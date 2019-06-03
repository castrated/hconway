	call a.memorization
	call mn_num
	int3

a.memorization:
	mov [a+1*4],1
	mov [a+2*4],1
	mov ecx,3

@@:
	mov eax,ecx
	mov edx.[a+(ecx-1)*4]
	sub eax,edx
	mov eax,[a+eax*4]
	add eax,[a+edx*4]
	mov [a+ecx*4],eax
	inc ecx
	cmp ecx,1 shl 20
	jnz @B
	retn

_0.55 equ ((55 shl 32)/100) ; FF[55 * 2^N / 100], for N=32

mn_num:
	mov ecx,1 shl 20
@@:	dec ecx
	mov edx,[a+ecx*4]
	xor eax,eax
	div ecx
	cmp eax,_0.55 + 1
	jc @B
	retn

a rd 1 shl 20
