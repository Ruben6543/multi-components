from fastapi import FastAPI, HTTPException
from app.dni_utils import calcular_letra, validar_dni

app = FastAPI(title="Microservicio DNI", version="1.0")

@app.post("/dni/{numero}")
def obtener_letra(numero: int):
    """Devuelve la letra correspondiente a un número de DNI."""
    try:
        letra = calcular_letra(numero)
        return {"numero": numero, "letra": letra}
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))

@app.get("/dni/validar")
def validar_dni_endpoint(dni: str):
    """Valida un DNI completo (número + letra)."""
    es_valido = validar_dni(dni)
    return {"dni": dni, "valido": es_valido}
