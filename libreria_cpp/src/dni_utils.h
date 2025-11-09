#ifndef DNI_UTILS_H
#define DNI_UTILS_H

#ifdef _WIN32
  #ifdef BUILDING_DNI_LIB
    #define DNI_API __declspec(dllexport)
  #else
    #define DNI_API __declspec(dllimport)
  #endif
#else
  #define DNI_API
#endif

#include <stdexcept>
#include <cstring>
#include <cctype>
#include <cstdlib>

/**
 * @class VerificadorDNI
 * @brief Clase para calcular y validar DNIs españoles.
 */
class DNI_API VerificadorDNI {
private:
    static constexpr const char* LETRAS = "TRWAGMYFPDXBNJZSQVHLCKE";
    static constexpr int LETRAS_LENGTH = 23;

    char calcular_letra(int numero) const;
    bool es_numero_valido(int numero) const;

public:
    bool validar_dni(const char* dni) const;
};

#endif
