   org 100h  
#start=led_display.exe#


#make_bin#

name "led"  

#start=simple.exe#

#make_bin#

name "simple"
   
 
   
   mov ax, 0700h  
   mov ds, ax
   mov ax, 0300h
   mov di, ax  
   mov si,0100h 
     mov cl, 00h
   
MOV WORD PTR [0100h], 3331h  ;alt
MOV WORD PTR [0102h], 0013h  ;ust   

MOV WORD PTR [0104h], 0008h  
MOV WORD PTR [0106h], 0000h  

MOV WORD PTR [0108h], 0005h  ;alt
MOV WORD PTR [010Ah], 0000h  ;ust

MOV WORD PTR [010Ch], 0008h  
MOV WORD PTR [010Eh], 0000h 
 
MOV WORD PTR [0110h], 0005h  ;alt
MOV WORD PTR [0112h], 0000h  ;ust

MOV WORD PTR [0114h], 0008h  
MOV WORD PTR [0116h], 0000h 
 
MOV WORD PTR [0118h], 0005h  ;alt
MOV WORD PTR [011Ah], 0000h  ;ust 

MOV WORD PTR [011Ch], 0008h  
MOV WORD PTR [011Eh], 0000h 
 
MOV WORD PTR [0120h], 0005h  ;alt
MOV WORD PTR [0122h], 0000h  ;ust  

MOV WORD PTR [0124h], 0008h  
MOV WORD PTR [0126h], 0000h  


kontrol:

MOV AX, [si+2]
shr AX, 1        ; ust 16 bit saga kaydirilir
MOV [0102h], AX
MOV BX, [si]      
shr BX, 1 
jc dongu0   
jnc dongu1

dongu0: 
mov cx, bx
mov ch, 00h 
mov [di], ch 
inc cl 
mov [di], cl
inc di
inc si
inc si
cmp si, 0128h
jz cikti  
jnz kontrol 

dongu1:
mov cx, bx
mov ch, 00h 
mov [di], ch 
inc cl 
mov [di], cl
inc di
inc si 
inc si
cmp si, 0128h
jz cikti 
jnz kontrol  

cikti:
  XOR AX, AX  
  IN AL, 110  
  CMP AL,cl   
  JZ yaz   
  inc cl
yaz:
xor ax, ax
xor cl, cl
mov cx, ax
OUT 199, ax
   

   