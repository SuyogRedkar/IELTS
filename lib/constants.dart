import 'package:flutter/material.dart';
import 'size_config.dart';

// Constant Colors
const kAccent = Color.fromARGB(255, 39, 50, 72);
const kBase = Color.fromARGB(255, 255, 255, 255);
const kPrimary = Color.fromARGB(255, 252, 118, 67);
const kSecondary = Color.fromARGB(255, 195, 220, 90);
const kTertiary = Color.fromARGB(255, 255, 219, 207);
const kWarning = Color.fromARGB(255, 186, 26, 26);
const kOutline = Color.fromARGB(255, 133, 115, 109);
const kPrimaryAlt = Color.fromARGB(255, 137, 167, 12);
const kTertiary2 = Color.fromARGB(255, 245, 249, 228);

// Form Error
final RegExp nameValidatorRegExp = RegExp(r"[a-zA-Z]+\\.?");
const String kNameError = "Enter Correct Name";
const String kContactError = "Enter Correct Number";
const String kShortcontactError = "Number is too short";
const String kContactNullError = "Please Enter your Number";
const String kEmailError = "Enter Correct Email";
const String kEmailNullError = "Please Enter your Number";
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kInvalidEmailError = "Please Enter Valid Email";

spacer(height) {
  return SizedBox(
    height: getProportionateScreenHeight(height),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: const OutlineInputBorder(
    borderSide: BorderSide(
      color: kTertiary,
      width: 1,
    ),
  ),
);

OutlineInputBorder outlineInputBorder(width) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(width)),
    borderSide: const BorderSide(color: kSecondary),
  );
}

final dropdownInputDecoration = BoxDecoration(
  color: kBase, //background color of dropdown button
  border: Border.all(color: kSecondary, width: 1), //border of dropdown button
  borderRadius: BorderRadius.circular(4),
);
