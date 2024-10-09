import 'package:adopt_pet/widgets/add_pet.dart'; // Verifique se AddPet está implementado
import 'package:adopt_pet/widgets/favorites.dart';
import 'package:adopt_pet/widgets/profile.dart';
import 'package:adopt_pet/widgets/show_info.dart';
import 'package:adopt_pet/widgets/sign.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  List<Map<String, String>> minhaImagens = [
    {
      "image": "assets/images/Gato.png",
      "title": "Gato",
      "description": "Um amigo felino",
      "location": "São Paulo, 20km"
    },
    {
      "image": "assets/images/cachorro1.png",
      "title": "Cachorro",
      "description": "Um companheiro fiel",
      "location": "São Paulo, 30km"
    },
  ];

  late List<Map<String, String>> currentCarouselItems;

  bool _isGatoSelected = false;
  bool _isCachorroSelected = false;

  @override
  void initState() {
    super.initState();
    currentCarouselItems = [
      minhaImagens[0]
    ]; // Inicializa com a lista do primeiro animal
  }

  void updateCarousel(String animal) {
    setState(() {
      currentCarouselItems =
          minhaImagens.where((item) => item["title"] == animal).toList();
    });
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
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isGatoSelected = !_isGatoSelected;
                          _isCachorroSelected = false;
                        });
                        updateCarousel("Gato");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _isGatoSelected
                              ? const Color.fromARGB(130, 115, 104, 253)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/images/icon_cat.png",
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isCachorroSelected = !_isCachorroSelected;
                          _isGatoSelected = false;
                        });
                        updateCarousel("Cachorro");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _isCachorroSelected
                              ? const Color.fromARGB(130, 115, 104, 253)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/icon_dog.png",
                            width: 30, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                )),
            CarouselSlider(
              options: CarouselOptions(height: 340.0),
              items: currentCarouselItems.map((item) {
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
                            child: Image.asset(
                              item["image"]!,
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item["title"]!,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(Icons.male),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              item["location"] ?? "",
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                          // Adicione o botão aqui
                          ElevatedButton(
                            child: const Text("Ver mais"),
                            onPressed: () {
                              // Navegue para a página desejada aqui
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ShowInfo()),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            )
          ])
        ],
      ),
    );
  }
}
