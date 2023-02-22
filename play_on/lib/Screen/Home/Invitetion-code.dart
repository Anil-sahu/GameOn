import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/registration/widget/textField.dart';

import '../../constant/colors.constant.dart';

class EnterInvitationCode extends StatefulWidget {
  const EnterInvitationCode({super.key});

  @override
  State<EnterInvitationCode> createState() => _EnterInvitationCodeState();
}

class _EnterInvitationCodeState extends State<EnterInvitationCode> {
  TextEditingController invitationCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: secondryColor,
          elevation: 0,
          title: const Text("Invitation Code")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("If you have an invitaion code then enter and join",
              style: TextStyle(color: secondryColor, fontSize: 16)),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: const EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                  label: Text("Enter Invitaition code"),
                  labelStyle: TextStyle(
                      color: secondryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
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
                  "Join",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
