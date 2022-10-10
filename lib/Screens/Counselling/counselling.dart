import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Counselling/components/body.dart';

class CounsellingScreen extends StatelessWidget {
  static String routeName = "/CounsellingScreen";
  const CounsellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
