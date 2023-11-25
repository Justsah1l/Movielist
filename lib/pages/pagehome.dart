import 'package:flutter/material.dart';
import 'package:haircut/screens/futureelements.dart';
import 'package:haircut/screens/like.dart';

class Pagehome extends StatefulWidget {
  const Pagehome({super.key});

  @override
  State<Pagehome> createState() => _PagehomeState();
}

class _PagehomeState extends State<Pagehome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Now Streaming",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Futureelements(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Shows You might like",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
              height: 390,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Mightlike(),
              )),
        ],
      ),
    );
  }
}
