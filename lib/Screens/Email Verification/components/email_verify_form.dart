import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Email%20Verification/components/email_otp_screen.dart';
import 'package:studentapp/components/default_button.dart';
import 'package:studentapp/size_config.dart';

import '../../../constants.dart';

class EmailVerifyForm extends StatefulWidget {
  const EmailVerifyForm({super.key});

  @override
  State<EmailVerifyForm> createState() => _EmailVerifyFormState();
}

class _EmailVerifyFormState extends State<EmailVerifyForm> {
  String? email;

  bool remember = false;

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(40.0),
              width: double.infinity,
              child: buildEmailFormField(),
            ),
            spacer(222.0),
            DefaultButton(
              text: 'SUBMIT',
              press: () {
                Navigator.pushNamed(context, EmailOtpScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your Email",
        hintStyle: Theme.of(context).textTheme.headline4,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }
}
