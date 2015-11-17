exports.show = function(req,res,next){
	req.getConnecton(function(err,connection){
			connection.query('SELECT * FROM ISSUES',[], function(err,results){
				res.render('issues',{
					results:results
				});
			});
	});
};