IDEAL
MODEL small
STACK 100h


segment intrScreenSeg public
    intrScreenSeg1 db 64000 dup (00)
ends intrScreenSeg

segment homeScreenSeg public
    homeScreenSeg1 db 64000 dup (00)
ends homeScreenSeg

segment beckgroundseg public
    beckgroundseg1 db 64000 dup (00)
ends beckgroundseg

segment buildScreen public
    buildScreen1 db 64000 dup (00)
ends buildScreen

DATASEG
black       equ 0

lives       db 5
round       db 1

timehundreth    db 0
timesec     db 0
timemin     db 0

balloons    dw 200 dup(00)

money       dw 250 ; money amount that player have now
echo        dw 50 ; echo

wizardCost  dw 180
ninjaCost   dw 120

ninjas      dw 255 dup(00), 0 ; ninja places beckend
wizards     dw 255 dup(00), 0 ; wizard places beckend

NShots1     dw 50 dup(00)
NShots2     dw 50 dup(00)

WShots1     dw 50 dup(00)
WShots2     dw 50 dup(00)


stillPressedninja   db 0
stillPressedwizard  db 0
stillPressedecho    db 0

filename    db 'btdspic.bmp', 0
filename1   db 'ninjabtd.bmp', 0
filename2   db 'wizarbtd.bmp', 0
fileHome    db 'homesc.bmp', 0
fileIntr    db 'intrsc.bmp', 0

ninja       db 400 dup(0)
wizard      db 400 dup(0)
redballon   db 400 dup(0)
shuriken    db 400 dup(0)
wizardShot  db 400 dup(0) 

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

counter1    db 0
counter2    db 0
counter3    db 0
counter4    db 0
counter5    db 0
counter6    db 0

textX		dw 0
textY		dw 0

balloonsOnScreen db 0

; blueballoons dw 255 dup(?)
; redballoons  dw 255 dup(?)
; greenballoons dw 255 dup(?)
; bigballoons  dw 255 dup(?)

redballoonFile  db 'redbln.bmp', 0 ; length - 12, width - 8
shurikenFile    db 'shuriken.bmp', 0 
WShotFile       db 'wizshot.bmp', 0

x3          db 0
y3          db 0

Helper      dw 0



num0 	    db 't', 't', 0 , 0 , 0 , 't', 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 't', 0 , 0 , 0 , 't', 't', 's'

num1 	    db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 0 , 0 , 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 0 , 0, 0 , 't', 't', 's'

num2	    db 't', 't', 0, 0, 0, 't', 't', 'n'
			db 't', 0, 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 0, 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 0, 't', 't', 't', 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 's'

num3	    db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 's'

num4    	db 't', 't', 't', 0, 0, 't', 't', 'n'
			db 't', 't', 0, 't', 0, 't', 't', 'n'
			db 't', 0, 't', 't', 0, 't', 't', 'n'
			db 0, 't', 't', 't', 0, 't', 't', 'n'
			db 0 , 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 0,'t', 's'
	
num5 	    db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 's'

num6 	    db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 's'
	
num7	    db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 's'
	
num8 	    db 't', 't', 0 , 0 , 0 , 't', 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 't', 0 , 0 , 0 , 't', 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 't', 0 , 0 , 0 , 't', 't', 's'

num9	    db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 's'
	
num10	    db 't', 0, 't', 't', 0, 0, 't', 'n'
			db  0 , 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db  0 , 0 , 0 , 't', 0 , 0 , 't', 's'
LoseS       db '      _ _ _ _           _ _            _       _     _ _ _ _                   ',10,13
		    db '     |                 /    \         | \    / |    |                          ',10,13
		    db '     |                /      \        |  \  /  |    |                          ',10,13
		    db '     |    _ _        /        \       |   \/   |    |_ _ _ _                   ',10,13
		    db '     |       |      /-- -- -- -\      |        |    |                          ',10,13
		    db '     |       |     /            \     |        |    |                          ',10,13
		    db '     |_ _ _ _|    /              \    |        |    | _ _ _                   ',10,13
		    db '                                                                               ',10,13
            db '                          _ _ _ _ _                      _ _ _       _ _ _     ',10,13
		    db '                         |         |    \          /    |           |     |    ',10,13
		    db '                         |         |     \        /     |           |     |    ',10,13
		    db '                         |         |      \      /      |_ _ _      |_ _ _|    ',10,13
		    db '                         |         |       \    /       |           |    \     ',10,13
		    db '                         |         |        \  /        |           |     \    ',10,13
		    db '                         |_ _ _ _ _|         \/         |_ _ _      |      \   ',10,13                                                                                
		    db '                                                                               ',10,13
		    db '                                   You Lose ',1,10,13
            db '',10,13
            db '',10,13
            db '',10,13
            db '',10,13
            db '',10,13
            db '                      Press any button to get to the lobby ',10,13,'$'

CODESEG

proc delay
	push cx
	mov cx, 0ffffh
    outer_loop:
	push cx
	mov cx, 300
    inner_loop:
	loop inner_loop
	pop cx
	loop outer_loop
	pop cx
	ret
endp delay

