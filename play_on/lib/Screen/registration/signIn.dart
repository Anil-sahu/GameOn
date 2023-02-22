import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/registration/Signup.dart';
import 'package:play_on/Screen/registration/forgetPassword.dart';

import '../../constant/colors.constant.dart';
import '../../controller/mathes.controller.dart';
import '../main.screen.dart';
import 'widget/textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    Get.lazyPut(() => Matches());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: width * 1,
            height: height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                SizedBox(
                  width: width < 678 ? width : 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFields(
                          value: email,
                          hintText: "Enter email address...",
                          prefix: Icons.email,
                          suffix: Icons.close,
                          isobs: false,
                          type: TextInputType.emailAddress),
                      TextFields(
                          value: password,
                          hintText: "Enter password...",
                          prefix: Icons.lock,
                          suffix: FontAwesomeIcons.eyeSlash,
                          isobs: true,
                          type: TextInputType.visiblePassword),
                      TextButton(
                          style: const ButtonStyle(),
                          onPressed: () {
                            Get.offAll(() => const MainPage());
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
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: ''),
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => const ForgetPassword());
                            },
                            child: Text(
                              "Forget password",
                              style: TextStyle(
                                  color: secondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      margin: const EdgeInsets.only(top: 20, bottom: 30),
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 20, right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(219, 50, 54, 1)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )),
              ],
            )),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: const SingleChildScrollView(
          // child: Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          //   ),
          //   width: width < 678 ? width : 500,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       TextFields(
          //           value: email,
          //           hintText: "Enter email address...",
          //           prefix: Icons.email,
          //           suffix: Icons.close,
          //           isobs: false,
          //           type: TextInputType.emailAddress),
          //       TextFields(
          //           value: password,
          //           hintText: "Enter password...",
          //           prefix: Icons.lock,
          //           suffix: FontAwesomeIcons.eyeSlash,
          //           isobs: true,
          //           type: TextInputType.visiblePassword),
          //       Align(
          //         alignment: Alignment.centerLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 20),
          //           child: TextButton(
          //             onPressed: () {},
          //             child: Text(
          //               "Forget password",
          //               style: TextStyle(
          //                   color: Theme.of(context).selectedRowColor,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 16),
          //             ),
          //           ),
          //         ),
          //       ),
          //       TextButton(
          //           style: const ButtonStyle(),
          //           onPressed: () {},
          //           child: Container(
          //             width: 200,
          //             padding: const EdgeInsets.only(
          //                 top: 10, bottom: 10, left: 20, right: 20),
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(12),
          //                 color: Theme.of(context).selectedRowColor),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                   padding: const EdgeInsets.all(8),
          //                   decoration: const BoxDecoration(
          //                       color: Colors.amber, shape: BoxShape.circle),
          //                   child: Icon(
          //                     Icons.login_rounded,
          //                     size: 20,
          //                     color: Theme.of(context).selectedRowColor,
          //                   ),
          //                 ),
          //                 Container(
          //                   margin:
          //                       const EdgeInsets.only(left: 20, right: 20),
          //                   child: const Text(
          //                     "Login",
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20,
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           )),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
