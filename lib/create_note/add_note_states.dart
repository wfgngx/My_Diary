part of 'add_note.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesLoading extends NotesState {}
class NotesSuccess extends NotesState {}
class NotesFailure extends NotesState {
  final String? errMessage;

  NotesFailure(this.errMessage);
}

