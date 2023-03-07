import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_ins.dart';
import 'package:max_task/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  floating: false,
                  pinned: true,
                  title: RichText(
                    text: TextSpan(
                      text: "Welcome ",
                      style: GoogleFonts.questrial(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${authViewModel.username} 👋🏿",
                          style: GoogleFonts.questrial(
                            fontSize: 24.0,
                            color: const Color(0xffFDDB00),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        authViewModel.loginOut();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.only(
              top: 72.0,
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CheckIns(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
