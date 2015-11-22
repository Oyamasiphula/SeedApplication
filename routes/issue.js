exports.search = function(req, res, next){
	req.getConnection(function(error, connection){
        
    var issuesTdPullreq = req.params.query;
    	issuesTdPullreq = "%" + issuesTdPullreq + "%";

		connection.query('SELECT issue_id, categorise_issue, description, error_message, Solution FROM issues WHERE Solution LIKE ? OR error_message LIKE ?', [issuesTdPullreq,issuesTdPullreq], function(error, results) {
			console.log(results)
			if (error) return next(error);

		connection.query('SELECT category_id, category FROM category_td', [issuesTdPullreq], function(err, categoriesResults) {
				if (error) {
							return next("Error Searching : %s ", err);

				}

				res.render( 'issuesSearch', {
					products : results,
					categories: categoriesResults,
					layout : false

					});
				});
			});
		});	
	}; 
exports.show = function(req, res, next) {
	var id = req.params.id;

	var data = JSON.parse(JSON.stringify(req.body));

	req.getConnection(function(err, connection){
			connection.query('SELECT issue_id, categorise_issue, description, error_message, Solution FROM issues',[data], function(err,results){
				if (err)
              		return next("Error Selecting : %s ",err );
              	connection.query('SELECT category_id, category from category_td', [data.category_id], function(err, categoryList){
				if(err)
					return next("Error Selecting : %s ", err);

					var issue = results[0];

					var categories = categoryList.map(function(category){
						return {
							category_id : category.category_id,
							category : category.category,
							selected : category.category_id === issue.category_id
						}
					});

					res.render('issues',{
						results:results,
						categories:categories
					});
				});

			});
	});
};
// exports.editIssue = function (req, res, next) {
// 	req.getConnection(function(err, connection){
		
// 		var id = req.params.id;
//     	connection.query('SELECT category_id, category from Categories_td', [], function(err, categoryList) {
//         	if (err)
//               		return next("Error Selecting : %s ",err );
         
//          		connection.query('SELECT * FROM issues WHERE id = ?', [id], function(err,rows){
// 			if(err)
// 					return next("Error Selecting : %s ", err);


// 					var issue = rows[0];

// 					var categories = categoryList.map(function(category){
// 						return {
// 							id : category.id,
// 							category : category.category,
// 							selected : category.id === issue.Category_id
// 						}
// 					});

// 					res.render('editissue', { 
// 						page_title:"Edit Customers - Node.js",
// 						issues : issue,
// 					 	categories:categories
// 					});      
// 				});
//       	});
// 	});
// };

exports.add = function (req, res, next) {
	req.getConnection(function(err, connection){
	
		var input = JSON.parse(JSON.stringify(req.body));

		var data = {
            categorise_issue : input.categorise_issue,
            description : input.description,
            error_message :input.error_message,
            Solution :input.Solution,
            category_id : input.category_id
      };

			connection.query('insert into issues set ?', data, function(err, results) {
        		if (err)
             	 		return next(err);

          		res.redirect('/issues');
      	});
	});
};

exports.update = function(req, res, next){

	var data = JSON.parse(JSON.stringify(req.body));
    var id = req.params.issue_id;

    req.getConnection(function(err, connection){
    	connection.query('UPDATE issues SET categorise_issue = ?, description = ? ,Solution = ?, category_id = ?, WHERE issue_id = ?', [data.Product_name, data.Category_id, id], function(err, rows, fields){
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
