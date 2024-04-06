const express = require("express");
const app= express.Router();// !! here we create oblect of router
const Note= require("./../models/Note");// "../ means 1 folder back"



app.get("/list/",async function(req,res){

    var note=  await Note.find();
    res.json(note);

  });

  
  app.get("/list/:userid", async function(req,res){

    var note = await Note.find({userid: req.params.userid});
    res.json(note);
  
  });

  // make it post request
  app.post("/list/", async function(req,res){

    var note = await Note.find({userid: req.body.userid});
    res.json(note);
  
  });




    //save the data in mongoose
  
  //   app.get("/notes/add", async function(req, res) {
  //     try {
  //         const newNote = new Note({
  //             id: "0003",
  //             userid: "chandrakanta",
  //             title: "this is my note 3",
  //             content: "this is the content of my third note"
  //         });
  

  //         await newNote.save();
  //         console.log("Data added successfully");
  //         res.json({ message: "Data successfully added" });

  //     } catch (error) {
  //         console.error("Error adding data:", error);
  //         res.status(500).json({ error: "Internal server error" });
  //     }
  // });


  // send the data in post request using parameter 
  app.post("/add",async  function(req,res){

    // res.json(req.body);

    await Note.deleteOne({id: req.body.id});
    const newNote= new Note({

      id: req.body.id,
      userid: req.body.userid,
      title:req.body.title,
      content: req.body.connect,

    });

     await newNote.save();

     const response ={message: " new note created!" + `id:${req.body.id}`};
     res.json(response);
     console.log("note create sucessfully");

  });


  // delete request 
  app.post("/delete", async function(req,res){

    await Note.deleteOne({id: req.body.id});

    const response ={ message: "note deleted sucessfully! "+ `id: ${req.body.id}`};

    res.json(response);

  });


  module.exports= app;
  