; draw the graphic in a color at poristion
; get: color, offset num_x, x, y
PROC draw_Graphic
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx

	mov ax, [bp + 4]	; color
	mov bx, [bp + 6]	; offset num_x
	mov cx, [bp + 8]	; x
	mov dx, [bp + 10]	; y

	mov ah, 0ch

	draw_Pixel:
		push ax
		mov al, [byte ptr bx] ;;check current graphic data and act by it
		cmp al, 'n' ;;n=enter line
		JE enter_Line
		cmp al, 's' ;; s = stop drawing
		JE stop_Draw
		cmp al, 't' ;;t = transperent pixel
		JE skip
		pop ax
		int 10h
		inc bx
		inc cx
		JMP draw_Pixel
	skip:
		pop ax
		inc bx
		inc cx
		JMP draw_Pixel
	enter_Line:
		pop ax
		mov cx, [bp + 8]	; x
		inc dx
		inc bx
		JMP draw_Pixel

	stop_Draw:
		pop ax

		pop dx
		pop cx
		pop bx
		pop ax
		pop bp
		ret	8
ENDP draw_Graphic

; get: num
; give: offset num_x
PROC find_Graphic
	push bp
	mov bp, sp
	push ax
	push bx

	mov ax, [bp + 4]
			
		cmp ax, 0
		JNE not_0
		mov bx, offset num0
		mov [bp + 4], bx
		JMP draw_Num1
	not_0:
		cmp ax, 1
		JNE not_1
		mov bx, offset num1
		mov [bp + 4], bx
		JMP draw_Num1
	not_1:
		cmp ax, 2
		JNE not_2
		mov bx, offset num2
		mov [bp + 4], bx
		JMP draw_Num1
	not_2:
		cmp ax, 3
		JNE not_3
		mov bx, offset num3
		mov [bp + 4], bx
		JMP draw_Num1
	not_3:
		cmp ax, 4
		JNE not_4
		mov bx, offset num4
		mov [bp + 4], bx
		JMP draw_Num1
	not_4:
	 	cmp ax, 5
	 	JNE not_5
		mov bx, offset num5
		mov [bp + 4], bx
	 	JMP draw_Num1
	not_5:
		cmp ax, 6
		JNE not_6
	 	mov bx, offset num6
		mov [bp + 4], bx
		JMP draw_Num1
	not_6:
		cmp ax, 7
		JNE not_7
		mov bx, offset num7
		mov [bp + 4], bx
		JMP draw_Num1
	not_7:
		cmp ax, 8
		JNE not_8
		mov bx, offset num8
		mov [bp + 4], bx
		JMP draw_Num1
	not_8:
		cmp ax, 9
		JNE draw_Num1
		mov bx, offset num9
		mov [bp + 4], bx
	draw_Num1:
		
		pop bx
		pop ax
		pop bp
		ret
ENDP find_Graphic

; get: num, x, y
; print number at the right possion
PROC print_Number
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
    push es

	mov ax, [bp + 8]	; y
	mov [textY], ax
	mov ax, [bp + 6]	; x
	mov [textX], ax
	mov ax, [bp + 4]
	
	mov bl, 100
	div bl
	push ax
	xor ah, ah
	push [textY]
	push [textX]
	add [textX], 8
	push ax
	call find_Graphic
	push black
	call draw_Graphic

	pop ax
	mov al, ah
	xor ah, ah
	mov bl, 10
	div bl
	push ax
	xor ah, ah
	push [textY]
	push [textX]
	add [textX], 8
	push ax
	call find_Graphic
	push black
	call draw_Graphic

	pop ax
	mov al, ah
	xor ah, ah
	push [textY]
	push [textX]
	add [textX], 8
	push ax
	call find_Graphic
	push black
	call draw_Graphic

    pop es
	pop cx
	pop bx
	pop ax
	pop bp
	ret 6
ENDP print_Number


; get: num, x, y
; print number at the right possion
PROC print_Number2
    push bp
	mov bp, sp
	push ax
	push bx
	push cx
    push es

	mov ax, [bp + 8]	; y
	mov [textY], ax
	mov ax, [bp + 6]	; x
	mov [textX], ax
	mov ax, [bp + 4]
	
	mov bl, 10
	div bl
	push ax
	xor ah, ah
	push [textY]
	push [textX]
	add [textX], 8
	push ax
	call find_Graphic
	push black
	call draw_Graphic

	pop ax
	mov al, ah
	xor ah, ah
	push [textY]
	push [textX]
	add [textX], 8
	push ax
	call find_Graphic
	push black
	call draw_Graphic

    pop es
	pop cx
	pop bx
	pop ax
	pop bp
	ret 6
ENDP print_Number2

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
    mov cx, 64000
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
    cmp ah, 0D5h
    je dontPrintPixel1
    mov [word es:di], ax
    dontPrintPixel1:
    inc di

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


;;get: width - 320, length - 200, offset fileHome, offset SrcLine
PROC firstPrintHomeScreen
    push bp
    mov bp, sp
    push ax
    push si
    push cx
    push di
    push es
    
    push [bp + 8]  ; offset fileHome
    push offset ErrorMsg
    call OpenFile

    push offset Header
    call ReadHeader

    push offset palette
    call ReadPalette

    push offset palette
    call CopyPal

    
    mov ax, [bp + 4]
    mov [width], ax
    mov ax, [bp + 6]
    mov [length], ax
    mov ax, homeScreenSeg
    mov es, ax
    mov cx, [length]

    Printmaploop2:
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
    mov dx,[bp + 10] ; offset ScrLine
    int 21h

    cld ; Clear direction flag, for movsb for inc si, inc di
    ;call delay
    mov cx,[width]
    mov si, [bp + 10] ; offset SceLine
    dec di

    mbvsbloop3:
    xor ax, ax
    mov ax, [ds:si]
    mov [es:di], ax
    inc si
    inc di
    loop mbvsbloop3


    pop cx
    loop Printmaploop2

    push offset ErrorMsg
    call closeFile

    pop es
    pop di
    pop cx
    pop si
    pop ax
    pop bp
    ret 8
