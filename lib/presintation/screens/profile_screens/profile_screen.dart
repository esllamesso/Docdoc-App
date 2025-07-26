import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/presintation/widgets/profile_widgets/info_widget.dart';
import 'package:docdoc/presintation/widgets/profile_widgets/my_appoint_widget.dart';
import 'package:docdoc/presintation/widgets/profile_widgets/profile_options_list.dart';
import 'package:docdoc/presintation/widgets/profile_widgets/profile_pic.dart';
import 'package:docdoc/presintation/widgets/custom_bottom_nav_bar.dart';
import 'package:docdoc/presintation/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: selectedIndex),
      backgroundColor: ColorsManager.blue,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              width * 0.05,
              height * 0.07,
              width * 0.05,
              0,
            ),
            child: Column(
              children: [
                TopBar(text: "Profile", color: ColorsManager.white),
                SizedBox(height: height * 0.15),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        InfoWidget(),
                        SizedBox(height: height * 0.035),

                        MyAppointWidget(),
                        SizedBox(height: height * 0.001),
                        ProfileOptionsList(),
                      ],
                    ),
                  ),
                ),
                ProfilePic(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
