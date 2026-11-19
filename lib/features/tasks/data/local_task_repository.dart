import '../domain/task.dart';
import 'task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: 1,
      title: 'Modelar entidad Task con JSON',
      description: 'Separar la clase Task en lib/task.dart e implementar factory Task.fromJson',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 2,
      title: 'Documentar historias de usuario',
      description: 'Redactar las cinco historias con criterios comprobables en el archivo README.md',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 3,
      title: 'Definir contrato de endpoints REST',
      description: 'Especificar las rutas GET, POST, PATCH y DELETE para la futura integración con API',
      priority: 'Media',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 4,
      title: 'Validar búsqueda segura por id',
      description: 'Usar findTask y int.tryParse para mostrar un mensaje si el id de la tarea no existe',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 5,
      title: 'Ejecutar análisis estático del código',
      description: 'Correr dart format lib y flutter analyze sin errores antes de subir el commit',
      priority: 'Baja',
      isCompleted: false,
      userId: 1,
    ),
  ];

  @override
  List<Task> getTasks() => List.unmodifiable(_tasks);

  @override
  void save(Task task) {
    final index = _tasks.indexWhere((item) => item.id == task.id);
    if (index == -1) return;
    _tasks[index] = task;
  }
}
