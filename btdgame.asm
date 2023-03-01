IDEAL
MODEL small
STACK 100h

segment beckgroundseg public
    beckgroundseg1 db 64000 dup (00)
ends beckgroundseg

segment buildScreen public
    buildScreen1 db 64000 dup (00)
ends buildScreen

DATASEG

balloons     dw 255 dup(00)

money       dw 250 ; money amount that player have now
echo        dw 100 ; echo

wizardCost  dw 120
ninjaCost   dw 150

ninjas      dw 255 dup(00) ; ninja places beckend
wizards     dw 255 dup(00) ; wizard places beckend

timehundreth    db 0
timesec     db 0
timemin     db 0

stillPressedninja db 0
stillPressedwizard db 0

filename    db 'btdspic.bmp', 0
filename1   db 'ninjabtd.bmp', 0
filename2   db 'wizarbtd.bmp', 0

ninja       db 400 dup(0)
wizard      db 400 dup(0)
redballon   db 400 dup(0)

filehandle  dw ?
Header      db 54 dup (0)
Palette     db 256*4 dup (0)
ScrLine     db 320 dup (0)
bitmap      db 800 dup (0)
underMap    db 800 dup (0)
ErrorMsg    db 'Error', 13, 10,'$'

lastCurserPlace dw 0

length      dw 200
width       dw 320


balloonsOnScreen db 0

; blueballoons dw 255 dup(?)
; redballoons  dw 255 dup(?)
; greenballoons dw 255 dup(?)
; bigballoons  dw 255 dup(?)

redballoonFile db 'redbln.bmp', 0 ; length - 12, width - 8


CODESEG

proc delay
	push cx
	mov cx, 0ffffh
    outer_loop:
	push cx
	mov cx, 150
    inner_loop:
	loop inner_loop
	pop cx
	loop outer_loop
	pop cx
	ret
endp delay



PROC pixelcolor

    ; Read dot
    mov bh,0h
    mov cx,0 ;[x]
    mov dx,0 ; [y]
    mov ah,0Dh
    int 10h ; return al the pixel value read (color?)

    ret
ENDP pixelcolor


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                ;
;                                                                                                                                ;
;                                                            BMP files                                                           ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; get offset ErrorMsg, offset filename
proc OpenFile
    push bp
    mov bp, sp
    push ax
    push dx

    ; Open file
    mov ah, 3Dh
    xor al, al
    mov dx, [bp + 6] ; offset filename
    int 21h
    jc openerror
    mov [filehandle], ax

    pop dx
    pop ax
    pop bp
    ret 4
    openerror:
    mov dx, [bp+4] ; offset ErrorMsg
    mov ah, 9h
    int 21h

    pop dx
    pop ax
    pop bp
    ret 4
endp OpenFile

; get offset Header
proc ReadHeader
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    ; Read BMP file header, 54 bytes
    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,[bp+4] ; offset Header
    int 21h

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 2
endp ReadHeader

; get offset palette
proc ReadPalette
    push bp
    mov bp, sp
    push ax
    push cx
    push dx

    ; Read BMP file color palette, 256 colors * 4 bytes (400h)
    mov ah,3fh
    mov bx, [filehandle]
    mov cx,400h
    mov dx, [bp + 4] ; offset Palette
    int 21h

    pop dx
    pop cx
    pop ax
    pop bp
    ret 2
endp ReadPalette

; get offset palette
proc CopyPal
    push bp
    mov bp, sp
    push ax
    push si
    push cx
    push dx

    ; Copy the colors palette to the video memory
    ; The number of the first color should be sent to port 3C8h
    ; The palette is sent to port 3C9h
    mov si,[bp+4] ; offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0
    ; Copy starting color to port 3C8h
    out dx,al
    ; Copy palette itself to port 3C9h
    inc dx
    PalLoop:
    ; Note: Colors in a BMP file are saved as BGR values rather than RGB.
    mov al,[si+2] ; Get red value.
    shr al,2 ; Max. is 255, but video palette maximal
    ; value is 63. Therefore dividing by 4.
    out dx,al ; Send it.
    mov al,[si+1] ; Get green value.
    shr al,2
    out dx,al ; Send it.
    mov al,[si] ; Get blue value.
    shr al,2
    out dx,al ; Send it.
    add si,4 ; Point to next color.
    ; (There is a null chr. after every color.)

    loop PalLoop

    pop dx
    pop cx
    pop si
    pop ax
    pop bp
    ret 2
