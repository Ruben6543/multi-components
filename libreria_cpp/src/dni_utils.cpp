#include "dni_utils.h"

char VerificadorDNI::calcular_letra(int numero) const {
    if (!es_numero_valido(numero))
        throw std::invalid_argument("Número DNI fuera de rango");
    return LETRAS[numero % LETRAS_LENGTH];
}

bool VerificadorDNI::es_numero_valido(int numero) const {
    return numero > 0 && numero <= 99999999;
}

bool VerificadorDNI::validar_dni(const char* dni) const {
    if (!dni) return false;

    size_t len = std::strlen(dni);
    if (len < 2) return false;

    char letra = std::toupper(static_cast<unsigned char>(dni[len - 1]));
    char numero_str[16] = {0};
    std::strncpy(numero_str, dni, len - 1);
    numero_str[len - 1] = '\0';

    char* endptr;
    long numero = std::strtol(numero_str, &endptr, 10);
    if (*endptr != '\0' || !es_numero_valido(numero))
        return false;

    char letra_correcta = calcular_letra(numero);
    return letra == letra_correcta;
}
