# Saludo infinitamente-Actividad4
Para ejecutar un script que imprime un saludo y la fecha actual en un bucle infinito.

## Instalación

### Crear el script `nombre_Archivo.sh`:
    ```bash
    #!/bin/bash
    while true
    do
        echo "Esta es la fecha ctual: $(date)"
        sleep 1
    done
    ```

### Darle permisos de ejecución:
    ```bash
    chmod +x /ruta/nombre_Archivo.sh
    ```

### Crear la unidad de servicio `nombre_Servicio.service` en `/etc/systemd/system/`:
    ```ini
    [Unit]
    Description=Servicio para un saludo infinito

    [Service]
    ExecStart=/ruta/saludo.sh
    Restart=always
    User=nobody
    Group=nogroup

    [Install]
    WantedBy=multi-user.target
    ```

### Habilitar y arrancar el servicio:
    ```bash
    sudo systemctl enable nombre_Servicio.service
    sudo systemctl start nombre_Servicio.service
    ```

## Verificar el Servicio

Para ver el estado del servicio:
```bash
sudo systemctl status saludo.service
```bash
```

## Deteniendo el Servicio
    sudo systemctl stop nombre_Servicio.service
    sudo systemctl disable nombre_Servicio.service
