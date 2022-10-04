import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Register/components/body.dart';

class Register extends StatelessWidget {
  static String routeName = "/register";
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
