import 'package:docdoc/presintation/screens/booking_screens/confirmed_screen.dart';
import 'package:docdoc/presintation/widgets/booking_widgets/booking_information_widget.dart';
import 'package:docdoc/presintation/widgets/booking_widgets/payment_information_widget.dart';
import 'package:docdoc/presintation/widgets/doctors_widgets/doctor_header_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/colors.dart';
import '../../../data/doctor_model.dart';
import '../../widgets/booking_widgets/booking_steps_indicator.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/top_bar.dart';

class SummaryScreen extends StatefulWidget {
  final DateTime date;
  final String time;
  final String appointmentType;
  final String paymentMethod;
  final String? cardType;
  final DoctorModel doctor;

  const SummaryScreen({
    super.key,
    required this.date,
    required this.time,
    required this.appointmentType,
    required this.paymentMethod,
    this.cardType,
    required this.doctor,
  });

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final formattedDate = DateFormat('MMM d, yyyy').format(widget.date);

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
              BookingStepsIndicator(currentStep: 2),
              SizedBox(height: size.height * 0.02),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Text("Booking Information", style: AppTextStyles.title),
                      SizedBox(height: size.height * 0.007),
                      BookingInformationWidget(
                        date: formattedDate,
                        time: widget.time,
                        appointmentType: widget.appointmentType,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text("Doctor Information", style: AppTextStyles.title),
                      SizedBox(height: size.height * 0.03),
                      DoctorHeaderInfo(doctor: widget.doctor),
                      SizedBox(height: size.height * 0.02),
                      Text("Payment Information", style: AppTextStyles.title),
                      SizedBox(height: size.height * 0.007),
                      PaymentInformationWidget(
                        method: widget.cardType ?? widget.paymentMethod,
                        info: widget.cardType,
                        total: "50.00",
                        iconPath: _getPaymentIconPath(widget.paymentMethod, widget.cardType),
                      ),
                      SizedBox(height: size.height * 0.19),
                    ],
                  ),
                ),
              ),

              ButtonWidget(
                text: "Book Now",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> ConfirmedScreen(date: widget.date, time: widget.time, appointmentType: widget.appointmentType, doctor: widget.doctor)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPaymentIconPath(String method, String? option) {
    if (method == 'Credit Card') {
      switch (option) {
        case 'Master Card':
          return 'assets/icons/mastercard.svg';
        case 'American Express':
          return 'assets/icons/ae.svg';
        case 'Capital One':
          return 'assets/icons/capone.svg';
        case 'Barclays':
          return 'assets/icons/bar.svg';
        default:
          return 'assets/icons/card.svg';
      }
    } else if (method == 'PayPal') {
      return 'assets/icons/paypal.svg';
    } else if (method == 'Bank Transfer') {
      return 'assets/icons/bank.svg';
    } else {
      return 'assets/icons/card.svg';
    }
  }
}
