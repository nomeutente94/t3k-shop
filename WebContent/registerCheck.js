function LoginForm() {
	var nomi=["username","email","password","nome","cognome","dataNascita","indirizzo","cap","citta","provincia","stato","telefono"];
	for(i=0;i<12;i++){
		var x=document.forms["RegistrationForm"][nomi[i]].value;
		if (x == null || x == "") {
			alert("Inserire "+nomi[i]);
			return false;
		}
	}
	if(!document.getElementById('termsagree').checked){
		alert("Accettare le indicazioni sul trattamento dei dati personali");
		return false;
	}
}