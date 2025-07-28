import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/presintation/widgets/doctors_widgets/rec_doctors_widget.dart';
import 'package:docdoc/presintation/widgets/home_widgets/search_widget.dart';
import 'package:docdoc/presintation/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class RecDoctorScreen extends StatefulWidget {
  const RecDoctorScreen({super.key});

  @override
  State<RecDoctorScreen> createState() => _RecDoctorScreenState();
}

class _RecDoctorScreenState extends State<RecDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.04,
            size.height * 0.03,
            size.width * 0.04,
            size.height * 0.04,
          ),
          child: Column(
            children: [
              TopBar(
                text: "Recommendation Doctor",
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz_outlined),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        SearchWidget(),
                        SizedBox(height: size.height * 0.02),
                        RecDoctorsWidget(),
                      ]),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
