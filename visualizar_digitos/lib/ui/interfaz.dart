import 'package:flutter/material.dart';
import '../logica/digitos.dart';

class DigitosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DigitosPageState();
}

class _DigitosPageState extends State<DigitosPage> {
  final TextEditingController _numeroController = TextEditingController();

  // Variable para mostrar el resultado
  String _resultado = '';

  // Instancia de la clase Digitos
  final Digitos _digitos = Digitos();

  // Método que calcula los dígitos
  void _mostrarDigitos() {
    final numero = int.tryParse(_numeroController.text);

    // Validar que el valor ingresado sea un número y esté dentro del rango permitido
    if (numero == null || numero < 0 || numero > 9999) {
      setState(() {
        _resultado = 'Por favor ingrese un número válido (0-9999)';
      });
    } else {
      // Mostrar los dígitos
      final resultadoDigitos = _digitos.mostrarDigitos(numero);

      setState(() {
        _resultado = resultadoDigitos;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mostrar Dígitos"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(
                labelText: 'Número (máx. 4 dígitos)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _mostrarDigitos,
              child: Text('Mostrar Dígitos'),
            ),
            SizedBox(height: 20.0),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
