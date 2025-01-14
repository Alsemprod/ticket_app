import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dbstech_course/base/Widgets/app_double_text.dart';
import 'package:flutter_dbstech_course/base/Widgets/res/media.dart';
import 'package:flutter_dbstech_course/base/Widgets/res/styles/app_styles.dart';
import 'package:flutter_dbstech_course/base/Widgets/ticket_view.dart';
import 'package:flutter_dbstech_course/base/utils/app_json.dart';
import 'package:flutter_dbstech_course/base/utils/app_routes.dart';
import 'package:flutter_dbstech_course/screens/home/widgets/hotel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      //we want scrollable effect
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good morning", style: AppStyles.headlineStyle3),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Book Tickets", style: AppStyles.headlineStyle1)
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(AppMedia.logo))),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff4f6fd),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: const Row(
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xffbfc205),
                      ),
                      Text("Search"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AppDoubleText(
                  bigText: "Upcoming Flights",
                  smallText: "View all",
                  func: () =>
                      Navigator.pushNamed(context, AppRoutes.allTickets),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: ticketList
                            .take(2)
                            .map((singleTicket) =>
                                TicketView(ticket: singleTicket))
                            .toList())),
                const SizedBox(
                  height: 20,
                ),
                AppDoubleText(
                  func: () {
                    Navigator.pushNamed(context, AppRoutes.allHotels);
                  },
                  bigText: "Hotels",
                  smallText: "View all",
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: hotelList
                        .take(2)
                        .map(
                          (singleHotel) => Hotel(hotel: singleHotel),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
