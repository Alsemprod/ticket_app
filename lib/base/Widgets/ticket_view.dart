import 'package:flutter/material.dart';
import 'package:flutter_dbstech_course/base/Widgets/app_column_text_layout.dart';
import 'package:flutter_dbstech_course/base/Widgets/app_layout_builder_widget.dart';
import 'package:flutter_dbstech_course/base/Widgets/big_circle.dart';
import 'package:flutter_dbstech_course/base/Widgets/big_dot.dart';
import 'package:flutter_dbstech_course/base/Widgets/res/styles/app_styles.dart';
import 'package:flutter_dbstech_course/base/Widgets/text_style_fourth.dart';
import 'package:flutter_dbstech_course/base/Widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: 180,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            //blue part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketBlue
                      : AppStyles.ticketwWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Column(
                children: [
                  //show departure and destination of icons
                  Row(
                    children: [
                      TextStyleThird(
                          text: ticket["from"]["code"], isColor: isColor),
                      Expanded(child: Container()),
                      BigDot(
                        isColor: isColor,
                      ),
                      //tciket flying icon
                      Expanded(
                        child: Stack(
                          children: [
                            const SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(
                                randomDivider: 6,
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor == null
                                      ? Colors.white
                                      : AppStyles.planeSecondColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      TextStyleThird(
                        text: ticket["to"]["code"],
                        isColor: isColor,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 3,
                  ),
                  //Show departure and destination names with time
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["from"]["name"],
                          isColor: isColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(
                        text: ticket["flying_time"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["to"]["name"],
                          align: TextAlign.end,
                          isColor: isColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //circles and dots
            Container(
              color: isColor == null
                  ? AppStyles.ticketOrange
                  : AppStyles.ticketwWhite,
              child: Row(
                children: [
                  BigCircle(
                    isRight: false,
                    isColor: isColor,
                  ),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                    isColor: isColor,
                  )),
                  BigCircle(
                    isRight: true,
                    isColor: isColor,
                  )
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketOrange
                      : AppStyles.ticketwWhite,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                      bottomRight: Radius.circular(isColor == null ? 21 : 0))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        alignment: CrossAxisAlignment.start,
                        topText: ticket["date"],
                        bottomText: "DATE",
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        alignment: CrossAxisAlignment.center,
                        topText: ticket["departure_time"],
                        bottomText: "Departure time",
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        alignment: CrossAxisAlignment.end,
                        topText: ticket["number"].toString(),
                        bottomText: "Number",
                        isColor: isColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
