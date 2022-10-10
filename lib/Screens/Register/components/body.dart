import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Register/components/register_form.dart';
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
              horizontal: getProportionateScreenWidth(16),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(209),
                ),
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  'We will send you an One Time Password on this \nmobile number.',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
