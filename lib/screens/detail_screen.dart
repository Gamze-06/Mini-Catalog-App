import 'package:flutter/material.dart';
import '../models/product_model.dart';

class DetailScreen extends StatelessWidget {

  final Product product;

  const DetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor:
            Colors.white,

        elevation: 0,

        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),

        title: const Text(

          "Product Detail",

          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(20),

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

            const SizedBox(height: 20),

            Text(

              product.title,

              style: const TextStyle(

                fontSize: 24,

                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(

              "\$${product.price}",

              style: const TextStyle(

                fontSize: 22,

                color: Colors.deepPurple,

                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(

              "Description",

              style: TextStyle(

                fontSize: 18,

                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(

              product.description,

              maxLines: 4,

              overflow:
                  TextOverflow.ellipsis,

              style: const TextStyle(

                fontSize: 16,

                color: Colors.black87,

                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  Navigator.pop(
                    context,
                    true,
                  );
                },

                style:
                    ElevatedButton.styleFrom(

                  backgroundColor:
                      Colors.deepPurple,

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(
                            15),
                  ),
                ),

                child: const Text(

                  "Add to Cart",

                  style: TextStyle(

                    fontSize: 18,

                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}