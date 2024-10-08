import 'package:adopt_pet/view/homePage.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(70.0),
            child: Row(
            ),
          ),
          // ------------------------------------------------- Email -------------------------------------------------------

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Email",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.email),
                  ),
                ),
              )),

          // ------------------------------------------------- Senha  -------------------------------------------------------
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Password",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.lock),
                  ),
                ),
              )),
          
          // ------------------------------------------------- Botão Criar -------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Login"),
                )),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text("Or continue with")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text("")),
              TextButton(
                onPressed: () {
                  // Ação ao clicar no botão
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/google.jpg',
                    ),
                    // Espaço entre a imagem e o texto
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Ação ao clicar no botão
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/facebook.png',
                    ),
                    // Espaço entre a imagem e o texto
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Ação ao clicar no botão
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/x.png',
                    ),
                    // Espaço entre a imagem e o texto
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
