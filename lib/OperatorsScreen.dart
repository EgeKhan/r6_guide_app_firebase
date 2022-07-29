// ignore_for_file: file_names, unnecessary_import, implementation_imports, unused_import, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:r6_guide_app_firebase/MainPage.dart';
import 'package:r6_guide_app_firebase/Operators.dart';

class OperatorsScreen extends StatefulWidget {
  const OperatorsScreen({Key? key}) : super(key: key);

  @override
  State<OperatorsScreen> createState() => _OperatorsScreenState();
}

class _OperatorsScreenState extends State<OperatorsScreen> {
  var refOperators = FirebaseDatabase.instance.ref().child("Operators");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() => Navigator.pop(context)),
          ),
          title: const Text('Operators Page'),
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refOperators.onValue,
          builder: (context, event) {
            var operatorlistesi = <Operators>[];

            var gelenDegerler = event.data?.snapshot.value as dynamic;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenOperators = Operators.fromJson(nesne);

                operatorlistesi.add(gelenOperators);
                operatorlistesi.sort(
                  (a, b) => a.operator_type.compareTo(b.operator_type),
                );
              });
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 120 / 150,
                    ),
                    itemCount: operatorlistesi.length,
                    itemBuilder: (context, index) {
                      var operators = operatorlistesi[index];
                      return GestureDetector(
                        onTap: null,
                        child: Card(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FittedBox(
                                      child: Text(operators.operator_nickName)),
                                  SizedBox(
                                      height: 100,
                                      child: Image.network(
                                          operators.operator_icon)),
                                  FittedBox(
                                      child: Text(operators.operator_type))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
