// ignore_for_file: file_names

import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/OperatorsScreen.dart';

class EklemeSayfasi extends StatefulWidget {
  const EklemeSayfasi({Key? key}) : super(key: key);

  @override
  State<EklemeSayfasi> createState() => _EklemeSayfasiState();
}

class _EklemeSayfasiState extends State<EklemeSayfasi> {
  var tfBio = TextEditingController();
  var tfBirthPlace = TextEditingController();
  var tfDob = TextEditingController();
  var tfHeight = TextEditingController();
  var tfWeight = TextEditingController();
  var tfIcon = TextEditingController();
  var tfName = TextEditingController();
  var tfNickName = TextEditingController();
  var tfType = TextEditingController();
  var tfOrg = TextEditingController();

  var refOperators = FirebaseDatabase.instance.ref().child("Operators");

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
          actions: [
            IconButton(
              onPressed: () {
                var operatorBilgi = HashMap<String, dynamic>();

                operatorBilgi["BIO"] = tfBio.text;
                operatorBilgi["Birth Place"] = tfBirthPlace.text;
                operatorBilgi["DOB"] = tfDob.text;
                operatorBilgi["Height"] = tfHeight.text.toString();
                operatorBilgi["Weight"] = tfWeight.text.toString();
                operatorBilgi["Icon"] = tfIcon.text;
                operatorBilgi["Operator Name"] = tfName.text;
                operatorBilgi["NickName"] = tfNickName.text;
                operatorBilgi["ORG"] = tfOrg.text;
                operatorBilgi["Type"] = tfType.text;

                refOperators.push().set(operatorBilgi);

                debugPrint("Kayıt edildi");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OperatorsScreen()));
              },
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
            )
          ],
          title: const Text('Operator Ekleme Sayfası'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            elevation: 10,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      autocorrect: false,
                      controller: tfBio,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'BIO: '),
                    ),
                    TextField(
                      autocorrect: false,
                      controller: tfBirthPlace,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Birth Place: '),
                    ),
                    TextField(
                        autocorrect: false,
                        controller: tfDob,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'DOB: ')),
                    TextField(
                        autocorrect: false,
                        controller: tfHeight,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Height: ')),
                    TextField(
                        autocorrect: false,
                        controller: tfWeight,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Weight')),
                    TextField(
                        maxLength: 150,
                        autocorrect: false,
                        controller: tfIcon,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Icon Link:')),
                    TextField(
                        autocorrect: false,
                        controller: tfName,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Name: ')),
                    TextField(
                        autocorrect: false,
                        controller: tfNickName,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'NickName: ')),
                    TextField(
                        autocorrect: false,
                        controller: tfOrg,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'ORG: ')),
                    TextField(
                        autocorrect: false,
                        controller: tfType,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Type: ')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
