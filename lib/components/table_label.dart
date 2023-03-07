import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableLabel extends StatelessWidget {
  final String label;
  final bool isHeader;

  const TableLabel({
    Key? key,
    required this.label,
    this.isHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.questrial(
        fontSize: isHeader ? 16.0 : 18.0,
        color: isHeader ? Colors.grey : Colors.black,
        fontWeight: isHeader ? FontWeight.w700 : FontWeight.normal,
      ),
    );
  }
}
