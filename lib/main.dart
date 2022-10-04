import 'package:flutter/material.dart';
import 'package:studentapp/Screens/Splash/splash_screen.dart';
import 'package:studentapp/routes.dart';
import 'package:studentapp/theme.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
