// ignore_for_file: avoid_print, unused_import

import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/MainPage.dart';
import 'package:r6_guide_app_firebase/PatchNotes.dart';
import 'package:r6_guide_app_firebase/SignUpScreen.dart';
import 'package:r6_guide_app_firebase/Weapons.dart';

import 'admin/AdminPage.dart';
import 'Operators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var refOperators = FirebaseDatabase.instance.ref().child("Operators");
  var refWeapons = FirebaseDatabase.instance.ref().child("Weapons");
  var refPatchNotes = FirebaseDatabase.instance.ref().child("PatchNotes");

  /*Future<void> kisiEkle() async {
    var bilgi = HashMap<String, dynamic>();
    bilgi["bio"] = "Bio 2";
    bilgi["birth_place"] = "Bideford, England";
    bilgi["bod"] = "June 22nd(Age 56)";
    bilgi["height"] = "1.80";
    bilgi["weight"] = "72kg";
    bilgi["icon"] =
        "https://staticctf.akamaized.net/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/5NbqTdEPmYy9qOZmN9StVT/f75b0f2610a37f9e5bdcb8ba9d551a38/Y0R6_BADGE_Thatcher_L.png";
    bilgi["org"] = "SAS";
    bilgi["nickname"] = "Thatcher";
    bilgi["operator_name"] = "Mike Baker";
    bilgi["type"] = "Attacker";

    refOperators.push().set(bilgi);
  }*/

  @override
  void initState() {
    super.initState();
    // kisiEkle();
    // tumKisiler();
    // tumSilahlar();
    // tumPatchNotes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var adminId = 'kaansnbkr';
    var adminPsw = '13931393';

    var kullaniciId = "Eksnbkr09";
    var kullaniciPsw = "123123123";

    var tfKullaniciId = TextEditingController();
    var tfKullaniciPsw = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('LogIn Page'),
        ),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                      controller: tfKullaniciId,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Kullanıcı Adı: ')),
                  Column(
                    children: [
                      TextField(
                        controller: tfKullaniciPsw,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password: '),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: const Text('Hala Kayıt Olmadınız mı?'),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingUpScreen()),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (tfKullaniciId.text == adminId &&
                            tfKullaniciPsw.text == adminPsw) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminPageScreen()));
                        } else if (tfKullaniciId.text == kullaniciId &&
                            tfKullaniciPsw.text == kullaniciPsw) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPage()));
                        } else {
                          debugPrint(
                              "Yanlış kullanıcı veya şifre girişi yaptınız");
                        }
                      },
                      child: const Text('Giriş Yap'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
