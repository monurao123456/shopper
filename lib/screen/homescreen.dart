// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppers/component/grid_card.dart';
import 'package:shoppers/component/items.dart';
import 'package:shoppers/screen/product.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
// ignore: implementation_imports

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future loadData() async {
    final productjson =
        await rootBundle.loadString("assets/jsonfile/product.json");

    Map<String, dynamic> userMap = jsonDecode(productjson);

    //  ProductModel.item = List.from(productData)
    //       .map<Items>((Items) => Items.fromMap(Items))
    //       .toList();
    //   setState(() {});

    var user = Items.fromJson(userMap);
// print('Howdy, ${user.id}!');
// print('We sent the verification link to ${user.description}.');
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: GridView.builder(
        itemCount: ProductModel.item.length,
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
        itemBuilder: (context, index) {
          return GridCard(
           
            index: index,
            items: ProductModel.item[index],
          );
        },
      ),
    );
  }
}
