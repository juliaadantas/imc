import 'package:flutter/material.dart';

import 'SecondPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora IMC",
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Color.fromARGB(255, 2, 106, 56),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(50, 220, 115, 1.0),
          brightness: Brightness.light,
          secondary: Color.fromRGBO(50, 220, 115, 1.0),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/segundaPagina': (context) => const SecondPage(),
      },
    ),
  );
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 80,
              icon: const Icon(Icons.calculate),
              color: Colors.white,
              tooltip: 'Calculadora de IMC',
              onPressed: (() =>
                  Navigator.of(context).pushNamed('/segundaPagina')),
            ),
            Text('Calculadora de IMC',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
      backgroundColor: Colors.greenAccent[400],
    );
  }
}
