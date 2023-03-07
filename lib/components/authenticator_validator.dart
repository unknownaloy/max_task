import 'package:flutter/material.dart';
import 'package:max_task/screens/dashboard.dart';
import 'package:max_task/screens/login_screen.dart';
import 'package:max_task/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthenticatorValidator extends StatelessWidget {
  const AuthenticatorValidator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();

    if (!authViewModel.isAuthenticated) {
      return const LoginScreen();
    }
    return const Dashboard();
  }
}
