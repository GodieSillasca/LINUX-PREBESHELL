#!/bin/bash

#Funcion principal, explora cada directorio y su contenido recursivamente.
function arbolprebe() {
	for file in "$1"/*; do
		for ((i=0; $i < $nivel; i++)); do
			echo -n "   "
		done
		if [ -d "$file" ]; then
			let nivel=nivel+1
			nombre=`echo -e "$file" | grep -E -o "[][a-zA-Z0-9_─–\.\+\(\)\ \'\!\-]*$"`
			echo -e " └─ \E[1;36m$nombre\E[0m"
			arbolprebe "$file"
			let nivel=nivel-1
		elif [ -f "$file" ]; then
			nombre=`echo -e "$file" | grep -E -o "[][a-zA-Z0-9_─–\.\+\(\)\ \'\!\-]*$"`
			echo -e " └─ \E[36m$nombre\E[0m"
		fi
	done
}

nivel=0
echo Dame la ruta del directorio que quieres como inicio de tu arbol.
read directorio
arbolprebe $directorio

echo ""
echo  "El código de la función que hace funcionar el comando arbol, fue tomado del script "arbol.sh","
echo  "programado por David Yaxkin Sánchez Neri (DakeDekaane en GitHub)"
echo ""
echo  "La permanencia de dicho código en este script y en este repositorio está sujeta a la aprobación del autor original."

