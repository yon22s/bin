IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------

lastmove db 0   ; 1 --> up, 2 --> left, 3 --> down, 4 --> right.

snake_length db 3

snake dw (80*12)*2+80, ?, ?, 1997 dup(?)

apple dw 2500, 1997 dup(1678)   ; the apple location on the screen

apple_amount dw 1

apple_perEat db 1

random dw 60

CODESEG
; --------------------------
; Your functions here
; --------------------------

;                              clean screen
;---------------------------------------------------------------------------------;

; make all the screen black by put a " " in every square of the screen
PROC clear
	push cx
	push ax
	push di

	mov cx, 2*(80*25)
	xor di, di

	lop_clear:
	mov al, " "
	mov ah, 0
	mov [es:di], ax

	add di, 2
	loop lop_clear

	pop di
	pop ax
	pop cx
	ret
ENDP clear

; get the offset of snake
; clean the tail of the snake by take the snake_length and put a " " in the last square
PROC clean_last
	push bp
	mov bp, sp
	push bx
	push ax
	push di

	xor ax, ax
	mov al, [snake_length]
	dec al
	mov dl, 2
	mul dl                  ; al have the snake_length * 2
	mov bx, [bp + 4]  	    ; bx have the offset of snake
	add bx, ax              ; bx = offset snake + (snake_length * 2)
	mov di,[bx]
	mov al, " "
	mov ah, 0
	mov [es:di], ax

	pop di
	pop ax
	pop bx
	pop bp
	ret
ENDP clean_last

;---------------------------------------------------------------------------------;

;                             snake functions
;---------------------------------------------------------------------------------;

; get the snake offset
; move the value to the next address, 1 --> 2, 2 --> 3...
PROC move_address
	push bp
	mov bp, sp
	push dx
	push cx
	push bx
	push ax

	xor cx, cx
	mov cl, [snake_length]
	mov bx, [bp + 4]   ; bx have the snake offset
	
	move_lop:   ; loop runs snake_length times
	push bx

	mov ax, cx
	sub ax, 2
	mov dl, 2
	mul dl     
	add bx, ax   ; bx have the offset snake + snake length - 2
	mov dx, [bx]
	mov [bx + 2], dx   ; move the addres of snake length - 1 to snake length - 2 
	
	pop bx
	dec cx
	cmp cx, 1
	jg move_lop

	pop ax
	pop bx
	pop cx
	pop dx
	pop bp
	ret
ENDP move_address

; get the snake offset
; add the snake another tail
PROC snake_eat
	push bp
	mov bp, sp
	push dx
	push cx
	push bx
	push ax

	xor cx, cx
	mov cl, [snake_length]
	mov bx, [bp + 4]

	mov ax, cx
	mov dl, 2
	mul dl
	add bx, ax    ; offset snake + snake length
	mov dx, [bx - 2]  ; the new tail get the addres of the now tail
	mov [bx], dx

	inc cl
	mov [snake_length], cl  ; inc the snake length

	pop ax
	pop bx
	pop cx
	pop dx
	pop bp
	ret
ENDP snake_eat

;---------------------------------------------------------------------------------;


;                              print to screen
;---------------------------------------------------------------------------------;

; get the snake offset
; print the snake to the screen
PROC print_snake
	push bp
	mov bp, sp
	push bx
	push ax
	push di

	mov ah, 36
	mov al, ":"
	mov di, [bp + 6]
	mov bx,[di]
	mov [word es:bx], ax

	pop di
	pop ax
	pop bx
	pop bp
	ret
ENDP print_snake

