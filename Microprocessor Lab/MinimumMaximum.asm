Data Segment
 msg1 db 0dh,0ah,"Enter number 1 $"
 msg2 db 0dh,0ah,"Enter number 2 $"
 msg db 0dh,0ah,"-- -- -- -- OF DF IF TF SF ZF -- AF -- PF -- CF $"
 newl db 0dh,0ah,"$"
 flag dw ?
Data ends
Code Segment
assume CS:Code,DS:Data
start:
 mov ax,Data
 mov DS,ax
 cli; Clear Interrupt Flag
 stc; sets the carry flag
 clc; clears carry flag
 std;set the direction flag to one
 
  mov dx,offset msg1
  mov ah,09h
 int 21h

 mov ah,01h
 int 21h
 mov bl, al

 mov dx,offset msg2
 mov ah,09h
 int 21h
 
 mov ah,01h
 int 21h
 mov cl, al
 
 sub bl,cl
 
 mov dx,offset msg
 mov ah,09h
 int 21h

 mov dx,offset newl
 mov ah,09h
 int 21h
 pushf
 
 pop bx
 
 mov flag,bx

 mov cx,16
 mov bx,8000h

loops:
 mov ax,flag
 and ax,bx
 jz zero
 mov dl,31h
 mov ah,02h
 int 21h
 jmp space

zero: mov dl,30h
 mov ah,02h
 int 21h

space: mov dl,' '
 mov ah,02h
 int 21h

 mov ah,02h
 int 21h
 ror bx,1

 loop loops

 mov ah,4ch
 int 21h
Code ends
end start
___________________________

data segment
msg1 db 0dh,0ah,"1 minimum no 2 maximum no 3 exit $"
msg2 db 0dh,0ah,"enter your choice $"
msg3 db 0dh,0ah,"minimum no is $"
msg4 db 0dh,0ah,"maximum no is $"
arr db 04H,01H,05H,07H,02H,03h, 0aH, 09h,0bh,12h
data ends


code segment
assume cs: code, ds: data
start: mov ax,data
       mov ds, ax

continue:mov dx,offset msg1
    mov ah,09h
    int 21h

    mov dx,offset msg2
    mov ah,09h
    int 21h 

    mov ah,01h
    int 21h

    sub al,30h
    
    cmp al, 01h
    je call_min

    cmp al,02h
    je call_max

    cmp al,03h
    je quit

call_min:
    call min
    jmp continue

call_max:
    call max
    jmp continue


Quit:   mov ah,4ch
    int 21h

    min proc
    mov dx, offset msg3
    mov ah,09h
    int 21h

    mov di,0000H
    mov cl,0ah
    lea bx,arr
    mov al,[bx+di]
    mov dl,al
back1:  mov al,[bx+di]
    cmp dl,al
    jc noswap1
    mov dl,al
noswap1:inc di
    dec cl
    cmp cl,00H
    jne back1
    
    add dl,30H  
    mov ah,02H
    int 21H

    endp
    ret

    max proc
    mov dx, offset msg4
    mov ah,09h
    int 21h

    mov di,0000H
    mov cl,0ah
    lea bx,arr
    mov al,[bx+di]
    mov dl,al
back:   mov al,[bx+di]
    cmp dl,al
    jnc noswap
    mov dl,al
noswap: inc di
    dec cl
    cmp cl,00H
    jne back
    
    add dl,30H
    mov ah,02H
    int 21H
    endp
    ret
code ends
end start
