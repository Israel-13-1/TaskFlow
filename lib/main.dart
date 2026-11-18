import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'task.dart';

void main() {
  runApp(const TaskFlowApp());
}

const demoTasks = <Task>[
  Task(
    id: 1,
    title: 'Modelar entidad Task con JSON',
    description: 'Separar la clase Task en lib/task.dart e implementar factory Task.fromJson',
    priority: 'Alta',
    isCompleted: true,
    userId: 1,
  ),
  Task(
    id: 2,
    title: 'Documentar historias de usuario',
    description: 'Redactar las cinco historias con criterios comprobables en el archivo README.md',
    priority: 'Alta',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 3,
    title: 'Definir contrato de endpoints REST',
    description: 'Especificar las rutas GET, POST, PATCH y DELETE para la futura integración con API',
    priority: 'Media',
    isCompleted: true,
    userId: 1,
  ),
  Task(
    id: 4,
    title: 'Validar búsqueda segura por id',
    description: 'Usar findTask y int.tryParse para mostrar un mensaje si el id de la tarea no existe',
    priority: 'Alta',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 5,
    title: 'Ejecutar análisis estático del código',
    description: 'Correr dart format lib y flutter analyze sin errores antes de subir el commit',
    priority: 'Baja',
    isCompleted: false,
    userId: 1,
  ),
];

Task? findTask(int? id) {
  for (final task in demoTasks) {
    if (task.id == id) return task;
  }
  return null;
}

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TaskListScreen()),
    GoRoute(
      path: '/task/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '');
        return TaskDetailScreen(task: findTask(id));
      },
    ),
  ],
);

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      routerConfig: appRouter,
    );
  }
}

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis tareas')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoTasks.length,
        itemBuilder: (context, index) {
          final task = demoTasks[index];
          return Card(
            child: ListTile(
              leading: Icon(
                task.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
              ),
              title: Text(task.title),
              subtitle: Text('Prioridad: ${task.priority}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/task/${task.id}'),
            ),
          );
        },
      ),
    );
  }
}

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    final selected = task;
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de tarea')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: selected == null
            ? const Text('No se encontró esta tarea.')
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selected.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(selected.description),
                  const SizedBox(height: 16),
                  Text('Prioridad: ${selected.priority}'),
                  Text(
                    selected.isCompleted
                        ? 'Estado: completada'
                        : 'Estado: pendiente',
                  ),
                  Text('Usuario: ${selected.userId}'),
                ],
              ),
      ),
    );
  }
}
