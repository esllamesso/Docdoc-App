import 'package:docdoc/core/utils/colors.dart';
import 'package:flutter/material.dart';

enum NotificationType { successed, cancelled, changed }

class NotificationsModel {
  final String iconPath;
  final NotificationType type;

  final String title;
  final String description;
  final String time;
   bool isRead;

  NotificationsModel({
    required this.iconPath,
    required this.type,
    required this.title,
    required this.description,
    required this.time,
    this.isRead = false
  });

  Color get iconColor {
    switch (type) {
      case NotificationType.successed:
        return ColorsManager.green;
      case NotificationType.cancelled:
        return ColorsManager.red;
      case NotificationType.changed:
        return ColorsManager.blue;
    }
  }
}
