import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/create_note/add_note.dart';

class ColorItem extends StatelessWidget {
  final bool isActive;
  final Color color;
  const ColorItem({Key? key, required this.isActive, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 26,
            child: CircleAvatar(
              radius: 23,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 25,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = [
    const Color.fromRGBO(250, 164, 143, 1),
    const Color.fromRGBO(235, 159, 159, 1),
    const Color.fromRGBO(246, 229, 179, 1),
    const Color.fromRGBO(204, 237, 239, 1.0),
    const Color(0xff482C3D),
    const Color(0xfff8e7b4),
    const Color.fromRGBO(99, 253, 217, 1),
    Colors.white
    // Color(0xffAC3931),
    // Color(0xffE5D352),
    // Color(0xffD9E76C),
    // Color(0xff537D8D),
    // Color(0xff482C3D)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 33 * 2,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      BlocProvider.of<NotesCubit>(context).color =
                          colors[index];
                      setState(() {});
                    },
                    child: ColorItem(
                      color: colors[index],
                      isActive: currentIndex == index,
                    )));
          },
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
        ));
  }
}
