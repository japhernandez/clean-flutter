const mongoose = require('mongoose');

const URL_DB = 'mongodb+srv://famibienstar:Root2019*@cluster0.qmvza.mongodb.net/flutter?retryWrites=true&w=majority'

const connectDB = async() => {
    try {
        await mongoose.connect(URL_DB, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
            useCreateIndex: true
        });
        console.log('Conectado a la DB')
    } catch (error) {
        console.log(error);
    }
    
}

module.exports = { connectDB };