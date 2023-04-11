IDEAL
MODEL small
STACK 256

DATASEG

	win_melody dw 2711, 2415, 2031, 2711, 1612, 1,1, 1612, 1,1, 1809, 1,1,1,1, 2711, 2415, 2031, 2711, 1809, 1,1, 1809, 1,1, 2031, 1, 2152, 2415, 1,1, 2711, 2415, 2031, 2711, 2031, 1,1,1, 1809, 1, 2152, 1,1,1, 2711, 1,1, 2711, 1,1, 1809, 1,1, 2031, 0

CODESEG

	proc play_melody ; ax = notes array offset, divisor[2]
		push ax
		push si

		mov si, ax
		play_melody_loop:
			mov ax, [si]
			cmp ax, 0
			je play_melody_end

			cmp ax, 1
			je play_melody_continue

			push ax
			call play_beep

			play_melody_continue:
			call wait_tenth
			call stop_beep
			add si, 2
			jmp play_melody_loop
		
		play_melody_end:
		call stop_beep
		pop si
		pop ax
		ret
	endp


	proc play_beep ; divisor
		push bp
		mov bp, sp
		push ax

		in al, 61h ; Open speaker
		or al, 00000011b
		out 61h, al
		
		mov al, 0B6h ; Send control word to change frequency
		out 43h, al

		mov ax, [bp+4] ; Play divisor
		out 42h, al ; Sending lower byte
		mov al, ah
		out 42h, al ; Sending upper byte

		pop bp
		pop ax
		ret 2
	endp


	proc stop_beep
		push ax

		in al, 61h
		and al, 11111100b
		out 61h, al

		pop ax
		ret
	endp


	proc wait_tenth
		push ax
		push cx
		push dx
		
		mov ah, 86h
		mov cx, 0001h
		mov dx, 86A0h
		int 15h

		pop dx
		pop cx
		pop ax
		ret
	endp

start:
    mov ax, @data
    mov ds, ax

    lea ax, [win_melody]
    call play_melody

exit:
    mov ah, 4Ch
    int 21h
END start