endp CopyPal

; print the lines of beckground (320 - 200)
proc Printmap
    ; just for the background picture
    push bp
    mov bp, sp
    push ax
    push di
    push cx
    push dx
    push es
    push ds

    mov ax, buildScreen
    mov es, ax
    mov cx, 32000
    mov ax, beckgroundseg
    mov ds, ax

    Printmaploop:
    push cx
    
    ; di = cx*320, point to the correct screen line
    ; cx - the line number from the end to 0
    ; Read one line to variable ScrLine (buffer)
    ; mov ah,3fh
    ; mov cx, [width]
    ; mov dx,[bp + 4] ; offset ScrLine
    ; int 21h

    cld ; Clear direction flag, for movsb for inc si, inc di
    ;call delay

    mbvsbloop1:
    xor ax, ax
    mov ax, [word ds:di]
    ;cmp ah, 67h
    ;je dontPrintPixel1
    mov [word es:di], ax
    dontPrintPixel1:
    add di, 2

    pop cx
    loop Printmaploop

    pop ds
    pop es
    pop dx
    pop cx
    pop di
    pop ax
    pop bp
    ret
endp Printmap

; get offset ErrorMsg
proc closeFile
    push bp
    mov bp, sp
    push ax
    push bx

    mov ah, 3Eh
    xor al, al
    mov bx, [filehandle]
    int 21h
    jc openerror2

    pop dx
    pop ax
    pop bp
    ret 2
    openerror2:
    mov bx, [bp+4] ; offset ErrorMsg
    mov ah, 9h
    int 21h

    pop bx
    pop ax
    pop bp
    ret 2
endp closeFile

; print beckground (320-200)
; get: width - 320, length - 200
proc printBmpPic
    push bp
    mov bp, sp
    push ax
    ;mov ax, 25740  ; mid of screen (less by 20 up and left)
    
    mov ax, [bp + 4]
    mov [width], ax
    mov ax, [bp + 6]
    mov [length], ax
    call Printmap

    pop ax
    pop bp
    ret 4
endp printBmpPic


;get: width - 320, length - 200, offset filename
PROC copyBeckground
    push bp
    mov bp, sp
    push ax
    
    push [bp + 8]  ; offset filename
    push offset ErrorMsg
    call OpenFile

    push offset Header
    call ReadHeader

    push offset palette
    call ReadPalette

    push offset palette
    call CopyPal

    ;mov ax, 25740  ; mid of screen (less by 20 up and left)
    
    mov ax, [bp + 4]
    mov [width], ax
    mov ax, [bp + 6]
    mov [length], ax
    push offset ScrLine
    call FirstPrintmap

    push offset ErrorMsg
    call closeFile

    pop ax
    pop bp
    ret 6
ENDP copyBeckground


;get: offset SrcLine
PROC FirstPrintmap
    ; just for the background picture
    push bp
    mov bp, sp
    push ax
    push di
    push cx
    push dx
    push es

    mov ax, beckgroundseg
    mov es, ax
    mov cx, [length]

    Printmaploop1:
    push cx
    
    ; di = cx*320, point to the correct screen line
    ; cx - the line number from the end to 0

    mov ax, 320
    mul cx ; ax = cx*320
    
    mov di, ax
    ;add di, [bp + 6]
    ; Read one line to variable ScrLine (buffer)
    mov ah,3fh
    mov cx, [width]
    mov dx,[bp + 4] ; offset ScrLine
    int 21h

    cld ; Clear direction flag, for movsb for inc si, inc di
    ;call delay
    mov cx,[width]
    mov si, [bp + 4] ; offset SceLine
    dec di

    mbvsbloop2:
    xor ax, ax
    mov ax, [ds:si]
    mov [es:di], ax
    inc si
    inc di
    loop mbvsbloop2


    pop cx
    loop Printmaploop1

    pop es
    pop dx
    pop cx
    pop di
    pop ax
    pop bp
    ret 2
