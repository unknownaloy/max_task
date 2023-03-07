import 'package:flutter/cupertino.dart';
import 'package:max_task/models/vehicle.dart';
import 'package:max_task/vehicle_list.dart';

class DashboardViewModel extends ChangeNotifier {
  final List<Vehicle> _checkedInVehicles = [...dummyCheckedInVehicles];
  List<Vehicle> get checkedInVehicles => [..._checkedInVehicles];

  final List<Vehicle> _checkedOutVehicles = [...dummyCheckedOutVehicles];
  List<Vehicle> get checkedOutVehicles => [..._checkedOutVehicles];

  void addVehicleToCheckIn(Vehicle vehicle) {
    _checkedInVehicles.insert(0, vehicle);

    // _checkedOutVehicles.removeWhere(
    //   (element) => element.referenceNumber == vehicle.referenceNumber,
    // );
    _checkedOutVehicles.remove(vehicle);
    notifyListeners();
  }
}
