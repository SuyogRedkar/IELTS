import 'package:flutter/material.dart';
import 'package:studentapp/Screens/SignUp/components/sign_up_form.dart';
import 'package:studentapp/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
          ),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(210),
              ),
              Text(
                'Sign In',
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
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(12),
                    bottom: getProportionateScreenHeight(8)),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Contact Number',
                      style: Theme.of(context).textTheme.headline3,
                    )),
              ),
              const SignUpForm()
            ],
          ),
        ),
      )),
    );
  }
}
