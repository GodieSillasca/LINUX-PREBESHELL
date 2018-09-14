#!/bin/bash
#Un comando que busque un archivo en específico en un directorio en particular.
#Reciba dos argumentos: el archivo a buscar y el directorio en donde se va a
#buscar.
#Programado por CMDA (prebecario 3) y SMHA (prebecario 14)
echo -e "\e[95m ¿Qué archivo quieres buscar? \e[0m"
echo -en "\e[95m --> \e[0m"
read archivo

echo -e "\e[95m ¿En dónde quieres buscarlo? (dame la ruta completa del directorio) \e[0m"
echo -ne "\e[95m --> \e[0m"
read ruta
echo -e "\e[95m Resultados de la búsqueda: \e[0m"
ls $ruta | grep -i  $archivo
echo -e "\e[95m :3 \e[0m"
