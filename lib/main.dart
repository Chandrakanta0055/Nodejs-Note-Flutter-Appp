import 'package:flutter/material.dart';
import 'package:noteapp_flutter/pages/Homepage.dart';
import 'package:noteapp_flutter/provider/notes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[// change the ui
          ChangeNotifierProvider(create: (context)=> NotesProvider()),
        ] ,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage() ,
    ) ,
    );



    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: HomePage() ,
    // );
  }
}

