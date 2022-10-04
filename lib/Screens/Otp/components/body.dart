import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Otp/components/otp_form.dart';
import 'package:studentapp/constants.dart';
import 'package:studentapp/size_config.dart';

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
                'OTP Verification',
                style: Theme.of(context).textTheme.headline1,
              ),
              spacer(10.0),
              Text(
                'Enter the OTP sent on your Mobile number',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              spacer(51.0),
              const OtpForm()
            ],
          ),
        ),
      ),
    );
  }
}
