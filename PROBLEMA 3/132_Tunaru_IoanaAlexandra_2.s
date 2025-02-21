.data
matrix: .space 1296
copie_m: .space 1600
m: .space 4
mb: .space 4
n: .space 4
nb: .space 4
p: .space 4
left: .space 4
leftb: .space 4
right: .space 4
rightb: .space 4
k: .space 4
lineIndex: .space 4
columIndex: .space 4
index: .space 4
newLine: .asciz "\n"
formatInt: .asciz "%d "

//datele de intrare pentru citirea din fisier
inputFile: .space 4
outputFile: .space 4
input: .asciz "in.txt"
output: .asciz "out.txt"
w: .asciz "w"
r: .asciz "r"
formatPrint: .asciz "%d "
formatnewLine: .asciz "%s"

.text

.global main

main:
//deschidem fisierele cu care vom lucra
pushl $w
pushl $output
call fopen
addl $8, %esp
movl %eax, outputFile

pushl $r
pushl $input
call fopen
addl $8, %esp
movl %eax, inputFile

//incepem sa citim datele de intrare
pushl $m
pushl $formatInt
pushl inputFile
call fscanf
addl $12, %esp

//am incrementat m cu 2
movl m, %ecx
addl $2, %ecx
movl %ecx, mb

pushl $n
pushl $formatInt
pushl inputFile
call fscanf
addl $12, %esp

//am incrementat n cu 2
movl n, %ecx
addl $2, %ecx
movl %ecx, nb

pushl $p
pushl $formatInt
pushl inputFile
call fscanf
addl $12, %esp

///completam matricea cu 1 la poz. corespunzatoare
movl $0,index
et_for_p:
  movl index, %ecx
  cmp %ecx, p
  je calcul_suma_vecinilor

  pushl $left
  pushl $formatInt
  pushl inputFile
  call fscanf
  addl $12, %esp
  //am inc val left-ului  
  movl left, %edx
  incl %edx
  movl %edx, leftb

  pushl $right
  pushl $formatInt
  pushl inputFile
  call fscanf
  addl $12, %esp

  //am inc valoarea right-ului
  movl right, %edx
  incl %edx
  movl %edx, rightb

  //completam matricea cu indicii incrementati
  movl leftb, %eax
  xor %edx, %edx
  mull nb
  addl rightb, %eax
  lea matrix, %edi
  movl $1, (%edi, %eax, 4)

  incl index
  jmp et_for_p


calcul_suma_vecinilor:
pushl $k
pushl $formatInt
pushl inputFile
call fscanf
addl $12, %esp

for_k:
movl k, %ecx
cmp $0,%ecx
je et_afis_mat

movl $1, lineIndex
for_lines_vecini:
movl lineIndex, %ecx
cmp m, %ecx
jg for_copiere

  movl $1, columIndex
  for_colums_vecini:
  movl columIndex, %ecx
  cmp n, %ecx
  jg cont_lines_vecini

  //in %ecx vom retine suma curenta a el
  lea matrix, %edi
  xor %ecx, %ecx

  //elem a[i][j+1]
  //eax=i*nb+(j+1)
  movl lineIndex, %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  incl %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //elem a[i][j-1]
  //eax=i*nb+(j-1)
  movl lineIndex, %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  decl %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //elem a[i-1][j]
  //eax=(i-1)*nb+j
  movl lineIndex, %eax
  decl %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //elem a[i+1][j]
  //eax=(i+1)*nb+j
  movl lineIndex, %eax
  incl %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //elem a[i+1][j+1]
  //eax=(i+1)*nb+(j+1)
  movl lineIndex, %eax
  incl %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  incl %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //elem a[i-1][j-1]
  //eax=(i-1)*nb+(j-1)
  movl lineIndex, %eax
  decl  %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  decl %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //elem a[i-1][j+1]
  //eax=(i-1)*nb+(j+1)
  movl lineIndex, %eax
  decl  %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  incl %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //elem a[i+1][j-1]
  //eax=(i+1)*nb+(j-1)
  movl lineIndex, %eax
  incl  %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  decl %eax
  movl (%edi, %eax, 4), %ebx
  addl %ebx, %ecx

  //in acest moment suma este in %ecx
  //verificam mai intai daca celula este moarta sau vie
  movl lineIndex, %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  movl (%edi, %eax, 4), %ebx
  
  cmp $1, %ebx
  je conditii_celula_1
  jl conditii_celula_0

  ret_urm_col:
  incl columIndex
  jmp for_colums_vecini

  cont_lines_vecini:
   incl lineIndex
   jmp for_lines_vecini

conditii_celula_1:
  cmp $2, %ecx
  je pune_1
  jl pune_0

  cmp $3,%ecx
  jg pune_0
  je pune_1
  jmp ret_urm_col

conditii_celula_0:
  cmp $3,%ecx
  je pune_1
  jl pune_0
  jg pune_0
  jmp ret_urm_col

pune_0:
//salvam din nou poz curenta la care suntem in matrice
  movl lineIndex, %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax

  lea copie_m, %esi
  movl $0, (%esi, %eax, 4)
  jmp ret_urm_col

pune_1:
//salvam din nou poz curenta la care suntem in matrice
  movl lineIndex, %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax

  lea copie_m, %esi
  movl $1, (%esi, %eax, 4)
  jmp ret_urm_col


for_copiere:
decl k
movl $1, lineIndex
for_lines_copiere:

movl lineIndex, %ecx
cmp m, %ecx
jg for_k

  movl $1, columIndex
  for_colums_copiere:
  movl columIndex, %ecx
  cmp n,%ecx
  jg cont_for_lines_copiere
  
  movl lineIndex, %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  lea matrix, %edi
  lea copie_m, %esi
  movl (%esi, %eax, 4), %ecx
  movl %ecx, (%edi, %eax,4)

  incl columIndex
  jmp for_colums_copiere

  cont_for_lines_copiere:
    incl lineIndex
    jmp for_lines_copiere


et_afis_mat:
movl $1, lineIndex
for_lines:
movl lineIndex, %ecx
cmp m,%ecx
jg et_exit

  movl $1, columIndex
  for_colums:
  movl columIndex, %ecx
  cmp n,%ecx
  jg cont_for_lines
  
  movl lineIndex, %eax
  xor %edx, %edx
  mull nb
  addl columIndex, %eax
  lea matrix, %edi
  movl (%edi, %eax, 4), %ecx

  pushl %ecx
  pushl $formatPrint
  pushl outputFile
  call fprintf
  addl $12, %esp

  pushl $0
  call fflush
  popl %ebx

  incl columIndex
  jmp for_colums

  cont_for_lines:
    pushl $newLine
    pushl $formatnewLine
    pushl outputFile
    call fprintf
    addl $12, %esp
    
    pushl $0
    call fflush
    pop %ebx


    incl lineIndex
    jmp for_lines

et_exit:
mov $1, %eax
xor %ebx, %ebx
int $0x80
