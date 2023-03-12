data segment
    num1  db 13h
    num2  db 12h
    msg1 db 0dh,0ah,"Disply String $"
    msg10 db 0dh,0ah,"Hello Happy Programming $"
    msg2 db 0dh,0ah,"Display Character $"
    msg20 db 0dh,0ah,"Display number from Register $"
    msg3 db 0dh,0ah,"Take number from user $"
    msg4 db 0dh,0ah,"Display Number $"
data ends
code segment
assume cs: code, ds: data
start:  mov ax,data
        mov ds,ax
        mov dx, offset msg1;
        mov ah,09h; to display a string on the screen, it displays 
        int 21h;    the string whose offset address is in DX
        
        mov dx, offset msg10;
        mov ah,09h; to display a string on the screen, it displays 
        int 21h;    the string whose offset address is in DX
        
        mov dx, offset msg2;
        mov ah,09h; to display a string on the screen, it displays 
        int 21h;    the string whose offset address is in DX
        mov dl,"*"
       mov ah,02h
       int 21h
      
       mov dx, offset msg20;
        mov ah,09h; to display a string on the screen, it displays 
        int 21h;    the string whose offset address is in DX
       
    
       mov bl,num1 
       add bl,num2
       mov cl,bl ; result in cl

       mov dl,bl
       mov ah,02h
       int 21h

       mov dx, offset msg3;
        mov ah,09h; to display a string on the screen, it displays 
        int 21h;    the string whose offset address is in DX
       
        mov ah,01h
        int 21h
        mov bl,al
        
        mov dx, offset msg4;
        mov ah,09h; to display a string on the screen, it displays 
        int 21h;    the string whose offset address is in DX
        
        
        mov dl,bl
        mov ah,02h
        int 21h
        
        
        
    mov ah,4ch; Terminate the program
    int 21h


code ends
end start