import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/components/default_button.dart';
import 'package:studentapp/constants.dart';
import '../../../size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(54),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(54),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);
                  },
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(54),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value, pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(54),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          spacer(169.65),
          RichText(
            text: TextSpan(
              text: "Haven’t recieved OTP?",
              style: Theme.of(context).textTheme.headline3,
              children: [
                TextSpan(
                    text: "\t RESEND OTP",
                    style: const TextStyle(color: kPrimary),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ],
            ),
          ),
          spacer(24.79),
          DefaultButton(
            text: "SUBMIT",
            press: () {
             // Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
        ]),
      ),
    );
  }
}
