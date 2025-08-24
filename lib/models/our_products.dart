import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShowOurProducts extends StatefulWidget {
  const ShowOurProducts({super.key});

  @override
  State<ShowOurProducts> createState() => _ShowOurProductsState();
}

class _ShowOurProductsState extends State<ShowOurProducts> {
  List<Map<String, String>> products = [
    {
      "title": "Bags",
      "image": "assets/Bags.jpg"
    },
    {
      "title": "clothes",
      "image": "assets/clothes.jpg"
    },
    {
      "title": "shoses",
      "image": "assets/shoses.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          width: 300,
          height: 200,
          child: PageView(
            children: products.map((product) {
              return Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tr(product["title"]!),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(), 
          ),
        ),
      ),
    );
  }
}
