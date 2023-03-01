IDEAL
MODEL small
STACK 100h
P186
JUMPS
DATASEG

Duck    db 't','t','t','t','t','t','t','t',08h,'t',0eh,'t',0eh,'t',08h,'t','t','t','t','t','t','t','t',"n"
        db 't','t','t','t','t','t','t',08h,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',08h,'t','t','t','t','t','t','t',"n"
        db 't','t','t',0fh,'t',0fh,'t',0fh,'t',08h,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t','t','t',"n"
        db 't','t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t','t',"n"
        db 't',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',"n"
        db 't',0fh,'t',08h,'t',0fh,'t',0fh,'t',00h,'t',00h,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',0eh,'t',00h,'t',00h,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',"n"
        db 't',0fh,'t',08h,'t',0fh,'t',0fh,'t',00h,'t',00h,'t',0fh,'t',0eh,'t',0eh,'t',0eh,'t',0fh,'t',0fh,'t',00h,'t',00h,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',"n"
        db 't',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',"n"
        db 't',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',"n"
        db 't',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',"n"
        db 't','t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t',0fh,'t',0fh,'t','t',"n"
        db 't','t',0fh,'t',0fh,'t',0fh,'t',08h,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t','t',"n"
        db 't','t','t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t',08h,'t',08h,'t',08h,'t',08h,'t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t','t','t',"n"
        db 't','t','t','t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t','t','t','t',"n"
        db 't','t','t','t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t','t','t','t',"n"
        db 't','t','t','t','t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t','t','t','t','t',"n"
        db 't','t','t','t','t','t','t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t','t','t','t','t','t','t',"n"
        db 't','t','t','t','t','t','t',08h,'t',0fh,'t',0fh,'t',0fh,'t',0fh,'t',08h,'t','t','t','t','t','t','t',"n"
        db 't','t','t','t','t','t','t','t',08h,'t',,0fh,'t',0fh,'t',08h,'t','t','t','t','t','t','t','t',"n"
        db 't','t','t','t','t','t','t','t',08h,'t',08h,'t',08h,'t',08h,'t','t','t','t','t','t','t','t','t',"n"
        db "$"
x_pos dw 150
y_pos dw 180

cube_size db 20
cubecolor db 15

score dw 0
multi dw 0

carcolor db 4
cars dw 0
car_x dw 0
car_y dw 0
roads dw 0
road_y dw 0

road_size_y db 25
car_size_x db 33
car_size_y db 20

random dw 0
leftright db 0
carsonscrine db 3
roadsonscrine db 3

road_1 dw 1
road_1_y dw 102
road_3 dw 1
road_3_y dw 2
road_2 dw 1
road_2_y dw 52

car_1 dw 1
car_1_x dw 1
car_1_y dw 105
car_3 dw 1
car_3_x dw 1
car_3_y dw 5
car_2 dw 1
car_2_x dw 285
car_2_y dw 55


CODESEG
start:
	mov ax, @data
	mov ds, ax

	
	; mov ah, 0
	; int 1ah
	; mov ax, dx
	; xor dx, dx
	; mov cx, 6
	; div cx

	mov ax, 13h
	int 10h

	call starts

gameloop:
	mov ah, 01h
	int 16h
	jnz getpressed ; pressed something

	;waiting
	mov ah, 86h
	mov cx, 01
	mov dx, 01
	int 15h

	call roads_cars_loop

	jmp gameloop

getpressed:
	call move_cube
	jmp gameloop



PROC starts
	mov [x_pos], 150
	mov [y_pos], 180
	mov [car_1_x], 1
	mov [car_1_y], 105
	mov [car_3_x], 1
	mov [car_3_y], 5
	mov [car_2_x], 285
	mov [car_2_y], 55
	
	call printduck

	;road 1
	mov ax, [road_1_y]
	mov [road_y], ax
	call roadDraw

	;road 2
	mov ax, [road_2_y]
	mov [road_y], ax
	call roadDraw

	;road 3
	mov ax, [road_3_y]
	mov [road_y], ax
	call roadDraw

	; car 1
	mov ax, [car_1_x]
	mov [car_x], ax
	mov ax, [car_1_y]
	mov [car_y], ax
	call DrawCar

	; car 2
	mov ax, [car_2_x]
	mov [car_x], ax
	mov ax, [car_2_y]
	mov [car_y], ax
	call DrawCar

	; car 3
	mov ax, [car_3_x]
	mov [car_x], ax
	mov ax, [car_3_y]
	mov [car_y], ax
	call DrawCar

	ret
ENDP starts


PROC roads_cars_loop
	pusha

road1:
	cmp [road_1], 0
	je road2
	mov ax, [road_1_y]
	mov [road_y], ax
	call roadDraw
	mov ax, [roads]
	mov [road_1], ax
