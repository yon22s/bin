IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------

CODESEG
; --------------------------
; Your functions here
; --------------------------
PROC clear
	mov cx, 2*(80*25)
	xor di, di

	lop_clear:
	mov al, " "
	mov ah, 0
	mov [es:di], ax

	add di, 2
	loop lop_clear

	ret
ENDP clear

PROC clean_this  	; get bx and clean it
	mov al, " "
	mov ah, 0
	mov [es:bx], ax

	ret
ENDP clean_this

PROC move_up
	cmp bx, 160
	jl next_up
	sub bx, 80*2

	next_up:
	mov ah, 20
	mov al, "*"

	mov [word es:bx], ax

	ret	
ENDP move_up

PROC move_down
	cmp bx, 80*2*24
	jg next_down
	add bx, 80*2

	next_down:
	mov ah, 20
	mov al, "*"

	mov [word es:bx], ax
	
	ret	
ENDP move_down

PROC move_right
	xor dx, dx
	mov ax, bx
	mov cx, 80*2
	div cx
	cmp dx, 158
	je next_right

	add bx, 2
	next_right:
	mov ah, 20
	mov al, "*"

	mov [word es:bx], ax
	
	ret	
ENDP move_right

PROC move_left
	xor dx, dx
	mov ax, bx
	mov cx, 160
	div cx
	cmp dx, 0
	je next_left

	sub bx, 2
	next_left:
	mov ah, 20
	mov al, "*"

	mov [word es:bx], ax
	
	ret	
ENDP move_left

start:
	mov ax, @data
	mov ds, ax
	mov ax, 0b800h
	mov es, ax
; --------------------------
; Your code here
; --------------------------
	call clear

	mov di, 2*(80*12)+80
	mov ah, 20
	mov al, "*"

	mov [word es:di], ax

	mov bx, di

	lop:
	mov ah, 01h
	int 21h

	cmp al, 77h		;w pressed
	jne next1
	call clean_this
	call move_up

	next1:
	cmp al, 61h		;a pressed
	jne next2
	call clean_this
	call move_left

	next2:
	cmp al, 73h		;s pressed
	jne next3
	call clean_this
	call move_down

	next3:
	cmp al, 64h		;d pressed
	jne next4
	call clean_this
	call move_right

	next4:
	cmp al, 27		;esc pressed
	je exit
	
	jmp lop




exit:
	mov ax, 4c00h
	int 21h
END start


