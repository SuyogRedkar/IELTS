import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Otp/components/body.dart';

class Otp extends StatelessWidget {
  static String routeName = "/otp";
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