road2:
	cmp [road_2], 0
	je road3
	mov ax, [road_2_y]
	mov [road_y], ax
	call roadDraw
	mov ax, [roads]
	mov [road_2], ax
road3:
	cmp [road_3], 0
	je car1
	mov ax, [road_3_y]
	mov [road_y], ax
	call roadDraw
	mov ax, [roads]
	mov [road_3], ax


car1:
	; car 1
	cmp [car_1], 0
	je car2
	mov ax, [car_1_x]
	mov [car_x], ax
	mov ax, [car_1_y]
	mov [car_y], ax
	
	call move_car_left
	call check_lose

	mov ax, [car_x]
	mov [car_1_x], ax
	mov ax, [car_y]
	mov [car_1_y], ax

car2:
	; car 2
	cmp [car_2], 0
	je car3
	mov ax, [car_2_x]
	mov [car_x], ax
	mov ax, [car_2_y]
	mov [car_y], ax

	call move_car_right
	call check_lose

	mov ax, [car_x]
	mov [car_2_x], ax
	mov ax, [car_y]
	mov [car_2_y], ax

car3:
	; car 3
	cmp [car_3], 0
	je return
	mov ax, [car_3_x]
	mov [car_x], ax
	mov ax, [car_3_y]
	mov [car_y], ax

	call move_car_left
	call check_lose

	mov ax, [car_x]
	mov [car_3_x], ax
	mov ax, [car_y]
	mov [car_3_y], ax

return:

	popa
	ret
endp roads_cars_loop



PROC roadDraw
	pusha

	mov cx, 0
	mov dx, [road_y]
	mov al, 15

	cmp dx, 190
	jg disappear_dowd_road

	mov [roads], 1

uproad:
	call PixelDrow

	inc cx

	cmp cx, 320
	jl uproad


	mov cx, 0
	mov dx, [road_y]
	add dx, 25

downroad:
	call PixelDrow

	inc cx

	cmp cx, 320
	jl downroad
	jmp roadonscrine


disappear_dowd_road:
	mov [roads], 0
	dec [roadsonscrine]

roadonscrine:

	popa
	ret
ENDP roadDraw


PROC check_lose
	pusha

	mov ah, 0
	mov al, [car_size_y]
	mov dx, [car_y]
	add dx, ax
	mov ah, [car_size_x]  ; car x,y down.


cube_check: ; check if the cube is touching the car.

	mov cx, [y_pos]
	cmp cx, dx
	jg keep_play
	add cx, 20
	cmp cx, dx
	jl keep_play

	mov cx, [car_x]
	mov dx, [x_pos]

	add dx, 20
	cmp cx, dx
	jg keep_play
	sub dx, 50
	cmp cx, dx
	jl keep_play

	; lose method
	mov cx, 90
	mov dx, 70
	mov ah, 30
	mov bh, 10
	mov al, 7
draw_l:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_l

	mov ah, 30
	mov dx, 70

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_l

	mov cx, 110
	mov dx, 70
	mov ah, 30
	mov bh, 30
draw_1_o:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_1_o

	mov ah, 30
	mov dx, 70

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_1_o


	mov cx, 120
	mov dx, 78
	mov ah, 15
	mov bh, 15
	mov al, 0
draw_1_o_inside:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_1_o_inside

	mov ah, 15
	mov dx, 78

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_1_o_inside

	mov cx, 150
	mov dx, 70
	mov ah, 20
	mov bh, 20
	mov al, 7
draw_1_s:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_1_s

	mov ah, 20
	mov dx, 70

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_1_s


	mov cx, 155
	mov dx, 75
	mov ah, 10
	mov bh, 15
	mov al, 0
draw_1_s_inside:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_1_s_inside

	mov ah, 10
	mov dx, 75

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_1_s_inside


	mov cx, 150
	mov dx, 85
	mov ah, 15
	mov bh, 20
	mov al, 7
draw_2_s:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_2_s

	mov ah, 15
	mov dx, 85

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_2_s


	mov cx, 150
	mov dx, 88
	mov ah, 8
	mov bh, 15
	mov al, 0
draw_2_s_inside:

	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_2_s_inside

	mov ah, 8
	mov dx, 88

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_2_s_inside

	mov cx, 175
	mov dx, 70
	mov ah, 30
	mov bh, 20
	mov al, 7
	
	mov cx, 180
	mov dx, 70
	mov ah, 20
	mov bh, 20
	mov al, 7
draw_1_e:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_1_e

	mov ah, 20
	mov dx, 70

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_1_e


	mov cx, 185
	mov dx, 75
	mov ah, 10
	mov bh, 10
	mov al, 0
