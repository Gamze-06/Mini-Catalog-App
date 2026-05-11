import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartScreen extends StatefulWidget {

  final List<Product> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartScreen> createState() =>
      _CartScreenState();
}

class _CartScreenState
    extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        title: const Text(
          "Cart",
        ),

        backgroundColor:
            Colors.white,

        elevation: 0,
      ),

      body: widget.cartItems.isEmpty

          ? Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Icon(

                    Icons.shopping_cart_outlined,

                    size: 70,

                    color: Colors.grey.shade400,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Text(

                    "Your cart is empty",

                    style: TextStyle(

                      color:
                          Colors.grey.shade700,

                      fontSize: 16,

                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(

                    "Add items to start shopping",

                    style: TextStyle(

                      color:
                          Colors.grey.shade400,

                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )

          : ListView.builder(

              itemCount:
                  widget.cartItems.length,

              itemBuilder:
                  (context, index) {

                final product =
                    widget.cartItems[index];

                return Container(

                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),

                  padding:
                      const EdgeInsets.all(10),

                  decoration:
                      BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                            20),

                    boxShadow: [

                      BoxShadow(

                        color: Colors.black
                            .withOpacity(0.05),

                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Row(

                    children: [

                      Image.network(

                        product.image,

                        width: 70,
                        height: 70,
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Text(

                              product.title,

                              maxLines: 2,

                              overflow:
                                  TextOverflow
                                      .ellipsis,

                              style:
                                  const TextStyle(

                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                              height: 5,
                            ),

                            Text(

                              "\$${product.price}",

                              style:
                                  const TextStyle(

                                color: Colors
                                    .deepPurple,

                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(

                        onPressed: () {

                          setState(() {

                            widget.cartItems
                                .removeAt(
                                    index);
                          });
                        },

                        icon: const Icon(

                          Icons
                              .remove_circle_outline,

                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}