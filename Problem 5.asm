INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

.code
main PROC
	call Clrscr
	mov eax, -300	; lower bound
	mov ebx, 100	; upper bound
	mov ecx, 50		; we want to loop BetterRandomRange procedure

	L1:
		push eax
		push ebx

		call BetterRandomRange

		pop ebx		; pop ebx since ebx is altered in procedure
		pop eax		; pop eax since eax is altered in procedure

		loop L1

	INVOKE ExitProcess,0
main ENDP

BetterRandomRange proc
	sub ebx, eax		; ebx = 400, full range just shifted
	xchg ebx, eax		; RandomRange works with eax
						; eax = 400, ebx = -300
	call RandomRange	; generate random int
	neg ebx				; ebx = 300
	
	sub eax, ebx		; eax = eax-ebx = eax - 300 to readjust range
	
	; display number
	call WriteInt		; write signed integer
	call Crlf			; new line
	ret
BetterRandomRange endp

end main