import 'package:flutter/material.dart';

import 'package:flutter_dbstech_course/base/Widgets/bottom_nav.dart';
import 'package:flutter_dbstech_course/base/utils/app_routes.dart';
import 'package:flutter_dbstech_course/screens/home/all_hotels.dart';
import 'package:flutter_dbstech_course/screens/home/all_tickets.dart';
import 'package:flutter_dbstech_course/screens/hotel_detail.dart';
import 'package:flutter_dbstech_course/screens/ticket/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage: (context) => const BottomNavBar(),
        AppRoutes.allTickets: (context) => const AllTickets(),
        AppRoutes.ticketScreen: (context) => const TicketScreen(),
        AppRoutes.allHotels: (context) => const AllHotels(),
        AppRoutes.hotelDetail: (context) => const HotelDetail()
      },
    );
  }
}
