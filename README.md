# Flutter Intermedio: Diseños profesionales y animaciones

Del curso de Fernando Herrera: https://cursos.devtalles.com/courses/flutter-Intermedio

## Animaciones con Animate_do

### Temas puntuales de la sección

En esta sección tocaremos los siguientes temas:

- Librería Animate_do
- Diferentes animaciones
- Navegación entre páginas
- Intro de X
- Animar cualquier widget
- Botton Navigation Bar item con notificaciones
- Provider
- AnimateController
- Extraer controlador de la animación
- Repetir animaciones
- Y más!

### Inicio de proyecto - Animate_do.app

Creamos el proyecto `animate_do_app`.

Instalamos `animate_do`. Documentación: `https://pub.dev/packages/animate_do#-readme-tab-`.

En la carpeta `lib` creamos la carpeta `src` y dentro creamos la carpeta `pages`.

En la carpeta `pages` creamos el archivo `pagina1_page.dart`.

Modificamos `main.dart` para llamar a este archivo.

### Diseño de la página 1

Instalamos el paquete `font_awesome_flutter`. Documentación: `https://pub.dev/packages/font_awesome_flutter`.

Modificamos `pagina1_page.dart`.

### Animaciones básicas - Animate_do

Modificamos `pagina1_page.dart` para añadir animaciones.

La animación se realiza al iniciar la app. No se vuelve a animar con hot reloads. Hay que hacer un hot restart para volver a animarlo.

Podemos usar el paquete `animate_do` en cualquier sitio donde se acepte un Widget.

### X IOS intro page

En la carpeta `pages` creamos el archivo `xtwitter_page.dart`.

Luego conectaremos todo, pero para comenzar las pruebas modificamos `main.dart` para que apunte a la nueva page.

### Disparar animaciones manualmente

Cambiando la propiedad `animate` a `true` lanzaremos manualmente la animación.

En esta clase lo haremos con un Stateful Widget y más adelante lo haremos con Provider.

Modificamos `xtwitter_page.dart`.

También conectamos las dos pages. Para eso modificamos `main.dart` y `pagina1_page.dart`.

### Diseño de página con menú

Vamos a hacer otra pantalla para hacer otro tipo de animaciones.

Vamos a hacer que un Widget dispare una animación que se encuentra en otro Widget.

En la carpeta `pages` creamos el archivo `navegacion_page.dart`.

Para hacer pruebas modificamos `main.dart` para que apunte a esta nueva page. Luego la conectaré a las otras.

### Cambiar número de notificaciones usando Provider

Instalamos el paquete `provider`. Documentación: `https://pub.dev/packages/provider`.

Modificamos `navegacion_page.dart` para que, cuando toquemos el botón que se encuentra en un árbol diferente al BottomNavigationBar, se le comunique que hay que incrementar el número de notificaciones.

### Animaciones con Provider

Vamos a implementar animaciones con las notificaciones.

Modificamos `navegacion_page.dart`.

### Unir todas las pantallas de mi aplicación

Modificamos `main.dart` y `pagina1_page.dart`.
