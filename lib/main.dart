import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const TaskFlowApp());
}

class Task {
  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.isCompleted,
  });

  final int id;
  final String title;
  final String description;
  final String priority;
  final bool isCompleted;
}

const demoTasks = [
  Task(
    id: 1,
    title: 'Definir modelo de datos Task',
    description: 'Estructurar propiedades id, título, descripción, prioridad y estado para representar cada actividad en TaskFlow.',
    priority: 'Alta',
    isCompleted: true,
  ),
  Task(
    id: 2,
    title: 'Construir widget reutilizable TaskCard',
    description: 'Diseñar tarjeta con ListTile, estado visual e ícono de navegación hacia la vista de detalle.',
    priority: 'Alta',
    isCompleted: true,
  ),
  Task(
    id: 3,
    title: 'Implementar listado con ListView.builder',
    description: 'Renderizar las tareas locales bajo demanda en TaskListScreen optimizando el desplazamiento.',
    priority: 'Media',
    isCompleted: false,
  ),
  Task(
    id: 4,
    title: 'Configurar rutas declarativas con GoRouter',
    description: 'Enviar el parámetro :id desde el listado y recuperar la tarea seleccionada en TaskDetailScreen.',
    priority: 'Alta',
    isCompleted: false,
  ),
  Task(
    id: 5,
    title: 'Verificar calidad con flutter analyze',
    description: 'Aplicar dart format, comprobar que no existan diagnósticos pendientes y registrar el commit en GitHub.',
    priority: 'Baja',
    isCompleted: false,
  ),
];

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TaskListScreen()),
    GoRoute(
      path: '/task/:id',
      builder: (context, state) {
        final taskId = int.parse(state.pathParameters['id']!);
        return TaskDetailScreen(taskId: taskId);
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task, this.onTap});

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: task.isCompleted ? Colors.green : null,
        ),
        title: Text(task.title),
        subtitle: Text('${task.priority} - ${task.description}'),
        trailing: const Icon(Icons.chevron_right),
      ),
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
          return TaskCard(
            task: task,
            onTap: () => context.push('/task/${task.id}'),
          );
        },
      ),
    );
  }
}

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.taskId});

  final int taskId;

  @override
  Widget build(BuildContext context) {
    final task = demoTasks.firstWhere((item) => item.id == taskId);

    return Scaffold(
      appBar: AppBar(title: Text('Detalle de tarea #${task.id}')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text(task.description),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                Chip(
                  avatar: const Icon(Icons.flag_outlined, size: 18),
                  label: Text('Prioridad: ${task.priority}'),
                ),
                Chip(
                  avatar: Icon(
                    task.isCompleted ? Icons.check_circle : Icons.pending,
                    size: 18,
                    color: task.isCompleted ? Colors.green : null,
                  ),
                  label: Text(
                    task.isCompleted
                        ? 'Estado: completada'
                        : 'Estado: pendiente',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Acción visual contextual exigida en el trabajo autónomo
            Card(
              child: ListTile(
                leading: Icon(
                  task.isCompleted ? Icons.verified : Icons.play_circle_outline,
                  color: task.isCompleted ? Colors.green : null,
                ),
                title: Text(
                  task.isCompleted
                      ? 'Esta tarea ya fue finalizada'
                      : 'Acción sugerida: iniciar seguimiento',
                ),
                subtitle: Text('Ruta activa: /task/${task.id}'),
                trailing: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          task.isCompleted
                              ? 'Tarea #${task.id} verificada en el backlog.'
                              : 'Tarea #${task.id} marcada en foco de trabajo.',
                        ),
                      ),
                    );
                  },
                  child: Text(task.isCompleted ? 'Verificar' : 'Enfocar'),
                ),
              ),
            ),
            const Spacer(),
            FilledButton.tonalIcon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver al listado'),
            ),
          ],
        ),
      ),
    );
  }
}
