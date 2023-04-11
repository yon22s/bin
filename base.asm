IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
white		equ 15
textX		dw 0
textY		dw 0
num0 	db 't', 't', 0 , 0 , 0 , 't', 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 't', 0 , 0 , 0 , 't', 't', 's'

	num1 	db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 0 , 0 , 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 0 , 0, 0 , 't', 't', 's'
	num2	db 't', 't', 0, 0, 0, 't', 't', 'n'
			db 't', 0, 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 0, 't', 't', 'n'
			db 't', 't', 't', 0, 't', 't', 't', 'n'
			db 't', 't', 0, 't', 't', 't', 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 's'

	num3	db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 's'

	num4 	db 't', 't', 't', 0, 0, 't', 't', 'n'
			db 't', 't', 0, 't', 0, 't', 't', 'n'
			db 't', 0, 't', 't', 0, 't', 't', 'n'
			db 0, 't', 't', 't', 0, 't', 't', 'n'
			db 0 , 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 0,'t', 's'
	
	num5 	db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 't', 't', 's'

	num6 	db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0, 't', 't', 't', 't', 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 's'
	
	num7	db 't', 0 , 0 , 0 , 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 'n'
			db 't', 't', 't', 't', 0 , 't', 't', 's'
	
	num8 	db 't', 't', 0 , 0 , 0 , 't', 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 't', 0 , 0 , 0 , 't', 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 't', 't', 't', 0 , 't', 'n'
			db 't', 't', 0 , 0 , 0 , 't', 't', 's'

	num9	db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0, 't', 't', 't', 0 , 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 't', 't', 't', 't', 0, 't', 'n'
			db 't', 0 , 0 , 0 , 0 , 0 , 't', 's'
	
	num10	db 't', 0, 't', 't', 0, 0, 't', 'n'
			db  0 , 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db 't', 0, 't', 0 ,'t', 't', 0 , 'n'
			db  0 , 0 , 0 , 't', 0 , 0 , 't', 's'

CODESEG
; --------------------------
; Your functions here
; --------------------------


PROC draw_Graphic ;; draw the graphic in a color at poristion passed in stack: color, offset num_x, x, y
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


PROC find_Graphic ;;pushes offset of num pushed to stack
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


PROC print_Number ;;print number pushed to stack at starting position pushed: num, x, y
	push bp
	mov bp, sp
	push ax
	push bx
	push cx

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
	push white
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
	push white
	call draw_Graphic

	pop ax
	mov al, ah
	xor ah, ah
	push [textY]
	push [textX]
	add [textX], 8
	push ax
	call find_Graphic
	push white
	call draw_Graphic

	pop cx
	pop bx
	pop ax
	pop bp
	ret 6
ENDP print_Number

start:
	mov ax, @data
	mov ds, ax
	mov ax, 0b800h
	mov es, ax
; --------------------------
; Your code here
; --------------------------
	; Graphic mode
	mov ax, 13h
	int 10h

	
	push 180
	push 282
	push 478
	call print_Number

	xor ax,ax
	mov ah,1

	int 21h

exit:
	mov ax, 4c00h
	int 21h
END start