ENDP FirstPrintmap

; copy the image to memory
; get offset bitmap
proc CopyBitmap
    ; BMP graphics are saved upside-down .
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.
    push bp
    mov bp, sp
    push ax
    push cx
    push dx

	mov cx, [length] ; image length
	mov ax, [width] ; image widht
	mul cx
	mov cx, ax
	mov dx, [bp+4] ; bitmap start location ; offset charecter
    mov bx, [filehandle]
	mov ah,3fh
	int 21h

    pop dx
    pop cx
    pop ax
    pop bp
    ret 2
endp CopyBitmap

; switch between the bitmap lines, it saved upside down...
; get: offset bitmap
proc switchLines
    push bp
    mov bp, sp
    push ax
    push cx
    push di
    push si

	mov si, [bp + 4]
	mov cx, [width]
	mov ax, [length]
	mul cx
	sub ax, [length]
	add ax, [bp+4]
	mov di, ax
	sar cx, 1

	layerloop1:
		push cx
		push di
		push si
		mov cx, [length]

		columnLoop:
			mov al, [si]
			mov ah, [di]
			mov [si], ah
			mov [di], al
			inc di
			inc si
		loop columnloop

		pop si
		pop di
		add si, [length]
		sub di, [length]
		pop cx
	loop layerloop1

    pop si
    pop di
    pop cx
    pop ax
    pop bp
    ret 2
endp switchLines


; print "any" size bmp pic, (not more than 800 bits) (to the segment)
; get offset bitmap, start place, [width] = width and [length] = length
PROC PrintBitmap
    push bp
    mov bp, sp
    push ax
    push si
    push cx
    push di
    push es

    mov ax, buildScreen ;;;
    mov es, ax  ;;;

    mov si, [bp + 4]        ; offset bitmap
    mov di, [bp + 6]        ; start place

    mov cx, [length]        ; image length
    dec cx
    PrintBitmaploop:
    push cx
        ; printrowloop:
        ; mov [es:di], [bx]
        ; inc bx
        ; add di, 2
        ; loop printrowloop
    cld ; Clear direction flag, for movsb for inc si, inc di
    ;call delay
    mov cx,[width]
    dec cx

    ;rep movsb ; Copy line to the screen    ; D5
    ;rep movsb is same as the following code:
    mbvsbloop:
    xor ax, ax
    mov ax, [ds:si]
    cmp ah, 0D5h
    je dontPrintPixel
    mov [es:di], ax
    dontPrintPixel:
    inc si
    inc di
    loop mbvsbloop

    add di, 320
    mov ax, [width]
    sub di, ax
    inc di
    inc si
    pop cx
    loop PrintBitmaploop

    
    pop es
    pop di
    pop cx
    pop si
    pop ax
    pop bp
    ret 4
ENDP PrintBitmap

; file to memory
; get: offset palete, offset header, offset filename, offset bitmap, widht, length
proc fileToDS_BG
    push bp
    mov bp, sp
    push ax

	mov ax, [bp+8]           ; file name offset
	push ax
    push offset ErrorMsg
	call OpenFile

	mov ax, [bp+6]			; header offset
	push ax
	call ReadHeader

	mov ax, [bp+4]			; palete offset
	push ax
	call ReadPalette

	mov ax, [bp+4]			; pallete offset
	push ax
	call CopyPal

	mov ax, [bp + 12]		; width
	mov [width], ax
	mov ax, [bp + 14]		; length
	mov [length], ax
	mov ax, [bp+10]			; bitmap offset
	push ax
	call CopyBitmap

    push offset ErrorMsg
	call closeFile
    
    pop ax
    pop bp
    ret 12
endp fileToDS_BG


