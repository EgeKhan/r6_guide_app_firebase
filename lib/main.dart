// ignore_for_file: avoid_print, unused_import

import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:r6_guide_app_firebase/MainPage.dart';
import 'package:r6_guide_app_firebase/PatchNotes.dart';
import 'package:r6_guide_app_firebase/SignUpScreen.dart';
import 'package:r6_guide_app_firebase/Users.dart';
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
  var refUsers = FirebaseDatabase.instance.ref().child("Users");

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
    var tfKullaniciAd = TextEditingController();
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
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        controller: tfKullaniciAd,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Kullanıcı Adı: ')),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      controller: tfKullaniciPsw,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password: '),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: const Text('Kayıt Ol'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SingUpScreen()),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          refUsers.onValue.listen(
                            (event) {
                              var gelenDegerler =
                                  event.snapshot.value as dynamic;
                              if (gelenDegerler != null) {
                                gelenDegerler.forEach(
                                  (key, nesne) {
                                    var gelenKisi = Users.fromJson(key, nesne);

                                    if (gelenKisi.kullaniciAd ==
                                            tfKullaniciAd.text &&
                                        gelenKisi.kullaniciPsw ==
                                            tfKullaniciPsw.text &&
                                        gelenKisi.kullaniciType == "Admin") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AdminPageScreen(),
                                          ));
                                    } else if (gelenKisi.kullaniciAd ==
                                            tfKullaniciAd.text &&
                                        gelenKisi.kullaniciPsw ==
                                            tfKullaniciPsw.text &&
                                        gelenKisi.kullaniciType == "User") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MainPage(),
                                        ),
                                      );
                                    }
                                  },
                                );
                              }
                            },
                          );
                        },
                        child: const Text('Giriş Yap'))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
