import 'package:flutter/material.dart';
import 'package:notes_app/views/search_icon.dart';

import 'notes_view.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function()? onPressed;
  final TextStyle textStyle;
  const CustomAppBar({Key? key, required this.title, required this.iconData, this.onPressed, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          title,
          style:  textStyle,
        ),
        // Spacer(),
        // SearchIconInAppBar(
        //   onPressed: onPressed,
        //   appBarIcon: iconData,
        // )
      ],
    );
  }
}
