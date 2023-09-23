import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/note_list_view.dart';
import '../models/note_model.dart';
import 'add_note_bottom_sheet.dart';

import 'app_bar.dart';

class NotesView extends StatefulWidget {
  // static const List<Color> colors = [Colors.white,Colors.black,Colors.blue,Colors.greenAccent,Colors.yellow,kPrimaryColor];

  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  NoteModel? noteModel;
  @override
  void initState() {
    BlocProvider.of<NnotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<NnotesCubit, NnotesState>(
          builder: (context, state) {
            List<NoteModel> notes =
                BlocProvider.of<NnotesCubit>(context).notes!;
            return notes.length == 0
                ?  Column(children: [SizedBox(height: 30,),
                  CustomAppBar(
            textStyle:
            TextStyle(fontSize: 32, fontFamily: 'Pacifico'),
            title: 'My Diary',
            iconData: Icons.search,
            ),
            SizedBox(height: 270,),
            Center(
                    child: Text(
                      "Start your Journey  📝  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                  )])

                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        CustomAppBar(
                          textStyle:
                              TextStyle(fontSize: 32, fontFamily: 'Pacifico'),
                          title: 'My Diary',
                          iconData: Icons.search,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(child: NotesListView())
                      ],
                    ),
                  );
          },
        ));
  }
}
