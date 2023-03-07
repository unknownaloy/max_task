import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/custom_bottom_sheet.dart';
import 'package:max_task/enums/check_type.dart';
import 'package:max_task/models/vehicle.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class CheckOutCards extends StatelessWidget {
  final Vehicle vehicle;
  final CheckType? checkType;
  const CheckOutCards({
    Key? key,
    required this.vehicle,
    this.checkType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<DashboardViewModel>();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
          ),
          builder: (BuildContext context) {
            return CustomBottomSheet(
              vehicle: vehicle,
            );
          },
        );
      },
      child: AspectRatio(
        aspectRatio: 3/4,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // width: double.infinity,
          // height: 152.0,
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
              Image.asset("assets/images/car.png", height: 112.0,),
              const SizedBox(width: 16.0,),
              Expanded(
                child: SizedBox(
                  width: 196.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          vehicle.name,
                          style: GoogleFonts.questrial(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Flexible(
                        child: Text(
                          vehicle.type,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.questrial(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          vehicle.model,
                          style: GoogleFonts.questrial(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      checkType != null && checkType == CheckType.checkIn
                          ? const SizedBox.shrink()
                          : TextButton(
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
                                  subTitle:
                                      "${vehicle.champion} => ${vehicle.model} | ${vehicle.type}   🚙",
                                  backgroundColor: Colors.green,
                                  hideCloseButton: true,
                                  titleStyle: GoogleFonts.questrial(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  subTitleStyle: GoogleFonts.questrial(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
