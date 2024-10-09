import 'package:flutter/material.dart';

class AddPet extends StatelessWidget {
  const AddPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet'),
      ),
      body: Column(
        children: [
          // ------------------------------------------------- Email -------------------------------------------------------
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Name',
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.text_fields),
                  ),
                ),
              )),

          // ------------------------------------------------- Senha  -------------------------------------------------------
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Age',
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.calendar_today),
                  ),
                ),
              )),

          // ------------------------------------------------- Senha Confirmar -------------------------------------------------------
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Weight',
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.monitor_weight),
                  ),
                ),
              )),

          // ------------------------------------------------- Botão Criar -------------------------------------------------------
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Sex',
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.pets),
                  ),
                ),
              )),

          // ------------------------------------------------- Botão Criar -------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Homepage()),
                  // );
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Add Pet"),
                )),
          ),
        ],
      ),
    );
  }
}
