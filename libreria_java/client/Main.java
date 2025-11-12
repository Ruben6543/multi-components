import java.util.Scanner;

import com.example.DNIUtils;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.print("Ingrese un DNI (ejemplo: 12345678Z): ");
            String input = scanner.nextLine().trim();

            if (input.length() != 9) {
                System.out.println("El DNI " + input + " no es valido\n");
                continue;
            }
            
            boolean valido = DNIUtils.validarDni(input);

            if (valido) {
                System.out.println("El DNI " + input + " es valido.\n");
            } else {
                System.out.println("El DNI " + input + " no es valido.\n");
            }

            System.out.println();
        }
    }
}
