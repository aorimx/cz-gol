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

		success: function(response){
      try {
        dataJson=JSON.parse(response);

      } catch (e) {
        dataJson=response;
      }
      console.log(dataJson.data);
      swal("Pronostico", dataJson.data.message, "success");

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
      var formulario=document.getElementById('formPrediccion');
      for(var i=0; i<response.data.length; i++){
        formulario.innerHTML+=response.data[i];
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