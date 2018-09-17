#!/bin/bash
# -*- ENCODING: utf-8 -*-
#Esta parte del programa pretende ser el esqueleto de la prebeshell
#El programa requiere de dos archivos:
#usuariosregistrados.txt almacena los usuarios que ya están en la prebeshell
#contrasenas.txt almacena sus respectivas contraseñas
#Lo anterior, con la finalidad de que los usuarios y las contraseñas estén medio controladas y los archivos no crezcan demasiado
#Programado por: Casillas Muñoz, D.A. (Prebecario 3)
#				 Solana Mejía, H.A. (Prebecario 14)
#Ejecutar el archivo así: "$$ bash prebeshell.sh", para que las opciones de 'read' estén disponibles
#echo "PS1="\[\033[01;32m\]\u\[\033[01;31m\]en\[\033[0;36m\]->\[\033[0;36m\]\w$\[\033[0;37m\]""
funcion () { 
	#Esta función es para atrapar las señales de salida.
	echo "Sal con elegancia, usa el comando necesario..."
	
	echo -e "Presiona enter, y si aún quieres salir escribe el comando \e[33msalir\e[0m"
}
clear
usuariosvalidos=~/usuariosregistrados.txt
contrasenas=~/contrasenas.txt
#elegí esa ubicación para mis archivos de texto, pero se puede elegir a conveniencia
#Falta hacer que cuando se lean las contraseñas, no se vean las entradas que escribe el usuario
figlet prebeshell
figlet Any y Diego
figlet Identificate!
echo -e "\e[36m Ingresa tu nombre de usuario \e[0m"
read usuario #En esta línea, la prebeshell leerá el usuario
if [ $(grep -c $usuario /etc/passwd | tail -n 1) -ne 0 ]; #esta parte fue reciclada del código para identificar la USB en el programa del firewall, verifica que el usuario ingresado se encuentre en /etc/passwd
	then
		if [ $(grep -c $usuario $usuariosvalidos) -ne 0 ]; #en este if, se describe qué ocurrirá si el usuario ingresado es un usuario válido, presente en passwd
			then
				echo -e "\e[36m Ingresa tu contraseña plox \e[0m"
				read -s contrasena
				if [ $(grep -c $contrasena $contrasenas) -ne 0 ]; then #tras leer la contraseña, este if decide si hay acceso o no, verificando que la contraseña in
					clear
					figlet bienvenido
				else
					while [ $(grep -c $contrasena $contrasenas) -eq 0 ]; do #si la contraseña ingresada no está registrada en contrasenas.txt, se pide la misma hasta que haya una coincidencia
							echo -e "\e[32m Contraseña incorrecta\nIngresa la contraseña correcta. \e[0m"
							read -s contrasena
						done
					figlet bienvenido
				fi
		else
			echo -e "\e[33m Veo que eres un usuario nuevo, ¿qué contraseña quieres usar? \e[0m"
			grep -o $usuario /etc/passwd | tail -n 1 >> $usuariosvalidos #esta línea añade al usuario a la lista de usuarios válidos cuando no está registrado
			read  -s contrasena
			echo "$contrasena" >> $contrasenas
		fi
	else
		figlet usuario invalido
		figlet chau
		exit 0;
fi

comando="anyeschida"
echo -e "\e[32mPresiona 'ayuda' para recibir ayuda sobre los comandos de la prebeshell!\e[0m"
while [ "$comando" != "salir" ]; do
	echo -ne "\e[32m$usuario\e[0m"
	echo -ne "\e[92m@\e[0m"
	echo -e "\e[32m $PWD \e[0m"
	echo -ne "\e[94m-->\e[0m"
	trap "funcion" INT QUIT TSTP
	read comando
	case $comando in
		'hora' ) #Esta opción activa el comando hora
			bash hora.sh
			;;
		'salir')
			exit 0
			;;
		'fecha')
			bash fecha.sh
			;;
		'juegoahorcado')
			bash juegoahorcado.sh
			;;
		'juegodados')
			bash dado.sh
			;;
		'infosis')
			bash infosys.sh
			;;
		'prebeplayer')
			bash prebeplayer.sh
			;;
		'buscar')
			bash busqueda.sh
			;;
		'arbol')
			bash arbol.sh
			;;
		'creditos')
			bash creditos.sh
			;;
		'ayuda')
			bash ayuda.sh
			;;
		*) #Esta opción del case es la que permite que los comandos usuales del bash funcionen
			$comando
			;;
	esac
done