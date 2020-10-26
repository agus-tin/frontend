const {Schema, model} = require('mongoose')

const userSchema = Schema({
    email:String,
    password:String,
	avatar: String,
	firstName: String,
	lastName: String
})

module.exports = model('User',userSchema)