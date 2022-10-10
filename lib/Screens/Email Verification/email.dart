import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Email%20Verification/components/body.dart';

class EmailVerification extends StatelessWidget {
  static String routeName = "/EmailVerification";
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
