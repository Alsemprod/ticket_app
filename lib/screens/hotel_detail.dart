import 'package:flutter/material.dart';
import 'package:flutter_dbstech_course/base/Widgets/res/styles/app_styles.dart';
import 'package:flutter_dbstech_course/base/utils/app_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["index"]);
    index = args["index"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppStyles.primaryColor),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                /*   title: Text(hotelList[index]["place"]), */
                background: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/${hotelList[index]["image"]}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        hotelList[index]["place"],
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  blurRadius: 10.0,
                                  color: AppStyles.primaryColor,
                                  offset: const Offset(2.0, 2.0))
                            ]),
                      )),
                )
              ],
            )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "Located in the heart of London, Open Space Hotel offers a blend of modern comfort and classic charm. Featuring spacious rooms with floor-to-ceiling windows, guests can enjoy stunning city views. The hotel provides amenities such as high-speed Wi-Fi, a cozy seating area, and a flat-screen TV. Perfect for travelers looking for luxury on a budget, Open Space Hotel ensures a relaxing stay with a premium bed, elegant furnishings, and a fully-equipped workspace. The hotel is within walking distance of popular attractions, shopping districts, and fine dining. Experience comfort at just \$25 per night!"),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "More images",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(16),
                        color: Colors.red,
                        child: Image.network(
                            "https://via.placeholder.com/200x200"),
                      );
                    }),
              )
            ]),
          )
        ],
      ),
    );
  }
}