; move picture to ds
; get: offset palette, offset header, offset filename, offset charecter, widht, length
PROC FirstTimePrint
    push bp
    mov bp, sp
    push ax

    mov ax, [bp + 14] ; length
    push ax
    mov ax, [bp + 12] ; width
    push ax
    mov ax, [bp + 10] ; offset bitmap
    push ax
    mov ax, [bp + 8]  ; offset filename
    push ax
    mov ax, [bp + 6]  ; offset header
    push ax
    mov ax, [bp + 4]  ; offset palette
    push ax
    call fileToDS_BG

    mov ax, [bp + 10] ; offset bitmap
    push ax
    call switchLines

    pop ax
    pop bp
    ret 12
ENDP FirstTimePrint

; the function to actually print a pic (to the segment)
; print A bmp pic All process
; get: offset charecter, start place
PROC printAbmp
    push bp
    mov bp, sp
    push ax

    mov ax, [bp + 6] ; start place
    push ax
    mov ax, [bp + 4] ; offset bitmap
    push ax
    call PrintBitmap

    pop ax
    pop bp
    ret 4
ENDP printAbmp


;move pic to ds
PROC FirstPrintAll
    push bp
    mov bp, sp

    push offset filename
    push 200
    push 320
    call copyBeckground

    push 20
    push 20
    push offset ninja
    push offset filename1
    push offset Header
    push offset Palette
    call FirstTimePrint

    push 20
    push 20
    push offset wizard
    push offset filename2
    push offset Header
    push offset Palette
    call FirstTimePrint

    push 20
    push 20
    push offset redballon
    push offset redballoonFile
    push offset Header
    push offset Palette
    call FirstTimePrint

    pop bp
ENDP FirstPrintAll


; move the screen1 segment to the screen
PROC screenToScreen
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push di
    push ds

    
    mov ax, buildScreen
    mov ds, ax
    xor di, di
    xor bx, bx

    mov cx, 32000 ; 64000 / 2
    movToScreen:
    mov ax, [word ds:bx]
    mov [word es:di], ax

    ; mov [word es:di], [word ds:bx]
    add bx, 2
    add di, 2
    loop movToScreen


    pop ds
    pop di
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP screenToScreen

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                ;
;                                                                                                                                ;
;                                                            Background                                                          ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; print the regulare beckground (every run)
; get: offset filename
PROC printBackground
    push bp
    mov bp, sp
    push ax

    push 200            ; length
    push 320            ; width
    call printBmpPic

    push 16284          ; 320 * 50 + 284
    push offset ninja   ; offset bitmap
    call PrintCharecter


    push 32284          ; 320 * 100 + 284
    push offset wizard  ; offset bitmap
    call PrintCharecter


    pop ax
    pop bp
    ret 2
ENDP printBackground


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                ;
;                                                                                                                                ;
;                                                              balloons                                                           ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;handel all balloons
PROC handelballoons
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov bx, offset balloons
    mov cx, 244

    loopDecballoon:
    mov ax, [word bx]
    cmp ax, 0
    je NotonScreen

    push [word bx]
    call BalloonToGo
    pop ax

    mov [word bx], ax        ; balloons place

    NotonScreen:
    add bx, 2
    loop loopDecballoon


    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP handelballoons


;check and mov the blloon to the right direction
;get Balloon place
PROC BalloonToGo
    push bp
    mov bp, sp
    push dx
    push cx
    push ax

    mov ax, [bp + 4] ; place ; devidend
    mov cx, 320 ; devisor
    div cx      ; y - ax, x - dx

    mov cx, [bp + 4]


    cmp ax, 166
    jl check128

    cmp dx, 13
    jg keepLeftB

    check128:
    cmp ax, 128
    jl check127
    jmp keepUpB

    check127:
    cmp ax, 127
    jl check73

    cmp dx, 255
    jl keepRightB

    check73:
    cmp ax, 73
    jl check72
    jmp keepUpB

    check72:
    cmp ax, 72
    jl check32

    cmp dx, 13
    jg keepLeftB
    
    check32:
    cmp ax, 32
    jl check31
    jmp keepUpB

    check31:
    cmp dx, 260
    jl keepRightB

    mov cx, 0
    jmp placeChanged


    keepRightB:
    inc cx
    jmp placeChanged

    keepLeftB:
    dec cx
    jmp placeChanged

    keepUpB:
    sub cx, 320

    placeChanged:
    mov [bp + 4], cx
    
    
    pop ax
    pop cx
    pop dx
    pop bp
    ret
