import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plan_app/models/models.dart';
import 'package:plan_app/screens/flower_page.dart';
import 'package:plan_app/screens/more_plants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Plants> list_recomended_plants = [
    Plants("img/r1.jpg", "Flower", 400),
    Plants("img/r2.jpg", "Flower", 250),
    Plants("img/r3.jpg", "Flower", 300),

  ];
  List<Plants> list_featured_plants = [
    Plants("img/f1.jpg", "Flower", 600),
    Plants("img/f2.jpg", "Flower", 550),
  ];

  int _curretIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 124, 29),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 25, 124, 29),
        onTap: (value) {
          setState(() {
            _curretIndex = value;
          });
        },
        currentIndex: _curretIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.spa_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "")
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 25, 124, 29),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    "Hi Uishopy!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              // onChanged: (value) => updateList(value),

              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide.none),
                hintText: "",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color.fromARGB(255, 25, 124, 29),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recomended",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MorePlants(
                                        list_plants: list_recomended_plants,
                                        height: 0.5,
                                        width: 0.4),
                                  ));
                            },
                            child: Container(
                              height: 30,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 25, 124, 29),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                "more",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    // color: Colors.yellow,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: ((context, index) => Divider()),
                      itemCount: list_recomended_plants.length,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlowerPage(
                                      plants: list_recomended_plants[index]),
                                ));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        list_recomended_plants[index]
                                            .plant_image_path),
                                    fit: BoxFit.fill),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 1), blurRadius: 10)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$${list_recomended_plants[index].plant_price}",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 25, 124, 29),
                                      ),
                                    ),
                                    Text(
                                      list_recomended_plants[index].plant_name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured Plants",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MorePlants(
                                      list_plants: list_featured_plants,
                                      height: 0.5,
                                      width: 0.7,
                                    ),
                                  ));
                            },
                            child: Container(
                              height: 30,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 25, 124, 29),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                "more",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    // color: Colors.amber,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: ((context, index) => Divider()),
                      itemCount: list_featured_plants.length,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlowerPage(
                                      plants: list_featured_plants[index]),
                                ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(list_featured_plants[index]
                                      .plant_image_path),
                                  fit: BoxFit.fill),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(offset: Offset(0, 1), blurRadius: 10)
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$${list_featured_plants[index].plant_price}",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 25, 124, 29),
                                    ),
                                  ),
                                  Text(
                                    list_featured_plants[index].plant_name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
