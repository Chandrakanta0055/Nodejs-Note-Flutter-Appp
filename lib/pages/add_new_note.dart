

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noteapp_flutter/models/Note.dart';
import 'package:noteapp_flutter/provider/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNote extends StatefulWidget {
  final bool isUpdate;
  final Note? note;

  const AddNewNote({super.key, required this.isUpdate,this.note});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  TextEditingController titleController= TextEditingController();
  TextEditingController contentController= TextEditingController();


  FocusNode node= FocusNode();

  void addNewNote()
  {
   print("add note");
   Note note= new Note(
     id: Uuid().v1(),
     userid: "Chandrakanta Muduli",
     title: titleController!.text!,
     content: contentController!.text!,
     dateadded: DateTime.now(),
   );

   // to know to Provider
    Provider.of<NotesProvider>(context,listen: false).addNote(note!);
    Navigator.pop(context);

  }

  void updateNote()
  {
    widget.note!.title= titleController.text;
    widget.note!.content= contentController.text;
    Provider.of<NotesProvider>(context,listen: false).updateNote(widget.note!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    if(widget.isUpdate)
      {
        titleController.text= widget.note!.title!;
        contentController.text= widget.note!.content!;

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

            setState(() {
              if(widget.isUpdate)
              {
                updateNote();
              }
              else {
                addNewNote();
              }
            });


          }, icon: Icon(Icons.check))
        ],

      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
               TextField(
                 controller: titleController,

                 onSubmitted: (val){//after put the value is focush another text fiels
                   if(val!="")
                     {
                       node.requestFocus();
                     }
                 },

                autofocus: widget.isUpdate?false: true,
                style: TextStyle(

                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                decoration: InputDecoration(
                  hintText: "Title",
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(4))
                    // )

                ),
              ),
              Expanded(
                child:  TextField(
                  controller: contentController,
                  focusNode: node,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      hintText: "Note",
                    border: InputBorder.none
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
