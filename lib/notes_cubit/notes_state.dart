part of 'notes_cubit.dart';

@immutable
abstract class NnotesState {}

class NnotesInitial extends NnotesState {}
class NnotesSuccess extends NnotesState {}

// class ShowNotesLoading extends NnotesState {}
// class ShowNotesSuccess extends NnotesState {
//   final List<NoteModel> notes;
//
//   ShowNotesSuccess(this.notes);
// }
// class ShowNotesFailure extends NnotesState {
//   final String errMessage;
//
//   ShowNotesFailure(this.errMessage);
// }

