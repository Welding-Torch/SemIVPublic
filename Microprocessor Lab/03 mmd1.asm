data segment
    a dw 08H
    b dw 06H

num1 db ?
num2 db ?
q db ?
r db ?

msg1 db 0dh,0ah,"1 Multiplication    2 Multiplication Successive addition    3 Multiplication Shift & Add     4  Division  5 exit$"

msg2 db 0dh,0ah,"enter your choice $"
msg3 db 0dh,0ah,"enter the 1st operand $"
msg4 db 0dh,0ah,"enter the 2nd operand $"
msg30 db 0dh,0ah,"entered the 1st operand $"
msg40 db 0dh,0ah,"entered the 2nd operand $"
msg5 db 0dh,0ah,"Result of multiplication is $"
msg6 db 0dh,0ah,"The quotient is $"
msg7 db 0dh,0ah,"The remainder is $"

data ends

code segment
assume cs: code, ds: data
start: mov ax,data
       mov ds, ax

continue: mov dx,offset msg1
    mov ah,09h
    int 21h

    mov dx,offset msg2
    mov ah,09h
    int 21h 

    mov ah,01h
    int 21h
    
    sub al,30h
    
    cmp al, 01h
    je call_mul
    
    cmp al, 02h
    je call_mulsa
    
    cmp al, 04h
    je call_div
    
    cmp al,05h
    je quit
    
    cmp al,03h
    je call_mulshad
 
quit:mov ah,4ch
    int 21h  
  
call_mul:
mov dl,"!"
    mov ah,02h; to display a character on the screen, DL should 
    int 21h;
    call Takedata
    
    ;mov     ah, 0
    ;mov     al, num1           ; Load number1 in al
    ;mov     bl, num2           ; Load number2 in bl
    mul     bl          ; multiply numbers and result in ax

    mov cl,al ; result in cl
    
    mov dx,offset msg5
    mov ah,09h
    int 21h 
    
    call disp
    jmp continue 
  
call_mulsa:
mov dl,"@"
    mov ah,02h; to display a character on the screen, DL should 
    int 21h;
    call Takedata
    
    ;mov     ah, 0
    ;mov     al, num1        ; Load number1 in al; add al bl times ie. dx = ax+ax+ax.... bl times   
    ;mov     bl, num2        ; Load number2 in bl
     
    mov     dx, 0       ; intialize result
ad: add     dx, ax      ; add numbers. Result in dx
    dec     bl          ; dec number
    cmp     bl, 0                                               
    jnz     ad          
    
    mov cx,dx ; result in cx 
    
    mov dx,offset msg5
    mov ah,09h
    int 21h 
    
    call disp
    jmp continue   
  
call_div:
      mov dl,"#"
    mov ah,02h; to display a character on the screen, DL should 
    int 21h;
    call Takedata
    ;mov ah,bh
    ;mov     al, num1       ; Load number1 in ax
    ;mov     bl, num2        ; Load number2 in bx            
    div     bl      ; divide numbers. Quotient in al and Rem in ah 

    
    mov q,al ; quotient in al
    mov r,ah ; remainder in ah
     mov dx, offset msg6;
        mov ah,09h; 
        int 21h;    
        mov ch,00
        mov cl,q
        call disp
    
    mov dx, offset msg7;
        mov ah,09h; to display a string on the screen, it displays 
        int 21h;    the string whose offset address is in DX
      mov ch,00
      mov cl,r
    call disp
    
    jmp continue    
    
call_mulshad:
mov dl,"*"
    mov ah,02h; to display a character on the screen, DL should 
    int 21h;
    call Takedata
    
    STC
    CLC
    
    ;mov      al, num1             ; Load number1 in al
    ;mov      bl, num2            ; Load number2 in bl
    ;mov      ah, 0           
           mov      dl, 04h         ; initialize counter
add1:       add       ax, ax           ; add numbers. Result in dx                                                    
           rcl        bl, 01
           jnc        skip
           add       ax, bx
skip:     dec       dl                ; dec number
           jnz        add1        
           
           mov      bx, ax          ; Result in reg bx
           mov      cx, bx          ; Result in reg bx
    
    mov dx,offset msg5
    mov ah,09h
    int 21h 
    
    call disp
    jmp continue 


convert proc
        cmp bl,0Ah
        jc l1
        add bl,37h
        jmp l2
            l1: add bl, 30h
            l2: ret
endp


disp proc
    ;mov cl,bl
    
    mov bl,ch
    and bl,0F0h
    ror bl,04h

    call convert ; convert decimal into ASCI 

    mov dl,bl
    mov ah,02h; to display a character on the screen, DL should 
    int 21h;    contain the offset address of the out put screen
    
    
    mov bl,ch
    and bl,0Fh
    call convert

    mov dl,bl
    mov ah,02h
    int 21h
    
    
    
    mov bl,cl
    and bl,0F0h
    ror bl,04h

    call convert ; convert decimal into ASCI 

    mov dl,bl
    mov ah,02h; to display a character on the screen, DL should 
    int 21h;    contain the offset address of the out put screen
    
    
    mov bl,cl
    and bl,0Fh
    call convert

    mov dl,bl
    mov ah,02h
    int 21h
    
    
    
ret
endp
Takedata proc
    mov dx,offset msg3
    mov ah,09h
    int 21h 

    call Accept
    
    mov num1,bl
    mov cl,bl
    
   mov dx,offset msg30
   mov ah,09h
   int 21h 
   
   call convert
   call disp
   
    mov dx,offset msg4
    mov ah,09h
    int 21h 
    
    call Accept
    mov num2,bl
    mov cl,bl
    
    mov dx,offset msg40
    mov ah,09h
    int 21h 
  
    call convert
   call disp
   
   mov     ah, 0
    mov     al, num1        ; Load number1 in al; add al bl times ie. dx = ax+ax+ax.... bl times   
    mov     bl, num2        ; Load number2 in bl
ret
     
endp     

Accept proc
    
    mov ah,01   
    int 21H
    sub al,30h
    mov dh,al       

    mov ah,01
    int 21H
    sub al,30h
    mov dl,al
    
    mov al, 0AH
    mul dh
    add al,dl
    mov bl,al
    mov bh,00
ret 
endp
code ends
end start

