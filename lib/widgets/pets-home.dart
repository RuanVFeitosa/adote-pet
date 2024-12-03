import 'package:flutter/material.dart';

class pets_home extends StatelessWidget {

  final String name;
  final List<dynamic> images;
  const pets_home({
    super.key,
    required this.name,
    required this.images
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 125,
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: const Color.fromARGB(130, 115, 104, 253)
          )
        ),
        child: Column(
        
        children: [
          Image.network(images[0], width: 100, height: 100, fit: BoxFit.cover,),
          Text(name),
        ],
      )),
    );
  }
}
