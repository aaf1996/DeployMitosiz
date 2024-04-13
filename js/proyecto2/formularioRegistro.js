const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario #password2');
/*
const expresiones = {
	usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
	nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
	telefono: /^\d{7,14}$/ // 7 a 14 numeros.
}
*/
const campos = {
	password: false
}

const validarFormulario = (e) => {
	switch (e.target.name) {
		case "password":			
			validarPassword2();
			break;
		case "password2":
			validarPassword2();
			break;
	}
}

const validarPassword2 = () => {
	const inputPassword1 = document.getElementById('password');
	const inputPassword2 = document.getElementById('password2');

	if (inputPassword1.value !== inputPassword2.value || inputPassword1.value == '') {
		document.getElementById(`grupo__password2`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__password2`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__password2 i`).classList.add('fa-times-circle');//icono incorrecto
		document.querySelector(`#grupo__password2 i`).classList.remove('fa-check-circle');//icono correcto
		document.querySelector(`#grupo__password2 .formulario__input-error`).classList.add('formulario__input-error-activo');
		campos['password'] = false;
	} else {
		document.getElementById(`grupo__password`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__password2`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__password`).classList.add('formulario__grupo-correcto');
		document.getElementById(`grupo__password2`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__password i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo__password2 i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo__password i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo__password2 i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo__password2 .formulario__input-error`).classList.remove('formulario__input-error-activo');
		campos['password'] = true;
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);	
});




function mostrarContrasena() {
	var tipo = document.getElementById("password");
	var ojito1 = document.getElementById("ojito1");
	if (tipo.type == "password") {
		tipo.type = "text";
		ojito1.style.filter = "drop-shadow(0px 0px 10px blue)"

	} else {
		tipo.type = "password";
		ojito1.style.filter = "none"
	}
}
function mostrarContrasena2() {
	var tipo = document.getElementById("password2");
	var ojito2 = document.getElementById("ojito2");
	if (tipo.type == "password") {
		tipo.type = "text";
		ojito2.style.filter = "drop-shadow(0px 0px 10px blue)"
	} else {
		tipo.type = "password";
		ojito2.style.filter = "none"
	}
}




