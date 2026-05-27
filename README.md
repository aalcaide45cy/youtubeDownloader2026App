# YT Downloader Premium - Aplicación de Escritorio e Interfaz Glassmorphic

Una aplicación de escritorio nativa de Windows, de diseño premium y moderna, construida con **FastAPI** en el backend y una interfaz de usuario integrada con **Glassmorphism** en el frontend usando **pywebview**. Utiliza **yt-dlp** para analizar y descargar flujos de YouTube a la velocidad máxima de tu red.

---

## 🚀 Características Clave

1. **Multi-Descarga Concurrente (Hilos)**: 
   Descarga múltiples pistas de vídeo, audio y subtítulos en paralelo (hasta 4 descargas simultáneas) utilizando un pool de hilos (`ThreadPoolExecutor`).
2. **Selección de Idiomas de Audio**:
   Permite listar todos los idiomas de audio disponibles de un vídeo. Si seleccionas una resolución de vídeo y una pista de audio en un idioma específico (ej: Español), la aplicación descargará ambos y los fusionará automáticamente en un solo archivo `.mp4` usando FFmpeg.
3. **Login seguro por Navegador (Cookies)**:
   Evita bloqueos de edad, CAPTCHAs y accede a tus vídeos privados o de miembros cargando las cookies de sesión activa de tu navegador web preferido (Chrome, Edge, Firefox, Brave, Opera, Vivaldi, Safari) de forma segura.
4. **Selector de Carpeta Nativo**:
   Integra una ventana emergente nativa del explorador de Windows para cambiar fácilmente la carpeta donde se guardarán las descargas.
5. **Progreso en Tiempo Real**:
   Transmite de manera asíncrona la velocidad de descarga en MB/s, porcentaje y tiempo estimado (ETA) mediante Server-Sent Events (SSE).
6. **Diseño Visual de Vanguardia**:
   Interfaz de usuario responsiva estilo "Glassmorphic" con orbes brillantes de fondo, modo oscuro, skeleton loaders y transiciones fluidas.

---

## 🛠️ Requisitos de Instalación

Antes de iniciar la aplicación, asegúrate de tener instalado en tu sistema:

1. **Python 3.13** o superior.
2. **FFmpeg** añadido al PATH de tu sistema (requerido por `yt-dlp` para fusionar el audio y el vídeo de alta calidad).

---

## 💻 Cómo Iniciar (Modo Desarrollo)

Para facilitarte la vida, hemos incluido un script automatizado. Simplemente haz doble clic en el archivo:

👉 **`run.bat`**

Este archivo por lotes se encargará automáticamente de:
1. Comprobar si existe el entorno virtual local de Python (`.venv`). Si no, lo creará.
2. Verificar e instalar las dependencias necesarias (`fastapi`, `uvicorn`, `yt-dlp`, `pywebview`, `pyinstaller`).
3. Iniciar el servidor local en segundo plano y abrir **una ventana dedicada de escritorio integrada** con el descargador, sin necesidad de usar el navegador de internet del sistema.

*Al cerrar la ventana de la aplicación, el servidor y todos los procesos en segundo plano se detendrán automáticamente.*

---

## 📦 Compilar a Aplicación Ejecutable (.exe)

Si quieres usar el descargador como una aplicación de escritorio tradicional independiente (portable) y sin tener consolas abiertas, puedes empaquetarla con un solo clic:

1. Haz doble clic en el archivo **`build.bat`**.
2. Este script utilizará **PyInstaller** para compilar la aplicación, sus dependencias y las plantillas estáticas en un único archivo ejecutable.
3. El archivo resultante, **`YT_Downloader_Premium.exe`**, se guardará en la carpeta **`dist/`**.
4. Puedes mover este `.exe` a tu Escritorio o a cualquier carpeta y ejecutarlo con doble clic.

### 💾 Persistencia de Configuración
- Al cambiar la carpeta de descarga desde la aplicación compilada, la ruta se guardará de forma persistente en un archivo `config.json` generado **al lado de tu ejecutable `.exe`**. 
- La próxima vez que inicies la aplicación, tu última carpeta de descargas se cargará de forma automática.

---

## 📂 Estructura del Código

- `downloader.py`: Módulo que integra `yt-dlp` para analizar vídeos de YouTube (extrayendo resoluciones, audios clasificados por idiomas y subtítulos) y realiza las descargas de forma asíncrona con hooks de progreso.
- `main.py`: Servidor FastAPI que expone la API y sirve la interfaz estática. Gestiona la concurrencia de descargas usando multi-hilo y levanta el selector de carpetas de Windows.
- `run.bat`: Script de Windows para inicialización automática.
- `static/`:
  - `index.html`: Estructura HTML de la aplicación basada en pestañas y tarjetas interactivas.
  - `style.css`: Estética visual Premium (Glassmorphism, gradientes de fondo y animaciones).
  - `app.js`: Controlador dinámico de interfaz de usuario y procesamiento de eventos SSE de descarga.
- `README.md`: Este archivo explicativo de GitHub.
