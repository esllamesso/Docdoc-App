import 'package:docdoc/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecDoctorsWidget extends StatefulWidget {
  const RecDoctorsWidget({super.key});

  @override
  State<RecDoctorsWidget> createState() => _RecDoctorsWidgetState();
}

class _RecDoctorsWidgetState extends State<RecDoctorsWidget> {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Randy Wigham",
      "specialty": "General",
      "image": "assets/images/dr1.png",
    },
    {
      "name": "Dr. Jack Sulivan",
      "specialty": "General",
      "image": "assets/images/dr2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.only(top: 20),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return Container(
          margin: EdgeInsets.only(bottom: height * 0.010),
          padding: EdgeInsets.all(width * 0.025),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  doctor['image']!,
                  height: height * 0.14,
                  width: height * 0.14,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: width * 0.04),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Randy Wigham",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorsManager.black,
                    ),
                  ),
                  Text(
                    "General | RSUD Gatot Subroto",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.grey,
                    ),
                  ),

                  SizedBox(height: height * 0.01),

                  Row(
                    children: [
                      SvgPicture.asset("assets/logos/star.svg"),
                      Text(
                        "4.8",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.lightGrey,
                        ),
                      ),

                      SizedBox(width: width * 0.01),

                      Text(
                        "(4,279 reviews)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
