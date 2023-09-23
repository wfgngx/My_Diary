import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/edit_note-view.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNote(
              note: widget.note,
            );
          }));
        },
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 12,
          ),
          // height: 100,
          // width: 200,
          decoration: BoxDecoration(
            color: Color(widget.note.color),
            // 253
            // 204
            //122
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(widget.note.title,
                    style: const TextStyle(color: Colors.black, fontSize: 26,fontWeight: FontWeight.bold)),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 12),
                    child: Text(widget.note.subTitle,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 20))),
                trailing: IconButton(
                  color: Colors.black,
                  onPressed: (){
                 widget.note.color=const Color.fromARGB(168, 255, 22, 0).value;
                 widget.note.title="Deleted";
                 widget.note.subTitle="";
                 widget.note.date="";
                     setState(() {
                     });
                    Timer(const Duration(seconds: 1), () {
                      widget.note.delete();
                      BlocProvider.of<NnotesCubit>(context).fetchAllNotes();
                    });
                    // widget.note.delete();
                    // BlocProvider.of<NnotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(Icons.delete, size: 30),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    widget.note.date,
                    style: const TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ));
  }
}
