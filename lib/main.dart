import 'dart:convert';
import './model/pizza.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];
  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizzas) => jsonEncode(pizzas))
    .toList());
  }


  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist_broken.json');
    List pizzaMapList = jsonDecode(myString);

    setState(() {
      for (var pizza in pizzaMapList) {
        Pizza myPizza = Pizza.fromJson(pizza);
        myPizzas.add(myPizza);
      }
    });
    String json = convertToJson(myPizzas);
    print(json);
    return myPizzas;
  }

  @override
  void initState() {
    super.initState();
    readJsonFile()
      .then((value) {
        setState(() {
          myPizzas = value;
        });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text('${myPizzas[index].description}\n€ ${myPizzas[index].price}'),
          );
        },
      )
    );
  }
}
