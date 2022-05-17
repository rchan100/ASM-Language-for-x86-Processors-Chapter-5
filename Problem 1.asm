INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	str1 BYTE "Color changing strings", 0
	
.code
main PROC
	mov ecx, 4						;4 loops for 4 colors
	mov eax, green + (white*16)		;starting text color & foreground color
	mov edx, offset str1

	L1:
		call SetTextColor			;set colors with eax
		call WriteString			;write colored screen
		call Crlf					;new line
		inc EAX						;increment eax to change color

		loop L1

	INVOKE ExitProcess,0
main ENDP
end main