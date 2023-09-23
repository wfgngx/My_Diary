import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/create_note/add_note.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
// import 'package:notes_app/models/note_model.dart';
// import 'package:notes_app/views/add_button_in_buttom_sheet.dart';
// import 'package:notes_app/views/custom_text_field.dart';
// import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'NoteBottomSheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
            child: BlocConsumer<NotesCubit, NotesState>(
                listener: (context, state) {
          if (state is NotesFailure) {
            print('Failed${state.errMessage}');
          }
          if (state is NotesSuccess) {
            BlocProvider.of<NnotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is NotesLoading ? true : false,
            // child:
            // Padding(
                // padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const NoteBottomSheet(),
          );
          // NoteBottomSheet();
        })
            // listener: (context, state) {
            //   // if(state is NotesFailure){
            //   //   print('Failed${state.errMessage}');
            //   // }
            //   // if(state is NotesSuccess){
            //   //
            //   //   Navigator.pop(context);
            // }
            )
        // NoteBottomSheet()
        );
  }
}