ENDP BalloonToGo


;get offset balloons
PROC createRedballoon
    push bp
    mov bp, sp
    push ax
    push bx

    mov bx, [bp + 4]

    loopfindballoonPlace:
    cmp [word bx], 0
    je MTplaceballoon
    add bx, 2
    jmp loopfindballoonPlace

    MTplaceballoon:
    mov ax, 53375       ; start of move for balloon
    mov [word bx], ax

    inc [balloonsOnScreen]
    
    pop bx
    pop ax
    pop bp
    ret 2
ENDP createRedballoon


;get offset balloons
PROC PrintAllballoons
    push bp
    mov bp, sp
    push ax
    push bx
    push cx

    mov bx, [bp + 4]
    mov cx, 244

    loopPrintballoon:
    mov ax, [word bx]
    cmp ax, 0
    je balloonIsNotOnScreen

    push ax
    push offset redballon
    call PrintCharecter

    balloonIsNotOnScreen:

    add bx, 2
    loop loopPrintballoon

    
    pop cx
    pop bx
    pop ax
    pop bp
    ret 2
ENDP PrintAllballoons

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                ;
;                                                                                                                                ;
;                                                         mouse functions                                                        ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; start the mouse on the screen
PROC startMouse
    push ax
    
    mov ax,0h ; start over
    int 33h

    mov ax,1h ; show mouse
    int 33h

    ; mov ax,3h ; mouse options right now
    ; int 33h ; bx = 1 --> left click, bx = 2 --> right click, cx - mouse row *2, dx - mouse col

    ; get bx = 0 --> left button
    ; mov ax,5h ; mouse press information 
    ; int 33h ; bx - count of button presses, cx - mouse row *2, dx - mouse col   everything about the last time it got pressed


    pop ax
    ret
ENDP startMouse


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                ;
;                                                                                                                                ;
;                                                         check functions                                                        ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;check if one of the charecters got pressed, if it is so if it can go on to the screen
PROC chackPressed
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    
    mov ah, [stillPressedninja]     ; is it allready took
    cmp ah, 1
    jne isWizardStillPressed
    call chackReleaseN
    jmp doesnotpressed

    isWizardStillPressed:
    mov ah, [stillPressedwizard]    ; is it allready took
    cmp ah, 1
    jne keepChecking
    call chackReleaseW
    jmp doesnotpressed

    keepChecking:
    mov bx, 0h
    mov ax, 5h
    int 33h     ; last curser click

    ; chack if the mouse touch the wizard or ninje
    shr cx, 1   ; div cx by 2

    cmp ax, 0000000000000001 ; left button got pressed
    jne doesnotpressed

    push cx
    push dx
    call checkPressedN

    push cx
    push dx
    call ckeckPressedW

    doesnotpressed:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP chackPressed


;check about the ninja if pressed
;get curser last click - bp + 4 = y, bp + 6 = x
PROC checkPressedN
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov cx, [bp + 6]
    mov dx, [bp + 4]

    cmp dx, 50 ; start of ninja rows
    jl doesnotpressedN

    cmp dx, 70 ; end of ninja rows
    jg doesnotpressedN

    cmp cx, 284 ; start of ninja col
    jl doesnotpressedN

    cmp cx, 304 ; end of ninja col
    jg doesnotpressedN

    push ax ; trush
    call CanBuyNinja
    pop ax

    cmp ax, "$"
    jne doesnotpressedN

    mov ax, 02
    int 33h ; hide mouse

    ; ninja got pressed
    call chackReleaseN

    doesnotpressedN:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 4    
ENDP checkPressedN

;check about the wizard if pressed
;get curser last click - bp + 4 = y, bp + 6 = x
PROC ckeckPressedW
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov cx, [bp + 6]
    mov dx, [bp + 4]

    cmp dx, 100 ; start of wizard rows
    jl doesnotpressedW

    cmp dx, 120 ; end of wizard rows
    jg doesnotpressedW

    cmp cx, 284 ; start of wizard col
    jl doesnotpressedW

    cmp cx, 304 ; end of wizard col
    jg doesnotpressedW

    push ax ; trush
    call CanBuyWizard
    pop ax

    cmp ax, "$"
    jne doesnotpressedW

    mov ax, 02
    int 33h ; hide mouse

    ; wizard got pressed
    call chackReleaseW

    doesnotpressedW:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 4   
ENDP ckeckPressedW


;
PROC chackReleaseN
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov [stillPressedninja], 1

    mov ax, 03h
    int 33h         ; curser right now

    shr cx, 1 ; div by 2
    sub cx, 20
    mov ax, 320
    sub dx, 20
    mul dx ; dx:ax = 320*dx -- ax
    add ax, cx ; the right place right now
    push ax

    push offset ninja
    call PrintCharecter


    mov bx, 0h
    mov ax, 6h
    int 33h         ; curser last released ; cx - 2*x, dx - y

    cmp bx, 0 ; no button released
    je notreleased1

    cmp ax, 0000000000000001
    je notreleased1

    shr cx, 1 ; div by 2
    
    push cx
    push dx
    call ckeckPlaceLimit
    pop ax

    cmp ax, "$"
    je cantPlaceNinja

    sub cx, 20
    mov ax, 320
    sub dx, 20
    mul dx ; dx:ax = 320*dx -- ax
    add ax, cx ; the right place released (right now)

    push offset ninjas
    push ax
    call createAninja

    cantPlaceNinja:
    mov [stillPressedninja], 0

    mov ax, 01
    int 33h ; show mouse
    notreleased1:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP chackReleaseN


PROC chackReleaseW
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov [stillPressedwizard], 1

    mov ax, 03h
    int 33h     ; curser right now

    shr cx, 1 ; div by 2
    sub cx, 20
    mov ax, 320
    sub dx, 20
    mul dx ; dx:ax = 320*dx -- ax
    add ax, cx ; the right place right now
    push ax

    push offset wizard
    call PrintCharecter


    mov bx, 0h
    mov ax, 6h
    int 33h     ; curser last release

    cmp bx, 0 ; no button released
    je notreleased2

    cmp ax, 0000000000000001
    je notreleased2

    shr cx, 1 ; div by 2

    push cx
    push dx
    call ckeckPlaceLimit
    pop ax

    cmp ax, "$"
    je cantPlaceWizard

    sub cx, 20
    mov ax, 320
    sub dx, 20
    mul dx ; dx:ax = 320*dx -- ax
    add ax, cx ; the right place

    push offset wizards
    push ax
    call createAwizard

    cantPlaceWizard:   
    mov [stillPressedwizard], 0

    mov ax, 01
    int 33h ; show mouse
    
    notreleased2:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP chackReleaseW



;get start place - y = [bp + 4], x = [bp + 6]
PROC ckeckPlaceLimit
    push bp
    mov bp, sp
    push cx
    push dx

    mov dx, [bp + 4] ; y
    mov cx, [bp + 6] ; x

    cmp cx, 268  ; towers secisoon
    jg cantplacehere

    cmp cx, 21 ; left out of scren
    jl cantplacehere
    
    cmp dx, 21 ; going up from screen
    jl cantplacehere


    cmp dx, 34
    jl canplacehere

    cmp dx, 60
    jl cantplacehere

    cmp dx, 80
    jg check95  ; can place if lower

    cmp cx, 45
    jg canplacehere  ; can place

    check95:
    cmp dx, 95
    jl cantplacehere

    cmp dx, 130
    jg check150

    cmp cx, 250
    jl canplacehere

    check150:
    cmp dx, 150
    jl cantplacehere

    cmp dx, 170
    jg check190

    cmp cx, 45
    jg canplacehere

    check190:
    cmp dx, 190
    jl cantplacehere

    jmp canplacehere

    cantplacehere:
    mov cx, "$"
    mov [bp + 6], cx

    canplacehere:

    pop dx
    pop cx
    pop bp
    ret 2
