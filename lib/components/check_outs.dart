import 'package:flutter/material.dart';
import 'package:max_task/components/check_out_cards.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class CheckOuts extends StatelessWidget {
  const CheckOuts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (_, model, __) => ListView.builder(
        itemCount: model.checkedOutVehicles.length,
        itemBuilder: (context, index) {
          final vehicle = model.checkedOutVehicles[index];
          return CheckOutCards(
            key: UniqueKey(),
            vehicle: vehicle,
          );
        },
      ),
    );
  }
}
