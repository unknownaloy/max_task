import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/table_label.dart';
import 'package:max_task/models/vehicle.dart';
import 'package:max_task/utils/custom_date_formatter.dart';

class CustomBottomSheet extends StatelessWidget {
  final Vehicle vehicle;
  const CustomBottomSheet({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      // height: MediaQuery.of(context).size.height * 0.96,
      // decoration: const BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(10.0),
      //     topRight: Radius.circular(10.0),
      //   ),
      // ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.model,
                      style: GoogleFonts.questrial(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      vehicle.type,
                      style: GoogleFonts.questrial(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            Text(
              "Vehicle Info:",
              style: GoogleFonts.questrial(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: "Champion",
                      isHeader: true,
                    ),
                    TableLabel(
                      label: "Reference",
                      isHeader: true,
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: vehicle.champion,
                    ),
                    TableLabel(
                      label: vehicle.referenceNumber,
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
                const TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: "Plate Number",
                      isHeader: true,
                    ),
                    TableLabel(
                      label: "Location",
                      isHeader: true,
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: vehicle.plateNumber,
                    ),
                    TableLabel(
                      label: vehicle.location,
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
                const TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: "Vehicle Model",
                      isHeader: true,
                    ),
                    TableLabel(
                      label: "Vehicle Type",
                      isHeader: true,
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: vehicle.model,
                    ),
                    TableLabel(
                      label: vehicle.type,
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
                const TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: "Location",
                      isHeader: true,
                    ),
                    TableLabel(
                      label: "Analyst",
                      isHeader: true,
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: vehicle.location,
                    ),
                    TableLabel(
                      label: vehicle.analyst,
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
                const TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: "Phone Number",
                      isHeader: true,
                    ),
                    TableLabel(
                      label: "Date Time",
                      isHeader: true,
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    TableLabel(
                      label: vehicle.phoneNumber,
                    ),
                    TableLabel(
                      label: CustomDateFormatter()
                          .weekdayMonthDayFormatter(vehicle.dateTime),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
