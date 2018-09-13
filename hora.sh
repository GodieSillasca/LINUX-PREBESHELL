#!/bin/bash
#Este script da la hora de la computadora de manera "personalizada"
echo -n "Son las: "
uptime | gawk '{print $(NF -9)}'
echo "Que tengas buen día, amiguito, estudia mucho y échale ganas <3"