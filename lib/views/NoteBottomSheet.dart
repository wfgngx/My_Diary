import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/create_note/add_note.dart';
import 'package:notes_app/models/note_model.dart';

import 'add_button_in_buttom_sheet.dart';
import 'colorListView.dart';
import 'custom_text_field.dart';

class NoteBottomSheet extends StatefulWidget {
  const NoteBottomSheet({Key? key}) : super(key: key);

  @override
  State<NoteBottomSheet> createState() => _NoteBottomSheetState();
}

class _NoteBottomSheetState extends State<NoteBottomSheet> {
  String? title, subTitle;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: autoValidateMode,
        key: formKey,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            titleOrDescription: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            titleOrDescription: 'Content',
            maxLines: 4,
          ),
          const SizedBox(
            height: 25,
          ),
          const ColorsListView(),
          BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
            return AddButton(
              text: "Add",
              isLoading: state is NotesLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat.yMMMEd().format(currentDate);
                  var noteModel = NoteModel(
                      title: title!,
                      color: Colors.blue.value,
                      date: formattedCurrentDate,
                      subTitle: subTitle!);
                  BlocProvider.of<NotesCubit>(context).addNote(noteModel);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }),
          const SizedBox(
            height: 10,
          )
        ]));
  }
}
