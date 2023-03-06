import 'package:flutter/cupertino.dart';
import 'package:max_task/enums/query_state.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  QueryState _queryState = QueryState.notQuerying;
  QueryState get queryState => _queryState;

  String? _username;
  String? get username => _username;

  void loginUser({required String inputtedUsername}) {
    _queryState = QueryState.querying;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      _username = inputtedUsername;
      _isAuthenticated = true;

      _queryState = QueryState.notQuerying;
      notifyListeners();
    });
  }
}
