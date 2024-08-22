# Saludo infinitamente
Este servicio `systemd` ejecuta un script que imprime un saludo y la fecha actual en un bucle infinito.

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
    chmod +x /ruta/al/script/nombre_Archivo.sh
    ```

3. Crear la unidad de servicio `saludo.service` en `/etc/systemd/system/`:
    ```ini
    [Unit]
    Description=Servicio de saludo infinito

    [Service]
    ExecStart=/ruta/al/script/saludo.sh
    Restart=always
    User=nobody
    Group=nogroup

    [Install]
    WantedBy=multi-user.target
    ```

4. Habilitar y arrancar el servicio:
    ```bash
    sudo systemctl enable saludo.service
    sudo systemctl start saludo.service
    ```

## Verificar el Servicio

Para ver el estado del servicio:
```bash
sudo systemctl status saludo.service
