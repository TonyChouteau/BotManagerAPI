var express = require('express');
var path = require('path');

var router = express.Router();

//===========================
// Load AI

// setTimeout(()=> {bot1.response("local-user", "hello");}, 100);

//===========================
// Routes

//=================
// Mouths Collection

router.route("/mouths")
.get(function(req, res){ // TODO
	res.json({
		response : "mouths",
	});
})
.post(function(req, res){ // TODO

	res.json({
		response : "mouths",
	});
})
.put(function(req, res){ // Not Allowed

	res.status(405);
	res.send('Method Not Allowed');
})
.patch(function(req, res){ // Not Allowed

	res.status(405);
	res.send('Method Not Allowed');
})
.delete(function(req, res){ // Not Allowed

	res.status(405);
	res.send('Method Not Allowed');
})

//=================
// Mouth ID

router.route("/mouth/:id")
.get(function(req, res){ // TODO

	res.json({
		response : "mouth",
	});
})
.put(function(req, res){ // TODO

	res.json({
		response : "mouth",
	});
})
.patch(function(req, res){ // TODO

	res.json({
		response : "mouth",
	});
})
.delete(function(req, res){ // TODO

	res.json({
		response : "bot",
	});
})
.post(function(req, res){ // NOT Allowed

	res.status(405);
	res.send('Method Not Allowed');
})

//===========================
// Export

module.exports = router;
