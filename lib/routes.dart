import 'package:flutter/widgets.dart';
import 'package:studentapp/Screens/Otp/otp.dart';
import 'package:studentapp/Screens/Profile/profile.dart';
import 'Screens/Profile Edit/profile_edit.dart';
import 'Screens/Register/register.dart';
import 'Screens/SignUp/signup.dart';
import 'Screens/Splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  Register.routeName: (context) => const Register(),
  Otp.routeName: (context) => const Otp(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ProfileEditScreen.routeName: (context) => const ProfileEditScreen(),
};
