#!/bin/bash

# Creado por: Douglas Torres
# Carnet: 11-11027

down="Se fue el internet a las ";
up="Volvio el internet a las ";
dia=${1:?'Debes colocar el dia para guardar el archivo con el nombre apropiado'};
aux=0;
trap "exit" INT
while true
do
    ping -c1 8.8.8.8 &> /dev/null;
    ct=$?;
    if [ "$ct" -ne 0 ] && [ "$aux" -eq 0 ]
    then
	now=$(date +"%T");
	echo "$down $now ">> internet-$dia.txt;
	aux=1;
    elif [ "$ct" -eq 0 ] && [ "$aux" -eq 1 ]
    then
	now=$(date +"%T");
	echo "$up $now ">> internet-$dia.txt;
	aux=0;
    fi
done

