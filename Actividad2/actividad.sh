#!/bin/bash

#Actividad2 SISTEMAS OPERATIVOS 1

# Definiendo mi variable con mi usuario de git
GITHUB_USER=SharonT2

# llamando api de git y pasando el usuario
consultaAPI=$(curl -s "https://api.github.com/users/$GITHUB_USER")

echo "Respuesta de la API: $consultaAPI"

# Extraer datos del JSON
identificador=$(echo $consultaAPI | jq -r '.id')
CREATED_AT=$(echo $consultaAPI | jq -r '.created_at')

# mensaje correspondiente
mensajeOut="Hola $GITHUB_USER. User ID: $identificador. Cuenta fue creada el: $CREATED_AT."

# Salida del mensaje
echo $mensajeOut

# Crear directorio para el log
date=$(date +%Y-%m-%d)
directorio="./$date"
mkdir -p $directorio

# Escribir mensaje en el log
echo $mensajeOut >> "$directorio/saludos.log"