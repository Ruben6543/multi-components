#include <iostream>
#include "../src/dni_utils.h"

int main() {
    VerificadorDNI verificador;
    char dni[16];

    while (true) {
        std::cout << "Ingrese un DNI (ejemplo: 12345678Z): ";
        std::cin >> dni;

        if (verificador.validar_dni(dni)) {
            std::cout << "El DNI " << dni << " es valido.\n";
        } else {
            std::cout << "El DNI " << dni << " no es valido.\n";
        }
    }

    return 0;
}
