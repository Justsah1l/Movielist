import 'package:flutter/material.dart';
import '../provider/authserv.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 60,
            child: Icon(
              Icons.person,
              size: 70,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 55,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              AuthService.logout();
            },
            child: const Text("Logout"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              onPrimary: Colors.black,
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              fixedSize: const Size(260, 60),
            ),
          ),
        ),
      ],
    );
  }
}
