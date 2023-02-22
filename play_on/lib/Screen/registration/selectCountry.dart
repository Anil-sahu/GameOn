import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/main.screen.dart';
import 'package:play_on/Screen/registration/otpVerification.dart';
import 'package:play_on/controller/mathes.controller.dart';

import '../../constant/colors.constant.dart';
import 'widget/textField.dart';

class SelectYourCountry extends StatefulWidget {
  const SelectYourCountry({super.key});

  @override
  State<SelectYourCountry> createState() => _SelectYourCountryState();
}

class _SelectYourCountryState extends State<SelectYourCountry> {
  var country = TextEditingController();
  String? imgUrl;
  @override
  void initState() {
    Get.find<Matches>().fetchCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: secondryColor,
            elevation: 0,
            title: const Text("Selcet country")),
        body: SingleChildScrollView(
          child: SizedBox(
              width: width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width < 678 ? width : 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          controller: country,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
                              suffix: IconButton(
                                onPressed: () {
                                  country.clear();
                                  setState(() {});
                                },
                                icon: Icon(Icons.close),
                              ),
                              hintText: "Search your country",
                              prefix: imgUrl != null
                                  ? SizedBox(
                                      width: 50,
                                      height: 40,
                                      child: SvgPicture.network(imgUrl!,
                                          semanticsLabel: 'Acme Logo'))
                                  : Icon(
                                      Icons.image,
                                      color: secondryColor,
                                    ),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: shadowColor),
                        ),
                        Container(
                          height: height - 100,
                          child: Obx(
                            () => Get.find<Matches>().country.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        Get.find<Matches>().country.length,
                                    itemBuilder: (context, index) {
                                      if (Get.find<Matches>()
                                          .country[index]['name']
                                          .toString()
                                          .toUpperCase()
                                          .contains(
                                              country.text.toUpperCase())) {
                                        return ListTile(
                                          onTap: () {
                                            setState(() {
                                              country.text = Get.find<Matches>()
                                                  .country[index]['name'];
                                              imgUrl = Get.find<Matches>()
                                                  .country[index]['image'];
                                            });
                                          },
                                          trailing: country.text ==
                                                  Get.find<Matches>()
                                                      .country[index]['name']
                                              ? const Icon(Icons.check_box)
                                              : const Icon(Icons
                                                  .check_box_outline_blank),
                                          leading: SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: SvgPicture.network(
                                                  Get.find<Matches>()
                                                      .country[index]['image'],
                                                  semanticsLabel: 'Acme Logo')),
                                          title: Text(Get.find<Matches>()
                                              .country[index]['name']),
                                        );
                                      } else {
                                        return ListTile(
                                          onTap: () {
                                            setState(() {
                                              country.text = Get.find<Matches>()
                                                  .country[index]['name'];
                                              imgUrl = Get.find<Matches>()
                                                  .country[index]['image'];
                                            });
                                          },
                                          trailing: country.text ==
                                                  Get.find<Matches>()
                                                      .country[index]['name']
                                              ? const Icon(Icons.check_box)
                                              : const Icon(Icons
                                                  .check_box_outline_blank),
                                          leading: SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: SvgPicture.network(
                                                  Get.find<Matches>()
                                                      .country[index]['image'],
                                                  semanticsLabel: 'Acme Logo')),
                                          title: Text(Get.find<Matches>()
                                              .country[index]['name']),
                                        );
                                      }
                                    })
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: secondryColor,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: secondryColor,
          onPressed: () {
            Get.offAll(() => MainPage());
          },
          label: const Text(
            "Start",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ));
  }
}
