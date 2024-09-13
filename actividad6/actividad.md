# Actividad 6 - Resolución de Problemas

## Pregunta 1: ¿Cuántos procesos son creados por el siguiente programa?

### Código:

```c
#include <stdio.h>
#include <unistd.h>

int main() {
    // Primera llamada a fork
    fork();
    // Segunda llamada a fork
    fork();
    // Tercera llamada a fork
    fork();
    
    return 0;
}


## Pregunta 2: Crear un proceso zombie que permanezca en el sistema durante al menos 60 segundos

### Código:

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();  // Crear un proceso hijo

    if (pid < 0) {
        // Error al crear el proceso hijo
        perror("Error en fork");
        exit(1);
    } else if (pid == 0) {
        // Este es el proceso hijo
        printf("Proceso hijo con PID: %d\n", getpid());
        exit(0);  // El hijo termina aquí y se convierte en un proceso zombie
    } else {
        // Este es el proceso padre
        printf("Proceso padre con PID: %d\n", getpid());
        printf("El proceso hijo se convierte en zombie por 60 segundos...\n");
        sleep(60);  // Espera 60 segundos antes de recolectar al hijo
        // Ejecutar ps -l en otra terminal para observar el proceso zombie
        wait(NULL);  // El padre recolecta al proceso hijo
        printf("Proceso hijo recolectado. El zombie ya no existe.\n");
    }

    return 0;
}



## Pregunta 3: Completar el programa y análisis de procesos e hilos

### Código:

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/types.h>

// Función que será ejecutada por el hilo
void* thread_function(void* arg) {
    printf("Hilo creado en el proceso con PID: %d\n", getpid());
    return NULL;
}

int main() {
    pthread_t thread;
    pid_t pid;

    // Primer fork
    pid = fork();
    if (pid == 0) {  // Proceso hijo
        printf("Primer proceso hijo creado con PID: %d\n", getpid());
        
        // Segundo fork dentro del hijo
        pid = fork();
        if (pid == 0) {  // Proceso nieto
            printf("Segundo proceso hijo (nieto) creado con PID: %d\n", getpid());
        } else if (pid > 0) {
            // Crear un hilo en el primer hijo
            if (pthread_create(&thread, NULL, thread_function, NULL)) {
                fprintf(stderr, "Error al crear el hilo\n");
                exit(1);
            }
            pthread_join(thread, NULL);  // Espera a que el hilo termine
        }
        
        // Tercer fork dentro del primer hijo
        fork();  // Esto crea otro proceso
        printf("Proceso después del tercer fork con PID: %d\n", getpid());
    } else if (pid > 0) {  // Proceso padre
        // El proceso padre no hace nada más
        sleep(1);  // Espera a que los hijos terminen su ejecución
    }

    return 0;
}