ENDP ckeckPlaceLimit



;get ninja start place, offset ninjas
PROC createAninja
    push bp
    mov bp, sp
    push ax
    push bx

    call buyNinja
    mov bx, [bp + 6] ; offset ninjas

    findNinjaMTPlace:
    cmp [word bx], 0
    je createTheninja
    add bx, 2
    jmp findNinjaMTPlace

    createTheninja:
    mov ax, [bp + 4]
    mov [bx], ax


    pop bx
    pop ax
    pop bp
    ret 4
ENDP createAninja


;get wizard start place, offset wizards
PROC createAwizard
    push bp
    mov bp, sp
    push ax
    push bx

    call buyWizard
    mov bx, [bp + 6]    ; offset wizards

    findWizardMTPlace:
    cmp [word bx], 0
    je createThewizard
    add bx, 2
    jmp findWizardMTPlace

    createThewizard:
    mov ax, [bp + 4]
    mov [bx], ax


    pop bx
    pop ax
    pop bp
    ret 4
ENDP createAwizard

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                ;
;                                                                                                                                ;
;                                                         print functions                                                        ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; print nonja or wizard
; get: offset charecter, start place
PROC PrintCharecter
    push bp
    mov bp, sp
    push ax

    mov [length], 20
    mov [width], 20

    mov ax, [bp + 6]   ; start place
    push ax
    mov ax, [bp + 4]   ; offset bitmap
    push ax
    call printAbmp
    
    pop ax
    pop bp
    ret 4
ENDP PrintCharecter



;get offset ninjas
PROC printAllNinjas
    push bp
    mov bp, sp
    push ax
    push bx


    mov bx, [bp + 4]
    loopPrintninjas:
    push bx

    xor ax, ax
    mov ax, [bx]
    cmp ax, 0
    je AllNinjasprinted

    push ax
    push offset ninja
    call PrintCharecter

    pop bx
    add bx, 2
    jmp loopPrintninjas

    AllNinjasprinted:
    pop bx

    pop bx
    pop ax
    pop bp
    ret 2
ENDP printAllNinjas


;get offset wizards
PROC printAllWizards
    push bp
    mov bp, sp
    push ax
    push bx


    mov bx, [bp + 4]
    loopPrintwizards:
    push bx

    xor ax, ax
    mov ax, [bx]
    cmp ax, 0
    je AllWizardsprinted

    push ax
    push offset wizard
    call PrintCharecter

    pop bx
    add bx, 2
    jmp loopPrintwizards

    AllWizardsprinted:
    pop bx

    pop bx
    pop ax
    pop bp
    ret 2
ENDP printAllWizards


;description
PROC PrintAllTOSeg
    push bp
    mov bp, sp
    push ax
    
    push offset filename
    call printBackground

    push offset ninjas
    call printAllNinjas

    push offset wizards
    call printAllWizards

    push offset balloons
    call PrintAllballoons

    pop ax
    pop bp
    ret
ENDP PrintAllTOSeg

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                ;
;                                                                                                                                ;
;                                                         money functions                                                        ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;get one parameter in bp+4 with nothing
PROC CanBuyNinja
    push bp
    mov bp, sp
    push ax
    push bx

    xor ax, ax
    mov [bp + 4], ax

    mov ax, [money]
    mov bx, [ninjaCost]

    cmp bx, ax
    jg cantBuyNinja

    mov ax, "$"
    mov [bp + 4], ax

    cantBuyNinja:

    pop bx
    pop ax
    pop bp
    ret
ENDP CanBuyNinja

