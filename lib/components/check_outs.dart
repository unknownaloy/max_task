import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_out_cards.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class CheckOuts extends StatelessWidget {
  const CheckOuts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (_, model, __) {
        if (model.checkedOutVehicles.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                "All vehicles checked in 🥳",
                style: GoogleFonts.questrial(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }

        return SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CheckOutCards(
                vehicle: model.checkedOutVehicles[index],
              );
            },
            childCount: model.checkedOutVehicles.length,
          ),
          itemExtent: 152,
        );
      },
    );
  }
}
