import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:play_on/Screen/Home/widget/bottomsheet.dart';
import 'package:play_on/constant/colors.constant.dart';

class MatchesWidget extends StatefulWidget {
  var matche;
  MatchesWidget({super.key, required this.matche});

  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  var remainDate;
  var endDate;
  var endTime;
  getDate() {
    endDate =
        DateFormat.MMMd().format(DateTime.parse(widget.matche['date_start']));
    endTime = DateFormat('hh:mm a')
        .format(DateTime.parse(widget.matche['date_start']));
    var startDate = DateTime.parse(widget.matche['date_start']);

    var toDay = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    if (toDay.difference(startDate).inDays < 0) {
      //   if (toDay.difference(startDate).inDays > 30 &&
      //       toDay.difference(startDate).inDays < 365) {
      //     remainDate =
      //         "${toDay.difference(startDate).inDays / 30}M : ${toDay.difference(startDate).toString().split(":")[1]}m";
      //   }
      //   if (toDay.difference(startDate).inDays > 365) {
      //     remainDate =
      //         "${toDay.difference(startDate).inDays / 365}Y : ${toDay.difference(startDate).inDays % 365}d";
      //   }
      //   if (toDay.difference(startDate).inDays >= 7 &&
      //       toDay.difference(startDate).inDays < 30) {
      //     remainDate =
      //         "${toDay.difference(startDate).inDays / 7}W : ${toDay.difference(startDate).toString().split(":")[1]}m";
      // }
      remainDate =
          "${toDay.difference(startDate).inDays}d : ${toDay.difference(startDate).toString().split(":")[1]}m";
    } else {
      remainDate = "Expired";
    }
  }

  @override
  void initState() {
    getDate();
    print(widget.matche);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        mathcDetailBottomSheet(context, widget.matche);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: primarColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 5, color: shadowColor)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.matche['teama']['logo_url'],
                          )),
                      shape: BoxShape.circle,
                      color: Colors.red),
                ),
                Container(
                  width: 95,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Text(widget.matche['teama']['name'],
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "${widget.matche['competition']['country'].toString().toUpperCase()} ${widget.matche['format_str'].toUpperCase()} MATCHE ${widget.matche['competition']['season']}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                RichText(
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  maxLines: 1,
                  textScaleFactor: 1,
                  text: TextSpan(
                    text: "$remainDate",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 1, 56, 150),
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: " $endDate, $endTime",
                          style: const TextStyle(
                              color: Colors.black45, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.matche['teamb']['logo_url'],
                          )),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 95,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(),
                    child: Text(
                      widget.matche['teamb']['name'],
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
