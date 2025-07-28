import 'package:docdoc/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  void _handleNavigation(BuildContext context, int index) {

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/calendar');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          elevation: 10,
          color: Colors.white,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon(context, "assets/icons/home.png", 0),
                _buildIcon(context, "assets/icons/chat.png", 1, hasNotification: true),
                const SizedBox(width: 48),
                _buildIcon(context, "assets/icons/calender.png", 2),
                _buildIcon(context, "assets/images/pic.png", 3),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: ColorsManager.blue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/search');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "assets/icons/search-normal.png",
                  width: 28,
                  height: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(BuildContext context, String assetPath, int index, {bool hasNotification = false}) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => _handleNavigation(context, index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? ColorsManager.blue.withOpacity(0.1) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              assetPath,
              width: 26,
              height: 26,
            ),
          ),
          if (hasNotification)
            const Positioned(
              right: 0,
              top: 4,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
