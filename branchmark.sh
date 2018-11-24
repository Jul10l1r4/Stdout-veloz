#!/usr/bin/env bash

# declarando variavel
buffer="";

# sendo claro
echo """
Teste de performance entre ECHO, PRINTF e CAT

##################################################
Ele mostrará uma série de caracteres em apenas
uma chamada"""

# fazendo o processador tremer
for i in $(seq 10000)
do
		buffer+='@#$%%&*I&FDFSRWEGsy€®³®ŧŋđðđðŋæ'
done;

# realizando testes

function echoTest (){
	echo "$buffer" > /dev/null
}

function priTest (){
	printf "$buffer" > /dev/null
}

function printfTest () {
	printf "$buffer"	> /dev/stdout 2&>-# /dev/null
}

function catTest (){
	cat <<- EOF > /dev/null
	$buffer
	EOF
}

# Saída do resultado

echo -e "--------------------------------------------------\n### ECHO ###"
time echoTest 

echo -e "--------------------------------------------------\n### PRINTF ###"
time priTest

echo -e "--------------------------------------------------\n### printf > /dev/stdout ###"
time printfTest

echo -e "--------------------------------------------------\n### CAT ###"
time catTest

echo """
##################################################
Verificação de varias chamadas a mesma funcao
"""
loopado='Sou mais rápido!'

function echoLoop (){
	for a in `seq 1024`
	do
					echo "$loopado" > /dev/null
	done
}

function prinLoop (){
	for b in `seq 1024`
	do
					printf "$loopado" > /dev/null
	done
}

function prinThereLoop (){
	for c in `seq 1024`
	do
					printf "$loopado" > /dev/stdout > /dev/null
	done
}
function catLoop (){
	for d in `seq 1024`
	do
					cat <<- EOF > /dev/null
					$loopado
					EOF
	done
}

echo -e "--------------------------------------------------\n### PRINTF ###"
time prinLoop

echo -e "--------------------------------------------------\n### ECHO ###"
time echoLoop 

echo -e "--------------------------------------------------\n### printf > /dev/stdout ###"
time prinThereLoop

echo -e "--------------------------------------------------\n### CAT ###"
time catLoop

