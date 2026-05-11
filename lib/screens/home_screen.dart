import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  late Future<List<Product>> products;

  List<Product> allProducts = [];
  List<Product> filteredProducts = [];

  List<Product> cartItems = [];

  @override
  void initState() {
    super.initState();

    products = ApiService.fetchProducts();

    products.then((value) {
      setState(() {
        allProducts = value;
        filteredProducts = value;
      });
    });
  }

  void searchProducts(String query) {

    final results =
        allProducts.where((product) {

      return product.title
          .toLowerCase()
          .contains(
            query.toLowerCase(),
          );

    }).toList();

    setState(() {
      filteredProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child:
            FutureBuilder<List<Product>>(

          future: products,

          builder:
              (context, snapshot) {

            if (snapshot.hasData) {

              return Column(

                children: [

                  const SizedBox(
                    height: 10,
                  ),

                  Padding(

                    padding:
                        const EdgeInsets
                            .symmetric(
                      horizontal: 15,
                    ),

                    child: Row(

                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [

                        const Column(

                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Text(
                              "Discover",

                              style:
                                  TextStyle(
                                fontSize: 32,

                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            Text(
                              "Find your perfect product",

                              style:
                                  TextStyle(
                                color:
                                    Colors
                                        .grey,
                              ),
                            ),
                          ],
                        ),

                        GestureDetector(

                          onTap: () async {

                            await Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder:
                                    (_) =>
                                        CartScreen(
                                  cartItems:
                                      cartItems,
                                ),
                              ),
                            );

                            setState(() {});
                          },

                          child: Container(

                            padding:
                                const EdgeInsets
                                    .all(10),

                            decoration:
                                BoxDecoration(

                              color:
                                  Colors.grey
                                      .shade100,

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15),
                            ),

                            child: Stack(

                              children: [

                                const Icon(
                                  Icons
                                      .shopping_bag_outlined,
                                ),

                                if (cartItems
                                    .isNotEmpty)

                                  Positioned(

                                    right: 0,
                                    top: 0,

                                    child:
                                        Container(

                                      width: 10,
                                      height: 10,

                                      decoration:
                                          const BoxDecoration(
                                        color:
                                            Colors.red,

                                        shape:
                                            BoxShape.circle,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(

                    margin:
                        const EdgeInsets
                            .all(15),

                    height: 90,

                    width:
                        double.infinity,

                    decoration:
                        BoxDecoration(

                      borderRadius:
                          BorderRadius
                              .circular(
                                  20),

                      image:
                          const DecorationImage(

                        image:
                            NetworkImage(
                          'https://wantapi.com/assets/banner.png',
                        ),

                        fit:
                            BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(

                    padding:
                        const EdgeInsets
                            .symmetric(
                      horizontal: 15,
                    ),

                    child: TextField(

                      onChanged:
                          searchProducts,

                      decoration:
                          InputDecoration(

                        hintText:
                            "Search products...",

                        prefixIcon:
                            const Icon(
                          Icons.search,
                        ),

                        filled: true,

                        fillColor:
                            Colors.grey
                                .shade100,

                        border:
                            OutlineInputBorder(

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      15),

                          borderSide:
                              BorderSide
                                  .none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Expanded(

                    child:
                        GridView.builder(

                      physics:
                          const BouncingScrollPhysics(),

                      padding:
                          const EdgeInsets
                              .all(10),

                      itemCount:
                          filteredProducts
                              .length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(

                        crossAxisCount:
                            2,

                        crossAxisSpacing:
                            10,

                        mainAxisSpacing:
                            10,

                        childAspectRatio:
                            0.72,
                      ),

                      itemBuilder:
                          (context, index) {

                        final product =
                            filteredProducts[
                                index];

                        return ProductCard(

                          product:
                              product,

                          onFavoriteTap:
                              () {},

                          onTap: () async {

                            final result =
                                await Navigator
                                    .push(

                              context,

                              MaterialPageRoute(

                                builder:
                                    (_) =>
                                        DetailScreen(
                                  product:
                                      product,
                                ),
                              ),
                            );

                            if (result ==
                                true) {

                              setState(() {

                                cartItems.add(
                                    product);
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            if (snapshot.hasError) {

              return const Center(
                child: Text(
                  "Bir hata oluştu",
                ),
              );
            }

            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}