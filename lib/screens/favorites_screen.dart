import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;

  const FavoritesScreen({
    super.key,
    required this.favoriteProducts,
  });

  @override
  Widget build(BuildContext context) {
    if (favoriteProducts.isEmpty) {
      return const Center(
        child: Text(
          "No favorite products yet",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: favoriteProducts.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = favoriteProducts[index];

        return ProductCard(
          product: product,

          onFavoriteTap: () {},

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(
                  product: product,
                ),
              ),
            );
          },
        );
      },
    );
  }
}