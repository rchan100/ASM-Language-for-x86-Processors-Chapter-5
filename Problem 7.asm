INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	rows	WORD	?
	columns	WORD	?

.code
main PROC
	call Clrscr
	mov ecx, 100			; loop 100 times

	L1:
		call GetMaxXY		; get console windows max x,y-coord
		mov rows, ax		; rows = max x-coord
		mov columns, dx		; columns = max y-coord

		movzx eax, rows		; eax = rows 
		call RandomRange	; procedure using eax
		mov dh, al			; dh = random x-coord

		movzx eax, columns	; eax = columns
		call RandomRange
		mov dl, al			; dl = random y-coord

		call GoToXY			; locate cursor at random xy-coord

		mov al, 'A'			; random character = 'A'
		call WriteChar		; display random character

		mov eax, 100		
		call Delay			; time delay of 100 milliseconds

		loop L1
		
	INVOKE ExitProcess,0
main ENDP
end main