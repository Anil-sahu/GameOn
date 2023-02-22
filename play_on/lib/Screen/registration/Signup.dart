import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:play_on/Screen/main.screen.dart';
import 'package:play_on/Screen/registration/selectCountry.dart';
import 'package:play_on/Screen/registration/signIn.dart';
import 'package:play_on/controller/mysql.dart';

import '../../constant/colors.constant.dart';
import 'widget/textField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  var c_password = TextEditingController();
  TextEditingController address = TextEditingController();
  String batch = "Unknown";
  TextEditingController stream = TextEditingController();
  bool isStudent = true;
  bool isFaculty = false;
  final _key = GlobalKey<FormState>();

  var dropdownvalue = 0;
  var gender = "Gender";
  var dateInput;
  MySql sql = MySql();
  insertData() {
    sql.getConnection().then((value) async {
      var queries = "INSERT INTO user (name,email,password) VALUES (?,?,?)";
      var result =
          await value.query(queries, [name.text, email.text, password.text]);
      debugPrint(result.toString());
    });
  }

  var items = ['Gender', 'Male', 'Femal', 'Other'];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondryColor,
          title: const Text("Hello! Register to get start"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
              width: width * 1,
              // height: height * 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _key,
                  child: SizedBox(
                    width: width < 678 ? width : 500,
                    // height: height-200,
                    // color: primary,
                    child: Column(
                      children: [
                        TextFields(
                            value: name,
                            hintText: "Username",
                            prefix: Icons.person,
                            suffix: Icons.close,
                            isobs: false,
                            type: TextInputType.name),
                        TextFields(
                            value: email,
                            hintText: "Eamil",
                            prefix: Icons.email,
                            suffix: Icons.close,
                            isobs: false,
                            type: TextInputType.text),
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width / 2.2 - 10,
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: primarColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: shadowColor,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  children: [
                                    Container(
                                      child: IconButton(
                                        onPressed: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2100));
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);

                                            setState(() {
                                              dateInput =
                                                  formattedDate; //set output date to TextField value.
                                            });
                                          } else {}
                                          //   }),
                                        },
                                        icon: Icon(
                                          Icons.date_range_rounded,
                                          color: secondryColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: primarColor,
                                      padding: const EdgeInsets.only(
                                          left: 0,
                                          bottom: 14,
                                          top: 14,
                                          right: 14),
                                      child: dateInput == null
                                          ? Text(
                                              "DOB",
                                              style: TextStyle(
                                                  color: shadowColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              "$dateInput",
                                              style: TextStyle(
                                                  color: secondryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: width / 2.2 - 20,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: primarColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: shadowColor,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "",
                                      style: TextStyle(
                                        color: secondryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                    DropdownButton(
                                      // Initial Value
                                      underline: const SizedBox(),
                                      value: gender,

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                                color: secondryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }).toList(),

                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFields(
                            value: address,
                            hintText: "Address Raipur, Chattisgarh",
                            prefix: Icons.location_city,
                            suffix: Icons.close,
                            isobs: false,
                            type: TextInputType.text),
                        TextFields(
                            value: mobile,
                            hintText: "Mobile number",
                            prefix: Icons.phone,
                            suffix: Icons.close,
                            isobs: false,
                            type: TextInputType.number),
                        TextFields(
                            value: password,
                            hintText: "Create a password",
                            prefix: Icons.lock,
                            suffix: FontAwesomeIcons.eyeSlash,
                            isobs: true,
                            type: TextInputType.visiblePassword),
                        TextFields(
                            value: c_password,
                            hintText: "Confirm password",
                            prefix: Icons.lock,
                            suffix: FontAwesomeIcons.eyeSlash,
                            isobs: true,
                            type: TextInputType.visiblePassword),
                        TextButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                              insertData();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: width,
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 30),
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: secondryColor),
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: RichText(
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              maxLines: 1,
                              textScaleFactor: 1,
                              text: const TextSpan(
                                text: "Already have an acount",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 1, 56, 150),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: " Click",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 1, 56, 150),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
