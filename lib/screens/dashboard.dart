import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_task/components/check_ins.dart';
import 'package:max_task/components/check_out_cards.dart';
import 'package:max_task/components/check_outs.dart';
import 'package:max_task/view_models/auth_view_model.dart';
import 'package:max_task/view_models/dashboard_view_model.dart';
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
    return ChangeNotifierProvider(
      create: (context) => DashboardViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NestedScrollView(
            // controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 72.0,
                    ),
                    child: CheckIns(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 8.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Checked-in",
                              style: GoogleFonts.questrial(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "See all",
                              style: GoogleFonts.questrial(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(
                // top: 48.0,
                left: 16.0,
                right: 16.0,
                // bottom: 16.0,
              ),
              child: Builder(
                builder: (context) {
                  return CustomScrollView(
                    slivers: [
                      // SliverOverlapInjector(
                      //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      //     context,
                      //   ),
                      // ),
                      Consumer<DashboardViewModel>(
                        builder: (_, model, __) => SliverFixedExtentList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return CheckOutCards(
                                vehicle: model.checkedOutVehicles[index],
                              );
                            },
                            childCount: model.checkedOutVehicles.length,
                          ),
                          itemExtent: 152,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
