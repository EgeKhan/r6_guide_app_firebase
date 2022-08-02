// ignore_for_file: file_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/EklemeSayfasi.dart';
import 'package:r6_guide_app_firebase/Operators.dart';

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
                    builder: (context) => const EklemeSayfasi(),
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
            var adminOperatorListesi = <Operators>[];

            var gelenDegerler = event.data?.snapshot.value as dynamic;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var adminGelenOperators = Operators.fromJson(nesne);

                adminOperatorListesi.add(adminGelenOperators);
                adminOperatorListesi.sort(
                    ((a, b) => a.operator_type.compareTo(b.operator_type)));
              });
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: adminOperatorListesi.length,
                  itemBuilder: (context, index) {
                    var adminOperators = adminOperatorListesi[index];
                    return GestureDetector(
                      onTap: null,
                      child: Card(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: FittedBox(
                                      child: Image.network(
                                    adminOperators.operator_icon,
                                  )),
                                ),
                                Column(
                                  children: [
                                    Text(adminOperators.operator_name),
                                    Text(adminOperators.operator_nickName),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
