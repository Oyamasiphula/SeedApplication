exports.show = function(req, res, next) {
	var id = req.params.id;

	var data = JSON.parse(JSON.stringify(req.body));

	req.getConnection(function(err, connection){
			connection.query('SELECT categorise_issue,description,Solution FROM issues',[data], function(err,results){
				res.render('issues',{
					results:results
				});
			});
	});
};
exports.editIssue = function (req, res, next) {
	req.getConnection(function(err, connection){
		
		var id = req.params.id;
    	connection.query('SELECT category_id, category from Categories_td', [], function(err, categoryList) {
        	if (err)
              		return next("Error Selecting : %s ",err );
         
         		connection.query('SELECT * FROM issues WHERE id = ?', [id], function(err,rows){
			if(err)
					return next("Error Selecting : %s ", err);


					var issue = rows[0];

					var categories = categoryList.map(function(category){
						return {
							id : category.id,
							category : category.category,
							selected : category.id === issue.Category_id
						}
					});

					res.render('editissue', { 
						page_title:"Edit Customers - Node.js",
						issues : issue,
					 	categories:categories
					});      
				});
      	});
	});
};

exports.add = function (req, res, next) {
	req.getConnection(function(err, connection){
	
		var input = JSON.parse(JSON.stringify(req.body));

		var data = {
            categorise_issue : input.categorise_issue,
            description : input.description,
            Solution :input.Solution,
            category_id : input.category_id
      };

			connection.query('insert into issues set ?', data, function(err, results) {
        		if (err)
             	 		return next("Error inserting : %s ", err);

          		res.redirect('/issues');
      	});
	});
};

exports.update = function(req, res, next){

	var data = JSON.parse(JSON.stringify(req.body));
    var id = req.params.issue_id;

    req.getConnection(function(err, connection){
    	connection.query('UPDATE issues SET categorise_issue = ?, description = ? ,Solution = ?, category_id = ?, WHERE id = ?', [data.Product_name, data.Category_id, id], function(err, rows, fields){
    		if (err)
              		return next("Error Updating : %s ",err);
  
          	res.redirect('/issues');
    	});
    });
};

exports.delete = function(req, res, next){
	var id = req.params.id;
	req.getConnection(function(err, connection){

		connection.query('DELETE FROM issues WHERE id = ?', id, function(err,rows){
			if(err)
				return next("Error deleting : %s ",err );
			
			res.redirect('/issues');
		});
		 
	});
};
