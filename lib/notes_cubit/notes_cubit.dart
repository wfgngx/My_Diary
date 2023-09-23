import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../constants.dart';
import '../models/note_model.dart';

part 'notes_state.dart';

class NnotesCubit extends Cubit<NnotesState> {
  NnotesCubit() : super(NnotesInitial());
 List <NoteModel>? notes;
  fetchAllNotes() async {
      var noteBox = Hive.box<NoteModel>(kPrimaryNoteBoxName);
      notes=  noteBox.values.toList();
      emit(NnotesSuccess());
      // emit(ShowNotesSuccess(notes));
    // try {
    //   var noteBox = Hive.box<NoteModel>(kPrimaryNoteBoxName);
    //  List<NoteModel> notes=  noteBox.values.toList();
    //   emit(ShowNotesSuccess(notes));
    // }
    // catch (e) {
    //   emit(ShowNotesFailure(e.toString()));
    // }
  }
}
