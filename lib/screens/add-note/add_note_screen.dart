import 'package:flutter/material.dart';
import 'package:flutter_project/models/note.dart';
import 'package:flutter_project/repository/notes_repository.dart';

class AddNoteScreen extends StatefulWidget {
  final Note? note;
  const AddNoteScreen({super.key, this.note});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      _title.text = widget.note!.title;
      _description.text = widget.note!.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add note'),
          actions: [
            IconButton(
              onPressed: _insertNote,
              icon: const Icon(Icons.done),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: _title,
                decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: TextField(
                  controller: _description,
                  decoration: InputDecoration(
                      hintText: 'Start typing here...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  maxLines: 50,
                ),
              )
            ],
          ),
        )
    );
  }

  _insertNote() async {
    final note  = Note(
        title: _title.text,
        description: _description.text,
        createdAt: DateTime.now()
    );
    await NotesRepository.insert(note: note);
  }

}