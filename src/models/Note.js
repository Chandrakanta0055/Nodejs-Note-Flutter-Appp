// steps:

// 1) define Schema exmple -> Notes: id, userid, title ,content, dateadded 
// 2) Create a model using this schema -> < model name>  <Schema> Note

const mongoose = require('mongoose');// create the instance of mongoose

const notesSchema = mongoose.Schema({// decribe the schema

    id:{
        type: String ,
        unique: true,
        require: true

    },
    userid:{
        type: String,
        require : true
    },
    title: {
        type: String,
        require: true
    },
    content: {
        type: String 
    },
    dateadded: {
        type: Date,
        default: Date.now
    }
});
// create a model 
// another tings we need to export the models to access  an another file

module.exports=  mongoose.model("Note",notesSchema);
