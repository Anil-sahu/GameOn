import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/Home/widget/team.dart';
import 'package:play_on/constant/colors.constant.dart';

import '../../controller/mathes.controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.lazyPut(() => Matches());
    Get.find<Matches>().fetchMathes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: secondryColor,
            title: TabBar(
              tabs: [
                Tab(
                  iconMargin: const EdgeInsets.only(bottom: 0),
                  icon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/cricket.png")),
                  text: "Cricket",
                ),
                Tab(
                  iconMargin: const EdgeInsets.only(bottom: 0),
                  icon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/football.png")),
                  text: "FootBall",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AnimationLimiter(
                child: Obx(
                  () => Get.find<Matches>().mathes.isNotEmpty
                      ? ListView.builder(
                          itemCount: Get.find<Matches>().mathes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Obx(() => MatchesWidget(
                                      matche:
                                          Get.find<Matches>().mathes[index])),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: secondryColor,
                          ),
                        ),
                ),
              ),
              const Center(
                child: Text("FootBall"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
