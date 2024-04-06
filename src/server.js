  const express = require('express');// get the exprex module  object
  const app= express();// make the object of express
  
  const mongoose= require("mongoose");
// import the note model
const Note = require("./models/Note");

const bodyParser= require("body-parser");
app.use(bodyParser.urlencoded({extended: false}));
// true -> nested object (correct)
// false -> nesetd object (not correct)
app.use(bodyParser.json());


// connect the data base
const mongodbPath="mongodb+srv://chandrakantamuduli86:Mnbvcxz123414@tutorial.7yxppds.mongodb.net/notesDB";
mongoose.connect(mongodbPath).then(
    function()
    {
 // if sucecssfully conect the data base then access the data base...... 


       // make the home page route("/")
      app.get("/",function(req,res){
      //  res.send("this is the home page");
       const response ={"message":"API works"};
       res.json(response);
        });
        console.log("home route create ");


        const noteRouter= require("./routes/Note");
        app.use("/notes",noteRouter);


    }
);// connect the data base

const PORT= process.env.PORT || 5000
  
app.listen(5000,function()
{
    console.log("server start at port :"+PORT);
});// port 