;get a even munber 0 - 3998, and put an apple in it
PROC apple_screen
	push bp
	mov bp, sp
	push dx
	push cx
	push bx
	push ax

	xor cx,cx

	mov cl, [snake_length]
	dec cx

	move_lop_apple:   ; loop runs snake_length times
	mov ax, cx
	shl ax, 1
	mov bx, offset snake
	add bx, ax   ; bx have the offset snake + snake length - 1 (count starts from 0)
	mov dx, [bx]

	mov ax, [bp + 4] ; place in array
	mov bx, [bp + 6] ; offset apple
	add bx, ax

	cmp dx, [bx]   ; compare the addres of snake to the place of the apple
	je call_random    ; the apple is on the snake

	dec cx
	cmp cx, 0
	jg move_lop_apple
	jmp show_apple

	call_random:
	push [bp + 6]
	push [bp + 4]
	call random_gen
	xor cx,cx
	mov cl, [snake_length]
	dec cx
	jmp move_lop_apple  ; start chack again

	show_apple:
	mov ah, 12    ; color red
	mov al, 149   ; apple sign
	mov cx, [bp + 4] ; place in array
	mov bx, [bp + 6] ; offset apple
	add bx, cx
	mov di, [bx]
	mov [word es:di], ax

	pop ax
	pop bx
	pop cx
	pop dx
	pop bp
	ret 4
ENDP apple_screen



;get offset apple
PROC goust_apples
	push bp
	mov bp, sp
	push di
	push cx
	push bx
	push ax

	mov ax, [apple_amount]
	dec ax
	shl ax, 1

	mov bx, [bp + 4] ; offset apple
	add bx, ax

	lop_goust:

	mov di, [bx]

	mov ch, 0
	mov cl, " "

	cmp cx, [word es:di]
	jne notAgoust

	mov di, [bx + 2]
	mov [bx], di

	notAgoust:
	sub bx, 2
	sub ax, 2
	cmp ax, 0
	jg lop_goust

	pop ax
	pop bx
	pop cx
	pop di
	pop bp
	ret 2
ENDP goust_apples
;---------------------------------------------------------------------------------;




;                              snake move
;---------------------------------------------------------------------------------;

; get offset snake
; move up
PROC move_up
	push bp
	mov bp, sp
	push ax
	push bx

	push [bp+4]
	call clean_last
	call move_address
	pop ax

	mov [lastmove], 1
	mov bx, [bp+4]    ; move the head of the tail, to it new place
	mov ax, [bx]
	sub ax, 2*80
	mov [bx], ax
	call print_snake

	pop bx
	pop ax
	pop bp
	ret	
ENDP move_up

; get offset snake
; move down
PROC move_down
	push bp
	mov bp, sp
	push ax
	push bx

	push [bp+4]
	call clean_last
	call move_address
	pop ax

	mov [lastmove], 3
	mov bx, [bp + 4]   ; move the head of the tail, to it new place
	mov ax, [bx]
	add ax, 2*80
	mov [bx], ax
	call print_snake

	pop bx
	pop ax
	pop bp
	ret	
ENDP move_down

; get offset snake
; move right
PROC move_right
	push bp
	mov bp, sp
	push ax
	push bx
	
	push [bp+4]
	call clean_last
	call move_address
	pop ax

	mov [lastmove], 4
	mov bx, [bp +4]    ; move the head of the tail, to it new place
	mov ax, [bx]
	add ax, 2
	mov [bx], ax

	call print_snake

	pop bx
	pop ax
	pop bp
	ret	
ENDP move_right

; get offset snake
; move left
PROC move_left
	push bp
	mov bp, sp
	push ax
	push bx

	push [bp+4]
	call clean_last
	call move_address
	pop ax

	mov [lastmove], 2
	mov bx, [bp +4]   ; move the head of the tail, to it new place
	mov ax, [bx]
	sub ax, 2
	mov [bx], ax
	call print_snake

	pop bx
	pop ax
	pop bp
	ret	
ENDP move_left

;---------------------------------------------------------------------------------;



;                             chack screen limits
;---------------------------------------------------------------------------------;

; get the snake offset
; chack if the snake is about to get up from the screen
PROC chack_lim_up
	push bp
	mov bp, sp
	push ax
	push bx
	push cx

	xor al, al
	mov bx, [bp + 4]  ; bx have the snake offset
	mov cx, [bx]  ; cx have the place of the head of the snake
	cmp cx, 160 ; the snake is on the upper line of the screen
	jnl next_up1
	mov ax, "$"
	mov [bp + 4], ax
	next_up1:

	pop cx
	pop bx
	pop ax
	pop bx
	ret
