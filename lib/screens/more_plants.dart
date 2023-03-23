import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plan_app/models/models.dart';

import 'flower_page.dart';

class MorePlants extends StatefulWidget {
  final double height;
  final double width;
  final List<Plants> list_plants;
  const MorePlants(
      {super.key,
      required this.list_plants,
      required this.height,
      required this.width});

  @override
  State<MorePlants> createState() => _MorePlantsState();
}

class _MorePlantsState extends State<MorePlants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 124, 29),
        elevation: 0,
      ),
      body: ListView.builder(
        
        itemCount: widget.list_plants.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FlowerPage(plants: widget.list_plants[index]),
                      ));
                },
                child: Container(
                  
                    width: MediaQuery.of(context).size.width *widget.width,
                    height:MediaQuery.of(context).size.width * widget.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.list_plants[index].plant_image_path),
                          fit: BoxFit.fill),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            "\$${widget.list_plants[index].plant_price}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 25, 124, 29),
                            ),
                          ),
                          Text(
                            widget.list_plants[index].plant_name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
