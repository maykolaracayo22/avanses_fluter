// lib/ejercicio/api_service.dart

import 'operacion.dart';

class ApiService {
  final Calculadora _calculadora = Calculadora();

  double realizarSuma(double a, double b) {
    return _calculadora.suma(a, b);
  }

  double realizarResta(double a, double b) {
    return _calculadora.resta(a, b);
  }

  double realizarMultiplicacion(double a, double b) {
    return _calculadora.multiplicacion(a, b);
  }
}
