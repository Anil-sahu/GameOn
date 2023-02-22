import 'package:flutter/material.dart';

import 'package:play_on/constant/colors.constant.dart';

class TextFields extends StatefulWidget {
  TextEditingController value = TextEditingController();
  String hintText;
  var suffix;
  var prefix;
  bool isobs = false;
  var type;
  TextFields(
      {super.key,
      required this.value,
      required this.hintText,
      required this.prefix,
      required this.suffix,
      required this.isobs,
      required this.type});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

bool showHide = false;

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        // height: 60,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: shadowColor,
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          key: Key(widget.hintText),
          textInputAction: TextInputAction.next,
          keyboardType: widget.type,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: shadowColor,
                fontSize: 15,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              focusColor: Theme.of(context).selectedRowColor,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(
                widget.prefix,
                color: secondryColor,
              ),
              filled: true,
              fillColor: primarColor,
              suffix: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.value.clear();
                    widget.value.text = "";
                  });
                },
                child: Icon(widget.suffix),
              )),
          obscureText: widget.isobs,
          style: TextStyle(color: secondryColor, fontWeight: FontWeight.bold),

          onChanged: ((value) {
            setState(() {
              widget.value.text = value;
            });
          }),
          validator: (value) {
            if (value != null) {
              widget.value.text = value;
            }
          },

          // print(widget.value);
        ));
  }
}
