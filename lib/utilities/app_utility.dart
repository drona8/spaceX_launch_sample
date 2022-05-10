import 'package:intl/intl.dart';

class AppUtility {
  static String formateDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat formatter = DateFormat('dd-MMM-yyyy – kk:mm a');
    return formatter.format(dateTime);
  }
}
