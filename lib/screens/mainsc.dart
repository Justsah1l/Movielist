import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mainsc extends StatefulWidget {
  const Mainsc({super.key});

  @override
  State<Mainsc> createState() => _MainscState();
}

class _MainscState extends State<Mainsc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("data"),
    );
  }
}
