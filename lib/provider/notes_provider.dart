import 'package:flutter/cupertino.dart';
import 'package:noteapp_flutter/services/api_services.dart';

import '../models/Note.dart';

class NotesProvider with ChangeNotifier{
  List<Note> notes= [];

  NotesProvider()
  {
    featchNote();
  }

  void addNote(Note note)
  {
    notes.add (note);
    notifyListeners();
    ApiServices.addNote(note);
  }

  void updateNote(Note note)
  {
    // find the index
    int indexofNote= notes.indexOf(notes.firstWhere((element) => element.id==note.id));
    notes[indexofNote]= note;

    notifyListeners();
    ApiServices.addNote(note);

  }
  void delete(Note note)
  {
    int indexofNote= notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexofNote);
    notifyListeners();
    ApiServices.deleteNote(note);

  }

  void featchNote() async
  {
   notes=await ApiServices.featchNote("Chandrakanta Muduli");

   notifyListeners();
  }


}