ENDP chack_lim_up

; get the snake offset
; chack if the snake is about to get down from the screen
PROC chack_lim_down
	push bp
	mov bp, sp
	push ax
	push bx
	push cx

	xor al, al
	mov bx, [bp + 4]  ; bx have the snake offset
	mov cx, [bx]  ; cx have the place of the head of the snake
	cmp cx, 80*2*24 - 1  ; the snake is on the lowest line of the screen
	jng next_down1
	mov ax, "$"
	mov [bp + 4], ax
	next_down1:

	pop cx
	pop bx
	pop ax
	pop bp
	ret
ENDP chack_lim_down

; get the snake offset
; chack if the snake is about to get right from the screen
PROC chack_lim_right
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx

	xor dx, dx
	mov bx, [bp +4]  ; bx have the snake offset
	mov ax, [bx]  ; ax have the place of the head of the snake
	mov cx, 80*2
	div cx        ; dx get the column of the snake head
	xor al, al
	cmp dx, 158   ; the snake is on the righter line of the screen
	jne next_right1
	mov ax, "$"
	mov [bp + 4], ax
	next_right1:

	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret
ENDP chack_lim_right

; get the snake offset
; chack if the snake is about to get lest from the screen
PROC chack_lim_left
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx

	xor dx, dx
	mov bx, [bp + 4]  ; bx have the snake offset
	mov ax, [bx]  ; ax have the place of the head of the snake
	mov cx, 2*80
	div cx        ; dx get the column of the snake head
	xor al, al
	cmp dx, 0   ; the snake is on the left line of the screen
	jne next_left1
	mov ax, "$"
	mov [bp + 4], ax
	next_left1:

	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret
ENDP chack_lim_left

; get the snake offset
; chack if the snake touch himself, and end the progress if it is
PROC chack_hititself
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx

	xor ax, ax
	xor cx, cx
	mov bx, [bp+4]
	mov cl, [snake_length]
	mov ax, [bx]

	lop_chackhit:
	push bx
	push ax

	mov ax, cx
	sub ax, 1
	mov dl, 2
	mul dl     
	add bx, ax   ; bx have the offset snake + snake length - 1 (the count starts at 0)
	mov dx, [bx]
	pop ax
	cmp dx, ax   ; compare the addres of snake length - 1 to the snake head
	je end_progres_hit

	pop bx
	dec cx
	cmp cx, 1
	jg lop_chackhit
	jmp end_chack_safe

	end_progres_hit:
	pop bx
	mov ax, "$"
	mov [bp+4], ax

	end_chack_safe:
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret
ENDP chack_hititself

;---------------------------------------------------------------------------------;



;                             chack functions
;---------------------------------------------------------------------------------;

; get the key that got pressed
; chack and translate the new snake direction
PROC pressed_to_lastmove
	push bp
	mov bp, sp
	push ax

	mov ax, [bp+4]  ; al is the pressed key
	cmp al, 77h		;w pressed
	je try_up1

	cmp al, 61h		;a pressed
	je try_left1

	cmp al, 73h		;s pressed
	je try_down1

	cmp al, 64h		;d pressed
	je try_right1

	cmp al, 27		;esc pressed
	je end_progress_1
	jmp end_change_dir

	end_progress_1:
	mov [lastmove], 27
	jmp end_change_dir

	try_up1:
	cmp [lastmove], 3   ; chack if last move was down
	je end_change_dir   ; if it was, nothing changes
	mov [lastmove], 1   ; otherwise, the snake move is up now
	jmp end_change_dir

	try_left1:
	cmp [lastmove], 4   ; chack if last move was right
	je end_change_dir
	mov [lastmove], 2   ; the snake move is left now
	jmp end_change_dir

	try_down1:
	cmp [lastmove], 1   ; chack if last move was up
	je end_change_dir
	mov [lastmove], 3   ; the snake move is down now
	jmp end_change_dir

	try_right1:
	cmp [lastmove], 2   ; chack if last move was left
	je end_change_dir
	mov [lastmove], 4   ; the snake move is right now


	end_change_dir:
	pop ax
	pop bp
	ret
