#!/usr/bin/env bash

# declarando variavel
buffer="";

# sendo claro
echo "Teste de performance entre ECHO, PRINTF e CAT"
echo "Armazendo variáveis"

# fazendo o processador tremer
for i in $(seq 10000)
do
		buffer+="@#$%%&*I&FDFSRWEGsy€®³®ŧŋđðđðŋæ"
done;

# realizando testes

function echoTest (){
	echo "$buffer" > /dev/null
}

function priTest (){
	printf "$buffer" > /dev/null
}

function printfTest () {
	printf "$buffer" > "/dev/stdout" > /dev/null
}

function catTest (){
	cat <<- EOF > /dev/null
	$buffer
	EOF
}

# Saída do resultado

echo -e "\n### ECHO ###"
time echoTest 

echo -e "\n### PRINTF ###"
time priTest

echo -e "\n### /dev/stdout ###"
time printfTest

echo -e "\n### CAT ###"
time catTest
