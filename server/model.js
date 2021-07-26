const mongoose = require('mongoose');

const { Schema, model } = require('mongoose');


const SurveySchema = Schema({
   
    question: {
        type: String,
        required: true
    },
    date: {
        type: String,
        required: true,
    },
    didAnswer: {
        type: Boolean,
        required: true
    }
}, { timestamps: false, versionKey: false });


module.exports = model('survey', SurveySchema );