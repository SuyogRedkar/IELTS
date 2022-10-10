import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/Screens/SignUp/signup.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../Otp/otp.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? fname;
  String? lname;
  String? contact;
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
    SizeConfig().init(context);
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Name',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              spacer(8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(154),
                    child: buildFnameFormField(),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(154),
                    child: buildLnameFormField(),
                  )
                ],
              ),
              spacer(8.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Contact Number',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(328),
                child: buildContactFormField(),
              ),
              spacer(16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(328),
                child: buildEmailFormField(),
              ),
              spacer(34.0),
              RichText(
                  text: TextSpan(
                      text: "Already an existing user?",
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                    TextSpan(
                      text: "\tLog In",
                      style: const TextStyle(color: kPrimary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                    )
                  ])),
              spacer(25.0),
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

  TextFormField buildFnameFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        fname = value;
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
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: "First Name",
        hintStyle: Theme.of(context).textTheme.headline4,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildLnameFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        fname = value;
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
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: "Last Name",
        hintStyle: Theme.of(context).textTheme.headline4,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
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
