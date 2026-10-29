# TaskFlow

Aplicación Android de gestión de tareas desarrollada durante el curso de Flutter.

## Datos del Estudiante
* **Estudiante:** David Israel Chávez García
* **Proyecto:** TaskFlow

---

## Bitácora de Avances y Dificultades Técnicas

### Semana 1 · Sesión 1: Introducción a Flutter, Dart y el entorno[cite: 1]
* **Avance implementado:** Verificación del entorno con `flutter doctor`, creación del proyecto base con `flutter create` e implementación de la pantalla de bienvenida personalizada con nombre de la app, datos del estudiante, mensaje de bienvenida, contador estático de tareas y paleta de colores propia[cite: 1].
* **Dificultad técnica registrada:** Al ejecutar `flutter run` en el emulador Android (`sdk gphone64 x86 64` / Pixel 7 API 34), la compilación de Gradle falló con el error `Android sdkmanager did not install NDK 28.2.13676358` debido a la deprecación de la herramienta CLI `sdkmanager`.
* **Solución aplicada:** Instalación manual de la versión específica del paquete **NDK (Side by side) `28.2.13676358`** desde el *SDK Manager > SDK Tools* de Android Studio, logrando compilar y desplegar la aplicación correctamente en el emulador[cite: 1].