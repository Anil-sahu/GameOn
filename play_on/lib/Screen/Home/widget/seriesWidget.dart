import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:play_on/Screen/Home/Invitetion-code.dart';
import 'package:play_on/Screen/Home/create-contest.dart';
import 'package:play_on/Screen/Home/create-team.dart';
import 'package:play_on/Screen/Home/widget/contest.dart';
import '../../../constant/colors.constant.dart';

class SeriesWidget extends StatefulWidget {
  var match;
  SeriesWidget({super.key, required this.match});

  @override
  State<SeriesWidget> createState() => _SeriesWidgetState();
}

class _SeriesWidgetState extends State<SeriesWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(100, 120),
            child: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              backgroundColor: secondryColor,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 40,
                                height: 50,
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        widget.match['teama']['logo_url'],
                                      )),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Text(
                              widget.match['teama']['short_name'],
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primarColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            "VS",
                            style: TextStyle(
                                color: acentColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 25),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        widget.match['teamb']['logo_url'],
                                      )),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Text(
                              widget.match['teamb']['short_name'],
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primarColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('hh:mm a')
                          .format(DateTime.parse(widget.match['date_start'])),
                      style: TextStyle(color: acentColor),
                    )
                  ],
                ),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "Contest",
                  ),
                  Tab(
                    text: "MyContes",
                  ),
                  Tab(
                    text: "Team",
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                    children:
                        List.generate(10, (index) => const ContestWidget())),
              ),
              SingleChildScrollView(
                child: Column(
                    children:
                        List.generate(10, (index) => const ContestWidget())),
              ),
              const Center(
                child: Text("Team"),
              )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: FloatingActionBubble(
            // Menu items
            items: <Bubble>[
              Bubble(
                title: "Create Contest",
                iconColor: Colors.white,
                bubbleColor: secondryColor,
                icon: Icons.circle,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  Get.to(() => CreateContest(match: widget.match));
                  _animationController.reverse();
                },
              ),
              Bubble(
                title: "Create Team",
                iconColor: Colors.white,
                bubbleColor: secondryColor,
                icon: Icons.circle,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  Get.to(() => const CreateTeam());
                  _animationController.reverse();
                },
              ),
              Bubble(
                title: "Enter code",
                iconColor: Colors.white,
                bubbleColor: secondryColor,
                icon: Icons.circle,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController.reverse();
                  Get.to(() => const EnterInvitationCode());
                },
              ),
            ],
            animation: _animation,
            onPress: () {
              _animationController.isCompleted
                  ? _animationController.reverse()
                  : _animationController.forward();
              setState(() {});
            },

            iconColor: Colors.amber,

            // Flaoting Action button Icon
            iconData: Icons.add,
            backGroundColor: secondryColor,
          ),
        ),
      ),
    );
  }
}
