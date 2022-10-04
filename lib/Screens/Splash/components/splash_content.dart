import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentapp/size_config.dart';

Widget initWidget() {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(320)),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              child: Text(
                "IELTS-Prep by",
                style: TextStyle(
                    fontFamily: 'Outfit-Medium',
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(child: SvgPicture.asset("assets/icons/splash.svg"))
          ],
        ),
      ),
    ),
  );
}
