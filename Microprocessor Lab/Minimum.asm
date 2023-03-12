data segment
arr db 04H,01H,05H,07H,02H,03H
min db ?
data ends

code segment
assume cs: code, ds: data
start: mov ax,data
       mov ds, ax
   
    mov di,0000H
    mov cl,5
    lea bx,arr
    mov al,[bx+di]
    mov dl,al
back:   mov al,[bx+di]
    cmp dl,al
    jc noswap
    mov dl,al
noswap: inc di
    dec cl
    cmp cl,00H
    jne back
    
    add dl,30H  
    mov ah,02H
    int 21H
        
    mov ah,4ch
    int 21h
code ends
end start