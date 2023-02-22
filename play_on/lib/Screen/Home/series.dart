import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/Home/widget/seriesWidget.dart';
import 'package:play_on/constant/colors.constant.dart';

import '../../controller/mathes.controller.dart';

class SeriesPage extends StatefulWidget {
  var match;
  SeriesPage({super.key, required this.match});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  void initState() {
    Get.lazyPut(() => Matches());
    Get.find<Matches>().fetchMathes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: secondryColor,
        title: Text(
          widget.match['competition']['abbr'].toString() +
              "  " +
              widget.match['format_str'].toUpperCase(),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.trophy,
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.bell,
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.calendar,
                size: 20,
              ))
        ],
      ),
      body: SeriesWidget(
        match: widget.match,
      ),
    );
  }
}
