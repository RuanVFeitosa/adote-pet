import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
        "description": "Um companheiro fiel"
      },
      {
        "image": "assets/images/Gato2.jpg",
        "title": "Tartaruga",
        "description": "Uma tartaruga tranquila"
      },
      {
        "image": "assets/images/Hams.png",
        "title": "Hamster",
        "description": "Um pequeno roedor",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.notifications),
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 50,
          )
        ],
      ),
      body: Column(
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
            Image.asset(
              "assets/images/Frame 33.png",
              width: 500,
              fit: BoxFit.cover,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/Frame 35.png"),
                  Image.asset("assets/images/Dog.png"),
                  Image.asset("assets/images/Turtle.png"),
                  Image.asset("assets/images/Hams.png"),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 340.0),
              items: minhaImagens.map((item) {
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
                              item["description"]!,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              item["location"] ??
                                  "", // Provide a default value if item["location"] is null
                              style: const TextStyle(fontSize: 16.0),
                            ),
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
