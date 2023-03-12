data segment
    blk1 db 01, 01, 01, 01, 01, 01, 01, 01, 01, 01H
count dw 0AH
msg db 0dh,0ah,"the addition result is $"
data ends

code segment
assume cs: code, ds: data
start: mov ax,data
       mov ds, ax
    
    
    
    mov     si, offset blk1     ; initialise pointer
    mov     cx, count   ; initialise counter
    
    mov dx,offset msg
    mov ah,09h
    int 21h
    mov     ax, 0
    cld         ; df=0                  
up: add     al, [si]    ; add numbers
    inc     si      ; increment pointer
    dec     count       ; decrement counter
    jnz     up      ; check if all nos are added
    
    
    mov bl,al
    mov cl,bl

    mov bh,cl
    and bh,0F0h
    ror bh,04h
    call convert
    mov dl,bh
    mov ah,02h
    int 21h

    mov bh,cl
    and bh,0Fh
    call convert

    mov dl,bh
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21h

convert proc
    cmp bh,0Ah
    jc l1
    add bh,37h
    jmp l2
    l1: add bh, 30h
    l2: ret
endp
code ends
end start


