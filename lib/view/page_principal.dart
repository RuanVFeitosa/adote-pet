import 'package:adopt_pet/view/homePage.dart';
import 'package:adopt_pet/widgets/profile.dart';
import 'package:flutter/material.dart';

class PagePrincipal extends StatelessWidget {
  const PagePrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group 65.png"),
              const Column(
                children: [
                  Text('Find your new friends',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  Text(
                      'Make your life more happy with us to have a little new friends',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
              Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/images/Group 74.png",
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  },
                  child: const Text("data"))
            ],
          ),
        ),
      ),
    );
  }
}
