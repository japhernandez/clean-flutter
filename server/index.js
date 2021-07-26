const express = require('express');
const app = express();
const { connectDB } = require('./config') 
const Survey = require('./model')


const PORT = process.env.PORT || 3000;


connectDB();

app.use(express.json());

app.post('/api/surveys', (req, res) => {
    saveSurvey(req, res);
});


app.get('/api/surveys', (req, res) => {
    listSurveys(req, res);
});


app.listen(PORT, () => console.log(`Server running on port: ${PORT}`));


const saveSurvey = async (req, res) => {
    try {
        const survey = new Survey(req.body);

        const result = await survey.save();

        return res.json(result);

    } catch (error) {
       console.log(error) 
    }
}

const listSurveys = async (req, res) => {
    try {
        const result = await Survey.find().select('-_id');
    
        return res.json(result);
        
    } catch (error) {
        console.log(error)
    }

}

