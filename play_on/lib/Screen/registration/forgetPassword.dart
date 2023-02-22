import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/registration/otpVerification.dart';

import '../../constant/colors.constant.dart';
import 'widget/textField.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: secondryColor,
          elevation: 0,
          title: const Text("Forget password")),
      body: SingleChildScrollView(
        child: SizedBox(
            width: width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                SizedBox(
                  width: width < 678 ? width : 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Please! Enter the email address linked your acount",
                        style:
                            TextStyle(color: Colors.grey, fontFamily: "Sans"),
                      ),
                      TextFields(
                          value: email,
                          hintText: "Enter email address",
                          prefix: Icons.email,
                          suffix: Icons.close,
                          isobs: false,
                          type: TextInputType.emailAddress),
                      TextButton(
                          style: const ButtonStyle(),
                          onPressed: () {
                            Get.to(() => const OTPVerification());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            margin: const EdgeInsets.only(top: 30, bottom: 10),
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: secondryColor),
                            child: const Text(
                              "Send Code",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
