#!/bin/bash
#Este script da la fecha de la computadora de manera "personalizada"
echo -n "Hoy es: "
date | gawk '{print $(NF-5),$(NF-4),$(NF-3),$(NF)}'
echo "Todos los días son buenos para decir 'te quiero' <3"
echo "Abraza hoy a todos tus seres queridos."