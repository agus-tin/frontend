const express = require('express')
const bodyParser = require('body-parser')
const MongoClient = require('mongodb').MongoClient
const mongoose = require('mongoose')
const app = express()

const port = 3000 || process.env.PORT
const morgan = require('morgan')
const cors = require('cors')

// ========================
// Link to Database
// ========================
// Updates environment variables
// @see https://zellwk.com/blog/environment-variables/
require('./dotenv')

// Replace process.env.DB_URL with your actual connection string
const connectionString = process.env.DB_URL
const uri = "mongodb+srv://mongodb_admin:1fvhAPXGDqYFp7@cluster0.phwl8.azure.mongodb.net/sample_training?retryWrites=true&w=majority";
//const mongoClient = new MongoClient(uri, { useUnifiedTopology: true });


MongoClient.connect(connectionString, { useUnifiedTopology: true })
  .then(mongoClient => {
    console.log('Connected to Database')
    const db = mongoClient.db('coaching')
    const usersCollection = db.collection('users')

 

    // ========================
    // Middlewares
    // ========================
    //NIT To test app.use(morgan, ('dev'))
    app.set('view engine', 'ejs')
    app.use(bodyParser.urlencoded({ extended: true }))
    app.use(bodyParser.json())
    app.use(express.static('public'))

    // ========================
    // Routes
    // ========================
    app.get('/', (req, res) => {
      db.collection('users').find().toArray()
        .then(users => {
          res.render('users.ejs', { users: users })
        })
        .catch(/* ... */)
    })

    app.post('/users', (req, res) => {
      usersCollection.insertOne(req.body)
        .then(result => {
          res.redirect('/')
        })
        .catch(error => console.error(error))
    })

    app.put('/users', (req, res) => {
      usersCollection.findOneAndUpdate(
        { email: 'Yoda' },
        {
          $set: {
            email: req.body.email,
            password: req.body.password
          }
        },
        {
          upsert: true
        }
      )
        .then(result => res.json('Success'))
        .catch(error => console.error(error))
    })

    app.delete('/users', (req, res) => {
      usersCollection.deleteOne(
        { email: req.body.email }
      )
        .then(result => {
          if (result.deletedCount === 0) {
            return res.json('No User to delete')
          }
          res.json('Deleted Darth Vadar\'s user')
        })
        .catch(error => console.error(error))
    })



    app.get('/', (req, res) => {
      db.collection('users').find().toArray()
        .then(users => {
          res.render('index.ejs', { users: users })
        })
        .catch(/* ... */)
    })

    app.post('/users', (req, res) => {
      usersCollection.insertOne(req.body)
        .then(result => {
          res.redirect('/')
        })
        .catch(error => console.error(error))
    })

    app.put('/users', (req, res) => {
      usersCollection.findOneAndUpdate(
        { email: 'agustin.garcia@softtek.com' },
        {
          $set: {
            email: req.body.email,
            password: req.body.password
          }
        },
        {
          upsert: true
        }
      )
        .then(result => res.json('Success'))
        .catch(error => console.error(error))
    })

    app.delete('/users', (req, res) => {
      usersCollection.deleteOne(
        { name: req.body.email }
      )
        .then(result => {
          if (result.deletedCount === 0) {
            return res.json('No User to delete')
          }
          res.json('Deleted User')
        })
        .catch(error => console.error(error))
    })


// ========================
    // NIT - From index.js 
	// NIT START - Remove if not used
    // ========================
    app.use(cors())
    app.use(bodyParser.urlencoded({extended:true}))
    app.use(bodyParser.json())
    app.use('/',require('./routes/user.route'))
    app.use('/',require('./routes/users'))
      // ========================
        // NIT END - Remove if not used
        // ========================


    // ========================
    // Listen
    // ========================
    const isProduction = process.env.NODE_ENV === 'production'
    const port = isProduction ? 7500 : 3000
    app.listen(port, function () {
      console.log(`listening on ${port}`)
    })
  })
  .catch(console.error)

