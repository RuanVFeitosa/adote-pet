import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/4.png"),
                    const Column(children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_city),
                          Text(
                            'New York',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ]),
                    const Icon(Icons.edit),
                  ]),
            ),
          ),
          const Divider(),
          
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [Icon(Icons.pets), Text("Pet Care")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [Icon(Icons.pets), Text("Pet Resources")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [Icon(Icons.settings), Text("Settings")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [Icon(Icons.contact_support), Text("Contact Us")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [Icon(Icons.person), Text("About Us")],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [Icon(Icons.help), Text("Help")],
            ),
          ),
        ],
      ),
    );
  }
}
