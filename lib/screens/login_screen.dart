import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/enums/query_state.dart';
import 'package:max_task/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _usernameTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();

    _usernameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 56.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Fleet Management",
                                style: GoogleFonts.questrial(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Login",
                                  style: GoogleFonts.questrial(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  onChanged: (String value) {},
                                  controller: _usernameTextController,
                                  cursorColor: Colors.grey,
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                  decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                        ),
                                    border: const OutlineInputBorder(),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z0-9]'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value?.isEmpty == true) {
                                      return 'Please enter an email';
                                    }

                                    if (value!.length < 4) {
                                      return "Username should be up to 4 characters";
                                    }

                                    return null;
                                  },
                                  onSaved: (String? value) {},
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  onChanged: (String value) {},
                                  controller: _passwordTextController,
                                  cursorColor: Colors.grey,
                                  obscureText: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                        ),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value?.isEmpty == true) {
                                      return 'Password field cannot be empty';
                                    }

                                    if (value!.length < 6) {
                                      return "Password length should be up to 6 characters";
                                    }

                                    return null;
                                  },
                                  onSaved: (String? value) {},
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                Consumer<AuthViewModel>(
                                  builder: (_, model, child) => TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xffFDDB00),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                        const Size.fromHeight(56.0),
                                      ),
                                    ),
                                    child:
                                        model.queryState == QueryState.querying
                                            ? const CircularProgressIndicator(
                                                strokeWidth: 2.0,
                                                color: Colors.black,
                                              )
                                            : Text(
                                                "LOGIN",
                                                style: GoogleFonts.questrial(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        authViewModel.loginUser(
                                          inputtedUsername:
                                              _usernameTextController.text
                                                  .trim(),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
