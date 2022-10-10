import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Profile%20Edit/components/body.dart';

class ProfileEditScreen extends StatelessWidget {
  static String routeName = "/profile_edit";
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
      ),
      body: const Body(),
    );
  }
}