ENDP firstPrintHomeScreen


;;get: width - 320, length - 200, offset fileIntr, offset SrcLine
PROC firstPrintIntrScreen
    push bp
    mov bp, sp
    push ax
    push si
    push cx
    push di
    push es
    
    push [bp + 8]  ; offset fileHome
    push offset ErrorMsg
    call OpenFile

    push offset Header
    call ReadHeader

    push offset palette
    call ReadPalette

    push offset palette
    call CopyPal

    
    mov ax, [bp + 4]
    mov [width], ax
    mov ax, [bp + 6]
    mov [length], ax
    mov ax, intrScreenSeg
    mov es, ax
    mov cx, [length]

    Printmaploop3:
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
    mov dx,[bp + 10] ; offset ScrLine
    int 21h

    cld ; Clear direction flag, for movsb for inc si, inc di
    ;call delay
    mov cx,[width]
    mov si, [bp + 10] ; offset SceLine
    dec di

    mbvsbloop4:
    xor ax, ax
    mov ax, [ds:si]
    mov [es:di], ax
    inc si
    inc di
    loop mbvsbloop4


    pop cx
    loop Printmaploop3

    push offset ErrorMsg
    call closeFile

    pop es
    pop di
    pop cx
    pop si
    pop ax
    pop bp
    ret 8
ENDP firstPrintIntrScreen

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


    push offset ScrLine
    push offset fileHome
    push 200
    push 320
    call firstPrintHomeScreen

    push offset ScrLine
    push offset fileIntr
    push 200
    push 320
    call firstPrintIntrScreen

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

    push 20
    push 20
    push offset shuriken
    push offset shurikenFile
    push offset Header
    push offset Palette
    call FirstTimePrint

    push 20
    push 20
    push offset wizardShot
    push offset WShotFile
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


; move the Home segment to the screen
PROC HomeToScreen
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push di
    push ds

    
    mov ax, homeScreenSeg
    mov ds, ax
    xor di, di
    xor bx, bx

    mov cx, 32000 ; 64000 / 2
    movToScreen1:
    mov ax, [word ds:bx]
    mov [word es:di], ax

    ; mov [word es:di], [word ds:bx]
    add bx, 2
    add di, 2
    loop movToScreen1


    pop ds
    pop di
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP HomeToScreen

; move the intr segment to the screen
PROC IntrToScreen
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push di
    push ds

    
    mov ax, IntrScreenSeg
    mov ds, ax
    xor di, di
    xor bx, bx

    mov cx, 64000
    movToScreen3:
    mov ax, [ds:bx]
    mov [es:di], ax

    ; mov [word es:di], [word ds:bx]
    add bx, 1
    add di, 1
    loop movToScreen3


    pop ds
    pop di
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP IntrToScreen

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

    call printMoney

    push 200            ; length
    push 320            ; width
    call printBmpPic

    call printMoney

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
;                                                              balloons                                                          ;
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
    mov cx, 200

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
    dec [lives]
    jmp placeChanged


    keepRightB:
    add cx, 1
    jmp placeChanged

    keepLeftB:
    sub cx, 1
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


;get: Balloon number in balloons * 2, offset balloons
PROC PopBalloon
    push bp
    mov bp, sp
    push ax
    push bx
    push cx

    xor bx, bx
    xor cx, cx

    mov bx, [bp + 6]    ; offset balloons

    mov cx, [bp + 4]    ; baloon number

    add bx, cx

    mov [word bx], 0

    dec [balloonsOnScreen]

    inc [money]  ; per balloon
    
    pop cx
    pop bx
    pop ax
    pop bp
    ret 4
ENDP PopBalloon


;get offset balloons
PROC createRedballoon
    push bp
    mov bp, sp
    push ax
    push bx
    push cx

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
    
    pop cx
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
    mov cx, 200

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
    jne isEchoStillPressed
    call chackReleaseW
    jmp doesnotpressed

    isEchoStillPressed:
    mov ah, [stillPressedecho]    ; is it allready took
    cmp ah, 1
    jne keepChecking
    call chackReleaseE
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

    push cx
    push dx
    call checkEcho

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



;check if echo was pressed
PROC checkEcho
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov cx, [bp + 6]
    mov dx, [bp + 4]

    cmp dx, 180 ; start of echo rows
    jl doesnotpressedE

    cmp dx, 190 ; end of echo rows
    jg doesnotpressedE

    cmp cx, 284 ; start of echo col
    jl doesnotpressedE

    cmp cx, 304 ; end of echo col
    jg doesnotpressedE

    ; buy echo

    cmp [money], 60
    jb doesnotpressedE

    cmp [echo], 93
    jg doesnotpressedE

    mov [stillPressedecho], 1
    sub [money], 60
    add [echo], 5

    doesnotpressedE:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 4    
