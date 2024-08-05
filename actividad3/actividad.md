# SHARON ESTEFANY TAGUAL GODOY
# 201906173


## Parte 1 - Gestión de usuarios

A continuación se presentan los comandos indicados en las instrucciones de la tarea:

### Parte 1: Gestión de Usuarios

Creando los tres usuarios: 
    sudo useradd charrys1
    sudo useradd charrys2
    sudo useradd charrys3

Asignando las contraseñas a los usuarios:
    sudo passwd charrys1
    sudo passwd charrys2
    sudo passwd charrys3

Visualizando informaciòn de los usuarios:
    id charrys1
    id charrys2
    id charrys3
    Información mostrada: uid=1002(usuario1) gid=1002(usuario1) grupos=1002(usuario1)

Eliminación de usuarios:
    sudo userdel -r charrys3

### Parte 2: Gestión de Grupos

Creando grupos:
    sudo groupadd priGrupo
    sudo groupadd segGrupo
    sudo groupadd terGrupo


Agregando usuario al grupo:
    sudo usermod -aG priGrupo priGrupo
    sudo usermod -aG segGrupo segGrupo

Verificando membresía:
    groups charrys1
    groups charrys2
    
    Resultado esperado:
    charrys1 : charrys1 grupo1
    charrys2 : charrys2 grupo2

Eliminando grupo:
    sudo groupdel priGrupo


### Parte 3: Gestión de Permisos

Creación archivos y directorios:
    su - charrys1
    echo "Hola mundo" > ~/file1.txt
    mkdir ~/file1
    echo "Hola mundo" > ~/file1/file2.txt


Verificar permisos:
    ls -l ~/file1.txt
    ls -ld ~/file2



Modificar Permisos usando chmod:
    chmod 640 ~/file1.txt
    chmod u+x ~/file1/file2.txt


Modificar Permisos usando `chmod` con Modo Simbólico:



Cambiar el Grupo Propietario: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.



Configurar Permisos de Directorio:



Comprobación de Acceso:



Verificación Final: