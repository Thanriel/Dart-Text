// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String textImc = "";

  void calculateIMC(weight, height) {
    double imc;
    String name = nameController.text;
    String gender = genderController.text;
    String cpf = cpfController.text;
    String statusIMC;
    //imc = weight / (height * height);
    height = height / 100;
    imc = weight / (height * height);

    if (imc < 18) {
      statusIMC = "Abaixo do peso";
    } else if (imc > 18 && imc < 24) {
      statusIMC = "Peso ideal";
    } else if (imc > 24 && imc < 29) {
      statusIMC = "Sobrepeso";
    } else if (imc > 29 && imc < 34) {
      statusIMC = "Obesidade";
    } else if (imc > 34 && imc < 40) {
      statusIMC = "Obesidade grau 2";
    } else {
      statusIMC = "Obesidade Mórbida";
    }

    textImc =
        "Olá $name\nCPF: $cpf\nSexo: $gender\nSeu calculo de IMC: $statusIMC\nIMC : $imc";
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImcCalculated(
                  textImc: textImc,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar

      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: const Text(
          "Calcular IMC",
          style: TextStyle(
              fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  keyboardType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: genderController,
                decoration: InputDecoration(
                    labelText: 'Sexo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: cpfController,
                decoration: InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: weightController,
                decoration: InputDecoration(
                    labelText: 'Peso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: heightController,
                decoration: InputDecoration(
                    labelText: 'Altura',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.cyanAccent),
              onPressed: () {
                calculateIMC(double.parse(weightController.text),
                    double.parse(heightController.text));
              },
              child: const Text('Calcular IMC'),
            )
          ],
        ),
      ),
    );
  }
}

class ImcCalculated extends StatelessWidget {
  final String textImc;

  const ImcCalculated({super.key, required this.textImc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: const Text(
          "IMC Calculado",
          style: TextStyle(
              fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[Text(textImc)],
        ),
      ),
    );
  }
}