;get one parameter in bp+4 with nothing
PROC CanBuyWizard
    push bp
    mov bp, sp
    push ax
    push bx

    xor ax, ax
    mov [bp + 4], ax

    mov ax, [money]
    mov bx, [wizardCost]

    cmp bx, ax
    jg cantBuyWizard

    mov ax, "$"
    mov [bp + 4], ax

    cantBuyWizard:

    pop bx
    pop ax
    pop bp
    ret
ENDP CanBuyWizard


;buy ninja
PROC buyNinja
    push ax

    mov ax, [money]
    sub ax, [ninjaCost]
    mov [money], ax

    pop ax
    ret
ENDP buyNinja

;buy wizard
PROC buyWizard
    push ax

    mov ax, [money]
    sub ax, [wizardCost]
    mov [money], ax

    pop ax
    ret
ENDP buyWizard


;count 10 sec and add echo to money
PROC moneytimecount
    push ax
    
    mov ax, [echo]
    add [money], ax ; echo
    
    pop ax
    ret
ENDP moneytimecount


;get MT return "$" if 5 sec pass
PROC fiveSecPass
    push bp
    mov bp, sp
    push ax
    push cx
    push dx

    mov ah, 2Ch
    int 21h
    
    cmp cl, [timemin]
    je haventpassed1

    add dh, 55        ; 55+dh > [timesec] --> timesec + 5
    cmp [timesec], dh
    jg haventpassed

    sub dh, 55
    mov [timemin], cl
    mov [timesec], dh
    mov ax, "$"
    add [bp + 4], ax ; passed
    jmp haventpassed

    haventpassed1:
    sub dh, 5
    cmp [timesec], dh
    jg haventpassed

    add dh, 5
    mov [timesec], dh
    mov ax, "$"
    add [bp + 4], ax ; passed

    haventpassed:
    
    pop dx
    pop cx
    pop ax
    pop bp
    ret
ENDP fiveSecPass


;get MT return "$" if 50 milisec pass
PROC fiftyMilisecPass
    push bp
    mov bp, sp
    push ax
    push cx
    push dx

    mov ah, 2Ch
    int 21h

    
    cmp cl, [timemin]
    je haventpassed1
    ; second must have passed too


    add dl, 95      ; ; 95+dl > [timehandreth] --> timehandreth + 5
    cmp dl, [timehundreth]
    jl havantpassedmil
    mov ax, "$"
    add [bp + 4], ax ; passed
    mov [timesec], dh
    mov [timemin], cl
    jmp havantpassedmil

    haventpassed1:
    cmp [timesec], dh
    je haventpassed

    add dl, 95      ; ; 94+dl > [timehandreth] --> timehandreth + 5
    cmp dl, [timehundreth]
    jl havantpassedmil
    mov ax, "$"
    add [bp + 4], ax ; passed
    mov [timesec], dh
    jmp havantpassedmil

    haventpassed:
    sub dl, 5       ; 50 milisec
    cmp dl, [timehundreth]
    jl havantpassedmil

    add dl, 5
    mov [timehundreth]
    mov ax, "$"
    mov [bp + 4], ax

    havantpassedmil:

    
    pop dx
    pop cx
    pop ax
    pop bp
    ret
ENDP fiftyMilisecPass

start:
mov ax, @data
mov ds, ax
mov ax, 0A000h
mov es, ax
; Graphic mode
mov ax, 13h
int 10h
; Process BMP file

mov ah, 2Ch
int 21h

mov [timemin], cl
mov [timesec], dh
mov [timehundreth], dl

call FirstPrintAll

push offset balloons
call createRedballoon

call PrintAllTOSeg
call startMouse

call screenToScreen

main:
call PrintAllTOSeg
call chackPressed

push 0
call fiftyMilisecPass
pop ax

mov bx, "$"
cmp ax, bx
jne keepMain
call handelballoons

push 0
call fiveSecPass
pop ax

mov bx, "$"
cmp ax, bx
jne keepMain

call moneytimecount
call createRedballoon

keepMain:
call screenToScreen

jmp main

; Wait for key press
mov ah,1

int 21h
; Back to text mode
mov ah, 0
mov al, 2
int 10h


exit:
mov ax, 4c00h
int 21h
END start