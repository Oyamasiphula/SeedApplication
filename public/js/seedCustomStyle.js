$(document).ready(function(){
				//Products Search
	$("#issueTdPullreq").keyup(function(){
		var issueTdPullreq = $("#issueTdPullreq").val();
		$.get("/issues/search/" + issueTdPullreq, function(results){
			$("#reqIssuesOutPut").html(results);
		  });
	});	
});	