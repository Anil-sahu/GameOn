import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constant/colors.constant.dart';

class CreateContest extends StatefulWidget {
  var match;
  CreateContest({super.key, required this.match});

  @override
  State<CreateContest> createState() => _CreateContestState();
}

class _CreateContestState extends State<CreateContest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: secondryColor,
          elevation: 0,
          title: const Text("Make your own contest")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
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
                                color: secondryColor,
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
                                color: secondryColor,
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
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        label: Text("Contest name"),
                        labelStyle: TextStyle(
                            color: secondryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            label: Text("Winning Ammount"),
                            labelStyle: TextStyle(
                                color: secondryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Min 0",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: secondryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            label: Text("Contest Size"),
                            labelStyle: TextStyle(
                                color: secondryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Min 2",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: secondryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                      // width: 100,

                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: secondryColor),
                      child: const Text(
                        "Create Contest",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
