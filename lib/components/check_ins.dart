import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_in_cards.dart';
import 'package:max_task/vehicle_list.dart';

class CheckIns extends StatelessWidget {
  const CheckIns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 192.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Checked-in",
                style: GoogleFonts.questrial(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "See all",
                style: GoogleFonts.questrial(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return CheckInCards(
                  vehicle: vehicle,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
