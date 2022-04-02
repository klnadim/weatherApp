import 'package:intl/intl.dart';

class Util {
  static String appId = "2d20e55edc896a5806ac13460ae52aae";

  static getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, yyyy').format(dateTime);
  }
}
