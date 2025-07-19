import 'package:docdoc/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SpecialityWidget extends StatefulWidget {
  const SpecialityWidget({super.key});

  @override
  State<SpecialityWidget> createState() => _SpecialityWidgetState();
}

class _SpecialityWidgetState extends State<SpecialityWidget> {
  final List<Map<String, String>> specialities = [
    {
      "image": "assets/logos/General.png",
      "label": "General",
    },
    {
      "image": "assets/logos/Neurologic.png",
      "label": "Neurologic",
    },
    {
      "image": "assets/logos/Pediatric.png",
      "label": "Pediatric",
    },
    {
      "image": "assets/logos/Radiology.png",
      "label": "Radiology",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerSize = screenWidth * 0.16;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: specialities.map((spec) {
        return _buildSpec(
          spec['image']!,
          spec['label']!,
          containerSize,
        );
      }).toList(),
    );
  }

  Widget _buildSpec(String imagePath, String label, double containerSize) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.light,
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
