.686p;
.MODEL FLAT,stdcall
.DATA
PUBLIC error
error BYTE 0
divis1 DWORD 0
.CODE					;дальше секция кода
PUBLIC checkOfZeroAndOverflowASM
checkOfZeroAndOverflowASM PROC a:DWORD, c1:DWORD, d:DWORD ; объявляем параметры как 32



mov eax,a				; edx=a
cdq	
mov ecx,4
idiv ecx				; edx=a/4
mov ecx,eax				; ecx=eax=a/4
sbb eax,1				; eax=a/4-1
jz error_division_zero
mov divis1, eax			; divis1 = a/4-1

mov eax,2				; eax = 2
mov edx, c1				; edx = c
imul edx				; edx=c*2
jo error_overflow
mov ecx,d				; ecx = d
sbb eax,ecx				; edx = c*2-d
jo error_overflow
adc eax,23				; edx = c*2-d+23
jo error_overflow

mov ecx,divis1			; ecx = a/4-1

cdq						; подготовка к делению convert double to quadro

idiv ecx				; осуществление деления divis1 на divis2

ret 12					; возврат процедуры в вызывающую функцию

error_division_zero:	; метка и выход из программы
mov eax, 0				; вывод из функции нуля
mov error,1				;если выведена 1 в ошибке, то деление на ноль
ret 12

error_overflow: 
mov error,2				;если выведена 2 в ошибке, то переполнение
ret 12					;возвращаем 

checkOfZeroAndOverflowASM ENDP ;окончание процедуры
END ; конец модуля