import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/colors.dart';
import '../../../data/doctor_model.dart';

class DoctorHeaderInfo extends StatefulWidget {
  final DoctorModel doctor;
  final bool showMessageIcon;
  const DoctorHeaderInfo({super.key, required this.doctor, this.showMessageIcon = false,});

  @override
  State<DoctorHeaderInfo> createState() => _DoctorHeaderInfoState();
}

class _DoctorHeaderInfoState extends State<DoctorHeaderInfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: widget.showMessageIcon
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(widget.doctor.image, height: 74, width: 74),
            SizedBox(width: size.width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctor.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * 0.004),
                Text(
                  widget.doctor.specialty,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.grey,
                  ),
                ),
                SizedBox(height: size.height * 0.004),
                Row(
                  children: [
                    SvgPicture.asset("assets/logos/star.svg", height: 14),
                    const SizedBox(width: 4),
                    Text(
                      "${widget.doctor.rating} (${widget.doctor.reviews} reviews)",
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
        if (widget.showMessageIcon)
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/message-text.svg"),
          ),
      ],
    );
  }

}
