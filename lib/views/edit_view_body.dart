import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/add_button_in_buttom_sheet.dart';
import 'package:notes_app/views/app_bar.dart';
import 'package:notes_app/views/custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();

}

class _EditViewBodyState extends State<EditViewBody> {
   String? title,content;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:
        SingleChildScrollView(child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
             CustomAppBar(
               textStyle:const TextStyle(fontSize: 32),
              onPressed:(){
                widget.note.title = title?? widget.note.title;
                widget.note.subTitle = content?? widget.note.subTitle;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NnotesCubit>(context).fetchAllNotes();


              } ,
              title:'Edit Note',
              iconData: Icons.done,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              onChange:(value){
                title = value;
              } ,

                titleOrDescription: widget.note.title),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              onChange: (value){
                content = value;
              },
              titleOrDescription: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(height: 50,),
            AddButton(onTap: (){
              widget.note.title = title?? widget.note.title;
              widget.note.subTitle = content?? widget.note.subTitle;
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<NnotesCubit>(context).fetchAllNotes();
            },
            text: "Save",)
          ],
        )));
  }
}
