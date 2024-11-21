class Digitos {
  String mostrarDigitos(int numero) {
    // Convertir el número a una cadena para poder acceder a cada dígito
    String numeroStr = numero.toString().padLeft(4, '0');

    // Crear el mensaje con los dígitos
    return 'd1 = ${numeroStr[0]}, d2 = ${numeroStr[1]}, d3 = ${numeroStr[2]} y d4 = ${numeroStr[3]}';
  }
}
