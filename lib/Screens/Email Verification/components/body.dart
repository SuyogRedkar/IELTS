import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Email%20Verification/components/email_verify_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(209),
              ),
              Text(
                'Enter your Email ID',
                style: Theme.of(context).textTheme.headline1,
              ),
              spacer(10.0),
              Text(
                'We will send you a four digit code on this email ID.',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              spacer(29.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email ID',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
              spacer(8.0),
              const EmailVerifyForm()
            ],
          ),
        ),
      ),
    );
  }
}
