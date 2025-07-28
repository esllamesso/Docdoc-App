import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/presintation/screens/details_screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/doctor_model.dart';

class RecDoctorsWidget extends StatefulWidget {
  const RecDoctorsWidget({super.key});

  @override
  State<RecDoctorsWidget> createState() => _RecDoctorsWidgetState();
}

class _RecDoctorsWidgetState extends State<RecDoctorsWidget> {
  final List<DoctorModel> doctors = [
    DoctorModel(
      name: "Dr. Randy Wigham",
      specialty: "General | RSUD Gatot Subroto",
      image: "assets/images/dr1.png",
      rating: "4.8",
      reviews: "4,279",
    ),
    DoctorModel(
      name: "Dr. Jack Sulivan",
      specialty: "General | RSUD Gatot Subroto",
      image: "assets/images/dr2.png",
      rating: "4.6",
      reviews: "3,920",
    ),
    DoctorModel(
      name: "Dr. Randy Wigham",
      specialty: "General | RSUD Gatot Subroto",
      image: "assets/images/doc3.png",
      rating: "4.6",
      reviews: "3,920",
    ),
    DoctorModel(
      name: "Dr. Jack Randy",
      specialty: "General | RSUD Gatot Subroto",
      image: "assets/images/doc4.png",
      rating: "4.6",
      reviews: "3,920",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];

        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> AboutScreen(doctor: doctor)));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: height * 0.010),
            padding: EdgeInsets.all(width * 0.025),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    doctor.image,
                    height: height * 0.14,
                    width: height * 0.14,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: width * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: ColorsManager.black,
                        ),
                      ),
                      Text(
                        doctor.specialty,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.grey,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          SvgPicture.asset("assets/logos/star.svg", height: 14),
                          const SizedBox(width: 4),
                          Text(
                            doctor.rating,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.lightGrey,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "(${doctor.reviews} reviews)",
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
