
# Microservicio REST FastAPI

A continuación, se detallarán los pasos para la creación y ejecución de un servicio RestAPI con _FastAPI_.

Considere que el proyecto consiste en la creación  de una función que se encargue de verificar un DNI español.


Si desea ejecutar toda la aplicación primeramente debe cumplir con los requerimientos (véase el punto 1), posteriormente dentro de _/microservicio_python_ ejecute el siguiente comando:

```bash
> build_all.bat
```

El comando anterior se encarga de la intalacion del entorno, la ejecución del servidor y la generación de la documentación del servicio RestAPI.

Tome en cuenta al sistema operativo Windows.
 
## 1. Requerimientos

### 1.1 Python
La versión utilizada en el proyecto fue _python 3.10_ mediante [su página oficial](https://www.python.org/downloads/release/python-3100/).


Con la finalidad de verificar la instalación ejecute el siguiente comando:

```bash
> python --version
Python 3.10.0
```

### 1.2 Editor de código
Para el presente proyecto se recomienda la instalación de [Visual Studio Code](https://code.visualstudio.com/download) para el desarrollo y ejecución de la aplicación.

### 1.3 Postman
[Postman](https://www.postman.com/downloads/) es una herramienta que permite principalmente documentar y probar servicios RestAPI. En el presente proyecto permitirá verificar la funcionalidad de la aplicación.


## 2. Ejecución

Es importante que cuente con un entorno virtual, donde podrá almacenar los paquetes del presente proyecto, dentro del directorio _/microservicio_python_ ejecute:

```bash
> python -m venv venv
```

Una vez creada la carpeta _/venv_ active el entorno virtual:

```bash
> venv\Scripts\activate
```

Es necesario que cuente con los paquetes instalados que se encuentran en el archivo _requeriments.txt_:

```bash
> pip install -r requirements.txt
```

Una vez instalados los requerimientos del proyecto, es posible la ejecución del sistema:


```
uvicorn app.main:app --reload
```

Podrá visualizar en la consola, el _endpoint_ por donde se ejecuta el proyecto:

```
INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
INFO:     Started reloader process [7380] using WatchFiles
INFO:     Started server process [17988]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```

Ahora podra realizar las respectivas pruebas mediante la herramienta _postman_ accediento al _endpoint_ _http://127.0.0.1:8000_.

Cosidere que el método _Post_ generará la letra en base a un número dado:

(POST)
http://127.0.0.1:8000/dni/[número-dni]

Como respuesta obtendra el mismo número enviado junto con la letra correspondiente:
```json
{
  "numero": 46130442,
  "letra": "D"
}
```
De igual forma, considere que el método _Get_ tiene la responsabilidad de validar un DNI enviado, agregue al DNI respectivo mediante _Params_ utilizando:

Key = dni
Value = [dni]

(GET)
http://127.0.0.1:8000/dni/validar?dni=[dni]


Como respuesta obtendra el mismo dni enviado junto con su validación:
```json
{
    "dni": "46130442d",
    "valido": true
}
```


## 3. Documentación
 La documentación tiene como objetivo principal acceder a las funcionalidades y puede generarse automaticamente mediante el servicio de _Fastapi_:
 
 http://127.0.0.1:8000/openapi.json

El anterior endpoint permite acceder a la documentación del servicio, considere que el servicio debe estar en ejecución.

Ejecute la aplicación:

```bash
uvicorn app.main:app --reload
```

Con la aplicación en ejecución, guarde el archivo en formato _json_:

```bash
curl -o docs/openapi.json http://127.0.0.1:8000/openapi.json
```

Finalmente genere el archivo _yaml_ ejecutando la clase _convert .py_ :

```bash
python app/convert.py
```

El comando anterior generará la documentación en el directorio _/docs_ donde podrá acceder a la misma, en formato _yaml_. 



# EXTRA
Para visualizar el archivo readme API_CPP.md en VS Code instale la extension _Markdown Preview Enhanced_ y dentro del archivo a visualizar utilice:   

cntrl + shift + v

Ejecute el siguiente comando para la generación del archivo _requirements.txt_:

```bash
pip freeze > requirements.txt
```
