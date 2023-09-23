import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_states.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  Color color = const Color(0xffAC3931);

  addNote(NoteModel note) async {
    note.color = color.value;
    emit(NotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kPrimaryNoteBoxName);
      await noteBox.add(note);
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
