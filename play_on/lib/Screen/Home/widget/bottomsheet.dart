import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:play_on/Screen/Home/series.dart';
import 'package:play_on/constant/colors.constant.dart';

mathcDetailBottomSheet(context, matche) {
  return showModalBottomSheet(
      backgroundColor: secondryColor,
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Get.to(() => SeriesPage(
                  match: matche,
                ));
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${matche['competition']['country'].toString().toUpperCase()} ${matche['format_str'].toUpperCase()} MATCHE ${matche['competition']['season']}",
                        style: TextStyle(
                            color: primarColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        softWrap: true,
                        maxLines: 1,
                        textScaleFactor: 1,
                        text: TextSpan(
                          text: "2d:45 ",
                          style: TextStyle(color: acentColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: " | ",
                                style: TextStyle(
                                    color: primarColor,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: " Jun 21, 10:10 PM",
                                style: TextStyle(color: acentColor)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      matche['teama']['logo_url'],
                                    )),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 150,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(),
                              child: Text(
                                matche['teama']['name'],
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primarColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "VS",
                          style: TextStyle(
                              color: acentColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 30),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      matche['teamb']['logo_url'],
                                    )),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 150,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(),
                              child: Text(
                                matche['teamb']['name'],
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primarColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    texWidget(
                      context,
                      "Match",
                      matche['short_title'].toString().split("(")[0],
                    ),
                    texWidget(
                      context,
                      "Series",
                      matche['competition']['abbr'].toString(),
                    ),
                    texWidget(
                      context,
                      "Start Date",
                      matche['competition']['datestart'].toString(),
                    ),
                    texWidget(
                      context,
                      "Start Time",
                      DateFormat("hh:mm a").format(
                          DateTime.parse(matche['date_start'].toString())),
                    ),
                    texWidget(
                      context,
                      "Venue",
                      matche['venue']['country'].toString(),
                    ),
                    texWidget(
                      context,
                      "Umpires",
                      matche['umpires'].toString().split("(")[0],
                    ),
                    texWidget(
                      context,
                      "Referee",
                      matche['referee'].toString().split("(")[0],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

texWidget(context, title, value) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 40,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: primarColor, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 40,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: primarColor, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}
