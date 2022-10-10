import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Otp/otp.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../Register/register.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? contact;
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
    SizeConfig().init(context);
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildContactFormField(),
              SizedBox(
                height: getProportionateScreenHeight(180),
              ),
              RichText(
                  text: TextSpan(
                      text: "New User?",
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                    TextSpan(
                        text: "\tRegister",
                        style: const TextStyle(color: kPrimary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, Register.routeName);
                          })
                  ])),
              spacer(38.0),
              DefaultButton(
                text: "SUBMIT",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, Otp.routeName);
                  }
                },
              ),
            ],
          ),
        ));
  }

  TextFormField buildContactFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (value.length >= 10) {
          removeError(error: kShortcontactError);
        }
        contact = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kContactNullError);
          return "Enter Contact";
        } else if (value.length < 10) {
          addError(error: kShortcontactError);
          return "Invalid Contact";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your Number",
        hintStyle: Theme.of(context).textTheme.headline4,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }
}
