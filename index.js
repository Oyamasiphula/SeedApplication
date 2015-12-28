var express = require('express'),	
	exphbs = require('express-handlebars'),
	mysql = require('mysql'),
	myConnection = require('express-myconnection'),
	session = require('express-session'),
	bodyParser = require('body-parser'),
  issues = require('./routes/issue');

var app = express();

var dbOptions = {
      host: 'localhost',
      user: 'oss_seed_db',
      password: 'password',
      port: 3306,
      database: 'OS_issues_Logs'
};
// at codex machine database nama is OS_issues_Logs;

//setup template handlebars as the template engine
app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

app.use(express.static(__dirname + '/public'));
app.use('/bower_components',  express.static(__dirname + '/bower_components'));

//setup middleware
app.use(myConnection(mysql, dbOptions, 'single'));
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

app.get("/", issues.getHome)
app.get('/issues', issues.show);
app.get('/issues/search/:query', issues.search);
app.post('/issues/add', issues.add);
app.get('/issues/edit/:issue_id', issues.showEdit);
app.post('/issues/update/:issue_id', issues.update);
app.get("/whyNodejs", issues.getNJsBasicInfo);
app.get('/about', issues.about)

//start everything up
var port = process.env.port || 2001;

app.listen( port, function(){
  console.log('listening on *:' + port);
});