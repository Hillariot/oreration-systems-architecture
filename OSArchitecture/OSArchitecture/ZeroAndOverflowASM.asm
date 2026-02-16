.686p;инструкции уровня пентиум
.MODEL FLAT,stdcall
.DATA
PUBLIC error
error BYTE 0
.CODE;дальше секция кода
PUBLIC checkOfZeroAndOverflowASM
checkOfZeroAndOverflowASM PROC a:DWORD, c:DWORD, d:DWORD ; объявляем параметры как 32

LOCAL divis1:DWORD
LOCAL divis2:DWORD

mov edx,a
idiv 4
mov eax,edx
sub eax,1
cmp eax,0
je error_division_zero

mov edx, c
mul 2
mov eax,edx
mov ecx,d
sub eax,ecx
add eax,23




je error_division_zero ; переход на метку вывода

cmp ecx,-1; устанавливает флаг ZF в 1, если равны
je max_value_a; делает переход на метку max_value_a

cdq; подготовка к делению convert double to quadro

idiv ecx; осуществление деления a на b

ret 12 ; возврат процедуры в вызывающую функцию

error_division_zero: ; метка и выход из программы
mov eax, 0 ; вывод из функции нуля
mov error,1;если выведена 1 в ошибке, то деление на ноль
ret 12

error_overflow: 
mov eax,0
mov error,2;если выведена 2 в ошибке, то переполнение
ret 12 ;возвращаем 

checkOfZeroAndOverflowASM ENDP ;окончание процедуры
END ; конец модуля