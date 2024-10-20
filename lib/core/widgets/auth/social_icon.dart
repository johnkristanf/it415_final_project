// third party
import 'package:flutter_svg/flutter_svg.dart';

// core
import 'package:babysitterapp/core/constants/styles.dart';

// flutter
import 'package:flutter/material.dart';

class SocalIcon extends StatelessWidget with GlobalStyles {
  SocalIcon({
    super.key,
    this.iconSrc,
    this.press,
  });

  final String? iconSrc;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: GlobalStyles.kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc!,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
