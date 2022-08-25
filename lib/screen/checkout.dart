// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppers/component/custom_button.dart';
import 'package:shoppers/component/list_cart.dart';
import 'package:shoppers/utils/custom_theme.dart';
// ignore: implementation_imports

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // ignore: override_on_non_overriding_member
  final cart = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemCount: cart.length,
            itemBuilder: (context, index) {
              return const ListCart();
            },
          ),
          pricefooter(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: CustomButton(
              text: "CHECKOUT",
              onPress: () {},
              loading: false,
            ),
          ),
        ],
      ),
    );
  }

  pricefooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [
        const Divider(
          height: 2,
          color: CustomTheme.grey,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                "Total:",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              Text(
                "\$ Price",
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
