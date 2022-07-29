// ignore_for_file: file_names
import 'package:flutter/material.dart';

class WeaponsScreen extends StatefulWidget {
  const WeaponsScreen({Key? key}) : super(key: key);

  @override
  State<WeaponsScreen> createState() => _WeaponsScreenState();
}

class _WeaponsScreenState extends State<WeaponsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Weapons Page'),
        ),
      ),
    );
  }
}