ENDP checkEcho

PROC chackReleaseE
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov [stillPressedecho], 1

    mov bx, 0h
    mov ax, 03h
    int 33h     ; curser last release

    and bx, 01h

    cmp bx, 01h
    je notreleased3

    mov [stillPressedecho], 0
    
    notreleased3:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP chackReleaseE


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
;                                                               Shots                                                            ;
;                                                                                                                                ;
;                                                                                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;get: offset balloon, offset NShots1, offset NShots2, offset WShots1, offset WShots2
PROC handleShots
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx

    mov bx, [bp + 6]
    mov di, [bp + 8]
    mov cx, 50

    loopMovNShots:
    mov ax, [word bx]
    cmp ax, 0
    je NotOnScreen1
    xor ax, ax

    push bx ;;
    push di ;;

    push [word bx]  ; shot place
    mov ax, [word di]
    mov bx, [bp + 4]    ; offset balloons
    add bx, ax
    push [word bx]  ; baloon place
    call NShotToGo
    pop ax

    pop di ;;
    pop bx ;;

    mov [word bx], ax   ; shot place

    push bx ;;;
    push di ;;;

    push [word bx]     ; shot place
    xor ax, ax
    mov ax, [word di]
    mov bx, [bp + 4]
    add bx, ax
    push [word bx]  ; baloon place
    call cmpShotToBalloon
    pop ax

    pop di ;;;
    pop bx ;;;

    cmp ax, "$"
    jne NotOnScreen1
    ; POP
    xor ax, ax
    mov ax, [word di]

    push [bp + 4]
    push ax
    call PopBalloon

    mov ax, 0
    mov [word di], ax

    mov [word bx], ax

    NotOnScreen1:
    add bx, 2
    add di, 2
    loop loopMovNShots

    ; wizard shots

    mov bx, [bp + 10]
    mov di, [bp + 12]
    mov cx, 50

    loopMovWShots:
    mov ax, [word bx]
    cmp ax, 0
    je NotOnScreen2
    xor ax, ax

    push bx ;;
    push di ;;

    push [word di]
    push [word bx]
    call WShotToGo
    pop ax

    pop di ;;
    pop bx ;;

    mov [word bx], ax   ; shot place

    push bx ;;;
    push di ;;;

    push [bp + 4]       ; offset balloons
    push [word bx]      ; shot place
    call cmpShotToBalloonW
    pop dx
    pop ax

    pop di ;;;
    pop bx ;;;

    cmp ax, "$"
    jne NotOnScreen2
    ; POP

    push [bp + 4]
    push dx
    call PopBalloon

    NotOnScreen2:
    add bx, 2
    add di, 2
    loop loopMovWShots


    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 10
ENDP handleShots


;get: baloon place, shot place
PROC NShotToGo
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx


    mov ax, [bp + 4]    ; baloon place
    cmp ax, 0
    jne BalloonIsExist

    mov ax, 0
    mov [bp + 6], ax
    jmp shurikenPlaceFound

    BalloonIsExist:
    add ax, 1924

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh    ; 200
    and dx, 1ffh

    mov bx, dx ; x
    mov [Helper], ax ; y
    
    mov ax, [bp + 6]    ; shot place
    add ax, 1605
    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    ; check vector
    cmp bx, dx
    jge keepCheckVector1

    sub dx, bx          ; x
    mov bx, dx
    
    cmp ax, [Helper]
    jle keepCheckVector2
    ; -- balloon place to shot place
    sub ax, [Helper]    ; y

    shr ax, 2
    shr bx, 2   ; vector : 16

    xor dx, dx
    mov cx, 320
    mul cx

    mov dx, [bp + 6]
    sub dx, ax
    sub dx, bx

    jmp shurikenPlaceFound

    keepCheckVector2:
    ; -+ balloon place to shot place
    sub [Helper], ax
    mov ax, [Helper]    ; y

    shr ax, 2
    shr bx, 2   ; vector : 16

    xor dx, dx
    mov cx, 320
    mul cx

    mov dx, [bp + 6]
    add dx, ax
    sub dx, bx

    jmp shurikenPlaceFound

    keepCheckVector1:
    sub bx, dx          ; x

    cmp ax, [Helper]
    jle keepCheckVector3
    ; +- balloon place to shot place
    sub ax, [Helper]    ; y

    shr ax, 2
    shr bx, 2   ; vector : 16

    xor dx, dx
    mov cx, 320
    mul cx

    mov dx, [bp + 6]
    sub dx, ax
    add dx, bx

    jmp shurikenPlaceFound

    keepCheckVector3:
    ; ++ balloon place to shot place
    sub [Helper], ax
    mov ax, [Helper]    ; y

    shr ax, 2
    shr bx, 2   ; vector : 16

    xor dx, dx
    mov cx, 320
    mul cx

    mov dx, [bp + 6]
    add dx, ax
    add dx, bx

    shurikenPlaceFound:
    mov [bp + 6], dx


    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 2
ENDP NShotToGo


