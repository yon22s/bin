IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
array_lenth db 10
array db 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

CODESEG
; --------------------------
; Your functions here
; --------------------------
; get the first address of the array and the lenth of the array
; returns the address of the minimum mun on the array.
PROC min
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	
	mov bx, [bp + 6]  ; first addres
	mov dx, bx  ; will be the min addres
	mov cx, [bp + 4]  ; array length
	mov al, [bx]  ; the first num in the array
	dec cx

	min_lop:
	inc bx
	mov ah, [bx]   ; the next num in the array
	cmp al, ah
	jl min_lop1
	mov al, ah
	mov dx, bx
	
	min_lop1:
	dec cx
	cmp cx, 0
	jg min_lop

	mov [bp + 6], dx  ; return the min address

	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 2
ENDP min


; get the first address and the min in the array address
; swap them
PROC swap
	push bp
	mov bp, sp
	push di
	push bx
	push cx

	mov di, [bp + 6]  ; first address
	mov bx, [bp + 4]  ; min address

	mov cl, [di] ; first num
	mov ch, [bx] ; min num

	mov [di], ch
	mov [bx], cl

	pop cx
	pop bx
	pop di
	pop bp
	ret 4
ENDP swap


start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	
	xor cx, cx
	mov cl, [array_lenth]  ; cx get the array lenth for the loop
	mov bx, offset array


	main_lop:
	push bx  ; the first address
	push cx  ; the new array lenth
	call min
	pop ax ; get the address of min

	push bx  ; the first address
	push ax  ; the min address
	call swap

	inc bx ; left the min out of the new array

	loop main_lop


exit:
	mov ax, 4c00h
	int 21h
END start