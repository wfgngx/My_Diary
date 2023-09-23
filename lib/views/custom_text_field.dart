import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  String titleOrDescription;
  int maxLines;

  CustomTextField(
      {Key? key,
      required this.titleOrDescription,
      this.maxLines = 1,
      this.onSaved,this.onChange})
      : super(key: key);
  void Function(String?)? onSaved;
  void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChange,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        maxLines: maxLines,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            hintText: titleOrDescription,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(kPrimaryColor)));
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
