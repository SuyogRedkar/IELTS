import 'package:flutter/widgets.dart';
import 'package:studentapp/Screens/Email%20Verification/components/email_otp_screen.dart';
import 'package:studentapp/Screens/Email%20Verification/email.dart';
import 'package:studentapp/Screens/Otp/otp.dart';
import 'package:studentapp/Screens/Profile/profile.dart';
import 'Screens/Counselling/counselling.dart';
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
  EmailVerification.routeName: (context) => const EmailVerification(),
  EmailOtpScreen.routeName: (context) => const EmailOtpScreen(),
  CounsellingScreen.routeName: (context) => const CounsellingScreen(),
};