ENDP pressed_to_lastmove

; get the offset of the snake,
; and chack if the snake eating the apple
PROC chack_if_eating
	push bp
	mov bp, sp
	push dx
	push bx
	push di
	push ax
	
	mov bx, [bp+4]  ; bx have the snake offset
	mov di, [bx]    ; di have the head of the snake place
	
	mov bx, offset apple
	
	mov cx, [apple_amount] ; apple on screen
	dec cx
	shl cx, 1

	add bx, cx
	mov cx, [apple_amount] ; apple on screen

	lop_check:
	
	cmp di, [bx]
	je eat

	sub bx, 2
	loop lop_check

	jmp not_eating
	
	eat:
	mov ax, "$"
	mov [bp+4], ax

	not_eating:

	pop ax
	pop di
	pop bx
	pop dx
	pop bp
	ret
ENDP chack_if_eating

;---------------------------------------------------------------------------------;



;                                delay functions
;---------------------------------------------------------------------------------;

;delay the code
PROC delay
	push cx

	mov cx, 4
	delay_lop1:
	push cx
	mov cx, 0BFFFh
	delay_lop2:
	loop delay_lop2
	pop cx
	loop delay_lop1

	pop cx
	ret
ENDP delay

;delay the code whan snake move up or down
PROC delay_updown
	push cx

	mov cx, 1
	delayupdown_lop1:
	push cx
	mov cx, 0FFFFh
	delayupdown_lop2:
	loop delayupdown_lop2
	pop cx
	loop delayupdown_lop1

	pop cx
	ret
ENDP delay_updown

;---------------------------------------------------------------------------------;


; gives a rendom number 0 - 3998 and put it in [apple]
; by multiplay the last place of [apple] by 16 and mod of 4000
PROC random_gen
	push bp
	mov bp, sp
	push dx
	push cx
	push bx
	push ax

	xor dx, dx

	mov cx, [bp + 4] ; place in array
	mov bx, [bp + 6] ; offset apple
	add bx, cx

    mov ax, [bx]
	
	; add ax, bx
	; shl ax, 3

	mov ah,0h ; interrupts to get system time
    int 1ah   ; CX:DX now hold number of clock ticks since midnight
			  ; will use just dx

	mov ax, [bp + 4]
	add ax, dx

	shl ax, 5

	add ax, [bp + 4]

	shl ax, 2

	add ax, [bp + 4]

	xor dx, dx
    mov cx, 80*12*2 + 40  ; 2000
    div cx ;  dx contains the remain of the division - from 0 to 1999
	
	shl dx, 1 ; 0 - 3998

	mov cx, [bp + 4] ; place in array
	mov bx, [bp + 6] ; offset apple
	add bx, cx
    mov [bx], dx

	pop ax
	pop bx
	pop cx
	pop dx
	pop bp
	ret 4
ENDP random_gen



start:
	mov ax, @data
	mov ds, ax
	mov ax, 0A000h
	mov es, ax
