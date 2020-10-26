const mongoose = require('mongoose');
require('dotenv').config({path: __dirname + '/.env'})
const connectionString = `mongodb+srv://mongodb_admin:uFDqH40UZfV66bdZ@cluster0.phwl8.azure.mongodb.net/coaching?retryWrites=true&w=majority`;

//NIT - Fiz reference to env variables test mongoose.connect("mongodb+srv://@cluster0.phwl8.azure.mongodb.net/coaching?retryWrites=true&w=majority", { user: process.env.MONGO_USER, pass: process.env.MONGO_PASSWORD, useNewUrlParser: true, useUnifiedTopology: true })

async function connect() {


    // get an environment variable
//NIT TOBE tested export const token = process.env['API_TOKEN'];

    const password = process.env['DATABASE_PASSWORD']
    const database = process.env['DATABASE_NAME']
    const user = process.env['DATABASE_USER']
    

    const uri = 'mongodb+srv://'+user+':'+password+'@cluster0.phwl8.azure.mongodb.net/'+database+'?retryWrites=true'



    await mongoose.connect(uri, {useNewUrlParser: true, useUnifiedTopology: true })
    .then(mongoose => {
      console.log('Connected to Database')
      //const db = mongoClient.db('coaching')
      //const usersCollection = db.collection('users')
  })
      .catch(console.error)


}

module.exports = {connect};