const {Router} = require('express');
const router = Router();
const User = require('../models/User');
const faker = require('faker');


router.get('/users', async (req, res) => {
  const users = await User.find();
  res.json({users});
});


router.get('/users/create', async(req, res) => {
for (let i=0; i<5; i++){
  await User.create({
    firstName: faker.name.firstName(),
    lastName: faker.name.lastName(),
    avatar: faker.image.avatar(),
    email: faker.internet.email(),
     password: faker.internet.password()
  });
}
res.json({message: '5 Users created'});

});


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
    console.log('Querying for User: ' + req.body )
    User.findOne({email:req.body.email,password:req.body.password},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            res.json(user);
            console.log('User data: ' + user )
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



module.exports = router;