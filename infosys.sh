#!/bin/bash

nombrekernel=`uname -s`
kernel=`uname -r`
procesador=`uname -p`
sistope=`uname -o`
memoria=`free -m`
usuario=`uname -n`
echo ""
echo -e "\e[42m Información del sistema\e[0m"
echo ""
echo -e "\e[32m Sistema Operativo:${sistope} \e[0m"
echo -e "\e[92m Kernel:${nombrekernel}\e[0m"
echo -e "\e[32m Versión del kernel:${kernel}\e[0m"
echo -e "\e[92m Procesador:${procesador}\e[0m"
echo -e "\e[32m Memoria RAM y SWAP [MB]:\e[0m"
echo -e"\e[92m ${memoria}\e[0m"
echo -e "\e[32m  Usuario:${usuario}\e[0m"
echo ""
