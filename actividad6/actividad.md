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
