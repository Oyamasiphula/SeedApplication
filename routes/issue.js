exports.show = function(req, res, next) {
	var id = req.params.id;

	var data = JSON.parse(JSON.stringify(req.body));

	req.getConnection(function(err, connection){
			connection.query('SELECT Category_Specification,description,Solution FROM issues',[data], function(err,results){
				res.render('issues',{
					results:results
				});
			});
	});
};