
# Librería compartida en C++

A continuación, se detallarán los pasos para la creación y ejecución del componente desarrollado en C++.

Considere que el proyecto consiste en la creación  de una función que se encargue de verificar un DNI español.

Cabe considerar por otra parte, la librería creada es considerada **dinámica**, conocida por ser una forma eficiente de la modularización de código y que permite la creación de librerías que pueden ser cargadas en tiempo de ejecución en multiples aplicaciones al mismo tiempo. Como consecuencia, promueve a la reutilización de código, reduce duplicación y simplifica el mantenimiento.

Finalmene se utilizó _CMake_ para la compilación.

Tome en cuenta al sistema operativo Windows
 
## 1. Requerimientos

### 1.1 Developer Command Prompt VS 2022
Debe tener instalada la extensión de [Visual Studio](https://visualstudio.microsoft.com/es/vs/community/).

Una vez ejecutandose el instalador, seleccione la opcion "Desarrollo para el escritorio con C++" dado que la carga de trabajo contiene las herramientas que se utilizarán en el presente proyecto.

### 1.2 Editor de código
Para el presente proyecto se recomienda la instalación de [Visual Studio Code](https://code.visualstudio.com/download) para el desarrollo y ejecución de la aplicación.

## 2. Documentación
Para generar la documentación primeramente debe instalar la herramienta [doxygen](https://www.doxygen.nl/). Doxygen es una software encargado de automatizar la documentación de un código, como por ejemplo a las clases, funciones, variables, etc.

Si generará la documentación por primera vez, debe dirigirse a la carpeta /docs dentro el proyecto de /libreria_cpp:
> ```
> cd docs
> ```

Genere el archivo de DoxyFile:
> ```
> doxygen -g
> ```

Dentro del archivo **DoxyFile** asegúrese de tener los siguientes ajustes para visualizarlo en la ejecución:

```ini
PROJECT_NAME           = "Librería DNI Utils"
OUTPUT_DIRECTORY       = .
INPUT                  = ../src
RECURSIVE              = NO
GENERATE_HTML          = YES
GENERATE_LATEX         = NO
EXTRACT_ALL            = YES
EXTRACT_PRIVATE        = YES
EXTRACT_STATIC         = YES
QUIET                  = YES
OPTIMIZE_OUTPUT_FOR_C  = NO
```
En caso de ya contar con los ajustes puede pasar a la ejecución de la apliación (véase el punto 3).


## 3. Ejecución

Para la acceder a la funcionalidad de verificación de DNIs españoles, mediante la consola _Developer Command Prompt for VS 2022_ (véase el punto 1.1) diríjase dentro de la carpeta _libreria_cpp_ y ejecute el siguiente comando:
```bash
> build_all.bat
```

Se creó el archivo _build_all.bat_ con la finalidad de automatizar los comandos para la ejecución de la aplicación.

Podrá visualizar el siguiente mensaje en la consola, al mismo tiempo, la documentación del código en su navegador (index.html) generado con **doxygen**:

```bash
> Running client...
> Ingrese un DNI (ejemplo: 12345678Z):
```


# Extra

Para visualizar el archivo readme API_CPP.md instale la extension _Markdown Preview Enhanced_ y dentro del archivo a visualizar utilice:   

cntrl + shift + v

