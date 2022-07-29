// ignore_for_file: file_names, unnecessary_import, implementation_imports, unused_import, sort_child_properties_last, unused_field, prefer_final_fields

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:r6_guide_app_firebase/Operators.dart';

import 'MapsScreen.dart';
import 'OperatorsScreen.dart';
import 'WeaponsScreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //late Operators _operators;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Rainbow Six: Siege GuideAPP'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OperatorsScreen()))),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/operators.png',
                        scale: 22,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Operators',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeaponsScreen()))),
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/mp5.png',
                        scale: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Weapons',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MapsScreen())),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/maps.png',
                        scale: 18,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text('Maps', style: TextStyle(fontSize: 20)),
                    ],
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
