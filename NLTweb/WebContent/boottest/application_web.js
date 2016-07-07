'use strict';
var colors = require('colors');
var http = require('http');
var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var app = express();

var config = require('./config');
var api = require('./lib/api');

app.set('port', process.env.PORT || 3000);
app.use('/dashboard', express.static(path.join(__dirname,'public')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/data/:container', function(req,res) {
  var container = req.params.container;
  api.getLatestContainer(config.nodeID, container, function(err, data){
    if(err) return res.send(err);
    else {
    	console.log(data.con);
    	if(data.con<=10){ 
    		console.log(colors.red('##########전력 생성량 너무 낮음############'));
    		/*r cmd = JSON.stringify({'cmd':'on'});
    		api.reqMgmtCmd(config.nodeID, config.mgmtCmdPrefix, cmd, function(err, data){ });*/
    	}
    	return res.send(data);}
    
  });
});

app.post('/control', function(req,res) {
  var cmd = JSON.stringify(req.body);
  console.log(cmd);
  api.reqMgmtCmd(config.nodeID, config.mgmtCmdPrefix, cmd, function(err, data){
    if(err) return res.send({'error':err});
    return res.send({'result':'ok'});
  });
});

var server = http.createServer(app);
server.listen(app.get('port'), function(){
  console.log('Express server for sample dashboard listening on port:'+ app.get('port'));
});
