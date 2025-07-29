import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/presintation/screens/booking_screens/payment_screen.dart';
import 'package:docdoc/presintation/widgets/booking_widgets/appointment_type_widget.dart';
import 'package:docdoc/presintation/widgets/booking_widgets/booking_steps_indicator.dart';
import 'package:docdoc/presintation/widgets/booking_widgets/select_date_widget.dart';
import 'package:docdoc/presintation/widgets/button_widget.dart';
import 'package:docdoc/presintation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import '../../widgets/booking_widgets/available_time_widget.dart';

class ChooseTimeScreen extends StatefulWidget {
  const ChooseTimeScreen({super.key});

  @override
  State<ChooseTimeScreen> createState() => _ChooseTimeScreenState();
}

class _ChooseTimeScreenState extends State<ChooseTimeScreen> {
  String selectedTime = '';
  DateTime selectedDate = DateTime.now();
  String selectedAppointmentType = "In Person";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.05,
            size.height * 0.03,
            size.width * 0.05,
            size.height * 0.001,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(text: "Book Appointment"),
              SizedBox(height: size.height * 0.02),
              BookingStepsIndicator(currentStep: 0),
              SizedBox(height: size.height * 0.02),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select Date", style: AppTextStyles.title),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Set Manual",
                              style: TextStyle(
                                color: ColorsManager.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      SelectDateWidget(
                        selectDate: selectedDate,
                        onDateSelected: (newDate) {
                          setState(() {
                            selectedDate = newDate;
                          });
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text("Available Time", style: AppTextStyles.title),
                      SizedBox(height: size.height * 0.02),

                      AvailableTimeWidget(
                        times: [
                          '08:00 AM',
                          '08:30 AM',
                          '09:00 AM',
                          '09:30 AM',
                          '10:00 AM',
                          '11:00 AM',
                        ],
                        selectedTime: selectedTime,
                        onTimeSelected: (time) {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text("Appointment Type",style: AppTextStyles.title,
                      ),
                      SizedBox(height: size.height * 0.02),
                      AppointmentTypeWidget(
                        selectedType: selectedAppointmentType,
                        onTypeSelected: (value) {
                          setState(() {
                            selectedAppointmentType = value;
                          });
                        },
                      ),
                      SizedBox(height: size.height * 0.04),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Continue",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
