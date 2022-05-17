; Prompt: Linking Array Items
;		  Suppose you are given three data items that indicate a starting index in a list, 
;		  an array of characters, and an array of link index. You are to write a program that 
;		  traverses the links and locates the characters in their correct sequence. For each 
;		  character you locate, copy it to a new array. Suppose you used the following sample 
;		  data, and assumed the arrays use zero-based indexes:
;					start = 1
;					chars: HACEBDFG
;					links: 04562370
;		  Then the values copied (in order) to the output array would be A,B,C,D,E,F,G,H. 
;		  Declare the character array as type BYTE, and to make the problem more interesting, 
;		  declare the links array type DWORD.


INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	start DWORD 1
	chars BYTE 'H', 'A', 'C', 'E', 'B', 'D', 'F', 'G'
	links DWORD 0,4,5,6,2,3,7,0
	
	linksType BYTE TYPE links
	array BYTE LENGTHOF chars DUP(?)

	
.code
main PROC
	mov ecx, LENGTHOF array			;counter = 8 (for this example)
	mov edi, OFFSET array

	L1:
		
		mov esi, OFFSET chars		;(re)set esi to chars starting position
		add esi, start				;move esi position by "start" value
		mov al, [esi]				;move element at esi into al
		mov [edi], al				;move value of al to the current position (edi) in array

		mov edx, offset links		;(re)set edx to links array starting position
		mov eax, start				;eax = start
		mul linksType				;eax = eax * linksType = eax * 4 (since links is a DWORD, dword = 4 Bytes)
		mov start, eax				;start = eax 
		add edx, start				;eax = val at position edx

		mov eax, [edx]				;move value in links array to eax
		mov start, eax				;start = eax

		inc edi						;increment edi to next position

	loop L1

	mov edx, offset array
	call WriteString
	

	INVOKE ExitProcess,0
main ENDP
end main