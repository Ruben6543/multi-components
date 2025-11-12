import requests

BASE_URL = "http://127.0.0.1:8000"

def obtener_letra(numero: int):
    resp = requests.post(f"{BASE_URL}/dni/{numero}")
    print(resp.json())

def validar_dni(dni: str):
    resp = requests.get(f"{BASE_URL}/dni/validar", params={"dni": dni})
    print(resp.json())

if __name__ == "__main__":
    obtener_letra(12345678)
    validar_dni("12345678Z")
