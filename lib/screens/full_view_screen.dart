import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_out_cards.dart';
import 'package:max_task/enums/check_type.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class FullViewScreen extends StatelessWidget {
  final CheckType checkType;
  const FullViewScreen({
    Key? key,
    required this.checkType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF7),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            floating: false,
            pinned: true,
            title: Text(
              checkType.name,
              style: GoogleFonts.questrial(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Consumer<DashboardViewModel>(
            builder: (_, model, __) {
              if (checkType == CheckType.checkOut &&
                  model.checkedOutVehicles.isEmpty) {
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
              return SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return CheckOutCards(
                        vehicle: checkType == CheckType.checkOut
                            ? model.checkedOutVehicles[index]
                            : model.checkedInVehicles[index],
                        checkType: checkType,
                      );
                    },
                    childCount: checkType == CheckType.checkOut
                        ? model.checkedOutVehicles.length
                        : model.checkedInVehicles.length,
                  ),
                  itemExtent: 152,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
