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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/Gato.png",
                  height: 100,
                ),
                const SizedBox(width: 10), // Espaçamento entre imagem e texto
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gato',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4), // Espaçamento entre Nome e Sexo
                    Text(
                      'Sexo: Masculino',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4), // Espaçamento entre Sexo e Localização
                    Text(
                      'Localização: São Paulo, SP',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8), // Espaçamento vertical
            const Text(
              'Description: Um amigo felino muito fofinho, adote ele',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20), // Espaçamento antes do Divider
            const Divider(
              height: 40,
              thickness: 2,
              color: Color.fromARGB(255, 255, 187, 0),
            ),
          ],
        ),
      ),
    );
  }
}
