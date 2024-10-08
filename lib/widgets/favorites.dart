import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/Gato.png",height: 100,),
                    const Text('Gato'),
                  ],
                ),
                const Row(
                  children: [
                    Text('Description: Um amigo felino muito fofinho, adote ele'),
                  ],
                ),
                const Row(
                  children: [
                    Text(""),
                  ],
                ),
                const Row(
                  children: [
                    Text(""),
                  ],
                ),
                const Divider(
                  height: 40,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Color.fromARGB(255, 255, 187, 0),
                ),
              ],
            ),
      )
    );
  }
}