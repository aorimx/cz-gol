function sendForm(form){
	event.preventDefault(form);
	var serializeArray = new FormData(form);

	$.ajax({
		url: form.action,
		type: form.method,
		data: serializeArray,
		cache:false,
		contentType: false,
		processData: false,

		success: function(data){
      try {
        dataJson=JSON.parse(data);

      } catch (e) {
        dataJson=data;
      }
      console.log(dataJson);

		},
		error: function (response) {
			var dataJson=JSON.parse(response.responseText);
			
		}
	});
	return false;
}

function getUsers(){
  var select = document.getElementById("selectUser");
  $.ajax({
		url: 'api/getUsers.php',
		type: 'GET',
		cache:false,
		contentType: false,
		processData: false,

		success: function(response){
      for(var i=0; i<response.data.length; i++){
        var opt = response.data[i];
        var el = document.createElement("option");
        el.textContent = opt.username;
        el.value = opt.id;
        select.appendChild(el);
      }

		},
		error: function (response) {
			console.log("Ha ocurrido un error");
		}
	});
}

function getMatchs(){
  $.ajax({
		url: 'api/getMatchs.php',
		type: 'GET',
		cache:false,
		contentType: false,
		processData: false,

		success: function(response){
      console.log(response.data);
      var diva=document.getElementById('formPrediccion');
      for(var i=0; i<response.data.length; i++){
        var div = document.createElement('div');
        div.innerHTML+=response.data[i];
        document.getElementById('formPrediccion').appendChild(div);
      }
		},
		error: function (response) {
			console.log("Ha ocurrido un error");
		}
	});
}

$(document).ready(function(){
    getUsers();
    getMatchs();
});