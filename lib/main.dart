// ignore_for_file: avoid_print, unused_import

import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/MainPage.dart';
import 'package:r6_guide_app_firebase/PatchNotes.dart';
import 'package:r6_guide_app_firebase/Weapons.dart';

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

  Future<void> tumPatchNotes() async {
    refPatchNotes.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          var gelenPathcNotes = PatchNotes.fromJson(nesne);

          debugPrint("**************\n");
          debugPrint("PatchNote Key: $key");
          debugPrint("PatchNote Details: ${gelenPathcNotes.patchNoteDetails}");
          debugPrint(
              "PatchNote Release Date: ${gelenPathcNotes.patchNoteReleaseDate}");
          debugPrint("PatchNote Version: ${gelenPathcNotes.patchNoteVersion}");
          debugPrint("PatchNote Steam Size: ${gelenPathcNotes.patchNoteSteam}");
          debugPrint("PatchNote UC Size: ${gelenPathcNotes.patchNoteUC}\n");
        });
      }
    });
  }

  Future<void> tumSilahlar() async {
    refWeapons.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          var gelenSilahlar = Weapons.fromJson(nesne);

          debugPrint("**************\n");
          debugPrint("Weapon Key: $key");
          debugPrint("Weapon Name: ${gelenSilahlar.weaponName}");
          debugPrint("Weapon Type: ${gelenSilahlar.type}");
          debugPrint("Weapon Damage: ${gelenSilahlar.damage}");
          debugPrint(
              "Weapon Suppressed Damage: ${gelenSilahlar.suppressedDamage}");
          debugPrint("Weapon ROF: ${gelenSilahlar.rof}");
          debugPrint("Weapon Magazine: ${gelenSilahlar.magazine}");
          debugPrint("Weapon Operators: ${gelenSilahlar.operators}");
          debugPrint("Weapon Icon: ${gelenSilahlar.weaponIcon}\n");
        });
      }
    });
  }

  Future<void> tumKisiler() async {
    refOperators.onValue.listen(
      (event) {
        var gelenDegerler = event.snapshot.value as dynamic;

        if (gelenDegerler != null) {
          gelenDegerler.forEach(
            (key, nesne) {
              var gelenKisi = Operators.fromJson(nesne);

              debugPrint("************\n");
              debugPrint("Key: $key");
              debugPrint("Kisi Ad: ${gelenKisi.operator_bio}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_birthPlace}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_dob}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_height}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_weight}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_icon}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_org}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_nickName}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_name}");
              debugPrint("Kisi Ad: ${gelenKisi.operator_type}\n");
            },
          );
        }
      },
    );
  }

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
