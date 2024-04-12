import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Note.dart';
class ApiServices{
 static String _baseUrl= "http://192.168.213.86:5000/notes";

 static Future<void> addNote(Note note)async
 {

   Uri responseUrl = Uri.parse(_baseUrl+"/add");
   var response = await http.post(responseUrl,body:  note.toMap());
   var decoded= jsonDecode(response.body);
   print(decoded);

 }


 static Future<void> updateNote(Note note)async
 {

   Uri responseUrl = Uri.parse(_baseUrl+"/add");
   var response = await http.post(responseUrl,body:  note.toMap());
   var decoded= jsonDecode(response.body);
   print(decoded+"Update sucessfully");
 }

 static Future<void> deleteNote(Note note) async
 {
   try {
     Uri url = Uri.parse(_baseUrl + "/delete");
     var response = await http.post(url, body: note.toMap()["id"]);
     var decoded = jsonDecode(response.body);
     print(decoded);
   }
   catch(e)
   {
     print(e);
   }

 }


 static Future<List<Note>> featchNote(String userid) async
 {
   Uri url= Uri.parse(_baseUrl+"/list/");

   var response= await http.post(url,body: userid);
   var decoded= jsonDecode(response.body);
   print(decoded);
   List<Note> myNote=[];
   for (var noteMap in decoded)
     {
      Note note=Note.fromMap(noteMap);
      myNote.add(note);

     }



   return myNote;

 }




 }