; --------------------------
; Your code here
; --------------------------
	call clear
	push offset snake
	push 00h
	call print_snake  ; show the snake on the screen
	pop ax
	pop ax  ; trash

	mov ah,0h ; interrupts to get system time
    int 1ah   ; CX:DX now hold number of clock ticks since midnight
			  ; will use just dx
	
	mov bx, offset apple ; offset apple
	mov [bx], dx   ; apple get a random num

	push offset apple
	push 0
	call random_gen   ; make a random num in the range 2-3998 from the last random
	push offset apple
	push 0
	call apple_screen

	xor ax, ax
    mov bx, 2700    ; place

	mov al, 1
	
    add al, 48h
    mov ah, 96
	mov [word es:bx], ax

	lop:
	call delay

	xor ax, ax
	push offset snake
	call chack_hititself
	pop ax
	cmp ax, "$"
	jne chack_eating_lable
	jmp exit

	chack_eating_lable:
	xor ax, ax
	push offset snake
	call chack_if_eating   ; chack if the snake "eat" the apple
	pop ax
	cmp ax, "$"
	je snake_ate

	push offset apple
	call goust_apples
	
	xor ax, ax
	mov ah, 01h    ; chack if something was pressed
	int 16h
	jz keys_didnt_pressed   ; it wasnt
	mov ah, 00h   ; get to al the pressed key
	int 16h
	
	keys_didnt_pressed:
	push ax
	call pressed_to_lastmove    ; chack if the pressed key is leggle
	pop ax
	xor al, al
	mov al, [lastmove]

	cmp al, 1		;w pressed
	je w_pressed
	jmp cmp_left
	w_pressed:
	jmp up1

	cmp_left:
	cmp al, 2		;a pressed
	je a_pressed
	jmp cmp_down
	a_pressed:
	jmp left1

	cmp_down:
	cmp al, 3		;s pressed
	je s_pressed
	jmp cmp_right
	s_pressed:
	jmp down1

	cmp_right:
	cmp al, 4		;d pressed
	je d_pressed
	jmp cmp_exit
	d_pressed:
	jmp right1

	cmp_exit:
	cmp al, 27		;esc pressed
	jne lop
	jmp exit        ; finish jame
	

	snake_ate:
	mov ax, [apple_amount] ; apple on screen
	dec ax
	shl ax, 1

	xor cx, cx
	mov cl, [apple_perEat]
	shl cx, 1

	add cx, ax
	apples_screen:
	
	push offset apple
	push cx
	call random_gen    ; gives a new random place to the new apple

	push offset apple
	push cx
	call apple_screen  ; shaw the new apple

	sub cx, 2
	
	cmp cx, ax
	jg apples_screen

	; mov ax, [apple_amount] ; apple on screen
	; dec ax
	; shl ax, 1

	; apple_alreadyscreen:
	; push offset apple
	; push ax
	; call apple_screen  ; shaw the apple

	; sub ax, 2
	; cmp ax, 0
	; jg apple_alreadyscreen

	push offset snake
	call snake_eat     ; make the snake lenght bigger by one
	pop ax  ; trash\
	xor ax, ax
	mov al, [apple_perEat]
	add [apple_amount], ax
	inc [apple_perEat] ; another apple need to be appeare
	jmp keys_didnt_pressed


	up1:
	call delay_updown

	push offset snake
	call chack_lim_up  ; chack if the snake about to go out of the screen up
	pop ax
	cmp ax, "$"
	jne up1next  ; the snake is not about to move out from the screen

	jmp exit

	up1next:
	push offset snake
	call move_up  ; move the snake places up
	pop ax

	jmp lop


	left1:
	push offset snake
	call chack_lim_left  ; chack if the snake about tho go out of the screen left, or last move was right
	pop ax
	cmp ax, "$"
	jne left1next  ; the snake is not about to move out from the screen

	jmp exit

	left1next:
	push offset snake
	call move_left  ; move the snake places left
	pop ax

	jmp lop

	down1:
	call delay_updown

	push offset snake
	call chack_lim_down  ; chack if the snake about tho go out of the screen down
	pop ax
	cmp ax, "$"
	jne down1next  ; the snake is not about to move out from the screen

	jmp exit


	down1next:
	push offset snake
	call move_down  ; move the snake places down
	pop ax

	jmp lop


	right1:
	push offset snake
	call chack_lim_right  ; chack if the snake about tho go out of the screen right
	pop ax
	cmp ax, "$"
	jne right1next  ; the snake is not about to move out from the screen

	jmp exit

	right1next:
	push offset snake
	call move_right  ; move the snake places right
	pop ax

	jmp lop

exit:
	mov ax, 4c00h
	int 21h
END start