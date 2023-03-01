IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
CODESEG
; makes the screen black
PROC black_screen
	mov cx, 2*(80*25)
	xor di, di

	lop:
	mov al, " "
	mov ah, 0
	mov [es:di], ax

	add di, 2
	loop lop

	ret
ENDP black_screen

start:
	mov ax, @data
	mov ds, ax
	mov ax, 0b800h
	mov es, ax
; --------------------------
; Your code here
; --------------------------
	call black_screen

	mov di, 2*(80*12)+80
	mov ah, 20
	mov al, "*"

	mov [word es:di], ax


exit:
	mov ax, 4c00h
	int 21h
END start


