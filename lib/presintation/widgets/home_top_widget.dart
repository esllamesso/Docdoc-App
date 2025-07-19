import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/const/images_paths.dart';
import '../../core/utils/colors.dart';

class HomeTopWidget extends StatefulWidget {
  const HomeTopWidget({super.key});

  @override
  State<HomeTopWidget> createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: width * 0.045,
              color: ColorsManager.black,
            ),
            children: [
              TextSpan(text: "Hi Omar!\n"),
              TextSpan(
                text: "How are you today?",
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.grey2,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width * 0.12,
          height: width * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.white2,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ImagesPaths.notification,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
