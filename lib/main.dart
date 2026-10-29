import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

/// Función con Null Safety que genera el saludo personalizado
String obtenerSaludo(String nombre, String? rolOpcional) {
  final String rol = rolOpcional ?? 'Estudiante de Ingeniería TI';
  return '¡Bienvenido, $nombre! ($rol)';
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      // Paleta de color propia usando Material 3
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E), // Verde esmeralda oscuro / Teal
          brightness: Brightness.dark,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dart básico: tipos, cadenas, booleanos, listas y mapas
    const String appName = 'TaskFlow';
    const String studentName = 'David Israel Chávez García';
    const String welcomeMessage =
        'Organiza tus actividades diarias, controla tu progreso y sincroniza tus pendientes en un solo lugar.';
    const int staticTaskCounter = 5;
    const bool isEnvironmentReady = true;

    final List<String> previewCategories = ['Universidad', 'Proyecto API', 'Entrenamiento'];
    final Map<String, dynamic> sessionMetadata = {
      'semana': 1,
      'sesion': 1,
      'arquitecturaObjetivo': 'MVVM + Repository',
    };

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surfaceContainerHighest,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Encabezado y bienvenida
              Icon(
                Icons.task_alt_rounded,
                size: 64,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                appName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                obtenerSaludo(studentName, null),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Text(
                welcomeMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 28),

              // Tarjeta del contador estático de tareas
              Card(
                elevation: 0,
                color: colorScheme.primaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        'TAREAS PENDIENTES',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$staticTaskCounter',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Semana ${sessionMetadata['semana']} · Sesión ${sessionMetadata['sesion']} (${isEnvironmentReady ? "Entorno Activo" : "Pendiente"})',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Chips de categorías (uso de List en Dart)
              Wrap(
                spacing: 8,
                alignment: WrapAlignment.center,
                children: previewCategories
                    .map((cat) => Chip(
                          label: Text(cat),
                          backgroundColor: colorScheme.surfaceContainerHigh,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}