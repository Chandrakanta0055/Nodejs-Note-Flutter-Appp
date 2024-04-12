import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp_flutter/pages/add_new_note.dart';
import 'package:noteapp_flutter/provider/notes_provider.dart';
import 'package:provider/provider.dart';

import '../models/Note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {


    NotesProvider notesProvider= Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,

      ),
      body:SafeArea(



        child:notesProvider.notes.length>0? GridView.builder(

          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemCount: notesProvider.notes.length,
          itemBuilder: (context,index)
          {
            
            Note currentNote= notesProvider.notes[index];
            return GestureDetector(
              onLongPress: (){
                notesProvider.delete(currentNote);
              },
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=> AddNewNote(isUpdate: true, note: currentNote,)));

              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey,
                    width: 2

                  ),
                ),
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [

                    Text(currentNote.title!,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                    maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 7,),
                    Text(currentNote.content!,style: TextStyle(fontSize: 18),
                    maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )

                  ],
                ),


              ),
            );
          },
        ):Center(child: Text("no item")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, CupertinoPageRoute(
            fullscreenDialog: true,
              builder: (context)=> AddNewNote(isUpdate: false,)));
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
