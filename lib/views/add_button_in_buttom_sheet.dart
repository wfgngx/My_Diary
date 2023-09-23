import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, this.onTap,  this.isLoading = false, required this.text}) : super(key: key);
  final void Function()? onTap;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
        child:
      Container(
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),

      // width: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: 55,
      child:  Center(
          child: isLoading? const CircularProgressIndicator(color: Colors.black,) :
           Text(text
        ,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      )),
    ));
  }
}
