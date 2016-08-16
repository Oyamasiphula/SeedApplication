exports.getHome = function(req,res,next){
    res.render("home");
};

exports.getNJsBasicInfo = function(req,res,next){
	res.render('why_nodejs');
};

exports.search = function(req, res, next){
	req.getConnection(function(error, connection){

    var issuesTdPullreq = req.params.query;
    	issuesTdPullreq = "%" + issuesTdPullreq + "%";

		connection.query('SELECT issues.id, issue_date, subject, issue_description, error_message, Solution FROM issues WHERE Solution LIKE ? OR error_message LIKE ?', [issuesTdPullreq,issuesTdPullreq], function(error, results) {
			if (error)
                return next(error);
		connection.query('SELECT id, category FROM category_td', [issuesTdPullreq], function(err, categoriesResults) {
				if (error) {
							   return next("Error Searching : %s ", err);

				}

				res.render( 'issuesSearch', {
					results : results,
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

	req.getConnection(function(err,connection){
	connection.query('SELECT issues.id, issues.issue_date, issues.subject, category_td.category, issues.issue_description, issues.error_message, issues.Solution FROM issues, category_td WHERE issues.id = category_td.category_id GROUP BY subject ORDER BY issue_date',[data], function(err,results){
  				if (err)
                		return next("Error Selecting : %s ",err );
               	connection.query('SELECT category_id, category from category_td', [data.id], function(err, categoryList){
 				if(err)
 					return next("Error Selecting : %s ", err);
 					var issue = results[0];
 					var categories = categoryList.map(function(category){
 						return {
 							id : category.id,
 							category : category.category,
 							selected : category.id === issue.id
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

exports.add = function (req, res, next) {
	req.getConnection(function(err, connection){

		var input = JSON.parse(JSON.stringify(req.body));

		var data = {
            issue_date : input.issue_date,
            subject : input.subject,
            issue_description : input.issue_description,
            error_message : input.error_message,
            Solution : input.Solution,
            id : input.id
      };

			connection.query('insert into issues set ?', data, function(err, results) {
        		if (err)
             	 		return next(err);

          		res.redirect('/issues');
      	});
	});
};

exports.showEdit = function (req, res, next) {
	req.getConnection(function(err, connection){

		var id = req.params.id;
    	connection.query('SELECT category_id, category from category_td', [], function(err, categoryList) {
        	if (err)
              		return next("Error Selecting : %s ",err );

         		connection.query('SELECT *  FROM issues WHERE issues.id = ?', [id], function(err, rows){
			if(err)
					return next("Error Selecting : %s ", err);


					var issues = rows[0];

					var categories = categoryList.map(function(category){
						return {
							id : category.id,
							category : category.category,
							selected : category.id === issues.id
						}
					});
					res.render('editissue', {
						page_title:"Edit Customers - Node.js",
						issues : issues,
					 	categories:categories
					});
				});
      	});
	});
};

exports.update = function(req, res, next){

	var data = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function(err, connection){
    	connection.query('UPDATE Suppliers_td SET ? WHERE id = ?', [ data.id, data.Solution, id], function(err, rows, fields){
    		if (err)
              		return next("Error Updating : %s ",err);
          	res.redirect('/issues');
    	});
    });
};

exports.about = function(req,res,next){
	res.render('about');
};
