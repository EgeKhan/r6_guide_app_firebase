// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/admin/AdminOperatorsSayfasi.dart';
import 'package:r6_guide_app_firebase/main.dart';

import 'AdminUsersSayfasi.dart';

class AdminPageScreen extends StatefulWidget {
  const AdminPageScreen({Key? key}) : super(key: key);

  @override
  State<AdminPageScreen> createState() => _AdminPageScreenState();
}

class _AdminPageScreenState extends State<AdminPageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                    (route) => false);
              },
              icon: const Icon(Icons.logout)),
          title: const Text('Admin Page'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: null,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.person, size: 30),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Users',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminUsersSayfasi(),
                              ));
                        },
                        icon: const Icon(Icons.edit),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: null,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/operators.png',
                        scale: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Operators',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 210,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AdminOperatorsSayfasi(),
                              ));
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: null,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/mp5.png',
                        scale: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Weapons',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 215,
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: null,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/maps.png',
                        scale: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Maps',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 245,
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
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
