# TaskFlow

Aplicación Android de gestión de tareas académicas desarrollada en Flutter.

## Datos del Estudiante
* **Estudiante:** David Israel Chávez García
* **Proyecto:** TaskFlow

---

## Alcance de TaskFlow

Problema: necesito organizar actividades académicas y de desarrollo de software para saber cuáles siguen pendientes en la semana.
Usuario objetivo: estudiante universitario que planifica entregas semanales y prácticas de programación.

### Historias de usuario y criterios de aceptación
1. Como estudiante, quiero listar mis tareas para ver qué actividades debo realizar.
   Criterio: la lista muestra título, prioridad y estado visual de cada tarea.
2. Como estudiante, quiero abrir una tarea para leer su descripción completa y el usuario asignado.
   Criterio: al tocar una tarjeta aparece la pantalla de detalle con descripción, prioridad, estado y usuario de la tarea elegida.
3. Como estudiante, quiero crear una tarea para registrar un nuevo pendiente académico.
   Criterio: el formulario guarda una tarea válida y la lista principal la muestra.
4. Como estudiante, quiero editar una tarea para actualizar su prioridad, texto o estado.
   Criterio: los cambios guardados aparecen reflejados tanto en la lista como en el detalle.
5. Como estudiante, quiero eliminar una tarea terminada para mantener limpio mi backlog.
   Criterio: después de confirmar la acción, la tarea desaparece de la lista.

### Modelo de datos
Task: id (entero único), title (texto), description (texto), priority (Alta, Media o Baja), isCompleted (verdadero/falso), userId (entero que identifica al usuario propietario).

### Pantallas previstas
Lista: tarjetas de tareas con título, prioridad, icono de estado y acción para navegar o crear.
Detalle: información completa de la tarea seleccionada (incluyendo userId) y futuras acciones de editar o eliminar.
Formulario: campos validados de título, descripción y selector de prioridad.

### Requisitos no funcionales
La navegación debe tener textos comprensibles y rutas declarativas por id.
Un id inexistente debe mostrar el mensaje "No se encontró esta tarea." en vez de cerrar la app.

### Contrato de API que necesitaremos
GET /tasks          listar tareas
GET /tasks/:id      consultar detalle
POST /tasks         crear tarea
PATCH /tasks/:id    actualizar tarea
DELETE /tasks/:id   eliminar tarea

La API concreta se conectará en las siguientes sesiones. Estas rutas definen los requisitos de comunicación del proyecto.