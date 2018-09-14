#!/bin/bash

echo ""
echo -e "\e[45m ********************Juego de Dados*********************\e[0m"
echo ""
echo -e "\e[33m Este es un juego de dados, los cuales te darán dos números entre 1 y 6, después se sumarán,y dependiendo de esta suma, tendrás que efectuar la accioń indicada\e[0m"
salida=1
decision=0

while [ $decision -ne 1 ]; do
var1=$((RANDOM%6+1))  #  se obtiene un número del 0 al 6
var2=$((RANDOM%6+1)) #  Saca un numero de 0 al 6
echo Dado1: $var1
echo Dado2: $var2
suma=`expr $var1 + $var2`
echo "suma = $suma"
	
continuar(){
	echo -e "\e[5m¿Quieres volver a jugar? Presiona 1 para terminar y cualquier tecla para continuar.\e[0m"
	read salida
	if [ $salida == 1 ];then
		decision=1
	fi
	return 0
}

		if [ $suma -eq 2 ]; then
			echo "Dale un besito a quien esté a tu derecha. <3"
			continuar
		fi
		if [ $suma -eq 3 ]; then
			echo "Dale una patada a quien esté a tu izquierda. 7m7"
			continuar
		fi
		if [ $suma -eq 4 ]; then
			echo "Olfatea a tu amigo más cercano. 7u7"
			continuar

		fi
		if [ $suma -eq 5 ]; then
			echo "Lame la oreja de tu colega."
			continuar
		fi
		if [ $suma -eq 6 ]; then
			echo "Hazle cosquillas a un amigo. :,)"
			continuar
		fi
		if [ $suma -eq 7 ]; then
			echo "Muerde alguna parte de tu amigo más cercano."
			continuar
		fi
		if [ $suma -eq 8 ]; then
			echo "Abraza a un árbol (o lo más parecido a uno)."
			continuar
		fi
		if [ $suma -eq 9 ]; then
			echo "Haz un garabato en el cuaderno de alguien más."
			continuar
		fi
		if [ $suma -eq 10 ]; then
			echo "Bloquea a tu amigo de FB."
			continuar
		fi
		if [ $suma -eq 11 ]; then
			echo "Pide a alguien cercano que te pellizque"
			continuar

		fi
		if [ $suma -eq 12 ]; then
			echo  "Pide a alguien que te olfatee."
			continuar

		fi
	done
