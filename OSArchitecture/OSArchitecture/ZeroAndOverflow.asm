.586;инструкции уровня пентиум
.MODEL FLAT,C  ;соглашение работы с C
OPTION CASEMAP:NONE
.CODE;дальше секция кода
PUBLIC _checkOfZeroAndOverflowASM
_checkOfZeroAndOverflowASM PROC a:DWORD, b:DWORD ; объявляем параметры как 32

mov eax,a ;загрузка параметра a в регистр eax
mov ecx,b ; загрузка параметра b в регистр ecx

cmp ecx,0 ; проверка на ноль у числа b

je error_division_zero ; переход на метку вывода

cmp ecx,-1; устанавливает флаг ZF в 1, если равны
je max_value_a; делает переход на метку max_value_a
continue_registr:

cdq; подготовка к делению convert double to quadro

idiv ecx; осуществление деления a на b

ret ; возврат процедуры в вызывающую функцию

error_division_zero: ; метка и выход из программы
mov eax, 0 ; вывод из функции нуля
ret

max_value_a:
cmp eax,-2147483648 ; устанавливает 1 в ZF, если совпали с минимальным int
je error_overflow ; переход в переполнение если совпали
jne continue_registr; переход в деление, если не совпали 


error_overflow: 
mov eax,-1
ret

_checkOfZeroAndOverflowASM ENDP ;окончание процедуры
END ; конец модуля