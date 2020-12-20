import 'package:bikes/models/bike_model.dart';
import 'package:bikes/network/app_url.dart';
import 'package:flutter/material.dart';

Widget buildBike(Bike bike, int index) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    width: 220,
    child: Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 140,
          child: Hero(
              tag: bike.id,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  AppUrl.baseUrlImage + bike.image,
                  fit: BoxFit.cover,
                  width: 220,
                ),
              )),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            bike.title,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          bike.price == null ? "USD "+"0":"USD "+bike.price.toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),

      ],
    ),
  );
}
