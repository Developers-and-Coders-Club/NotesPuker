const express = require('express')
const router = express.Router()
const { ensureAuth, ensureGuest } = require('../middleware/auth')

const User = require('../models/User')

// // @desc    Login/Landing page
// // @route   GET /
router.get('/', (req,res)=>{
  res.render("LandingPage")
})

router.get('/collegeinput', ensureAuth ,(req,res)=>{
  res.render("collegeInput", {name: req.user.displayName })
})

router.get('/lp', (req, res) => {
  res.render("LandingPage")
})
router.get('/db', (req, res) => {
  res.render("dashboard")
})
router.get('/pro', (req, res) => {
  res.render("profile")
})
router.get('/cat', (req, res) => {
  res.render("category")
})
router.get('/ci', (req, res) => {
  res.render("collegeInput")
})


router.post('/collegeinput', ensureAuth, (req, res) => {
  try {
     User.findOneAndUpdate({ googleId: req.user.googleId },{collegeName: req.body.college},{new: true},(err,doc)=>{
      if(err){
        console.log(err);
      }else{
        res.redirect('/dashboard')
      }
    })
  } catch (err) {
    console.log(err)
  }
})

module.exports = router
