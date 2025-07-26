import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/presintation/screens/home_screens/rec_doctor_screen.dart';
import 'package:docdoc/presintation/widgets/custom_bottom_nav_bar.dart';
import 'package:docdoc/presintation/widgets/home_widgets/find_nearby_widget.dart';
import 'package:docdoc/presintation/widgets/home_widgets/home_top_widget.dart';
import 'package:docdoc/presintation/widgets/home_widgets/rec_doctors_widget.dart';
import 'package:docdoc/presintation/widgets/home_widgets/speciality_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.white,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          width * 0.05,
          height * 0.07,
          width * 0.05,
          0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopWidget(),
              SizedBox(height: height * 0.03),
              FindNearbyWidget(),
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor Speciality",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.020),
              SpecialityWidget(),
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation Doctor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> RecDoctorScreen()));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.015),
              RecDoctorsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
