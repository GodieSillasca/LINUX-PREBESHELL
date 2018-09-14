#!/bin/bash
# -*- ENCODING: utf-8 -*-
#Programado por:
#Casillas MUñoz, Diego Armando (Prebecario 3)
#Solana Mejía, Haydee Amairany (Prebecario 14)
clear
figlet prebeplayer
while [ "$salir" != "N" ]; do
echo "Para que la prebeplayer funcione, es necesario el programa mpg123"
echo ""
echo "Si quieres reproducir tu música de la carpeta actual, presiona 1"
echo "Si quieres listar la música de tu carpeta actual, presiona 2"
echo "Si no tienes el programa mpg123 y quieres instalarlo, presiona 3"
echo "Si quieres cambiar de carpeta, presiona 4"
echo "Si quieres salir de la prebeplayer, presiona 5"

read eleccion
case $eleccion in
		1 ) #Esta opción es para reproducir las canciones
			echo "Bienvenido a la prebeplayer"
			echo "Para pausar, presiona 'espacio'"
			echo "Para ir a la siguiente canción, presiona 'f'"
			echo "Para retroceder una canción, presiona 'd'"
			echo "Para reiniciar la canción, presiona 'b'"	
			echo "Para subir el volumen, presiona '+'"
			echo "Para bajar el volumen, presiona '-'"
			echo "Para mostrar la lista de reproducción, presiona 'l'"
			echo "Para mostrar más comandos, presiona 'h'"
			echo "Para salir del reproductor, presiona 'q'"
			mpg123 -qC *
			;;
		2) #Esta opción es para listar las canciones
			ls | grep .mp3
			;;
		3) #Esta opción es para instalar mpg123
			;;
		4) #Esta opción es para cambiar de carpeta
			echo "Por favor, dime la ruta (relativa) de la carpeta a la que quieres cambiar"
			read carpeta
			cd $carpeta
			echo "Ahora estás en $carpeta "
			;;
		5) #Opción para salirse
			salir=N
			;;
		*) #Esta opción del case es la que permite que los comandos usuales del bash funcionen
			$eleccion
			;;
	esac
done
