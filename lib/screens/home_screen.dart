import 'package:flutter/material.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      title: "Laptop",
      price: 15000,
      description: "Yüksek performanslı laptop",
      image: "assets/images/laptop.png",
    ),
    Product(
      id: 2,
      title: "Telefon",
      price: 8000,
      description: "Yeni nesil akıllı telefon",
      image: "assets/images/phone.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Katalog"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: product,
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(product.image, height: 80),
                  const SizedBox(height: 10),
                  Text(product.title),
                  Text("${product.price} ₺"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}