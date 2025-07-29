import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/presintation/widgets/booking_widgets/booking_steps_indicator.dart';
import 'package:docdoc/presintation/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
              BookingStepsIndicator(currentStep: 1),
              SizedBox(height: size.height * 0.02),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
