data segment

msg1 db 0dh,0ah,"1 Ascending order 2 Descending order 3 exit $"
msg2 db 0dh,0ah,"enter your choice $"
msg3 db 0dh,0ah,"Ascending Order $"

msg4 db 0dh,0ah,"Descinding order $"

NUM DW 0402H,0154H,0270H,0005H
data ends

code segment
assume cs: code, ds: data
start: mov ax,data
    
    mov     ds, ax


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
    je call_ascn

    cmp al,02h
    je call_desc

    cmp al,03h
    je quit

call_ascn:
    mov dx,offset msg3
    mov ah,09h
    int 21h
    call ascn
    jmp continue

call_desc:
    mov dx,offset msg4
    mov ah,09h
    int 21h
    call desc
    jmp continue


Quit:   mov ah,4ch
    int 21h





ascn proc
    
    mov     dx, 2        
loop2 : mov     cx, dx      
    dec     cx      
    mov     si, cx          
    add     si, si      
    mov     ax, num[si] 
loop1:  cmp     num[si-2], ax    
                 
    jbe     next         
                
    mov     di, num[si-2]    
    mov     num[si], di  
    dec     si      
    dec     si      
    dec     cx       
                
    jnz     loop1       
next:   mov     num[si], ax  
                
    inc     dx      
                
    cmp     dx, 4        
                
    jbe     loop2       
    mov si, offset num
    mov     dh, 4
l1: mov     ch, 04h         
                
    mov     cl, 04h     
    mov     bx, [si]        
l2: rol     bx, cl       
                 
    mov     dl, bl      
                
    and     dl, 0fh     
    cmp     dl, 09       
                
    jbe     l4

    add     dl, 07          
                
l4: add     dl, 30h
    mov     ah, 02                  
    int     21h 
    dec     ch      
    jnz     l2 
    mov     ah, 02  
    mov     dl, ' '     
    int     21h 
    inc     si      
    inc     si      
    dec     dh
    cmp     dh, 0
    jnz     l1

endp
ret


desc proc

mov     dx, 2        
loop21 :mov     cx, dx      
    dec     cx      
    mov     si, cx          
    add     si, si      
    mov     ax, num[si] 
loop11: cmp     num[si-2], ax    
                 
    jae     next1        
                
    mov     di, num[si-2]    
    mov     num[si], di  
    dec     si      
    dec     si      
    dec     cx       
                
    jnz     loop11      
next1:  mov     num[si], ax  
                
    inc     dx      
                
    cmp     dx, 4        
                
    jbe     loop21      
    mov si, offset num
    mov     dh, 4
l11:    mov     ch, 04h         
                
    mov     cl, 04h     
    mov     bx, [si]        
l21:    rol     bx, cl       
                 
    mov     dl, bl      
                
    and     dl, 0fh     
    cmp     dl, 09       
                
    jbe     l41

    add     dl, 07          
                
l41:    add     dl, 30h
    mov     ah, 02                  
                
    int     21h 
    dec     ch      
    jnz     l21 
    mov     ah, 02  
    mov     dl, ' '     
    int     21h 
    inc     si      
    inc     si      
    dec     dh
    cmp     dh, 0
    jnz     l11

endp
ret


code ends
end start

    