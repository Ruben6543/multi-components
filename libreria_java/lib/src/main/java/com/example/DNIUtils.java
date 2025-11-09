package com.example;

/**
 * Clase de utilidades para trabajar con DNI español.
 * Permite calcular la letra de un DNI y validar un DNI completo.
 */
public class DNIUtils {

    // Letras para el cálculo del DNI
    private static final char[] LETRAS = {
        'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X',
        'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E'
    };

    /**
     * Calcula la letra correspondiente a un numero de DNI.
     *
     * @param numero Numero del DNI sin letra.
     * @return Letra del DNI correspondiente.
     * @throws IllegalArgumentException si el numero no esta entre 0 y 99_999_999
     */
    public static char calcularLetra(int numero) {
        if (numero < 0 || numero > 99999999) {
            throw new IllegalArgumentException("Numero de DNI fuera de rango");
        }
        return LETRAS[numero % 23];
    }

    /**
     * Valida un DNI completo (numero + letra).
     *
     * @param dni DNI completo (ejemplo: "12345678Z").
     * @return true si el DNI es valido; false en caso contrario.
     */
    public static boolean validarDni(String dni) {
        if (dni == null || dni.length() != 9) return false;

        String numeroStr = dni.substring(0, 8);
        char letra = Character.toUpperCase(dni.charAt(8));

        try {
            int numero = Integer.parseInt(numeroStr);
            return calcularLetra(numero) == letra;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
