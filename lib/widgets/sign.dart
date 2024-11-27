import 'dart:convert';

import 'package:adopt_pet/view/homePage.dart';
import 'package:adopt_pet/widgets/login.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => SignState();
}

class SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void _getData() async {
      var client = http.Client();
      var url = 'https://pet-adopt-dq32j.ondigitalocean.app/user/register';

      var data = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': passwordController.text,
        'confirmpassword': confirmPasswordController.text
      };

      var response = await client.post(Uri.parse(url),
          body: json.encode(data), 
          headers: {'Content-Type': 'application/json'});
      print(response.body);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        // Adicionando SingleChildScrollView aqui
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                children: [],
              ),
            ),
            // ------------------------------------------------- Email -------------------------------------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.person),
                  ),
                ),
              ),
            ),
            // ------------------------------------------------- Email -------------------------------------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.email),
                  ),
                ),
              ),
            ),
            // ------------------------------------------------- Email -------------------------------------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.phone),
                  ),
                ),
              ),
            ),

            // ------------------------------------------------- Senha  -------------------------------------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.lock),
                  ),
                ),
              ),
            ),

            // ------------------------------------------------- Senha Confirmar -------------------------------------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Confirme Password",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(Icons.lock),
                  ),
                ),
              ),
            ),

            // ------------------------------------------------- Botão Criar -------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                 _getData();
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Create An Account"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      elevation: WidgetStatePropertyAll(0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
