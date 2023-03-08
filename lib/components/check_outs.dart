import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_out_cards.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class CheckOuts extends StatefulWidget {
  const CheckOuts({Key? key}) : super(key: key);

  @override
  State<CheckOuts> createState() => _CheckOutsState();
}

class _CheckOutsState extends State<CheckOuts> {
  final _listAnimateKey = GlobalKey<SliverAnimatedListState>();

  @override
  void initState() {
    super.initState();

    final model = context.read<DashboardViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future future = Future(() {});
      for (int index = 0; index < model.checkedOutVehicles.length; index++) {
        future = future.then((_) {
          return Future.delayed(const Duration(milliseconds: 100), () {
            _listAnimateKey.currentState!.insertItem(
              index,
              duration: const Duration(
                milliseconds: 250,
              ),
            );
          });
        });
      }
    });
  }

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

        return SliverAnimatedList(
          key: _listAnimateKey,
          initialItemCount: model.checkedOutVehicles.length,
          itemBuilder: (context, index, animation) {
            final vehicle = model.checkedOutVehicles[index];
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ),
              ),
              child: CheckOutCards(
                vehicle: model.checkedOutVehicles[index],
                onAddComplete: () {
                  _listAnimateKey.currentState!.removeItem(
                    index,
                    (context, animation) => SizeTransition(
                      key: ValueKey(vehicle.referenceNumber),
                      sizeFactor: animation,
                      child: CheckOutCards(
                        vehicle: vehicle,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