;get: baloon place, shot place
PROC cmpShotToBalloon
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    

    mov ax, [bp + 6]
    add ax, 1605    ; the amount that gives the exact middle of the shuriken

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    mov bx, dx ; x
    mov [Helper], ax ; y
    
    mov ax, [bp + 4]
    add ax, 1924    ; the amount that gives the exact middle of the Balloon

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    ; check radios
    add bx, 10   ; half gap when gap = 16
    cmp dx, bx
    jg notPoping

    sub bx, 20  ; gap
    cmp dx, bx
    jl notPoping

    add [Helper], 10   ; half gap when gap = 16
    cmp ax, [Helper]
    jg notPoping

    sub [Helper], 20  ; gap
    cmp ax, [Helper]
    jl notPoping

    ; In Radios
    mov ax, "$"
    mov [bp + 6], ax

    notPoping:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 2
ENDP cmpShotToBalloon


;get: place of shot, baloon number in array * 2, offset NShots1, offset NShots2
PROC createANShot
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    

    mov bx, [bp + 8]
    mov cx, 0
    findNShotMTPlace:
    mov ax, [word bx]
    cmp ax, 0
    je createTheNshot
    add bx, 2
    inc cx
    jmp findNShotMTPlace

    createTheNshot:
    mov ax, [bp + 4]
    add ax, 10
    mov [word bx], ax

    mov bx, [bp + 10]
    shl cx, 1
    add bx, cx
    xor ax, ax
    mov ax, [bp + 6]
    mov [word bx], ax    ;?
    

    pop cx
    pop bx
    pop ax
    pop bx
    ret 8
ENDP createANShot


;get: offset ninjas, offset balloons, offset NShots1, offset NShots2
PROC checkNinjasRadios
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push di
    

    mov bx, [bp + 4]    ; offset ninjas
    loopNinjasRadios:
    push bx

    xor ax, ax
    mov ax, [word bx]   ; ninja place
    cmp ax, 0
    jne startballonsloop
    jmp AllNinjasChecked

    startballonsloop:

    mov cx, 0
    loopcheckballoonsIn:
    push bx
    push cx

    mov di, [bp + 6]    ; offset balloons
    add di, cx

    mov ax, [word di]
    cmp ax, 0
    je notInRadios

    mov ax, [word bx]
    add ax, 3210    ; the amount that gives the exact middle of the charecter

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    mov bx, dx ; x
    mov [Helper], 0
    mov [Helper], ax ; y

    pop cx
    mov di, [bp + 6]    ; offset balloons
    add di, cx
    push cx
    
    mov ax, [word di]
    add ax, 1924    ; the amount that gives the exact middle of the Balloon

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    ; check radios
    add bx, 30   ; half radios when radios = 60
    cmp dx, bx
    jg notInRadios

    sub bx, 60  ; radios
    cmp dx, bx
    jb notInRadios

    mov bx, [Helper]
    add bx, 30   ; half radios when radios = 60
    cmp ax, bx
    jg notInRadios

    sub bx, 60  ; radios
    cmp ax, bx
    jb notInRadios

    
    ; In Radios
    pop cx      ; baloon number in array * 2
    mov dx, cx
    pop bx
    mov ax, [word bx]    ; place of ninja

    push bx
    mov cx, 100
    push cx


    push [bp + 10]
    push [bp + 8]
    push dx
    push ax
    call createANShot

    
    notInRadios:
    pop cx
    add cx, 2
    pop bx
    cmp cx, 100
    jge endBalloonCheckLoop
    jmp loopcheckballoonsIn

    endBalloonCheckLoop:

    pop bx
    add bx, 2
    jmp loopNinjasRadios

    push bx
    AllNinjasChecked:
    pop bx

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 8
ENDP checkNinjasRadios



;get: shot place, offset balloons
PROC cmpShotToBalloonW
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push di
    

    mov cx, 0
    loopCheckBalloonsHit:
    push cx

    mov ax, [bp + 4]
    add ax, 1605    ; the amount that gives the exact middle of the WShot

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    mov bx, dx ; x
    mov [Helper], ax ; y
    
    pop cx
    mov di, [bp + 6]
    add di, cx
    push cx
    mov ax, [word di]
    add ax, 1924    ; the amount that gives the exact middle of the Balloon

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    ; check radios
    add bx, 8   ; half gap when gap = 16
    cmp dx, bx
    jg notPoping1

    sub bx, 16  ; gap
    cmp dx, bx
    jl notPoping1

    add [Helper], 8   ; half gap when gap = 16
    cmp ax, [Helper]
    jg notPoping1

    sub [Helper], 16  ; gap
    cmp ax, [Helper]
    jl notPoping1

    ; In Radios
    mov ax, "$"
    mov [bp + 6], ax

    pop cx
    mov [bp + 4], cx
    jmp notPoping2

    notPoping1:
    pop cx
    add cx, 2
    cmp cx, 100
    jg notPoping2
    jmp loopCheckBalloonsHit

    notPoping2:

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret
ENDP cmpShotToBalloonW


