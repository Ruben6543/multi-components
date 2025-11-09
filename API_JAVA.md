


# Librería de utilidades en Java

A continuación, se detallarán los pasos para la creación y ejecución de una librería de utilidades en _java_.

Considere que el proyecto consiste en la creación  de una función que se encargue de verificar un DNI español.

La finalidad de una librería de utilidades es agrupar código reutilizable con la finalidad de evitar la duplicación del mismo.

Si desea ejecutar toda la aplicación primeramente debe cumplir con los requerimientos (véase el punto 1), posteriormente dentro de _/libreria_java_ ejecute el siguiente comando:

```bash
> build_all.bat
```
Mediante el comando anterior podrá visualizar mediante la consola la ejecución del programa, al mismo tiempo, la documentacion en su navegador predeterminado.

Tome en cuenta al sistema operativo Windows.
 
## 1. Requerimientos

### 1.1 Java 17
La versión recomendada de _java_ es la version 17 porque en relación con la versión 8, esta ofrece una mejora en el rendimiento, seguridad, integración con _frameworks_ modernos, soporte a largo plazo (LTS), APIs y librerías extendidas entre otros.

Para instalar _java_ y ejecutarlo dentro del editor de código seleccionado (véase el punto 1.2). Es necesario que instale el JDK 17 de [adoptium](https://adoptium.net/es/temurin/releases?version=17&os=any&arch=any) y verifique su instalación:

```bash
> javac --version
javac 17.0.17
```

```bash
> java --version
openjdk 17.0.17 2025-10-21
OpenJDK Runtime Environment Temurin-17.0.17+10 (build 17.0.17+10)
OpenJDK 64-Bit Server VM Temurin-17.0.17+10 (build 17.0.17+10, mixed mode, sharing)
```

### 1.2 Editor de código
Para el presente proyecto se recomienda la instalación de [Visual Studio Code](https://code.visualstudio.com/download) para el desarrollo y ejecución de la aplicación.

## 2. Documentación
Para generar la documentación debe ejecutar desde el directorio _/libreria_java_:

```
javadoc -d docs/javadoc lib/src/main/java/com/example/DNIUtils.java client/Main.java
```

El comando anterior creará la documentación de las clases _DNIUtils_ y _Main_ dentro del directorio _/docs_ donde prodrá visualizar un archivo _index.html_

## 3. Ejecución

Para la acceder a la funcionalidad de verificación de DNIs españoles, debe crear el directorio de salida mediante: 

```
javac -d out lib/src/main/java/com/example/DNIUtils.java
```

El comando anterior creará un directorio _/out_ con la finalidad de poder ejecutar la clase _DNIUtils.java_ y utilizarlo en diferentes partes del proyecto o también en otros proyectos mediante la creación mediante _JAR_. Podrá visualizar la creación de un archivo _DNIUtils.class_

A continuación compile el archivo de _cliente/Main.java_ mediante el comando: 

```
javac -d out -cp out client/Main.java
```

El comando anteior compila el cliente _Main.java_ en el directorio _/out_ con la finalidad de verificar las dependencias. Nótese de igual forma la creación de un archivo  _Main.class_.

Finalmente ejecute el comando de ejecución del cliente compilado anteriormente:

```
java -cp out Main
```

Podrá visualizar el programa en funcionamiento:

```bash
> Ingrese un DNI (ejemplo: 12345678Z):
```

## 4. Generacion del archivo JAR

Un archivo _JAR_ almacena varias clases en un solo archivo con la finalidad de reutilizarlo en uno o varios proyectos.

En caso de que requiera su creación, prosiga validando la compilación y creación del directorio _/out_ (véase el punto 3), ejecute el siguiente comando:

```
jar cf lib/dniutils.jar -C out com/example/DniUtils.class
```
Considere que el archivo _JAR_ se creará en el directorio especificado en el comando, en este caso _lib/_.

# Extra

Para visualizar el archivo readme API_CPP.md instale la extension _Markdown Preview Enhanced_ y dentro del archivo a visualizar utilice:   