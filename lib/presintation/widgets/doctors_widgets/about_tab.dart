import 'package:flutter/material.dart';

import '../../../core/utils/app_text_styles.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
         Text(
          "About me",
          style: AppTextStyles.title,
        ),
         SizedBox(height: 8),
        Text(
          "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achieved several awards for her wonderful contribution in medical field. She is available for private consultation.",
         style: AppTextStyles.about),
         SizedBox(height: 16),
         Text(
          "Working Time",
          style: AppTextStyles.title,
        ),
         SizedBox(height: 8),
         Text("Monday - Friday, 08.00 AM - 20.00 PM"),
         SizedBox(height: 16),
         Text(
          "STR",
          style: AppTextStyles.title,
        ),
         SizedBox(height: 8),
         Text("4726482464",style: AppTextStyles.about,),
         SizedBox(height: 16),
         Text(
          "Pengalaman Praktik",
          style: AppTextStyles.title,
        ),
         SizedBox(height: 8),
         Text("RSPAD Gatot Soebroto\n2017 - sekarang",style: AppTextStyles.about,),
      ],
    );
  }
}
