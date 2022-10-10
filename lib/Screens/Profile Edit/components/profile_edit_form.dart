import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentapp/Screens/Email%20Verification/email.dart';
import 'package:studentapp/components/default_button.dart';
import 'package:studentapp/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../size_config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProfileEditForm extends StatefulWidget {
  const ProfileEditForm({super.key});

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final _formKey = GlobalKey<FormState>();
  String? fname;
  String? lname;
  String? contact;
  String? email;
  String? dob;
  bool remember = false;
  final List<String> items = [
    'Married',
    'Unmarried',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                thickness: 1,
                color: kSecondary,
              ),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  final List<String> module = [
    'General',
    'Academic',
  ];
  String? selectedModule;

  List<DropdownMenuItem<String>> _addDividersAfterModules(List<String> module) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in module) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != module.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                thickness: 1,
                color: kSecondary,
              ),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomModuleHeights() {
    List<double> _moduleHeights = [];
    for (var i = 0; i < (module.length * 2) - 1; i++) {
      if (i.isEven) {
        _moduleHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _moduleHeights.add(4);
      }
    }
    return _moduleHeights;
  }

  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu & Kashmir',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Orissa',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Tripura',
    'Uttar Pradesh',
    'West Bengal',
    'Chhattisgarh',
    'Uttarakhand',
    'Jharkhand',
    'Telangana',
  ];
  String? selectedStates;

  List<DropdownMenuItem<String>> _addDividersAfterState(List<String> states) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in states) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != states.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                thickness: 1,
                color: kSecondary,
              ),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomStatesHeights() {
    List<double> _stateHeights = [];
    for (var i = 0; i < (states.length * 2) - 1; i++) {
      if (i.isEven) {
        _stateHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _stateHeights.add(4);
      }
    }
    return _stateHeights;
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Information',
                style: Theme.of(context).textTheme.headline2,
              ),
              spacer(17.0),
              RichText(
                  text: TextSpan(
                      text: "Your Name",
                      style: Theme.of(context).textTheme.headline3,
                      children: const [
                    TextSpan(
                      text: "\t*",
                      style: TextStyle(color: kPrimary),
                    )
                  ])),
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
              spacer(17.0),
              Row(
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Date of Birth",
                          style: Theme.of(context).textTheme.headline3,
                          children: const [
                        TextSpan(
                          text: "\t*",
                          style: TextStyle(color: kPrimary),
                        )
                      ])),
                  SizedBox(
                    width: getProportionateScreenWidth(80),
                  ),
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
              spacer(8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenWidth(154),
                      child: buildDOBFormField()),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenWidth(154),
                      child: DecoratedBox(
                        decoration: dropdownInputDecoration,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, top: 11.5, bottom: 11.5),
                              child: Text(
                                'Gender',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            items: _addDividersAfterItems(items),
                            customItemsHeights: _getCustomItemsHeights(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 40,
                            dropdownMaxHeight: 200,
                            buttonWidth: 140,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              spacer(17.0),
              RichText(
                  text: TextSpan(
                      text: "Module",
                      style: Theme.of(context).textTheme.headline3,
                      children: const [
                    TextSpan(
                      text: "\t*",
                      style: TextStyle(color: kPrimary),
                    )
                  ])),
              spacer(8.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(154),
                  child: DecoratedBox(
                    decoration: dropdownInputDecoration,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(
                              left: 9, top: 11.5, bottom: 11.5),
                          child: Text(
                            'Module',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        items: _addDividersAfterModules(module),
                        customItemsHeights: _getCustomModuleHeights(),
                        value: selectedModule,
                        onChanged: (value) {
                          setState(() {
                            selectedModule = value as String;
                          });
                        },
                        buttonHeight: 40,
                        dropdownMaxHeight: 200,
                        buttonWidth: 140,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),
                ),
              ),
              spacer(32.0),
              Text(
                'Contact Information',
                style: Theme.of(context).textTheme.headline2,
              ),
              spacer(17.0),
              Text(
                'Email ID',
                style: Theme.of(context).textTheme.headline3,
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: buildEmailFormField(),
              ),
              spacer(17.0),
              Text(
                'Contact Number',
                style: Theme.of(context).textTheme.headline3,
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: buildContactFormField(),
              ),
              spacer(17.0),
              Text(
                'Address',
                style: Theme.of(context).textTheme.headline3,
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: buildAddressFormField('Address Line 1'),
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: buildAddressFormField('Address Line 2'),
              ),
              spacer(17.0),
              Row(
                children: [
                  RichText(
                      text: TextSpan(
                          text: "City",
                          style: Theme.of(context).textTheme.headline3,
                          children: const [
                        TextSpan(
                          text: "\t*",
                          style: TextStyle(color: kPrimary),
                        )
                      ])),
                  SizedBox(
                    width: getProportionateScreenWidth(139),
                  ),
                  RichText(
                      text: TextSpan(
                          text: "State",
                          style: Theme.of(context).textTheme.headline3,
                          children: const [
                        TextSpan(
                          text: "\t*",
                          style: TextStyle(color: kPrimary),
                        )
                      ])),
                ],
              ),
              spacer(8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenWidth(154),
                      child: buildCityFormField()),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(154),
                    child: DecoratedBox(
                      decoration: dropdownInputDecoration,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Padding(
                            padding: const EdgeInsets.only(
                                left: 9, top: 11.5, bottom: 11.5),
                            child: Text(
                              'State',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          items: _addDividersAfterState(states),
                          customItemsHeights: _getCustomStatesHeights(),
                          value: selectedStates,
                          onChanged: (value) {
                            setState(() {
                              selectedStates = value as String;
                            });
                          },
                          buttonHeight: 40,
                          dropdownMaxHeight: 200,
                          buttonWidth: 140,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              spacer(17.0),
              RichText(
                text: TextSpan(
                  text: "Pincode",
                  style: Theme.of(context).textTheme.headline3,
                  children: const [
                    TextSpan(
                      text: "\t*",
                      style: TextStyle(color: kPrimary),
                    )
                  ],
                ),
              ),
              spacer(8.0),
              SizedBox(
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(154),
                  child: buildPincodeFormField()),
              spacer(17.0),
              RichText(
                text: TextSpan(
                  text: "*",
                  style: const TextStyle(color: kPrimary),
                  children: [
                    TextSpan(
                      text: "\tMandatory Fields",
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
              ),
              spacer(32.0),
              Text(
                'Educational Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              spacer(17.0),
              Text(
                'Institute',
                style: Theme.of(context).textTheme.headline3,
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: buildInstituteFormField(),
              ),
              spacer(17.0),
              Text(
                'Stream (Qualification)',
                style: Theme.of(context).textTheme.headline3,
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: buildStreamFormField(),
              ),
              spacer(17.0),
              Text(
                'Percentage',
                style: Theme.of(context).textTheme.headline3,
              ),
              spacer(8.0),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: double.infinity,
                child: buildPercentageFormField(),
              ),
              spacer(32.0),
              const DefaultButton(
                text: 'SUBMIT',
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
        hintStyle: Theme.of(context).textTheme.headline5,
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
        hintStyle: Theme.of(context).textTheme.headline5,
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
        hintStyle: Theme.of(context).textTheme.headline5,
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
        suffixIcon: IconButton(
          onPressed: () => _onAlertButtonsPressed(context),
          icon: SvgPicture.asset('assets/icons/questionmark.svg'),
        ),
        hintText: "Enter your Email",
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildDOBFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        dob = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: "DD/MM/YYYY",
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildAddressFormField(address) {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        fname = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: address,
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildCityFormField() {
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
        hintText: "City",
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildPincodeFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        dob = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: "XXXXXX",
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildInstituteFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        dob = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: "Institute",
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildStreamFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        dob = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: "Stream",
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  TextFormField buildPercentageFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContactError);
        } else if (nameValidatorRegExp.hasMatch(value)) {
          removeError(error: kShortcontactError);
        }
        dob = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13.5),
            horizontal: getProportionateScreenWidth(9)),
        hintText: "XX",
        hintStyle: Theme.of(context).textTheme.headline5,
        enabledBorder: outlineInputBorder(4.0),
      ),
    );
  }

  _onAlertButtonsPressed(context) {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: "Email ID not Verified!",
      buttons: [
        DialogButton(
          child: Text(
            "LATER",
            style: Theme.of(context).textTheme.headline4,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        DialogButton(
          child: Text(
            "VERIFY",
            style: Theme.of(context).textTheme.headline4,
          ),
          onPressed: () =>
              Navigator.pushNamed(context, EmailVerification.routeName),
        ),
      ],
    ).show();
  }
}
