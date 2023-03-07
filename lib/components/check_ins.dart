import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_in_cards.dart';
import 'package:max_task/vehicle_list.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';

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
            child: Consumer<DashboardViewModel>(
              builder: (_, model, __) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.checkedInVehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = model.checkedInVehicles[index];
                  return CheckInCards(
                    vehicle: vehicle,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
