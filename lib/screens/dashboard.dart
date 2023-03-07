import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_ins.dart';
import 'package:max_task/components/check_outs.dart';
import 'package:max_task/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  void dispose() {
    _scrollController.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
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
            child: Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  controller: _scrollController,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    const SliverToBoxAdapter(
                      child: CheckIns(),
                    ),
                    const SliverFillRemaining(
                      child: CheckOuts(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
