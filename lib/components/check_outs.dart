import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_in_cards.dart';
import 'package:max_task/vehicle_list.dart';

class CheckOuts extends StatelessWidget {
  const CheckOuts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Checked-out",
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
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                height: 60,
                width: double.infinity,
                color: Colors.blue,
              );
            },
          ),
        ),
      ],
    );
  }
}
