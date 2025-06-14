import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:shifa_task/config/AppColors.dart';

class Utils {
  static String formatDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy - hh:mm a').format(dateTime);
  }
}
