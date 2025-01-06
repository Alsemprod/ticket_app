import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dbstech_course/base/Widgets/app_column_text_layout.dart';
import 'package:flutter_dbstech_course/base/Widgets/app_layout_builder_widget.dart';
import 'package:flutter_dbstech_course/base/Widgets/res/media.dart';
import 'package:flutter_dbstech_course/base/Widgets/res/styles/app_styles.dart';
import 'package:flutter_dbstech_course/base/Widgets/ticket_view.dart';
import 'package:flutter_dbstech_course/base/utils/app_json.dart';
import 'package:flutter_dbstech_course/screens/search/widgets/app_ticket_tabs.dart';
import 'package:flutter_dbstech_course/screens/ticket/widgets/ticket_positioned_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      print("passed index ${args["index"]}");
      ticketIndex = args["index"];
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        backgroundColor: AppStyles.bgColor,
        title: Text("Tickets"),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              /*      const SizedBox(
                height: 40,
              ), */
/*               Text(
                "Tickets",
                style: AppStyles.headlineStyle1,
              ), */
              /*       const SizedBox(
                height: 20,
              ), */
              const AppTicketTabs(
                firstTab: "Upcoming",
                secondTab: "Previous",
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  isColor: true,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketwWhite,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          alignment: CrossAxisAlignment.start,
                          topText: "Flutter DB",
                          bottomText: "Passenger",
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          alignment: CrossAxisAlignment.end,
                          topText: "5221 36869",
                          bottomText: "passport",
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          alignment: CrossAxisAlignment.start,
                          topText: "2465 7685740343",
                          bottomText: "Number of E-ticket",
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          alignment: CrossAxisAlignment.end,
                          topText: "B46859",
                          bottomText: "Booking code",
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visacard,
                                  scale: 11,
                                ),
                                Text(
                                  " *** 2462",
                                  style: AppStyles.headlineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment method",
                              style: AppStyles.headlineStyle4,
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                          alignment: CrossAxisAlignment.end,
                          topText: "\$249.99",
                          bottomText: "Price",
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 1,
              ),
              //bottom of the ticket detail section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppStyles.ticketwWhite,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BarcodeWidget(
                        height: 70,
                        data: "http//www.dbstech.com",
                        drawText: false,
                        barcode: Barcode.code128(),
                        color: AppStyles.textColor,
                        width: double.infinity,
                      )),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //colourful ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                ),
              ),
            ],
          ),
          const TicketPositionedCircle(
            pos: true,
          ),
          const TicketPositionedCircle(
            pos: null,
          )
        ],
      ),
    );
  }
}
