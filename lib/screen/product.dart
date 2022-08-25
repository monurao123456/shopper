import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppers/component/custom_button.dart';
import 'package:shoppers/component/items.dart';
import 'package:shoppers/utils/custom_theme.dart';

class ProductScreen extends StatefulWidget {
  final Items items;
  const ProductScreen({Key? key, required this.items}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  void onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });
    //add to cart
    setState(() {
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:items[0].image,
                        fit: BoxFit.cover,
                      ),
                      // child: CachedNetworkImage(
                      //     fit: BoxFit.cover,
                      //     imageUrl:
                      //         "https://th.bing.com/th/id/OIP.wp43rVrv093lAOrI7LghRgHaGJ?pid=ImgDet&rs=1"),
                    ),
                    Positioned(
                      top: 35,
                      right: 35,
                      child: Container(
                        decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: CustomTheme.yellow,
                            shadows: [
                              BoxShadow(
                                  color: CustomTheme.grey,
                                  blurRadius: 3,
                                  offset: Offset(1, 3))
                            ]),
                        child: IconButton(
                          icon: const Icon(Icons.share),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: const Text("Title"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: const [Text("MRP:"), Text("\$ Price:")],
                            ),
                          ),
                          CustomButton(
                            text: "Add to Cart",
                            onPress: onAddToCart,
                            loading: addButtonLoad,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "About the items",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "The item Description",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 30,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: CustomTheme.grey,
                      blurRadius: 3,
                      offset: Offset(1, 3))
                ],
              ),
              child: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
          ),
        ],
      )),
    );
  }
}
