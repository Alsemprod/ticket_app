import 'package:flutter/material.dart';

import 'package:flutter_dbstech_course/base/Widgets/ticket_view.dart';
import 'package:flutter_dbstech_course/base/utils/app_json.dart';
import 'package:flutter_dbstech_course/base/utils/app_routes.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Tickets"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList
                  .map((singleTicket) => GestureDetector(
                        onTap: () {
                          var index = ticketList.indexOf(singleTicket);

                          print("I am tapped on the ticket $index");

                          Navigator.pushNamed(context, AppRoutes.ticketScreen,
                              arguments: {"index": index});
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TicketView(
                              ticket: singleTicket,
                              wholeScreen: true,
                            )),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
