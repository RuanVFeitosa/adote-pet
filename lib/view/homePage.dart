import 'package:adopt_pet/widgets/add_pet.dart';
import 'package:adopt_pet/widgets/favorites.dart';
import 'package:adopt_pet/widgets/profile.dart';
import 'package:adopt_pet/widgets/show_info.dart';
import 'package:adopt_pet/widgets/sign.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(),
    const AddPet(),
    const Text(
      'Index 2: All Pets',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_sharp),
            label: 'All Pets',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(130, 115, 104, 253),
        onTap: _onItemTapped,
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
  List<Map<String, String>> pets = [];
  bool isLoading = true;
  bool hasFetched = false; // Flag para verificar se já foi carregado

  @override
  void initState() {
    super.initState();
    if (!hasFetched) {
      fetchPets();
    }
  }

  Future<void> fetchPets() async {
    var client = http.Client();
    var url = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      var response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        setState(() {
          pets = List<Map<String, String>>.from(
            jsonResponse.map((item) => {
                  "image": item["imageUrl"] ?? "",
                  "title": item["name"] ?? "",
                  "description": item["description"] ?? "",
                  "location": item["location"] ?? "",
                }),
          );
          isLoading = false;
          hasFetched = true; // Marque como carregado
        });
      } else {
        print("Erro: Código de status não 200: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao buscar pets: $e");
    } finally {
      client.close();
    }
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
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CarouselSlider(
                  options: CarouselOptions(height: 340.0),
                  items: pets.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15.0)),
                                child: Image.network(
                                  item["image"]!,
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item["title"]!,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(Icons.pets),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Text(
                                  item["location"]!,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                              ElevatedButton(
                                child: const Text("Ver mais"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShowInfo(
                                        petDetails: item,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
