// ignore_for_file: file_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/OperatorDetail.dart';
import 'package:r6_guide_app_firebase/Operators.dart';

import 'AdminEklemeSayfasi.dart';

class AdminOperatorsSayfasi extends StatefulWidget {
  const AdminOperatorsSayfasi({Key? key}) : super(key: key);

  @override
  State<AdminOperatorsSayfasi> createState() => _AdminOperatorsSayfasiState();
}

class _AdminOperatorsSayfasiState extends State<AdminOperatorsSayfasi> {
  var refAdminOperators = FirebaseDatabase.instance.ref().child('Operators');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminEklemeSayfasi(),
                  ),
                );
              },
              child: const Text(
                'EKLE',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
          backgroundColor: Colors.red,
          title: const Text('Admin Operators Page'),
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refAdminOperators.onValue,
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
                child: ListView.builder(
                    itemCount: operatorlistesi.length,
                    itemBuilder: (context, index) {
                      var adminOperators = operatorlistesi[index];
                      return GestureDetector(
                        onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OperatorDetail(
                                    adminOperators.operator_bio,
                                    adminOperators.operator_name,
                                    adminOperators.operator_nickName,
                                    adminOperators.operator_type,
                                    adminOperators.operator_org,
                                    adminOperators.operator_height,
                                    adminOperators.operator_weight,
                                    adminOperators.operator_dob,
                                    adminOperators.operator_birthPlace)))),
                        child: Card(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      child: Image.network(
                                          adminOperators.operator_icon)),
                                  Column(
                                    children: [
                                      FittedBox(
                                          child: Text(adminOperators
                                              .operator_nickName)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      FittedBox(
                                          child: Text(
                                              adminOperators.operator_type)),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OperatorDetail(
                                                        adminOperators
                                                            .operator_bio,
                                                        adminOperators
                                                            .operator_name,
                                                        adminOperators
                                                            .operator_nickName,
                                                        adminOperators
                                                            .operator_type,
                                                        adminOperators
                                                            .operator_org,
                                                        adminOperators
                                                            .operator_height,
                                                        adminOperators
                                                            .operator_weight,
                                                        adminOperators
                                                            .operator_dob,
                                                        adminOperators
                                                            .operator_birthPlace)));
                                      },
                                      icon: const Icon(Icons.remove_red_eye))
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
