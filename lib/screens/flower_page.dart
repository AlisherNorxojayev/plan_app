import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plan_app/models/models.dart';

class FlowerPage extends StatefulWidget {
  final Plants plants;
  const FlowerPage({super.key, required this.plants});

  @override
  State<FlowerPage> createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 124, 29),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.plants.plant_image_path))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
            widget.plants.plant_name,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            "\$${widget.plants.plant_price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 25, 124, 29),
            ),
          ),],
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            color: Color.fromARGB(255, 25, 124, 29),
            alignment: Alignment.center,
            child: Text("Buy now"),
          )
        ],
      ),
    );
  }
}
