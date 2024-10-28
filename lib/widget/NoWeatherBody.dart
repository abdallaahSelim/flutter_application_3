import 'package:flutter/material.dart';

class Noweatherbody extends StatelessWidget {
  const Noweatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Title(
                  color: Colors.black,
                  child: Text(
                    "there is no wheather🙄start ",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ))),  Center(
              child: Title(
                  color: Colors.black,
                  child: Text(
                    "searching now🔎",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ))),
        ],
      );
  }
}