;get: shot place, shot vector
PROC WShotToGo
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    
    mov ax, [bp + 4]
    mov [Helper], ax

    mov bx, [bp + 6]    ; bl = x pixels, bh = y pixels

    cmp bl, 01111111b   ; below 10000000
    jb PlusX1

    xor cx, cx
    mov cl, bl
    and cl, 01111111b

    sub [Helper], cx

    cmp bh, 01111111b   ; below 10000000
    jb PlusY1

    xor cx, cx
    mov cl, bh
    and cl, 01111111b
    mov ax, 320
    mul cx

    sub [Helper], ax
    jmp FoundWShotNewPlace

    PlusX1:
    xor cx, cx
    mov cl, bl

    add [Helper], cx

    cmp bh, 01111111b   ; below 10000000
    jb PlusY1

    xor cx, cx
    mov cl, bh
    and cl, 01111111b
    mov ax, 320
    mul cx

    sub [Helper], ax
    jmp FoundWShotNewPlace
    PlusY1:
    xor cx, cx
    mov cl, bh
    mov ax, 320
    mul cx

    add [Helper], ax

    FoundWShotNewPlace:
    mov ax, [Helper]
    push ax
    call CheckScreenLimits
    pop ax
    mov [bp + 6], ax

    cmp ax, 0
    jne finishdam
    mov [bp + 4], ax

    finishdam:

    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 2
ENDP WShotToGo



;get: shot place
PROC CheckScreenLimits
    push bp
    mov bp, sp
    push ax
    push cx
    push dx

    mov ax, [bp + 4]
    mov cx, 320
    div cx      ; ax = y, dx = x

    and ax, 0ffh
    and dx, 1ffh

    cmp ax, 4
    jb killShot

    cmp ax, 195
    jg killShot

    cmp dx, 4
    jb killShot

    cmp dx, 270
    jg killShot

    jmp ShotIsOK

    killShot:
    mov ax, 0
    mov [bp + 4], ax

    ShotIsOK:

    pop dx
    pop cx
    pop ax
    pop bp
    ret
ENDP CheckScreenLimits


;get: shot place, balloon place
PROC findWShotVector
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx


    mov ax, [bp + 6]    ; baloon place
    cmp ax, 0
    jne BalloonIsExist1

    mov ax, 0
    mov [bp + 4], ax
    jmp WShotPlaceFound

    BalloonIsExist1:
    add ax, 1924

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh    ; 200
    and dx, 1ffh

    mov bx, dx ; x
    mov [Helper], ax ; y
    
    mov ax, [bp + 4]    ; shot place
    add ax, 1605
    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    ; check vector
    cmp bx, dx
    jge keepCheck1Vector1

    sub dx, bx          ; x
    mov bx, dx
    
    cmp ax, [Helper]
    jle keepCheck1Vector2
    ; -- balloon place to shot place
    sub ax, [Helper]    ; y

    xor cx, cx

    add ax, bx  ; x + y
    mov cx, ax
    shl bx, 3   ; x * 8
    mov ax, bx

    div cl      ; al = 8x / x + y
    mov [x3], al

    mov [y3], 8
    sub [y3], al

    or [y3], 10000000b
    or [x3], 10000000b

    mov dl, [x3]
    mov dh, [y3]

    jmp WShotPlaceFound

    keepCheck1Vector2:
    ; -+ balloon place to shot place
    sub [Helper], ax
    mov ax, [Helper]    ; y

    xor cx, cx

    add ax, bx  ; x + y
    mov cx, ax
    shl bx, 3   ; x * 8
    mov ax, bx

    div cl      ; al = 8x / x + y
    mov [x3], al

    mov [y3], 8
    sub [y3], al

    or [x3], 10000000b

    mov dl, [x3]
    mov dh, [y3]

    jmp WShotPlaceFound

    keepCheck1Vector1:
    sub bx, dx          ; x

    cmp ax, [Helper]
    jle keepCheck1Vector3
    ; +- balloon place to shot place
    sub ax, [Helper]    ; y

    xor cx, cx

    add ax, bx  ; x + y
    mov cx, ax
    shl bx, 3   ; x * 8
    mov ax, bx

    div cl      ; al = 8x / x + y
    mov [x3], al

    mov [y3], 8
    sub [y3], al

    or [y3], 10000000b

    mov dl, [x3]
    mov dh, [y3]

    jmp shurikenPlaceFound

    keepCheck1Vector3:
    ; ++ balloon place to shot place
    sub [Helper], ax
    mov ax, [Helper]    ; y

    xor cx, cx

    add ax, bx  ; x + y
    mov cx, ax
    shl bx, 3   ; x * 8
    mov ax, bx

    div cl      ; al = 8x / x + y
    mov [x3], al

    mov [y3], 8
    sub [y3], al

    mov dl, [x3]
    mov dh, [y3]

    WShotPlaceFound:
    mov [bp + 6], dx


    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 2
ENDP findWShotVector


;get: place of shot, balloon place, offset WShots1, offset WShots2
PROC createAWShot
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    

    mov bx, [bp + 8]
    mov cx, 0
    findWShotMTPlace:
    mov ax, [word bx]
    cmp ax, 0
    je createTheWshot
    add bx, 2
    add cx, 2
    jmp findWShotMTPlace

    createTheWshot:
    mov ax, [bp + 4]
    add ax, 10
    mov [word bx], ax

    mov bx, [bp + 10]
    add bx, cx
    
    push [bp + 6]
    push [bp + 4]
    call findWShotVector
    pop ax

    mov [word bx], ax    ;?
    

    pop cx
    pop bx
    pop ax
    pop bx
    ret 8
ENDP createAWShot


