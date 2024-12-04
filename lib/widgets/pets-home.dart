import 'package:flutter/material.dart';

class PetsHome extends StatelessWidget {
  final String name;
  final List<dynamic> images;

  const PetsHome({super.key, required this.name, required this.images});

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
          border: Border.all(color: const Color.fromARGB(130, 115, 104, 253)),
        ),
        child: Column(
          children: [
            // Validação de imagem com fallback para erro
            images.isNotEmpty && images[0] is String && images[0].isNotEmpty
                ? Image.network(
                    images[0],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 100,
                      );
                    },
                  )
                : const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 100,
                  ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
