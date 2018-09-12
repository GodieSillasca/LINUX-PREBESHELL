#!/bin/bash
 
intento=0
cont=0

echo Ahorcado FI, elaborado por SOMH y CAMD para esta PREBESHELL.; 
declare -a palabra1[15];  #Se declara la palabra1, la cual contendrá 15 espacios

read -p "Palabra : " palabra2                # Se lee la palabra 2, -p ayuda a excribir en la terminal mientras recibe de teclado
let longitud=`expr length "$palabra2"`-1     # let:ejecución de operaciones aritméticas,longitud de la palabra ingresada

for i in $(seq 0 $longitud); # seq:para generar una lista de valores
	do
	palabra1[$i]=${palabra2:$i:1}  
done

read -p "Defina el numero de intentos que el jugador tendrá para para adivinar la palabra  : " intento # intento nos indica hasta qué momento terminar el programa
declare -a pavidinar[$longitud];
for i in $(seq 0 $longitud);
	do
	pavidinar[$i]=_  # Se usan guiones por cada letra de la palabra a advinar.
	echo ${pavidinar[$i]};
done

#ciclo, hacer miestras cont no sea igual a intento.
while test $cont -le $intento
	do
echo;

for i in $(seq 0 $longitud);
	do
	echo -n "${pavidinar[$i]} ";
done

echo;
echo "Letra :       ;Intentos: $cont de $intento"

read letra
echo $palabra2 | grep "$letra" > nul 2>&1 || let cont+=1
 
for i in $(seq 0 $longitud);
	do
		if [ ${palabra1[$i]} = "$letra" ];then #rellena los espacios
			pavidinar[$i]=$letra
		fi
done
# Mostrar los guiones de las letras no encontradas 
echo;echo;

for i in $(seq 0 $longitud);
	do
	echo -n "${pavidinar[$i]} ";
done

echo;echo;

if [ "$cont" -ge "$intento" ];
	then
break
fi
i=0
cadenafinal=`while test $i -le $longitud; do echo -n ${pavidinar[$i]}; let i+=1; done`

if [ "$cadenafinal" == "$palabra2" ]; #Compara la cadena fina, después de todos los intentos con la palabra ingresada
	then
	break
fi
done
if [ "$cadenafinal" == "$palabra2" ];
	then
	echo "Felicidades, ganaste :3."

#Falta hacer que aparezca el mensaje antes de que se cierre

elif [ "$cadenafinal" -ne "$palabra2" ];
	then
	echo "Perdiste :(."
fi
exit 0