draw_1_e_inside:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_1_e_inside

	mov ah, 10
	mov dx, 75

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_1_e_inside


	mov cx, 180
	mov dx, 85
	mov ah, 15
	mov bh, 20
	mov al, 7
draw_2_e:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_2_e

	mov ah, 15
	mov dx, 85

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_2_e


	mov cx, 185
	mov dx, 88
	mov ah, 8
	mov bh, 15
	mov al, 0
draw_2_e_inside:
	call PixelDrow

	inc dx
	DEC ah

	cmp ah, 0
	jne draw_2_e_inside

	mov ah, 8
	mov dx, 88

	inc cx
	dec bh

	cmp Bh, 0
	jne draw_2_e_inside




newgame:
	;waiting
	mov ah, 86h
	mov cx, 04
	mov dx, 01
	int 15h

	call starts

keep_play:

	popa
	ret
ENDP check_lose


PROC move_car_left
	pusha

	mov [carcolor], 0
	call DrawCar

	cmp [car_y], 180
	jg car_disappear_down

	cmp [car_x], 285
	jg car_disappear_right

	add [car_x], 3
	jmp drawcarcall

car_disappear_down:
	mov [cars], 0
	dec [carsonscrine]
	jmp passeverything_

car_disappear_right:
	mov [cars], 0
	dec [carsonscrine]
	jmp passeverything_
	
drawcarcall:
	mov [carcolor], 4
	call DrawCar
	mov [cars], 1
	
passeverything_:
	call printduck

	popa
	ret

ENDP move_car_left


PROC move_car_right
	pusha

	mov [carcolor], 0
	call DrawCar

	cmp [car_y], 180
	jg car_disappear_down_r

	cmp [car_x], 4
	jl car_disappear_left

	sub [car_x], 3
	jmp drawcarcall_r

car_disappear_down_r:
	mov [cars], 0
	dec [carsonscrine]
	jmp passeverything

car_disappear_left:
	mov [cars], 0
	dec [carsonscrine]
	jmp passeverything
	
drawcarcall_r:
	mov [carcolor], 4
	call DrawCar
	mov [cars], 1
	
passeverything:
	call printduck

	popa
	ret

ENDP move_car_right


PROC move_cube
	pusha

	mov ah, 00h
	int 16h

	mov [cubecolor], 0
	; ; car 1
	; mov bx, [car_1_x]
	; mov [car_x], bx
	; mov bx, [car_1_y]
	; mov [car_y], bx
	; call DrawCar

	; ; car 2
	; mov bx, [car_2_x]
	; mov [car_x], bx
	; mov bx, [car_2_y]
	; mov [car_y], bx
	; call DrawCar

	; ; car 3
	; mov bx, [car_3_x]
	; mov [car_x], bx
	; mov bx, [car_3_y]
	; mov [car_y], bx
	; call DrawCar
	
	call cubeDraw


	cmp ah, 48h
	je up_pressed
	cmp ah, 4Bh
	je left_pressed
	cmp ah, 4Dh
	je right_pressed
	jmp continue

up_pressed:
	inc [score]
	;call printscore

	cmp [y_pos], 110
	jl everythingUp
	sub [y_pos], 25
	JMP continue
left_pressed:
	cmp [x_pos], 20
	jl continue
	sub [x_pos], 25
	JMP continue
right_pressed:
	cmp [x_pos], 280
	jg continue
	add [x_pos], 25
	JMP continue

everythingUp:
	add [car_1_y], 25
	add [car_3_y], 25
	add [car_2_y], 25
	add [road_1_y], 25
	add [road_3_y], 25
	add [road_2_y], 25
	call randomroad
	
	call printscore
	jmp continue

continue:
	mov ah, 09h
	mov cx, 1000h
	mov al, 20h
	mov bl, 0
	int 10h
	
	mov [carcolor], 4

	call roads_cars_loop

	call printduck
	
	popa
	ret
ENDP move_cube
	

PROC printscore
	pusha

	;mov dl, [score]
	;mov ah, 2
	;int 21h

	popa
	ret
ENDP printscore


PROC PixelDrow
	pusha
	; need cx = x, dx = y, al = color
	mov bh, 00h
	mov ah, 0ch
	
	int 10h

	popa
	ret
ENDP PixelDrow


PROC printduck
    pusha

    mov bx, offset Duck
    mov cx, [x_pos]
    mov dx, [y_pos]

	duckloop:
    	mov al, [bx]
    	add bx, 1

    	cmp al, '$'
    	je endduckloop

    	cmp al, 't'
    	je got_t

    	cmp al, "n"
    	je got_n

    ; need cx = x, dx = y, al = color
		mov ah, 0ch
		int 10h

    	jmp duckloop

	got_t:
    	add cx, 1
    	jmp duckloop
    
	got_n:
    	add dx, 1
    	mov cx, [x_pos]
    	jmp duckloop

	endduckloop:

    	popa
    	ret
