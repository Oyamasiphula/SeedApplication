var express = require('express'),	
	exphbs = require('express-handlebars'),
	mysql = require('mysql'),
	myConnection = require('express-myconnection'),
	session = require('express-session'),
	bodyParser = require('body-parser'),
  issue = require('./routes/issue');

var app = express();

var dbOptions = {
      host: 'localhost',
      user: 'root',
      password: 'codex',
      port: 2000,
      database: 'OS_Log_db'
};

//setup template handlebars as the template engine
app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

app.use(express.static(__dirname + '/public'));

//setup middleware
app.use(myConnection(mysql, dbOptions, 'single'));
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

app.get("/", function (req,res) {
    res.render("home")
})

app.post('issues',issue.show)
app.post('issues',issue.add)

//start everything up
var port = process.env.khuluma_port ||2010;

app.listen( port, function(){
  console.log('listening on *:' + port);
});