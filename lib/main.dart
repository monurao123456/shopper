// ignore_for_file: unnecessary_const

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shoppers/screen/checkout.dart';
import 'package:shoppers/screen/homescreen.dart';
import 'package:shoppers/screen/login.dart';
import 'package:shoppers/screen/profile.dart';
import 'package:shoppers/utils/application_state.dart';
import 'package:shoppers/utils/custom_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // stripe setup
  final String response =
      await rootBundle.loadString("assets/config/stripe.json");
  final data = await jsonDecode(response);
  Stripe.publishableKey = data["publishableKey"];

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => Consumer<ApplicationState>(
        builder: (context, applicationState, _) {
          Widget child;
          switch (applicationState.loginState) {
            case ApplicaationLoginState.loggedOut:
              child = const LoginScreen();

              break;
            case ApplicaationLoginState.loogedIn:
              child = const MyApp();

              break;

            default:
              child = const LoginScreen();
          }
          return MaterialApp(
            theme: CustomTheme.getTheme(),
            home: child,
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("shoppers"),
            centerTitle: true,
          ),
          bottomNavigationBar: Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: CustomTheme.cardShadow,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: const TabBar(tabs: [
              Tab(
                icon: const Icon(Icons.home),
              ),
              Tab(
                icon: const Icon(Icons.person),
              ),
              Tab(
                  icon: const Icon(
                Icons.shopping_cart,
              )),
            ]),
          ),
          body: const TabBarView(children: [
            const HomeScreen(),
            const ProfileScreen(),
            const CheckoutScreen()
          ]),
        ));
  }
}
