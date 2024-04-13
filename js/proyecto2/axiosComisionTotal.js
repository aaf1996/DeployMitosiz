getIdcliente();

function getIdcliente() {
    let body = {};
    axios.post('Index.aspx/GetIdCliente', body)
        .then(response => {

            console.log(response);
            getInfoForComisionTotal(response.data.d);
        })
        .catch(error => console.error(error));

}

function getInfoForComisionTotal(idCliente) {
    let body = {
        "idCliente": idCliente
    }
    axios.post('Autocompletado.asmx/MontoTotalComision', body)
        .then(response => {
            let comision = response.data.d;
            let comisionParseado = comision.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            console.log(comisionParseado);
            console.log(response);
            let valorComisionTotal = document.getElementById('valorComisionTotal');
            if (!!valorComisionTotal) {
                valorComisionTotal.innerHTML = `<span class='moneda'>S/ </span>${comisionParseado}`;
            }
        })
        .catch(error => console.error(error));

}