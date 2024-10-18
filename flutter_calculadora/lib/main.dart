
import 'package:flutter/material.dart';
import 'package:flutter_calculadora/comp/CustomAppBar.dart';
import 'package:flutter_calculadora/theme/AppTheme.dart';
import './comp/CalcButton.dart';
import 'dart:math';
void main() => runApp(CalcApp());
class CalcApp extends StatefulWidget {
  const CalcApp({super.key}) ;
  @override
  CalcAppState createState() => CalcAppState();
}


class CalcAppState extends State<CalcApp> {
  String valorAnt = '';
  String operador = '';
  TextEditingController _controller = new TextEditingController();
  void numClick(String text) {
    setState(() => _controller.text += text);
    print(_controller);
  }
  void clear(String text) {
    setState(() {
      _controller.text = '';
    });
  }
  void opeClick(String text) {
    setState(() {
      valorAnt = _controller.text;
      operador = text;
      _controller.text = '';
    });
  }
  void accion(){
    setState(() {
      print("");
    });
  }


  void resultOperacion(String text) {
    setState(() {
      switch (operador) {
        case "/":
          _controller.text = (double.parse(valorAnt) / double.parse(_controller.text)).toString();
          break;
        case "*":
          _controller.text = (double.parse(valorAnt) * double.parse(_controller.text)).toString();
          break;
        case "+":
          _controller.text = (double.parse(valorAnt) + double.parse(_controller.text)).toString();
          break;
        case "-":
          _controller.text = (double.parse(valorAnt) - double.parse(_controller.text)).toString();
          break;
        case "%":
          _controller.text = (double.parse(valorAnt) % double.parse(_controller.text)).toString();
          break;
        case "√":
          _controller.text = (sqrt(double.parse(_controller.text))).toString();
          break;
        case "π":
          _controller.text = "3.14159265359";  // Mostrar el valor de Pi directamente
          break;
        case "^2":
          _controller.text = (pow(double.parse(_controller.text), 2)).toString();  // Elevar al cuadrado
          break;
        case "^":
          valorAnt = _controller.text;
          operador = "^";
          _controller.text = "";  // Limpiar la pantalla para ingresar el exponente
          break;
        case "=":
          if (operador == "^") {
            _controller.text = (pow(double.parse(valorAnt), double.parse(_controller.text))).toString();
          }
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    List<List> labelList = [
      ["AC", "C", "√", "/"],       // √ = Raíz Cuadrada
      ["π", "^2", "^", "*"],       // π = Pi, ^2 = Potencia al cuadrado, ^ = Potencia a cualquier número
      ["7", "8", "9", "-"],
      ["4", "5", "6", "+"],
      ["1", "2", "3", "="],
      [".", "0", "00", ""]
    ];
    List<List> funx = [
      [clear, clear, opeClick, opeClick],
      [opeClick, opeClick, opeClick, opeClick],
      [numClick, numClick, numClick, opeClick],
      [numClick, numClick, numClick, opeClick],
      [numClick, numClick, numClick, resultOperacion],
      [numClick, numClick, numClick, resultOperacion] // Añade esta fila para coincidir con labelList
    ];

//Aqui codigo
    AppTheme.colorX=Colors.blue;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeData,
      home: Scaffold(
        appBar: CustomAppBar(accionx: accion as Function),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
/*color:
Theme.of(context).colorScheme.surfaceVariant,*/
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  textAlign: TextAlign.end,
                  controller: _controller,
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(labelList.length, (index) =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                        labelList[index].length,
                            (indexx) => CalcButton(
                          text: labelList[index][indexx],
                          callback: funx[index][indexx] as Function,
                        ),
                      ),
                    ],
                  )
              )
                //aqui codigo
            ],
          ),
        ),
      ),
    );
  }

//Aquí Código
}
