# ASM-Language-for-x86-Processors-Chapter-5
Assembly Language for x86 Processors Chapter 5

Short Questions : 15, 16,17,18,19, 20

Long Problems 1, 2, 4, 5, 7

Note: use of Irvine Library

=====

Problem 1: Draw Text Colors
Write a program that displays the same string in four different colors, using a loop. Call the Set-TextColor procedure from the book’s link library. Any colors may be chosen, but you may find it easiest to change the foreground color.

Problem 2: Linking Array Items
Suppose you are given three data items that indicate a starting index in a list, an array of characters, and an array of link index. You are to write a program that traverses the links and locates the characters in their correct sequence. For each character you locate, copy it to a new array. Suppose you used the following sample data, and assumed the arrays use zero-based indexes:
	
	start = 1
	chars: HACEBDFG
	links: 04562370

Then the values copied (in order) to the output array would be A,B,C,D,E,F,G,H. Declare the character array as type BYTE, and to make the problem more interesting, declare the links array type DWORD.

Problem 4: Simple Addition (2)
Use the solution program from the preceding exercise as a starting point. Let this new program repeat the same steps three times, using a loop. Clear the screen after each loop iteration.

Problem 5: BetterRandomRange Procedure
The RandomRange procedure from the Irvine32 library generates a pseudorandom integer between 0 and N - 1. Your task is to create an improved version that generates an integer between M and N-1. Let the caller pass M in EBX and N in EAX. If we call the procedure BetterRandomRange, the following code is a sample test:
	
	mov ebx,-300 ; lower bound
	mov eax,100 ; upper bound
	call BetterRandomRange

Write a short test program that calls BetterRandomRange from a loop that repeats 50 times. Display each randomly generated value.

Problem 7: Random Screen Locations
Write a program that displays a single character at 100 random screen locations, using a timing delay of 100 milliseconds. Hint: Use the GetMaxXY procedure to determine the current size of the console window
