// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class OperatorDetail extends StatefulWidget {
  String bio;
  String name;
  String nickName;
  String type;
  String org;
  String height;
  String weight;
  String dateOfBirth;
  String birthPlace;

  OperatorDetail(this.bio, this.name, this.nickName, this.type, this.org,
      this.height, this.weight, this.dateOfBirth, this.birthPlace,
      {Key? key})
      : super(key: key);

  @override
  State<OperatorDetail> createState() => _OperatorDetailState();
}

class _OperatorDetailState extends State<OperatorDetail> {
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
          title: Text(widget.nickName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 5,
            shadowColor: Colors.red,
            child: Center(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.bio),
                      Text(widget.name),
                      Text(widget.type),
                      Text(widget.org),
                      Text(widget.height),
                      Text(widget.weight),
                      Text(widget.dateOfBirth),
                      Text(widget.birthPlace),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
