import 'package:flutter/material.dart';
import '../model/note.dart';
import 'add_edit_note_screen.dart';

class NoteListScreen extends StatefulWidget {
  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];

  void addNote(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      body: notes.isEmpty
          ? const Center(child: Text("No Notes Available"))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].description),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteNote(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditNoteScreen(),
            ),
          );
          if (newNote != null) addNote(newNote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
