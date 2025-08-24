// ignore: depend_on_referenced_packages
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/widgets/offer_card_widget.dart';
import 'package:final_project/models/our_products.dart';
import 'package:final_project/widgets/product_card_widget.dart';
import 'package:final_project/widgets/protuct_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> offers = [
    {
      "title": "50% Off Bags",
      "subtitle": "Limited time offer on all bags",
      "action": "50% OFF",
    },
    {
      "title": "Free Shipping Weekend",
      "subtitle": "No delivery charges on orders above \$50",
      "action": "FREE SHIP",
    },
    {
      "title": "Buy 2 Get 1 Free",
      "subtitle": "On selected accessories and peripherals",
      "action": "B2G1",
    },
    {
      "title": "Student Discount",
      "subtitle": "Extra 20% off with valid student ID",
      "action": "20% OFF",
    },
    {
      "title": "Bundle Deals",
      "subtitle": "Save more when you buy complete setups",
      "action": "BUNDLE",
    },
  ];
  List<ProductCard> cards = [
    const ProductCard(
      image: 'assets/skirt.jpg',
      title: 'skirt',
      price: '\$100',
    ),
    const ProductCard(
      image: 'assets/long_dress.jpg',
      title: 'Long Dress',
      price: '\$150',
    ),
    const ProductCard(
      image: 'assets/backpack.jpg',
      title: 'backpack',
      price: '\$80',
    ),
    const ProductCard(
      image: 'assets/handbag.jpg',
      title: 'handbag',
      price: '\$50',
    ),
    const ProductCard(
      image: 'assets/lofer shoes.jpg',
      title: 'lofer shoes',
      price: '\$150',
    ),
    const ProductCard(
      image: 'assets/lace-up shoes.jpg',
      title: 'lace-up shoes',
      price: '\$200',
    ),
  ];
  get mediaQuery => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text(
          tr('Our_Products'),
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actionsIconTheme: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShowOurProducts(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    ProductCard product = cards[index];
                    return ShowProductCard(
                        context: context,
                        image: product.image,
                        productName: product.title,
                        productPrice: product.price);
                  }),
            ),
            Text(
              tr('offer'),
              style: const TextStyle(color: Colors.brown, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: offers.length,
              padding: const EdgeInsets.only(bottom: 10),
              itemBuilder: (BuildContext context, int index) {
                return ShowOfferCard(
                    context: context,
                    title: offers[index]['title']!,
                    subtitle: offers[index]['subtitle']!,
                    buttomText: offers[index]['action']!);
              },
            )
          ],
        ),
      ),
    );
  }
}
