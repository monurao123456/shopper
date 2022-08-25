import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppers/component/items.dart';
import 'package:shoppers/utils/custom_theme.dart';

import '../screen/product.dart';

class GridCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final int index;
  final Items items;

  const GridCard({Key? key, required this.index, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    onCardPess() {
      Navigator.push(context,MaterialPageRoute(builder:(context) => ProductScreen(items: items),));
    }

    return Container(
      margin: index % 2 == 0
          ? const EdgeInsets.only(left: 22)
          : const EdgeInsets.only(right: 22),
      // ignore: prefer_const_constructors
      decoration: CustomTheme.getcardDecoration(),
      child: GestureDetector(
        onTap: onCardPess,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Column(children: [
            Expanded(
                flex: 7,
                child: SizedBox(
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: items.image,
                      fit: BoxFit.cover,
                    ))),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        "title",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Text(
                      "price",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
