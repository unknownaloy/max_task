import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/models/vehicle.dart';

class CheckInCards extends StatelessWidget {
  final Vehicle vehicle;

  const CheckInCards({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.all(8.0),
      width: 128.0,
      height: 64.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        color: Colors.white,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/car.png",
              height: 72.0,
            ),
          ),
          // const SizedBox(height: 2.0,),

          Text(
            vehicle.name,
            style: GoogleFonts.questrial(fontSize: 12.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4.0,),
          Text(
            vehicle.type,
            style: GoogleFonts.questrial(fontSize: 12.0),
          ),
          Text(
            vehicle.model,
            style: GoogleFonts.questrial(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
