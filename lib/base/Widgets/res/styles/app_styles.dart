import 'package:flutter/material.dart';

Color primary = const Color(0xff687daf);

class AppStyles {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xff3b3b3b);
  static Color bgColor = const Color(0XFFeeedf2);
  static Color ticketBlue = const Color(0xff526799);
  static Color ticketOrange = const Color(0xfff37b67);
  static Color kakiColor = const Color(0xffd2bdb6);
  static Color ticketTabColor = const Color(0xfff4f6fd);
  static Color planeColor = const Color(0xffbfc2df);
  static Color findTicketColor = const Color(0xd91130ce);
  static Color circleColor = const Color(0xff189999);
  static Color ticketwWhite = const Color(0xffffffff);
  static Color dotColor = const Color(0xff8accf7);
  static Color planeSecondColor = const Color(0xffbaccf7);

  static TextStyle headlineStyle1 =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: textColor);

  static TextStyle headlineStyle2 =
      TextStyle(fontSize: 21, color: textColor, fontWeight: FontWeight.bold);

  static TextStyle headlineStyle3 =
      const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);

  static TextStyle headlineStyle4 = TextStyle(
    fontSize: 14,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor);
}
