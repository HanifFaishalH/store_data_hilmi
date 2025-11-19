import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      theme: ThemeData(primaryColor: Colors.cyan),
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
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';

  //   PRAKTIKUM 4: SHARED PREF
  // Future<void> readAndWritePreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int appCounter = prefs.getInt('appCounter') ?? 0;
  //
  //   // Increment
  //   appCounter++;
  //
  //   await prefs.setInt('appCounter', appCounter);
  //   setState(() {
  //     appCounter = appCounter;
  //   });
  // }
  //
  // Future<void> deletePreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('appCounter');
  //
  //   setState(() {
  //     appCounter = 0;
  //   });
  // }

  // PRAKTIKUM 5
  Future<void> getPaths() async {
    // jeda sedikit agar emulator siap
    await Future.delayed(const Duration(milliseconds: 300));

    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    print("DOC: ${docDir.path}");
    print("TEMP: ${tempDir.path}");

    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState() {
    super.initState();
    // readAndWritePreference();
    getPaths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Doc path: $documentsPath'),
            Text('Temp path: $tempPath'),
          ],
        ),
      ),
    );
  }
}
