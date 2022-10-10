import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Profile%20Edit/components/profile_edit_form.dart';
import 'package:studentapp/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello User!',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const ProfileEditForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
