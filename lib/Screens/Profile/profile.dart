import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Profile/components/profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profilescreen";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
