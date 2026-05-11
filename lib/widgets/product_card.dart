import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(22),

          boxShadow: [

            BoxShadow(

              color:
                  Colors.black.withOpacity(
                      0.12),

              blurRadius: 25,

              spreadRadius: 3,

              offset: const Offset(0, 12),
            ),

            BoxShadow(

              color:
                  Colors.grey.withOpacity(
                      0.08),

              blurRadius: 8,

              spreadRadius: 1,

              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Padding(

          padding:
              const EdgeInsets.all(12),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Expanded(

                child: Center(

                  child: Image.network(

                    product.image,

                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Text(

                product.title,

                maxLines: 2,

                overflow:
                    TextOverflow.ellipsis,

                style: const TextStyle(

                  fontWeight:
                      FontWeight.bold,

                  fontSize: 14,

                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(

                  color:
                      Colors.deepPurple.shade50,

                  borderRadius:
                      BorderRadius.circular(
                          20),
                ),

                child: Text(

                  "\$${product.price}",

                  style: const TextStyle(

                    color:
                        Colors.deepPurple,

                    fontWeight:
                        FontWeight.bold,

                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}