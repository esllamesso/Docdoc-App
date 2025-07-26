import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Eslam Mohamed",
          style: TextStyle(
            color: ColorsManager.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "eslammoh369@gmail.com",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorsManager.lightGrey,
          ),
        ),
      ],
    );
  }
}