;get: offset wizards, offset balloons, offset WShots1, offset WShots2
PROC checkWizardsRadios
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push di
    

    mov bx, [bp + 4]    ; offset wizards
    loopWizardsRadios:
    push bx

    xor ax, ax
    mov ax, [word bx]   ; wizard place
    cmp ax, 0
    jne startballonsloop1
    jmp AllWizardsChecked

    startballonsloop1:

    mov cx, 0
    loopcheckballoonsIn1:
    push bx
    push cx

    mov di, [bp + 6]    ; offset balloons
    add di, cx

    mov ax, [word di]
    cmp ax, 0
    je notInRadios1

    mov ax, [word bx]
    add ax, 3210    ; the amount that gives the exact middle of the charecter

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    mov bx, dx ; x
    mov [Helper], 0
    mov [Helper], ax ; y

    pop cx
    mov di, [bp + 6]    ; offset balloons
    add di, cx
    push cx
    
    mov ax, [word di]
    add ax, 1924    ; the amount that gives the exact middle of the Balloon

    xor dx, dx
    mov cx, 320
    div cx          ; ax = y, dx = x;

    and ax, 0ffh
    and dx, 1ffh

    ; check radios
    add bx, 30   ; half radios when radios = 60
    cmp dx, bx
    jg notInRadios1

    sub bx, 60  ; radios
    cmp dx, bx
    jb notInRadios1

    mov bx, [Helper]
    add bx, 30   ; half radios when radios = 60
    cmp ax, bx
    jg notInRadios1

    sub bx, 60  ; radios
    cmp ax, bx
    jb notInRadios1

    
    ; In Radios
    pop cx      ; baloon number in array * 2
    mov dx, cx
    mov di, [bp + 6]    ; offset balloons
    add di, dx
    mov dx, [word di]   ; balloon place
    pop bx
    mov ax, [word bx]   ; place of wizard

    push bx
    mov cx, 100
    push cx


    push [bp + 10]
    push [bp + 8]
    push dx
    push ax
    call createAWShot

    
    notInRadios1:
    pop cx
    add cx, 2
    pop bx
    cmp cx, 100
    jge endBalloonCheckLoop1
    jmp loopcheckballoonsIn1

    endBalloonCheckLoop1:

    pop bx
    add bx, 2
    jmp loopWizardsRadios

    push bx
    AllWizardsChecked:
    pop bx

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 8
ENDP checkWizardsRadios


;get offset NShots1, offset WShots1
PROC PrintAllNShots
    push bp
    mov bp, sp
    push ax
    push bx
    push cx

    mov bx, [bp + 4]
    mov cx, 50

    loopPrintNShot:
    mov ax, [word bx]
    cmp ax, 0
    je NShotIsNotOnScreen

    push ax
    push offset shuriken
    call PrintCharecter

    NShotIsNotOnScreen:

    add bx, 2
    loop loopPrintNShot

    mov bx, [bp + 6]
    mov cx, 50

    loopPrintWShot:
    mov ax, [word bx]
    cmp ax, 0
    je WShotIsNotOnScreen

    push ax
    push offset wizardShot
    call PrintCharecter

    WShotIsNotOnScreen:

    add bx, 2
    loop loopPrintWShot

    
    pop cx
    pop bx
    pop ax
    pop bp
    ret 4
ENDP PrintAllNShots

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



; print all of the little number in the right down corner
PROC printMoney
    push ax
    push cx

    xor ax, ax
    mov ax, [money]
    push 180    ; y
    push 280    ; x
    push ax
    call print_Number

    push 190
    push 284
    mov ax, [echo]
    push ax
    call print_Number2

    push 169
    push 293
    xor ax, ax
    mov al, [lives]
    push ax
    call print_Number2

    push 169
    push 273
    xor ax, ax
    mov al, [round]
    push ax
    call print_Number2

    pop cx
    pop ax
    ret
ENDP printMoney


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

    push offset WShots1
    push offset NShots1
    call PrintAllNShots

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
    je haventpass1
    ; second must have passed too


    add dl, 95      ; ; 95+dl > [timehandreth] --> timehandreth + 5
    cmp dl, [timehundreth]
    jl havantpassedmil
    mov ax, "$"
    add [bp + 4], ax ; passed
    mov [timesec], dh
    mov [timemin], cl
    sub dl, 95
    mov [timehundreth], dl
    jmp havantpassedmil

    haventpass1:
    cmp [timesec], dh
    je haventpass

    add dl, 95      ; ; 95+dl > [timehandreth] --> timehandreth + 5
    cmp [timehundreth], dl
    jg havantpassedmil
    mov ax, "$"
    add [bp + 4], ax ; passed
    mov [timesec], dh
    sub dl, 95
    mov [timehundreth], dl
    jmp havantpassedmil

    haventpass:
    sub dl, 5       ; 50 milisec
    cmp dl, [timehundreth]
    jl havantpassedmil

    add dl, 5
    mov [timehundreth], dl
    mov ax, "$"
    mov [bp + 4], ax

    havantpassedmil:

    
    pop dx
    pop cx
    pop ax
    pop bp
    ret
ENDP fiftyMilisecPass


