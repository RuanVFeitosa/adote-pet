import 'dart:convert';

import 'package:adopt_pet/widgets/add_pet.dart'; // Verifique se AddPet está implementado
import 'package:adopt_pet/widgets/favorites.dart';
import 'package:adopt_pet/widgets/pets-home.dart';
import 'package:adopt_pet/widgets/profile.dart';
import 'package:adopt_pet/widgets/show_info.dart';
import 'package:adopt_pet/widgets/sign.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  // Atualize a lista de widgets para incluir AddPet e AllPets
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(),
    const AddPet(), // Página de Adicionar Pets
    const Text(
      'Index 2: All Pets', // Adicione a página de Todos os Pets aqui
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualize o índice selecionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.notifications),
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Favorites()),
                  );
                },
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 50,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Label correta para o item Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Pets', // Label correta para o item Add Pets
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_sharp),
            label: 'All Pets', // Label correta para o item All Pets
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(130, 115, 104, 253),
        onTap: _onItemTapped, // Chama a função para mudar de página
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Map<String, dynamic>> pets = [];

  void getPets() async {
    var client = http.Client();
    var url = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      var response = await client.get(Uri.parse(url));
      var responseData = jsonDecode(response.body);

      print(responseData['pets']);

      for (var element in responseData['pets']) {
        setState(() {
          pets.add(element);
        });
        print(pets.length);
      }
    } finally {
      client.close();
    }
  }

  void initState() {
    getPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                suffixIcon: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(130, 115, 104, 253),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: const Icon(Icons.search_outlined),
                ),
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sign()),
                );
              },
              child: Image.asset(
                "assets/images/Frame 33.png",
                width: 370,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pet Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    "More Categories",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(130, 115, 104, 253)),
                  ),
                ],
              ),
            ),
            Container(
              
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pets.length, //qtd de produtos
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                 
                  List<dynamic> images = pets[index]['images'];

                  return pets_home(name: pets[index]['name'], images: images);
                },
              ),
            ),
          ])
        ],
      ),
    );
  }
}
