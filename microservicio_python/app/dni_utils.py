LETRAS = "TRWAGMYFPDXBNJZSQVHLCKE"

def calcular_letra(numero: int) -> str:
    """Calcula la letra de un DNI a partir del número."""
    if numero <= 0 or numero > 99999999:
        raise ValueError("Número DNI fuera de rango")
    return LETRAS[numero % 23]

def validar_dni(dni: str) -> bool:
    """Valida un DNI completo (número + letra)."""
    if not dni or len(dni) != 9:
        return False

    numero_str = dni[:-1]
    letra = dni[-1].upper()

    if not numero_str.isdigit():
        return False

    numero = int(numero_str)
    letra_correcta = calcular_letra(numero)
    return letra == letra_correcta
