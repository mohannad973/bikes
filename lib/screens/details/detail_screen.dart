import 'package:bikes/models/bike_model.dart';
import 'package:bikes/network/app_url.dart';
import 'package:bikes/screens/widgets/specification_widget.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class DetailScreen extends StatefulWidget {
  final Bike bike;

  DetailScreen({@required this.bike});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(
                                color: Colors.grey[300],
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black,
                              size: 28,
                            )),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.bike.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

               widget.bike.country == null?Container(): Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.bike.country.toString(),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                    ),
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

                Center(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Hero(
                      tag: widget.bike.id,
                      child: Image.network(
                        AppUrl.baseUrlImage + widget.bike.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 16,),

                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    widget.bike.description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Text(
                          "SPECIFICATIONS",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        padding: EdgeInsets.only(
                          top: 8,
                          left: 16,
                        ),
                        margin: EdgeInsets.only(bottom: 16),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                           buildSpecificationBike("gear", widget.bike.gear),
                           buildSpecificationBike("size", widget.bike.size),
                           buildSpecificationBike("model", widget.bike.model),
                           buildSpecificationBike("wheel size", widget.bike.wheelSize),
                           buildSpecificationBike("riding style", widget.bike.ridingStyle),
                           buildSpecificationBike("frame size", widget.bike.frameSize),
                           buildSpecificationBike("type", widget.bike.type),
                           buildSpecificationBike("brake type", widget.bike.brakeType),
                           buildSpecificationBike("used for", widget.bike.usedFor),
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [
                    Text(
                      widget.bike.price == null ? "USD "+"0":"USD "+widget.bike.price.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                  ],
                ),
              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
