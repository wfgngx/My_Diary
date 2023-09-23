import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/create_note/add_note.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/edit_note-view.dart';
import 'package:notes_app/views/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NnotesCubit, NnotesState>(builder: (context, state) {
      // List<NoteModel> notes = BlocProvider.of<NnotesCubit>(context).notes??[];
      List<NoteModel> notes = BlocProvider.of<NnotesCubit>(context).notes!;
      return (Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: NoteItem(
                      note: notes[index],
                    ));
              })));
    });
    // GestureDetector(
    //   onTap: () {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return EditNote();
    //     }));
    //   },
    //   child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 8),
    //       child: ListView.builder(
    //         itemCount: ,
    //           padding: EdgeInsets.zero,
    //           itemBuilder: (context, index) {
    //             return const Padding(
    //                 padding: EdgeInsets.only(bottom: 8), child: NoteItem());
    //           })));
  }
}
