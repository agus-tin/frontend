const express = require('express')
const User = require('../models/user.model')
const router = express.Router()


router.post('/signup',(req,res)=>{
    User.findOne({email:req.body.email},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user==null){
                const user = User({
                    email:req.body.email,
                    password:req.body.password
                })
                user.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(user)
                        res.json(user)
                    }
                })
            }else{

            res.json({
                message:'email is not avilable'
            })
            }
        }
    })
})

router.post('/signin',(req,res)=>{
    User.findOne({email:req.body.email,password:req.body.password},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            res.json(user)
        }
    })
})



router.post('/users', (req, res) => {
      User.insertOne(req.body)
        .then(result => {
          res.redirect('/')
        })
        .catch(error => console.error(error))
    })

    router.put('/users', (req, res) => {
      User.findOneAndUpdate(
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

    router.delete('/users', (req, res) => {
      User.deleteOne(
        { email: req.body.email }
      )
        .then(result => {
          if (result.deletedCount === 0) {
            return res.json('No User to delete')
          }
          res.json('Deleted User')
        })
        .catch(error => console.error(error))
    })



module.exports = router