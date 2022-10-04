import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Profile%20Edit/profile_edit.dart';
import 'package:studentapp/components/default_button.dart';
import 'package:studentapp/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spacer(100.0),
        DefaultButton(
          text: "SUBMIT",
          press: () {
            Navigator.pushNamed(context, ProfileEditScreen.routeName);
          },
        ),
      ],
    );
  }
}
