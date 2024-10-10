// main.dart

import 'dart:io';
import 'ejercicio_02/operacion.dart';

void main() {
  Calculadora calculadora = Calculadora();

  print('Ingrese el primer número:');
  double? num1 = double.tryParse(stdin.readLineSync()!);

  print('Ingrese el segundo número:');
  double? num2 = double.tryParse(stdin.readLineSync()!);

  print('Seleccione la operación (suma, resta, multiplicación):');
  String? operacion = stdin.readLineSync();

  double? resultado;

  switch (operacion) {
    case 'suma':
      resultado = calculadora.suma(num1!, num2!);
      break;
    case 'resta':
      resultado = calculadora.resta(num1!, num2!);
      break;
    case 'multiplicacion':
      resultado = calculadora.multiplicacion(num1!, num2!);
      break;
    default:
      print('Operación no válida.');
      return;
  }

  print('El resultado de la $operacion es: $resultado');
}
