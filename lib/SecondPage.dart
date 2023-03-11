import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  bool ativado = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _textInfo = "";
  void _resetCampos() {
    _formKey.currentState?.reset();
    pesoController.clear();
    alturaController.clear();
    ativado = true;
    setState(() {
      _textInfo = "";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      //debugPrint("$imc");
      if (imc < 18.6)
        _textInfo =
            "Abaixo do peso \n(IMC: ${imc.toStringAsPrecision(4) + ' kg/cm²'})";
      else if (imc >= 18.6 && imc < 24.9)
        _textInfo =
            "Peso ideal \n(IMC: ${imc.toStringAsPrecision(4) + ' kg/cm²'})";
      else if (imc >= 24.9 && imc < 29.9)
        _textInfo =
            "Levemente acima do peso \n(IMC: ${imc.toStringAsPrecision(4) + ' kg/cm²'})";
      else if (imc >= 29.9 && imc < 34.9)
        _textInfo =
            "Obesidade Grau I \n(IMC: ${imc.toStringAsPrecision(4) + ' kg/cm²'})";
      else if (imc >= 34.9 && imc < 39.9)
        _textInfo =
            "Obesidade Grau II \n(IMC: ${imc.toStringAsPrecision(4) + ' kg/cm²'})";
      else if (imc >= 40)
        _textInfo =
            "Obesidade Grau III \n(IMC: ${imc.toStringAsPrecision(4) + ' kg/cm²'})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetCampos,
            )
          ], //<Widget>[]
        ), // app bar
        // backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 50,
                          spreadRadius: 15,
                          color: Color.fromRGBO(50, 220, 115, 1.0),
                        )
                      ]),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(30),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    width: 4,
                                    color: Color.fromARGB(255, 8, 116, 64))),
                            child: Icon(Icons.person,
                                size: 120,
                                color: Color.fromRGBO(50, 220, 115, 1.0)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 8, 116, 64),
                                    width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 8, 116, 64),
                                    width: 3),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              labelText: "Peso",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 8, 116, 64),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              suffix: Text(
                                "kg",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 2, 106, 56),
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 106, 56),
                                fontSize: 25.0),
                            controller: pesoController,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Insira seu peso!";
                              else
                                return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 8, 116, 64),
                                    width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 8, 116, 64),
                                    width: 3),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Altura",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 8, 116, 64),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              suffix: Text(
                                "cm",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 2, 106, 56),
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 2, 106, 56),
                                fontSize: 25.0),
                            controller: alturaController,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Insira sua altura!";
                              else
                                return null;
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 20.0, bottom: 28.0),
                              child: ElevatedButton(
                                onPressed: ativado
                                    ? () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() => ativado = false);
                                          _calcular();
                                        }
                                      }
                                    : null,
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(5))),
                                child: const Text(
                                  "Calcular",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 2, 106, 56),
                                      fontSize: 25.0),
                                ),
                              )),
                          Text(
                            _textInfo,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 2, 106, 56),
                                fontSize: 25.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
