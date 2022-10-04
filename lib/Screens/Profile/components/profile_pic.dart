import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentapp/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(120.0),
      width: getProportionateScreenWidth(120.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets\icons\profile.png'),
          ),
          Positioned(
              right: -12,
              bottom: 0,
              child: SizedBox(
                height: getProportionateScreenHeight(46),
                width: getProportionateScreenWidth(46),
                child: ElevatedButton(
                  onPressed: () {},
                  child: SvgPicture.asset('assets/icons/camera.svg'),
                ),
              ))
        ],
      ),
    );
  }
}
