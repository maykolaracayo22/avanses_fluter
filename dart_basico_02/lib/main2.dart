// main.dart

import 'dart:io';
import 'ejercicio_01/api_service.dart';
import 'ejercicio_02/operacion.dart';


void main() {
  ApiService apiService = ApiService();

  print('Ingrese el primer número:');
  double? num1 = double.tryParse(stdin.readLineSync()!);

  print('Ingrese el segundo número:');
  double? num2 = double.tryParse(stdin.readLineSync()!);

  print('Seleccione la operación (suma, resta, multiplicación):');
  String? operacion = stdin.readLineSync();

  double? resultado;

  switch (operacion) {
    case 'suma':
      resultado = apiService.realizarSuma(num1!, num2!);
      break;
    case 'resta':
      resultado = apiService.realizarResta(num1!, num2!);
      break;
    case 'multiplicacion':
      resultado = apiService.realizarMultiplicacion(num1!, num2!);
      break;
    default:
      print('Operación no válida.');
      return;
  }

  print('El resultado de la $operacion es: $resultado');
}

// main.dart


