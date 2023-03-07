import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> customDialog({
  required BuildContext context,
  required Function onApprove,
  required Function onCancel,
}) async {
  if (Platform.isIOS) {
    return showCupertinoModalPopup<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          'Confirm Check-in',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Proceed with adding vehicle to check-in?',
          style: GoogleFonts.questrial(fontSize: 16.0),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              onCancel();
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              onApprove();
            },
            child: const Text('Approve'),
          ),
        ],
      ),
    );
  }
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm Check-in',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Proceed with adding vehicle to check-in?',
                style: GoogleFonts.questrial(fontSize: 16.0),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: GoogleFonts.questrial(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onCancel();
            },
          ),
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
              onApprove();
            },
          ),
        ],
      );
    },
  );
}