;get: offset balloons, offset ninjas, offset wizards
PROC newGame
    push bp
    mov bp, sp
    push ax
    push cx
    push dx

    mov [round], 1
    mov [lives], 5
    mov [money], 250

    mov bx, [bp + 4]    ;offset balloons
    mov cx, 200
    loopZero:
    mov [word bx], 0
    add bx, 2
    loop loopZero


    mov bx, [bp + 6]    ;offset ninjas
    mov cx, 250
    loopZero1:
    mov [word bx], 0
    add bx, 2
    loop loopZero1


    mov bx, [bp + 8]    ;offset wizards
    mov cx, 250
    loopZero2:
    mov [word bx], 0
    add bx, 2
    loop loopZero2

    pop cx
    pop bx
    pop ax
    pop bp
    ret 6
ENDP newGame


;including interaptions
PROC HomeScreen

    showHome:
    call HomeToScreen

    checkPressHome:
    mov ah, 01h
    int 21h

    cmp al, "i"
    je introductionL

    cmp al, 27      ; esc
    je exitTheGame

    cmp al, 13      ; enter
    jne checkPressHome
    jmp startNewGame


    introductionL:
    call IntrToScreen

    checkPressIntr:
    mov ah, 01h
    int 21h

    cmp al, 27      ; esc
    je showHome

    cmp al, 13      ; enter
    jne checkPressIntr
    jmp startNewGame

    exitTheGame:
    mov ax, 999

    startNewGame:
    
    ret
ENDP HomeScreen


; ;description
PROC LoseScreen
    push bp
    mov bp, sp
    push ax
    push dx
    push ds

    mov ah, 0
    mov al, 2
    int 10h

    mov dx, [bp + 4]
    mov ah, 09h
    int 21h

    ; Wait for key press
    mov ah,1

    int 21h

    mov ax, 13h
    int 10h
    
    pop ds
    pop dx
    pop ax
    pop bp
    ret 2
ENDP LoseScreen


; ;description
; PROC victoryScreen
    
; ENDP victoryScreen

;Main Loop Of the game
PROC MainGG
    mov cx, 10
    main:
    push cx

    call PrintAllTOSeg
    call chackPressed

    cmp [money], 950
    jb mainnnn
    mov [money], 949

    mainnnn:

    push 0
    call fiftyMilisecPass
    pop ax

    mov bx, "$"
    cmp ax, bx
    je timepass
    jmp keepMain
    timepass:
    call handelballoons
    call handelballoons

    cmp [round], 5
    jb keepHendleSht
    call handelballoons
    keepHendleSht:
    push offset WShots2
    push offset WShots1
    push offset NShots2
    push offset NShots1
    push offset balloons
    call handleShots

    inc [counter1]
    inc [counter5]

    cmp [counter5], 4
    jb cmpForOneSec

    pop cx
    mov bx, cx
    push cx
    cmp bx, 0
    je cmpForOneSec

    inc [counter6]
    mov [counter5], 0

    cmp [round], 8
    jb cmpCreateABslloon
    push offset balloons
    call createRedballoon

    pop cx
    dec cx
    push cx

    cmpCreateABslloon:

    cmp [counter6], 2
    jb cmpForOneSec

    push offset balloons
    call createRedballoon

    mov [counter6], 0

    pop cx
    dec cx
    push cx


    cmpForOneSec:
    cmp [counter1], 19 ; 1 sec ; 19 (ticks per sec)
    jl CheckMoreThanOneSec

    mov [counter1], 0

    inc [counter2]
    inc [counter3]
    inc [counter4]

    CheckMoreThanOneSec:
    cmp [counter3], 5   ; 5 sec
    jb CheckIfShot

    call moneytimecount
    mov [counter3], 0

    call FirstPrintAll

    CheckIfShot:
    cmp [counter2], 2   ; 2 sec
    jb RestartRound

    push offset NShots2
    push offset NShots1
    push offset balloons
    push offset ninjas
    call checkNinjasRadios

    push offset WShots2
    push offset WShots1
    push offset balloons
    push offset wizards
    call checkWizardsRadios


    mov [counter2], 0

    RestartRound:

    cmp [counter4], 20  ; per round
    jb keepMain
    inc [round]

    pop cx
    mov cx, 10
    xor ax, ax
    mov al, [round]
    shl ax, 2
    add cx, ax
    push cx

    mov [counter4], 0


    cmp [round], 15
    jb keepMain
    pop cx
    add cx, 2
    push cx


    cmp [round], 20
    jb keepMain
    jmp victoryYY

    keepMain:
    call screenToScreen

    cmp [lives], 0
    je endGame1
    pop cx
    jmp main


    victoryYY:
    mov cx, 1
    ret

    endGame1:
    pop cx
    mov cx, 0
    ret
ENDP MainGG


start:
mov ax, @data
mov ds, ax
mov ax, 0A000h
mov es, ax
; Graphic mode
mov ax, 13h
int 10h
; 

call FirstPrintAll

call HomeScreen
cmp ax, 999
je exit

mov ah, 2Ch
int 21h

mov [timemin], cl
mov [timesec], dh
mov [timehundreth], dl

push offset wizards
push offset ninjas
push offset balloons
call newGame

call FirstPrintAll

call PrintAllTOSeg
call startMouse

call screenToScreen

call delay

startGame:
call MainGG
call printMoney
cmp cx, 1
jne endGame
;call victoryScreen      ; victory screen

; Wait for key press
mov ah,1

int 21h

je start

endGame:        
push offset LoseS
call LoseScreen     ; lose screen

jmp start
; Back to text mode
mov ah, 0
mov al, 2
int 10h


exit:
mov ax, 4c00h
int 21h
END start