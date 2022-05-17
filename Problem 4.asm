INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	prompt	BYTE "Enter an integer:", 0
	msg		BYTE "Sum of 2 integers:", 0

	int1 DWORD ?
	int2 DWORD ?
	sum DWORD ?

	
.code
main PROC
	mov ecx, 3					; running process 3 times
	L1:
		call Clrscr				; clear screen

		; move cursor to the middle of the screen
		mov dh, 13				; y-coord range 0-24
		mov dl, 40				; x-coord range 0-79
		call GoToXY				; locate cursor

		; get first integer
		mov edx, offset prompt
		call WriteString		; display prompt
		call ReadInt			; read enterred integer
		mov int1, eax			; store enterred integer

		; move cursor to the middle of the screen
		mov dh, 14				; move down vertically by 1
		mov dl, 40				; x-coord range 0-79
		call GoToXY				; locate cursor

		; get second integer
		mov edx, offset prompt	
		call WriteString 
		call ReadInt
		mov int2, eax

		; add integers together
		mov eax, int1			; eax = int1
		add eax, int2			; eax = int1 + int2
		mov sum, eax			; sum = int1 + int2

		; move cursor to the middle of the screen
		mov dh, 15				; move down vertically by 1
		mov dl, 40				; x-coord range 0-79
		call GoToXY				; locate cursor

		; display sum
		mov edx, offset msg
		call WriteString		; display msg
		mov eax, sum			; eax = sum
		call WriteInt			; display the sum
		call Crlf
		call WaitMsg
	
	loop L1


	INVOKE ExitProcess,0
main ENDP
end main