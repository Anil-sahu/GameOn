import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:play_on/constant/colors.constant.dart';

class ContestWidget extends StatefulWidget {
  const ContestWidget({super.key});

  @override
  State<ContestWidget> createState() => _ContestWidgetState();
}

class _ContestWidgetState extends State<ContestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: primarColor,
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 5,
                color: Color.fromARGB(255, 192, 191, 191))
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "Prize pool",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "\$ 1000",
                      style: TextStyle(
                          color: secondryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Winner",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: secondryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Entry",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    color: hilightColor,
                    child: Text(
                      "\$ 556",
                      style: TextStyle(
                          color: primarColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: 10,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              height: 10,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: hilightColor, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2 spot left",
                style: TextStyle(
                    color: acentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "2 spot",
                style: TextStyle(
                    color: acentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ]),
    );
  }
}
