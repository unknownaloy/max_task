import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/models/vehicle.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class CheckOutCards extends StatelessWidget {
  final Vehicle vehicle;
  const CheckOutCards({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<DashboardViewModel>();
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      height: 152.0,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/car.png"),
          SizedBox(
            width: 196.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle.name,
                  style: GoogleFonts.questrial(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  vehicle.type,
                  style: GoogleFonts.questrial(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  vehicle.model,
                  style: GoogleFonts.questrial(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffFDDB00),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size.fromHeight(32.0),
                    ),
                  ),
                  child: Text(
                    "CHECK IN",
                    style: GoogleFonts.questrial(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    var cancel = BotToast.showSimpleNotification(
                      title: "Vehicle check-in success!!! 🎉",
                      backgroundColor: Colors.green,
                      hideCloseButton: true,
                      titleStyle: GoogleFonts.questrial(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    );

                    model.addVehicleToCheckIn(vehicle);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
