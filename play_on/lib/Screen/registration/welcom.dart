import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/registration/Signup.dart';
import 'package:play_on/Screen/registration/signIn.dart';
import 'package:play_on/constant/colors.constant.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 150,
                height: 150,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 50),

                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/logo.png"))),

                // margin: const EdgeInsets.only(left: 20, top: 60),
              ),
              Column(children: [
                Text(
                  "LET'S PLAY",
                  style: TextStyle(
                      color: secondryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "INDIAN'S BIGGEST STORES GAME",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
          Container(
            width: 150,
            height: 150,
            alignment: Alignment.centerLeft,

            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/throw.png"))),

            // margin: const EdgeInsets.only(left: 20, top: 60),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: secondryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: acentColor, shape: BoxShape.circle),
                                child: Icon(
                                  Icons.login_rounded,
                                  color: Theme.of(context).selectedRowColor,
                                  size: 15,
                                ),
                              ),
                              const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    child: TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          Get.to(() => const SignUpScreen());
                        },
                        child: Container(
                          // width: 100,

                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: secondryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: acentColor,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    FontAwesomeIcons.userLarge,
                                    color: primarColor,
                                    size: 15,
                                  )),
                              const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: Expanded(
                    child: Container(
                      // width: 100,

                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(66, 103, 178, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.asset("assets/facebook.png")),
                          const Text(
                            "Facebook",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Column(
                children: [
                  TextButton(
                      style: const ButtonStyle(),
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: Expanded(
                        child: Container(
                          // width: 100,

                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromRGBO(219, 50, 54, 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 20,
                                  height: 20,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Image.asset("assets/google.png")),
                              const Text(
                                "Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
