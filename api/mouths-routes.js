var express = require('express');
var path = require('path');

var router = express.Router();

//===========================
// Load AI

// setTimeout(()=> {bot1.response("local-user", "hello");}, 100);

//===========================
// Routes

router.route("/mouths")
.get(function(req, res){

	res.json({
		response : "mouths",
	});
})


module.exports = router;