import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers/component/custom_button.dart';
import 'package:shoppers/component/custum_text_input.dart';
import 'package:shoppers/utils/application_state.dart';
import 'package:shoppers/utils/custom_theme.dart';
import 'package:shoppers/utils/login_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loadingButton = false;
  Map<String, String> data = {};
  _LoginScreenState() {
    data = LoginData.signIn;
  }
  // ignore: non_constant_identifier_names
  void SwitchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.signUp)) {
        data = LoginData.signIn;
      } else {
        data = LoginData.signUp;
      }
    });
  }

  loginError(e) {
    if (e.message != '') {
      setState(() {
        _loadingButton = false;
      });
    }
  }

  void loginButtonPressed() {
    setState(() {
      _loadingButton = true;
    });
    ApplicationState applicationState = Provider.of(context, listen: false);
    if (mapEquals(data, LoginData.signUp)) {
      applicationState.signUp(
          _emailcontroller.text, _passwordController.text, loginError);
    } else {
      applicationState.signIn(
          _emailcontroller.text, _passwordController.text, loginError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      data['heading'] as String,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Text(
                    data['subheading'] as String,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            model(data, _emailcontroller, _passwordController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: TextButton(
                      onPressed: SwitchLogin,
                      child: Text(
                        data['footer'] as String,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  model(Map<String, String> data, TextEditingController emailcontroller,
      TextEditingController passwordcontroller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20, left: 30, bottom: 56),
      decoration: CustomTheme.getcardDecoration(),
      child: Column(
        children: [
          CustomTextInput(
              label: "your email address",
              icon: Icons.email,
              placeholder: "email@address.com",
              textEditingController: _emailcontroller),
          CustomTextInput(
              label: "password",
              icon: Icons.lock_outline,
              password: true,
              placeholder: "password",
              textEditingController: _passwordController),
          CustomButton(
              text: data['lable'] as String,
              onPress: loginButtonPressed,
              loading: _loadingButton),
        ],
      ),
    );
  }
}
