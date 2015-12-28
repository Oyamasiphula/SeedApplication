$(document).ready(function(){
        //Products Search
  $("#search").keyup(function(){
    var issueTdPullreq = $("#issueTdPullreq").val();
    $.get("/issues/search/" + issueTdPullreq, function(results){
      $("#reqIssuesOutPut").html(results);
      });
            // conditional statements as a layout manager for a proper search textBox output
              if (issueTdPullreq === true) {
                $.get("/issues/search/" + issueTdPullreq, function(results){
                            $("#reqIssuesOutPut").html(results);
                  });
              } 
              else if(issueTdPullreq === "" || false){
                    window.location.replace("http://localhost:2010/issues");
              };
    });
});

$(function() {
  setTimeout(function() {
    $('.container').addClass('fadeIn');
  }, 300);
});