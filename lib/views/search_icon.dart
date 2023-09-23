import 'package:flutter/material.dart';

class SearchIconInAppBar extends StatelessWidget {
  final IconData appBarIcon;
  const SearchIconInAppBar({Key? key, required this.appBarIcon, this.onPressed})
      : super(key: key);
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(0.05)),
      child: IconButton(icon:Icon(appBarIcon,color: Colors.black,),onPressed: onPressed

      ,),
    );
  }
}