endp printduck


PROC cubeDraw
	pusha

	mov ah, [cube_size]
	mov bh, [cube_size]
	mov cx, [x_pos]
	mov dx, [y_pos]

drawcube:
	mov al, [cubecolor]
	call PixelDrow
	INC cx
	DEC ah

	CMP ah, 00
	JNE drawcube

	mov ah, [cube_size]
	mov cx, [x_pos]
	inc dx
	DEC bh

	cmp bh, 0
	jne drawcube


; 	mov al, [cube_size]
; 	mov cx, [x_pos]
; 	mov dx, [y_pos]
; 	add dx, ax
; 	mov ah, al
	
; drowdown:
; 	mov al, [cubecolor]
; 	call PixelDrow
; 	INC cx
; 	DEC ah

; 	CMP ah, 00
; 	JNE drowdown

; 	mov ah, [cube_size]
; 	mov cx, [x_pos]
; 	mov dx, [y_pos]
	
; drowleft:
; 	mov al, [cubecolor]
; 	call PixelDrow
; 	INC dx
; 	DEC ah

; 	CMP ah, 00
; 	JNE drowleft


; 	mov al, [cube_size]
; 	mov cx, [x_pos]
; 	mov dx, [y_pos]
; 	add cx, ax
; 	mov ah, al
; 	inc ah

; drowright:
; 	mov al, [cubecolor]
; 	call PixelDrow
; 	INC dx
; 	DEC ah

; 	CMP ah, 00
; 	JNE drowright

	popa
	ret
ENDP cubeDraw


PROC DrawCar 
	pusha

	mov ah, [car_size_x]
	mov cx, [car_x]
	mov dx, [car_y]

drowupcar:
	mov al, [carcolor]
	call PixelDrow
	INC cx
	DEC ah

	CMP ah, 0
	JNE drowupcar


	mov al, [car_size_y]
	mov cx, [car_x]
	mov dx, [car_y]
	add dx, ax
	mov ah, [car_size_x]
	
drowdowncar:
	mov al, [carcolor]
	call PixelDrow
	INC cx
	DEC ah

	CMP ah, 0
	JNE drowdowncar

	mov ah, [car_size_y]
	mov cx, [car_x]
	mov dx, [car_y]
	
drowleftcar:
	mov al, [carcolor]
	call PixelDrow
	INC dx
	DEC ah

	CMP ah, 0
	JNE drowleftcar


	mov al, [car_size_x]
	mov cx, [car_x]
	mov dx, [car_y]
	add cx, ax
	mov ah, [car_size_y]
	inc ah

drowrightcar:
	mov al, [carcolor]
	call PixelDrow
	INC dx
	DEC ah

	CMP ah, 0
	JNE drowrightcar

	popa
	ret
	
ENDP DrawCar


PROC randomnum10
	pusha

	mov ah,0h ; interrupts to get system time
    int 1ah

    mov ax,dx
    xor dx,dx
    mov cx,10
    div cx ;  dx contains the remain of the division - from 0 to 9
    inc dx
    mov [random], dx
	
	popa
	ret
ENDP randomnum10


PROC randomroad
	pusha

	cmp [roadsonscrine], 3
	je tomuchr

	call randomnum10
	mov ax, [random]
	mov bx, 10
	call multiply

	add [multi], ax
	mov ax, [score]
	add [multi], ax

	cmp [multi], 100
	jl tomuchr

	call addroad

tomuchr:

	popa
	ret
ENDP randomroad


PROC addroad
	pusha

	cmp [road_1], 1
	je road_2cmp
	mov [road_1_y], 2
	mov [road_1], 1

road_2cmp:
	cmp [road_2], 1
	je road_3cmp
	mov [road_2_y], 2
	mov [road_2], 1

road_3cmp:
	cmp [road_2], 1
	je road_2cmp
	mov [road_2_y], 2
	mov [road_2], 1

	popa
	ret
ENDP addroad


PROC randomcar
	pusha

	cmp [carsonscrine], 4
	je tomuchc

	call randomnum10
	cmp [random], 10
	jg tomuchc

	;call addcar

tomuchc:

	popa
	ret
ENDP randomcar


PROC multiply
	pusha
	; gets ax, bx
	mov cx, ax

mult:
	add ax, cx
	dec bx
	cmp bx, 0
	jg mult

	mov [multi], ax
	popa
	ret
ENDP multiply

	
exit:
	mov ax, 4c00h
	int 21h
END start
