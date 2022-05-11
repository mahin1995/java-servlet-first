
<%@ page errorPage="erro_page.jsp" %>  
<html>
<head>
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" ></script>
</head>
<body>
<% 
int a=10;  
int b=0;  
int c=a/b;
out.print(c);

%>
<div class="card" style="margin:80px">
<div class="container" style="padding-top:10px">
<div class="row">
    <form class="col s12" id="id_registration_form"  method="post">
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="Placeholder" name="firstName" id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input id="last_name" name="lastName" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" name="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="email" name="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="col s12">
      <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input name="img" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
        </div>
      </div>
      <button class="btn waves-effect waves-light" type="button" id="id_submit_button" name="action">Submit
    <i class="material-icons right"></i>
  </button>
    </form>
  </div>
        

</div>
</div>
<script>
$("#id_submit_button").on('click',function(){
	register_form_sub()
})
function register_form_sub(){
	//var formData = $('#id_registration_form').serializeArray();
	
	var formData = new FormData(document.getElementById("id_registration_form"));
	
	$.ajax({
	    url : "registerAction", // Url of backend (can be python, php, etc..)
	    type: "POST", // data type (can be get, post, put, delete)
	   data : formData, // data in json format
	   processData:false,
	   contentType:false,
	  // enable or disable async (optional, but suggested as false if you need to populate data afterwards)
	    success: function(response, textStatus, jqXHR) {
	    	console.log(response);
	    },
	    error: function (jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
	      	console.log(textStatus);
	      	console.log(errorThrown);
	    }
	});
}

</script>
</body>
</html>
