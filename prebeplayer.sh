#!/bin/bash
# -*- ENCODING: utf-8 -*-
#Programado por:
#Casillas MUñoz, Diego Armando (Prebecario 3)
#Solana Mejía, Haydee Amairany (Prebecario 14)
clear
figlet prebeplayer
while [ "$salir" != "N" ]; do
echo -e "\e[38;5;203mPara que la prebeplayer funcione, es necesario el programa mpg123\e[0m"
echo -e "\e[38;5;203mLos comandos usuales de tu terminal también funcionan aquí!\e[0m"
echo -e ""
echo -e "\e[38;5;216mSi quieres reproducir tu música de la carpeta actual, presiona 1\e[0m"
echo -e "\e[38;5;203mSi quieres listar la música de tu carpeta actual, presiona 2\e[0m"
echo -e "\e[38;5;216mSi no tienes el programa mpg123 y quieres instalarlo, presiona 3\e[0m"
echo -e "\e[38;5;203mSi quieres cambiar de carpeta, presiona 4\e[0m"
echo -e "\e[38;5;216mSi quieres salir de la prebeplayer, presiona 5"
echo""

read eleccion
case $eleccion in
		1 ) #Esta opción es para reproducir las canciones
			echo -e "\e[38;5;203mBienvenido a la prebeplayer\e[0m"
			echo -e "\e[38;5;216mPara pausar, presiona 'espacio'\e[0m"
			echo -e "\e[38;5;203mPara ir a la siguiente canción, presiona 'f'\e[0m"
			echo -e "\e[38;5;216mPara retroceder una canción, presiona 'd'\e[0m"
			echo -e "\e[38;5;203mPara reiniciar la canción, presiona 'b'\e[0m"	
			echo -e "\e[38;5;216mPara subir el volumen, presiona '+'\e[0m"
			echo -e "\e[38;5;203mPara bajar el volumen, presiona '-'\e[0m"
			echo -e "\e[38;5;216mPara mostrar la lista de reproducción, presiona 'l'\e[0m"
			echo -e "\e[38;5;203mPara mostrar más comandos, presiona 'h'\e[0m"
			echo -e "\e[38;5;216mPara salir del reproductor, presiona 'q'\e[0m"
			echo ""
			mpg123 -qC *
			;;
		2) #Esta opción es para listar las canciones
			ls | grep .mp3
			;;
		3) #Esta opción es para instalar mpg123
			sudo apt install mpg123
			;;
		4) #Esta opción es para cambiar de carpeta
			echo "Por favor, dime la ruta (relativa o absoluta) de la carpeta a la que quieres cambiar"
			echo -n "-->"
			read carpeta
			cd $carpeta
			echo "Ahora estás en $carpeta "
			echo ""
			;;
		5) #Opción para salirse
			salir=N
			;;
		*) #Esta opción del case es la que permite que los comandos usuales del bash funcionen
			$eleccion
			;;
	esac
done
