ObtenerTipoCliente();
var input = document.getElementById('SMedioPago');
var inputTCompra = document.getElementById('STipoCompra');
var inputTienda = document.getElementById('ComboTienda');
var inputPregis = document.getElementById('cboPreRegistro');
var inputPregis2 = document.getElementById('cboPreRegistro2');
var tipoCliente = "", TCL = "", TCOM = "", idCliente = "";

input.onchange = function () {
    localStorage['SMedioPago'] = this.value;
    GuardarIDCombos('MPago', this.value);
}
inputTCompra.onchange = function () {
    var preregis = $('#cboPreRegistro').val();
    if (preregis != "0" && preregis != "" && preregis != null) {
        if (this.value == "01" || this.value == "02" || this.value == "03" ||
            this.value == "04" || this.value == "05" || this.value == "06" ||
            this.value == "23" || this.value == "30") {
            if ((tipoCliente == "01" && (this.value == "05" || this.value == "06")) ||
                (tipoCliente != "01" && (this.value != "05" || this.value != "06"))) {
                $('#STipoCompra').val(localStorage['STipoCompra']);
                NoCambioTipoCliente();
            } else {
                localStorage['STipoCompra'] = this.value;
                GuardarIDCombos('TCompra', this.value);
            }
        } else {
            $('#STipoCompra').val(localStorage['STipoCompra']);
            NoCambioPreRegistro();
        }
    } else {
        localStorage['STipoCompra'] = this.value;
        GuardarIDCombos('TCompra', this.value);
    }
}
inputTienda.onchange = function () {
    localStorage['ComboTienda'] = this.value;
    GuardarIDCombos('TiendaS', this.value);
}
inputPregis.onchange = function () {
    localStorage['cboPreRegistro'] = this.value;
    localStorage['cboPreRegistro2'] = this.value;
    GuardarIDCombos('Pregis', this.value);
}
inputPregis2.onchange = function () {
    localStorage['cboPreRegistro'] = this.value;
    localStorage['cboPreRegistro2'] = this.value;
    GuardarIDCombos('Pregis', this.value);
}

function ObtenerTipoCliente() {
    $.ajax({
        type: "POST",
        url: "TiendaSN.aspx/ObtenerTipoCliente",
        data: "{}",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, throwError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (dataS) {
            tipoCliente = dataS.d.val1;
            idCliente = dataS.d.idCliente;
            TCL = dataS.d.tipoCliente;
            TCOM = $('#STipoCompra').val();
        }
    });
}

function GuardarIDCombos(combo, idcombo) {
    var obj = JSON.stringify({
        comboS: combo, idComboS: idcombo
    });
    $.ajax({
        type: "POST",
        url: "TiendaSN.aspx/GuardarIDCombos",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, throwError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (dataS) {
            var Datos = dataS.d;
            if (combo == "TCompra") {
                $('#LbPrecioPagar').text("S/." + Datos.MontoPago);
            }
            if (combo == "Pregis" && (idcombo != "0" && idcombo != "" && idcombo != null)) {
                localStorage['STipoCompra'] = Datos.IdPaquete;
                $('#STipoCompra').val(Datos.IdPaquete);
            }
        }
    });
}

function AgregarCarrito(codigo) {
    $('#page_loader').show();
    var cMPago = $("#SMedioPago").val();
    var cCom = $('#STipoCompra').val();
    var cTienda = $('#ComboTienda').val();

    if (cCom != '0' && cTienda != '0' && cMPago != '0') {
        var cantidad = $('#' + codigo + '').val();
        var obj = JSON.stringify({
            codProductoCarrito: codigo, cantidadProductos: cantidad
        });
        $.ajax({
            type: "POST",
            url: "TiendaSN.aspx/AgregarProducto",
            data: obj,
            contentType: 'application/json; charset=utf-8',
            error: function (xhr, ajaxOptions, throwError) {
                console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            },
            success: function (dataS) {
                var Datos = dataS.d;
                if (Datos.Mensaje == "OK") {
                    $('#LbPrecioTotal').text("S/." + parseFloat(Datos.Total.replace(",", ".")));
                    $('#LbPrecioPagar').text("S/." + parseFloat(Datos.Monto));
                    $('#LbPuntosCompra').text(Datos.Puntos);
                    $('#LbPuntosRango').text(Datos.PuntosPromo);
                    $('#LbPrecioTotal2').text("S/." + parseFloat(Datos.Total));
                    $('#LbPrecioPagar2').text("S/." + parseFloat(Datos.Monto));
                    $('#LbPuntosCompra2').text(Datos.Puntos);
                    $('#LbPuntosRango2').text(Datos.PuntosPromo);
                    $('#page_loader').hide();
                    Swal.fire({
                        title: 'Perfecto!',
                        text: 'Producto Agregado',
                        type: "success"
                    });
                }
                else {
                    $('#page_loader').hide();
                    Swal.fire({
                        title: 'Ooops...!',
                        text: Datos.Mensaje,
                        icon: "error"
                    });
                }
            }
        });
    } else {
        Swal.fire({
            title: 'Ooops...!',
            text: 'Debe seleccionar todos los datos de la compra',
            icon: "error"
        });
    }

}

function irCarrito() {
    var cMPago = $("#SMedioPago").val();
    var cCom = $('#STipoCompra').val();
    var cTienda = $('#ComboTienda').val();
    if (cCom != '0' && cTienda != '0' && cMPago != '0') {
        $.ajax({
            type: "POST",
            url: "TiendaSN.aspx/CantidadProdCarrito",
            data: "{}",
            contentType: 'application/json; charset=utf-8',
            error: function (xhr, ajaxOptions, throwError) {
                console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            },
            success: function (dataS) {
                if (dataS.d == "") {
                    location.href = "DetalleDeCompra.aspx";
                }
                else{
                    Swal.fire({
                        title: 'Ooops...!',
                        text: dataS.d,
                        icon: "error"
                    });
                }
            }
        });
    } else {
        Swal.fire({
            title: 'Ooops...!',
            text: 'Debe seleccionar todos los datos de la compra',
            icon: "error"
        });
    }

}

function VerTodosProductos() {
    location.href = "TiendaSN.aspx";
}

$(function () {
    $("[id$=txtNomProducto]").autocomplete({
        source: function (request, responce) {
            var obja = JSON.stringify({
                palabra: request.term,
                tipoCliente: TCL,
                tipoCompra: $('#STipoCompra').val(),
                tienda: $('#ComboTienda').val(),
                idCliente: idCliente
            });

            $.ajax({
                url: "Autocompletado.asmx/FiltrarNombreProductos",
                method: "post",
                CORS: true,
                contentType: "application/json;charset=utf-8",
                //data: "{ 'palabra': '" + request.term + "'}",
                data: obja,
                dataType: 'json',
                success: function (data) {
                    responce(data.d);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log("In The ERROR");
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            });
        }
    });
});

function NoCambioPreRegistro() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Está completando un preregistro, no puede seleccionar esa opción',
    })
}

function NoCambioTipoCliente() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'No puede realizar cambio en el tipo de cliente',
    })
}