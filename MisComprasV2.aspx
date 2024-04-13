﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MisComprasV2.aspx.cs" Inherits="SantaNaturaNetwork.MisCompras2"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!---->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
    <style>
        #tablaDetalleComprasRealizadasEfectivo.dataTable tbody tr:hover {
            background-color: gainsboro;
        }

            #tablaDetalleComprasRealizadasEfectivo.dataTable tbody tr:hover > .sorting_1 {
                background-color: gainsboro;
            }

        .datepicker {
            position: absolute !important;
            background-color: white !important;
        }

        .dataTables_filter {
            display: none;
        }

        #BtnAgregarVaucher {
            background-color: White;
            border-color: White;
            font-size: 0px;
            border: white;
        }

        #Progress {
            position: fixed;
            border-radius: 7px;
            background: #f5f5f5;
            background-color: #f5f5f5;
            top: 40%;
            left: 35%;
            height: 30%;
            width: 30%;
            z-index: 100001;
            background-image: url('Imagenes/COLAGENO_FUERZA.PNG');
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/estilosTablaMisCompras2-v1.css?v1" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrapv2.min.css?Fv35">
    <link href="https://cdn.rawgit.com/atatanasov/gijgo/master/dist/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/file-upload.css" />

    <!---->
    <link rel="stylesheet" href="assets/Estilos/alertify.core.css" />
    <link rel="stylesheet" href="assets/Estilos/alertify.default.css" id="toggleCSS" />
    <script src="assets/Estilos/alertify.min.js" type="text/javascript"></script>


    <asp:HiddenField ID="hf_IdCliente" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="hf_Establecimiento" ClientIDMode="Static" runat="server" />
    <input id="hdnTicket" name="hdnTicket" type="hidden">
    <asp:HiddenField ID="HiddenTicket" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenTienda" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenMondoPagar" ClientIDMode="Static" runat="server" />

    <asp:HiddenField ID="HiddenField_NombreCliente" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenField_idTipoCompra" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenField_FechaPago" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenField_TipoCompra" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenField_NotaDelivery" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenField_Ruc" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="HiddenRuta" ClientIDMode="Static" runat="server" />

    <div class="container-tablaMisCompras2">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">

                <nav style="margin-bottom: 43px;">
                    <div class="nav nav-tabs nav-fill navHeaderHistorial" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link ov-btn-grow-ellipse active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" onclick="TabPendingPurchases();" aria-selected="true">
                            <img onclick="TabPendingPurchases();" src="img/iconosNavHeadHistorial/compra-pendiente2.png" alt="Alternate Text" />COMPRAS PENDIENTES DEPOSITO</a>
                        <a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-efectivo-tab" data-toggle="tab" href="#nav-pendiente" role="tab" aria-controls="nav-pendiente" aria-selected="false" onclick="TabPendingPurchasesCash();">
                            <img onclick="TabPendingPurchasesCash();" src="img/iconosNavHeadHistorial/Compras-pendientes-efectivo.png" alt="Alternate Text" />COMPRAS PENDIENTES CANJE</a>
                       <%-- <a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-bbva-tab" data-toggle="tab" href="#nav-bbva-pendiente" role="tab" aria-controls="nav-bbva-pendiente" aria-selected="false" onclick="TabPendingPurchasesBBVACash();">
                            <img onclick="TabPendingPurchasesBBVACash();" src="img/iconosNavHeadHistorial/cuenta-recaudadora-pendiente.png" alt="Alternate Text" />COMPRAS PENDIENTES RECAUDO</a>--%>
                        <%--<a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-pendpe-tab" data-toggle="tab" href="#nav-pendiente-pe" role="tab" aria-controls="nav-pendiente-pe" aria-selected="false" onclick="TabPendingPurchasesCashPayment();">
                            <img onclick="TabPendingPurchasesCashPayment();" src="img/iconosNavHeadHistorial/Compras-pendientes-pe.png" alt="Alternate Text" />COMPRAS PENDIENTES PAGOEFECTIVO</a>--%>
                        <%--<a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-pen-tupay-tab" data-toggle="tab" href="#nav-pendienteTupay" role="tab" aria-controls="nav-tupay" aria-selected="false" onclick="TabPendingPurchasesTupay();">
                            <img onclick="TabPendingPurchasesTupay();" src="img/iconosNavHeadHistorial/Compras-pendientes-pe.png" alt="Alternate Text" />COMPRAS PENDIENTES TUPAY</a>--%>
                        <%--<a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-visa-tab" data-toggle="tab" href="#nav-pendienteVISA" role="tab" aria-controls="nav-visaNet" aria-selected="false" onclick="TabPendingPurchasesMadeVisanet();">
                            <img onclick="TabPendingPurchasesMadeVisanet();" src="img/iconosNavHeadHistorial/Compras realizadas visanet.png" alt="Alternate Text" />COMPRAS REALIZADAS VISANET</a>--%>
                        <%--<a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-rpe-tab" data-toggle="tab" href="#nav-realizadope" role="tab" aria-controls="nav-realizadope" aria-selected="false" onclick="TabPendingPurchasesMadeCashPayment();">
                            <img onclick="TabPendingPurchasesMadeCashPayment();" src="img/iconosNavHeadHistorial/Compras realizadas pagoefectivo.png" alt="Alternate Text" />COMPRAS REALIZADAS PAGOEFECTIVO</a>--%>
                        <%--<a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-re-tupay-tab" data-toggle="tab" href="#nav-realizadotupay" role="tab" aria-controls="nav-realizadotupay" aria-selected="false" onclick="TabPendingPurchasesMadeTupay();">
                            <img onclick="TabPendingPurchasesMadeTupay();" src="img/iconosNavHeadHistorial/Compras realizadas pagoefectivo.png" alt="Alternate Text" />COMPRAS REALIZADAS TUPAY</a>--%>
                        <a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" onclick="TabPendingPurchasesMadeCash();">
                            <img src="img/iconosNavHeadHistorial/Compras realizadas efectivo o canje.png" alt="Alternate Text" />COMPRAS REALIZADAS CANJE</a>
                        <%--<a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-bbva-r-tab" data-toggle="tab" href="#nav-bbva-r" role="tab" aria-controls="nav-bbva-r" aria-selected="false" onclick="TabPendingPurchasesMadeBBVACash();">
                            <img src="img/iconosNavHeadHistorial/cuenta-recaudadora-realizada.png" alt="Alternate Text" />COMPRAS REALIZADAS RECAUDO</a>--%>
                        <a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false" onclick="TabPendingPurchasesMadeDeposit();">
                            <img onclick="TabPendingPurchasesMadeDeposit();" src="img/iconosNavHeadHistorial/Compras realizadasDeposito.png" alt="Alternate Text" />COMPRAS REALIZADAS DEPOSITO</a>
                        <%--<a class="nav-item nav-link ov-btn-grow-ellipse" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false" onclick="TabCanceladas();">
                            <img onclick="TabCanceladas();" src="img/iconosNavHeadHistorial/Cancelado.png" alt="Alternate Text" />CANCELADO</a>--%>
                    </div>
                </nav>

                <div class="tab-content" id="nav-tabContent">
                    <!-- PENDIENTE DEPOSITO-->
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div id="comprasPen" class="row" style="display: block; padding-bottom: 60px" runat="server">
                            <div class="responsiveTbl table-responsive">
                                <table id="TablePendingPurchases" style="text-align: center; width: 100%" class="table table-hover table-condensed table-bordered w-auto table2">
                                    <thead class="table-success">
                                        <tr class="text-center" style="color: white;">
                                            <th>Ticket</th>
                                            <th>Fecha de pedido</th>
                                            <th>Unidades</th>
                                            <th>Monto Neto Total</th>
                                            <th>Puntos</th>
                                            <th>Puntos promoción</th>
                                            <th>Tipo de Compra</th>
                                            <th>Voucher</th>
                                            <th>Mayorista</th>
                                            <th>Observación</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                    </tfoot>
                                </table>
                            </div>

                        </div>

                        <div class="modal fade" id="confirm-delete" aria-hidden="true">
                            <div class="modal-dialog modalDeleteDialog">
                                <div class="modal-content modalDeleteContent">
                                    <%--<div class="modal-header">
                                        <h4 class="modal-title">Eliminar Ticket</h4>
                                    </div>--%>
                                    <div class="modal-body modalDeleteBody">
                                        <label>Está apunto de eliminar el Ticket ¿Desea continuar?</label>
                                    </div>
                                    <div class="modalDeleteFooter">
                                        <a data-dismiss="modal">Cancelar</a>
                                        <button type="button" data-dismiss="modal" id="btn_eliminarsi" onclick="RemoverSi();">Eliminar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- PENDIENTE EFECTIVO/CANJE-->
                    <div class="tab-pane fade" id="nav-pendiente" role="tabpanel" aria-labelledby="nav-efectivo-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="tablePendingPurchasesCash">
                                <thead class="table-success">
                                    <tr class="text-center" style="color: white">
                                        <th>Ticket</th>
                                        <th>Fecha de pedido</th>
                                        <th>Unidades</th>
                                        <th>Monto Neto Total</th>
                                        <th>Puntos</th>
                                        <th>Puntos promoción</th>
                                        <th>Tipo de Compra</th>
                                        <th>Mayorista</th>
                                        <th>Observación</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!-- PENDIENTE BBVA RECAUDO-->
                    <div class="tab-pane fade" id="nav-bbva-pendiente" role="tabpanel" aria-labelledby="nav-bbva-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="tablePendingPurchasesBBVACash">
                                <thead class="table-success">
                                    <tr class="text-center" style="color: white">
                                        <th>Ticket</th>
                                        <th>Fecha de pedido</th>
                                        <th>Unidades</th>
                                        <th>Monto Neto Total</th>
                                        <th>Punto</th>
                                        <th>Puntos promoción</th>
                                        <th>Tipo de Compra</th>
                                        <th>Mayorista</th>
                                        <th>Observación</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--PENDIENTE PAGO EFECTIVO-->
                    <div class="tab-pane fade" id="nav-pendiente-pe" role="tabpanel" aria-labelledby="nav-pendpe-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePendingPurchasesCashPayment">
                                <thead class="table-success">
                                    <tr class="text-center" style="color: white">
                                        <th>Ticket</th>
                                        <th>Fecha de pedido</th>
                                        <th>Fecha de Caducidad</th>
                                        <th>CIP</th>
                                        <th>Monto Neto Total</th>
                                        <th>Punto</th>
                                        <th>Puntos promoción</th>
                                        <th>Tipo de Compra</th>
                                        <th>Mayorista</th>
                                        <th>Observación</th>
                                        <th>Detalle</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>

                    </div>

                    <!--PENDIENTE PAGO TUPAY-->
                    <div class="tab-pane fade" id="nav-pendienteTupay" role="tabpanel" aria-labelledby="nav-pen-tupay-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePendingPurchasesTupay">
                                <thead class="table-success">
                                    <tr class="text-center" style="color: white">
                                        <th>Ticket</th>
                                        <th>Fecha de pedido</th>
                                        <th>Fecha de Caducidad</th>
                                        <th>Codigo</th>
                                        <th>URL</th>
                                        <th>Monto Neto Total</th>
                                        <th>Punto</th>
                                        <th>Puntos promoción</th>
                                        <th>Tipo de Compra</th>
                                        <th>Mayorista</th>
                                        <th>Observación</th>
                                        <th>Detalle</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>

                    </div>

                    <!--  COMPRAS REALIZADAS VISANET -->
                    <div class="tab-pane fade" id="nav-pendienteVISA" role="tabpanel" aria-labelledby="nav-visa-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePurchasesMadeVisanet">
                                <thead class="table-success">
                                    <tr class="text-center tr2" style="color: white">
                                        <th class="th2">Ticket</th>
                                        <th class="th2">Fecha de pedido</th>
                                        <th class="th2">Unidades</th>
                                        <th class="th2">Monto Neto Total</th>
                                        <th class="th2">Punto</th>
                                        <th class="th2">Puntos promoción</th>
                                        <th class="th2">Tipo de Compra</th>
                                        <th class="th2">Mayorista</th>
                                        <th class="th2">Observación</th>
                                        <th class="th2"></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--  COMPRAS REALIZADAS PAGOEFECTIVO -->
                    <div class="tab-pane fade" id="nav-realizadope" role="tabpanel" aria-labelledby="nav-rpe-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePurchasesMadeCashPayment">
                                <thead class="table-success">
                                    <tr class="text-center tr2" style="color: white">
                                        <th class="th2">Ticket</th>
                                        <th class="th2">Fecha de pedido</th>
                                        <th class="th2">Fecha de pago</th>
                                        <th class="th2">CIP</th>
                                        <th class="th2">Monto Neto Total</th>
                                        <th class="th2">Punto</th>
                                        <th class="th2">Puntos promoción</th>
                                        <th class="th2">Tipo de Compra</th>
                                        <th class="th2">Mayorista</th>
                                        <th class="th2">Observación</th>
                                        <th class="th2">Detalle</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--  COMPRAS REALIZADAS TUPAY -->
                    <div class="tab-pane fade" id="nav-realizadotupay" role="tabpanel" aria-labelledby="nav-re-tupay-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePurchasesMadeTupay">
                                <thead class="table-success">
                                    <tr class="text-center tr2" style="color: white">
                                        <th class="th2">Ticket</th>
                                        <th class="th2">Fecha de pedido</th>
                                        <th class="th2">Fecha de pago</th>
                                        <th class="th2">Codigo</th>
                                        <th class="th2">Monto Neto Total</th>
                                        <th class="th2">Punto</th>
                                        <th class="th2">Puntos promoción</th>
                                        <th class="th2">Tipo de Compra</th>
                                        <th class="th2">Mayorista</th>
                                        <th class="th2">Observación</th>
                                        <th class="th2">Detalle</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--  COMPRA REALIZADAS EFECTIVO/CANJE -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePurchasesMadeCash">
                                <thead class="table-success">
                                    <tr class="text-center tr2" style="color: white">
                                        <th class="th2">Ticket</th>
                                        <th class="th2">Fecha de pedido</th>
                                        <th class="th2">Unidades</th>
                                        <th class="th2">Monto Neto Total</th>
                                        <th class="th2">Punto</th>
                                        <th class="th2">Puntos promoción</th>
                                        <th class="th2">Tipo de Compra</th>
                                        <th class="th2">Mayorista</th>
                                        <th class="th2">Observación</th>
                                        <th class="th2"></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--  COMPRA REALIZADAS BBVA -->
                    <div class="tab-pane fade" id="nav-bbva-r" role="tabpanel" aria-labelledby="nav-bbva-r-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePurchasesMadeBBVACash">
                                <thead class="table-success">
                                    <tr class="text-center tr2" style="color: white">
                                        <th class="th2">Ticket</th>
                                        <th class="th2">Fecha de pedido</th>
                                        <th class="th2">Unidades</th>
                                        <th class="th2">Monto Neto Total</th>
                                        <th class="th2">Puntos</th>
                                        <th class="th2">Puntos promoción</th>
                                        <th class="th2">Tipo de Compra</th>
                                        <th class="th2">Mayorista</th>
                                        <th class="th2">Observación</th>
                                        <th class="th2"></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--  COMPRA REALIZADAS DEPOSITO -->
                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%" id="TablePurchasesMadeDeposit">
                                <thead class="table-success">
                                    <tr class="text-center" style="color: white">
                                        <th class="th2">Ticket</th>
                                        <th class="th2">Fecha de pago</th>
                                        <th class="th2">Unidades</th>
                                        <th class="th2">Monto Neto Total</th>
                                        <th class="th2">Puntos</th>
                                        <th class="th2">Puntos promoción</th>
                                        <th class="th2">Voucher</th>
                                        <th class="th2">Voucher Mayorista</th>
                                        <th class="th2">Tipo de Compra</th>
                                        <th class="th2">Mayorista</th>
                                        <th class="th2">Observación</th>
                                        <th class="th2"></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--  COMPRAS CANCELADAS -->
                    <div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <div class="responsiveTbl table-responsive">
                            <table class="table table-hover table-condensed table-bordered w-auto table2" style="text-align: center; width: 100%; cursor: pointer;" id="TableCanceled">
                                <thead class="table-success">
                                    <tr class="text-center" style="color: white">
                                        <th class="th2">Ticket</th>
                                        <th class="th2">Fecha de pago</th>
                                        <th class="th2">Unidades</th>
                                        <th class="th2">Monto Neto Total</th>
                                        <th class="th2">Puntos totales</th>
                                        <th class="th2">Voucher</th>
                                        <th class="th2">Tipo de Compra</th>
                                        <th class="th2">Mayorista</th>
                                        <th class="th2">Observación</th>
                                        <th class="th2"></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                </tfoot>
                                <%-- <tbody class="text-center table">
                                    <% if (listaComprasAnuladas != null)
                                        {
                                            foreach (var compraAnula in listaComprasAnuladas)
                                            {%>
                                    <tr class="text-center">
                                        <td hidden><%=compraAnula.Ticket %></td>
                                        <td><%=compraAnula.FechaPago.ToString("dd/MM/yyyy") %></td>
                                        <td><%=compraAnula.Cantidad %></td>
                                        <td><%=compraAnula.MontoAPagar.ToString("N2").Replace(",", ".") %></td>
                                        <td><%=compraAnula.PuntosTotal.ToString("N2").Replace(",", ".") %></td>
                                        <td><%=compraAnula.FotoVaucher %></td>
                                        <td><%=compraAnula.Despacho %></td>
                                        <td>Realizado</td>                                      
                                        <td style="width: 100px">
                                            <div class="align-middle">
                                             <button type="button" class="btn btn-success btn-lg btn-xs" data-toggle="modal" data-target="#comprasPendientesEfectivoModal"><i class="glyphicon glyphicon-chevron-right"></i> Ver detalle</button>         
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <%}
                                    } %>--%>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal editar pendiendtes -->
    <div class="modal" id="editarComprasPendientes" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" data-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document" style="display: flex; justify-content: center;">
            <div class="modal-content modalDetalleContent">
                <div class="modal-header modalDetalleHeader">
                    <h5 class="modal-title font-weight-bold modalDetalleHeader__titulo">EDITAR VOUCHER</h5>
                    <button type="button" onclick="QuitarCamposRequeridos()" class="close" data-dismiss="modal" aria-label="Close">
                        <span onclick="QuitarCamposRequeridos()" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body modalDetalleBody">
                    <div class="fila" style="max-width: 400px">
                        <div class="fila__contenido bloqueIzquierda">
                            <label class="">Seleccionar voucher:</label>
                            <div class="cajaIzquierda">
                                <label class="file-upload btn form-control border subirArchivo">
                                    <img src="img/imgExportWhite.png" alt="Alternate Text" />&nbsp; Subir archivo
                                     <input type="file" id="file_archivos" name="postedFile" class="form-control" onchange="subir()" />
                                    <input type="button" id="btnUpload" value="Upload" onclick="subir();" style="display: none" />

                                    <input type="file" class="imagen form-control" id="imagen" name="NuevaFotoCliente" accept="image/x-png,image/jpeg" runat="server" visible="false" />
                                </label>
                            </div>
                            <div class="nombreArchivo" id="div_download">
                                <a id="id_download" href="#" target="_blank"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;Descargar</a>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-md-12" style="text-align: center; display: none" id="div_download">
                            <a download id="id_download" href="#" target="_blank"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;Descargar</a>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <progress id="fileProgress" class="form-control" style="display: none"></progress>
                        </div>
                    </div>--%>
                    <div class="fila">
                        <div class="fila__contenido bloqueIzquierda">
                            <label class="">Banco:</label>
                            <div class="cajaIzquierda">
                                <select id="cboBanco" runat="server" class="form-control border">
                                    <option value="0">Seleccionar:</option>
                                    <option value="BCP">BCP</option>
                                    <option value="BBVA COLLECTION">BBVA RECAUDO</option>
                                    <option value="BBVA">BBVA</option>
                                </select>
                            </div>
                        </div>

                        <div class="fila__contenido bloqueDerecha">
                            <label class="">N° Operación:</label>
                            <div class="cajaIzquierda">
                                <input type="text" onkeypress="return validarNumeros(event)" class="form-control border" id="TxtNumOperacion" runat="server" placeholder="N° operación" style="padding-left: 14px">
                            </div>
                        </div>
                    </div>
                    <div class="fila">
                        <div class="fila__contenido bloqueIzquierda">
                            <label class="">Monto:</label>
                            <div class="cajaIzquierda">
                                <input type="text" class="form-control solo-numero noBorder" id="TxtMonto" runat="server" placeholder="Ingresar monto" readonly style="padding-left: 14px">
                            </div>
                        </div>
                        <div class="fila__contenido bloqueDerecha">
                            <label class="">Fecha Voucher:</label>
                            <div class="cajaIzquierda">
                                <div class="input-group date" id="datetimepicker2">
                                    <input id="datepicker" type="text" class="form-control noBorder" runat="server" readonly><span class="input-group-addon noBorder"><i class="glyphicon glyphicon-th" style="right: 6px"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fila">
                        <div class="fila__contenido bloqueIzquierda">
                            <label class="">Tipo de Pago:</label>
                            <div class="cajaIzquierda">
                                <select id="cboTipoPago" name="cboTPago" runat="server" class="form-control border">
                                    <option hidden value="0">Seleccionar:</option>
                                    <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                                    <option value="DEPOSITO">DEPOSITO</option>
                                </select>
                            </div>
                        </div>
                        <div class="fila__contenido bloqueDerecha">
                            <label class="">Tipo Voucher:</label>
                            <div class="cajaIzquierda">
                                <select id="cboComprobante" runat="server" class="form-control border">
                                    <option hidden value="0">Select</option>
                                    <option value="1">BOLETA</option>
                                    <option value="2">FACTURA</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="fila">
                        <div class="fila__contenido bloqueIzquierda">
                            <label class="">Confirmar Tienda:</label>
                            <div class="cajaIzquierda">
                                <select id="cmbTienda" class="form-control noBorder" style="margin-bottom: 5px;" disabled runat="server"></select>
                                <asp:DropDownList ID="ComboTienda" CssClass="form-control btn-lg" runat="server" Enabled="false" Font-Size="10px" Visible="false">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer modalDetalleFooter">
                    <button type="button" class="btn btn-lg btnCancelar" onclick="QuitarCamposRequeridos()" data-dismiss="modal">CANCELAR</button>
                    <button type="button" class="btn btn-lg btn-primary float-right" onclick="validar_campos();">GUARDAR</button>
                    <%--<center><asp:Button ID="Button1" OnClick="Button1_Click" Font-Size="0px" Text="Save" runat="server" /></center>--%>
                    <center><asp:Button ID="BtnAgregarVaucher" OnClick="BtnAgregarVaucher_Click" Text="Save" Font-Size="0px" runat="server" /></center>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal realizadas -->
    <div class="modal" id="comprasRealizadasModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header ">
                    <h5 class="modal-title font-weight-bold modalDetalleTitulo">DETALLE DE MI COMPRA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body scroll style-1">
                    <div class="row">
                        <div class="col-12 col-sm-7 col-md-7">
                            <div class="table-responsive">
                                <table class="table table-bordred table-striped">
                                    <thead class="table-success">
                                        <tr class="text-center">
                                            <th>SUPER ALIMENTO</th>
                                            <th>NOMBRE</th>
                                            <th>UNIDADES</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-center">
                                        <% if (listaDetalleCompra != null)
                                            {
                                                foreach (var detalleCompra in listaDetalleCompra)
                                                {%>
                                        <tr class="text-center">
                                            <td style="width: 20%">
                                                <div class="row">
                                                    <div class="col-9 col-sm-9 col-md-9 center-block">
                                                        <img src="products/<%=detalleCompra.Foto %>" class="img-responsive" />
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%=detalleCompra.Nombre %></td>
                                            <td><%=detalleCompra.Cantidad %></td>
                                        </tr>
                                    </tbody>
                                    <%}
                                        } %>
                                </table>
                            </div>
                        </div>
                        <div class="col-12 col-sm-5 col-md-5">
                            <div style="height: 250px">
                                <% if (listaDetalleCompra != null)
                                    {%>
                                <img src="<%=fotoVoucherCompra%>" class="img-responsive" />
                                <%} %>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-lg" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal realizadas Efectivo-->
    <div class="modal" id="comprasRealizadasModalEfectivoGo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold modalDetalleTitulo">DETALLE DE MI COMPRA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordred table-striped">
                                    <thead class="table-success">
                                        <tr class="text-center">
                                            <th>SUPER ALIMENTO</th>
                                            <th>NAME</th>
                                            <th>UNIDADES</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-center">
                                        <% if (listaDetalleCompra != null)
                                            {
                                                foreach (var detalleCompra in listaDetalleCompra)
                                                {%>
                                        <tr class="text-center">
                                            <td style="width: 20%">
                                                <div class="row">
                                                    <div class="col-9 col-sm-9 col-md-9 center-block">
                                                        <img src="products/<%=detalleCompra.Foto %>" class="img-responsive" />
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%=detalleCompra.Nombre %></td>
                                            <td><%=detalleCompra.Cantidad %></td>
                                        </tr>
                                    </tbody>
                                    <%}
                                        } %>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-lg" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal realizadas Visa Net-->
    <div class="modal" id="comprasRealizadasVisaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" data-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold modalDetalleTitulo">DETALLE DE MI COMPRA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordred table-striped">
                                    <thead class="table-success">
                                        <tr class="text-center">
                                            <th>SUPER ALIMENTO</th>
                                            <th>NAME</th>
                                            <th>UNIDADES</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-center">
                                        <% if (listaDetalleCompra != null)
                                            {
                                                foreach (var detalleCompra in listaDetalleCompra)
                                                {%>
                                        <tr class="text-center">
                                            <td style="width: 20%">
                                                <div class="row">
                                                    <div class="col-9 col-sm-9 col-md-9 center-block">
                                                        <img src="products/<%=detalleCompra.Foto %>" class="img-responsive" />
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%=detalleCompra.Nombre %></td>
                                            <td><%=detalleCompra.Cantidad %></td>
                                        </tr>
                                    </tbody>
                                    <%}
                                        } %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-lg" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Pendiente Efectivo -->
    <div class="modal" id="comprasPendientesEfectivoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" data-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content modalDetalleContent">
                <div class="modal-header modalDetalleHeader">
                    <h5 class="modal-title font-weight-bold modalDetalleHeader__titulo">DETALLE DE MI COMPRA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body modalDetalleBody">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12">
                            <div class="table-responsive">
                                <table id="tablaDetalleComprasRealizadasEfectivo" class="table table-bordred table-striped">
                                    <thead class="table-success">
                                        <tr class="text-center" style="color: white">
                                            <th>Super alimento</th>
                                            <th>Nombre</th>
                                            <th>UNIDADES</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer modalDetalleFooter">
                    <button type="button" class="btn btn-lg" data-dismiss="modal">CERRAR</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Pendiente Pago Efectivo -->
    <div class="modal" id="comprasPendientesPagoEfecModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold">DETAIL1 OF MY PURCHASE</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordred table-striped">
                                    <thead class="table-success">
                                        <tr class="text-center">
                                            <th>SUPER COMIDA</th>
                                            <th>NOMBRE</th>
                                            <th>UNIDADES</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-center">
                                        <% if (listaDetalleCompra != null)
                                            {
                                                foreach (var detalleCompra in listaDetalleCompra)
                                                {%>
                                        <tr class="text-center">
                                            <td style="width: 20%">
                                                <div class="row">
                                                    <div class="col-9 col-sm-9 col-md-9 center-block">
                                                        <img src="products/<%=detalleCompra.Foto %>" class="img-responsive" />
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%=detalleCompra.Nombre %></td>
                                            <td><%=detalleCompra.Cantidad %></td>
                                        </tr>
                                    </tbody>
                                    <%}
                                        } %>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer ">
                    <button type="button" class="btn btn-lg" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Detalle pendientes -->
    <div class="modal" id="comprasPendientesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold modalDetalleTitulo">DETALLE DE MI COMPRA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordred table-striped">
                                    <thead class="table-success">
                                        <tr class="text-center">
                                            <th>SUPER ALIMENTO</th>
                                            <th>NOMBRE</th>
                                            <th>UNIDADES</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-center">
                                        <% if (listaDetalleCompra != null)
                                            {
                                                foreach (var detalleCompra in listaDetalleCompra)
                                                {%>
                                        <tr class="text-center">
                                            <td style="width: 20%">
                                                <div class="row">
                                                    <div class="col-9 col-sm-9 col-md-9 center-block">
                                                        <img src="products/<%=detalleCompra.Foto %>" class="img-responsive" />
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%=detalleCompra.Nombre %></td>
                                            <td><%=detalleCompra.Cantidad %></td>
                                        </tr>
                                    </tbody>
                                    <%}
                                        } %>
                                </table>
                            </div>
                        </div>
                        <div class="col-12 col-sm-5 col-md-5">
                            <div style="height: 250px">
                                <% if (listaDetalleCompra != null)
                                    {%>
                                <img src="<%=fotoVoucherCompra%>" class="img-responsive" />
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer ">
                    <button type="button" class="btn btn-lg btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Detalle pendientes -->
    <div class="modal" id="ModalProducto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content modalDetalleContent">
                <div class="modal-header modalDetalleHeader">
                    <h5 class="modal-title font-weight-bold" id="TituloProducto"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12" style="display: flex;">
                            <div class="col-12 col-sm-12 col-md-12 center-block">
                                <img id="img_result" src="#" class="img-responsive" style="width: 100%; cursor: pointer; text-align: center" title="click here" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer modalDetalleFooter">
                    <button type="button" class="btn btn-lg" data-dismiss="modal">CERRAR</button>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="Ticket" runat="server" />

    <%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="js/bootstrap4.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>


    <script src="js/file-uploadv1.js"></script>
    <script src="js/jquery.numeric.js"></script>
    <script src="js/moment.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10" type="text/javascript"></script>

    <!--Nuevo DatePicker (calendario)-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
    <!--Nuevo DatePicker (calendario) en español-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.es.min.js"></script>


    <script>
        window.onload = function () {
            if (window.innerWidth < 1148) {
                //document.getElementById("liHistCompras").style.background = '#E8E8E8';

                document.getElementById("idMenuTienda").style.color = 'white';
                //document.getElementById("idMenuTienda").style.fontWeight = "700";
                document.getElementById("idMenuTienda").classList.add("peso700");
                document.getElementById("idSubMenuHisCompras").style.fontWeight = "700";


                //var naranja = document.getElementById("navtienda2");
                //naranja.classList.add('menu__item--active2');
            }
            else {
                document.getElementById("idMenuTienda").style.color = 'white';
                document.getElementById("idMenuTienda").style.borderBottom = '3px solid white';
                document.getElementById("idSubMenuHisCompras").style.color = 'white';
                document.getElementById("idSubMenuHisCompras").style.fontWeight = "700";
            }

        }

        $('#datetimepicker2').datepicker({
            weekStart: 0,
            todayBtn: "linked",
            language: "es",
            orientation: "bottom auto",
            keyboardNavigation: false,
            autoclose: true
        });


        $(document).ready(function () {
            $("#ModalProducto").on("hidden.bs.modal", function () {
                $('#comprasPendientesEfectivoModal').modal('show');
            });
        });


    </script>

    <script>
        $("[id$=datepicker]").datepicker({
            uiLibrary: 'bootstrap4',
            format: 'dd/mm/yyyy',
            endDate: new Date()
        });
        $('.solo-numero').numeric();

        function showRowComprasByID(value, rowComprasPen, rowComprasRea, rowComprasPenAprob, rowComprasAnula) {
            if (value == "1") {
                rowComprasPen.style.display = "block";
                rowComprasRea.style.display = "none";
                rowComprasPenAprob.style.display = "none";
                rowComprasAnula.style.display = "none";
            } else if (value == "2") {
                rowComprasPen.style.display = "none";
                rowComprasRea.style.display = "block";
                rowComprasPenAprob.style.display = "none";
                rowComprasAnula.style.display = "none";
            } else if (value == "3") {
                rowComprasPen.style.display = "none";
                rowComprasRea.style.display = "none";
                rowComprasPenAprob.style.display = "block";
                rowComprasAnula.style.display = "none";
            } else {
                rowComprasPen.style.display = "none";
                rowComprasRea.style.display = "none";
                rowComprasPenAprob.style.display = "none";
                rowComprasAnula.style.display = "block";
            }
        }

        function EnviarTicket(t) {
            var tick = $($($(t).parent().parent().children()[0]).children()[0]).parent().parent().parent().parent().children()[0].children[0].textContent;
            var Ticket = $("[id$=Ticket]");
            Ticket.val(tick);
        }

        function EliminarTicket(t) {
            var tick = $($($(t).parent().parent().children()[0]).children()[0]).parent().parent().parent().parent().children()[0].children[0].textContent;
            var Ticket = $("[id$=Ticket]");
            Ticket.val(tick);
        }

        function DetalleComprasRealizadas(t) {
            var tick = $($($(t).parent().parent().children()[0]).children()[0]).parent().parent().parent().parent().children()[0].children[0].textContent;
            var Ticket = $("[id$=Ticket]");
            Ticket.val(tick);
        }

        function DetalleComprasEfectivo(t) {
            var tick = $($($(t).parent().parent().children()[0]).children()[0]).parent().parent().parent().parent().children()[0].children[0].textContent;
            var Ticket = $("[id$=Ticket]");
            Ticket.val(tick);
        }

        function DetalleComprasPendientes(t) {
            var tick = $($($(t).parent().parent().children()[0]).children()[0]).parent().parent().parent().parent().children()[0].children[0].textContent;
            var Ticket = $("[id$=Ticket]");
            Ticket.val(tick);
        }

        function MostrarComprasRealizadas() {
            $("#comprasRealizadasModal").modal("show");
        }

        function MostrarComprasRealizadasEfectivo() {
            $("#comprasRealizadasModalEfectivoGo").modal("show");
        }

        function MostrarComprasRealizadasVisa() {
            $("#comprasRealizadasVisaModal").modal("show");
        }

        function MostrarComprasPendientesEfectivo() {
            $("#comprasPendientesEfectivoModal").modal("show");
        }

        function MostrarComprasPendientesPagoEfec() {
            $("#comprasPendientesPagoEfecModal").modal("show");
        }

        function MostrarComprasPendientes() {
            $("#comprasPendientesModal").modal("show");
        }

        function ShowModalEditar() {
            FijarCamposRequeridos();
            $("#editarComprasPendientes").modal("show");
        }

        function FijarCamposRequeridos() {
            $("[id$=TxtBanco]").prop("required", true);
            $("[id$=TxtNumOperacion]").prop("required", true);
            $("[id$=datepicker]").prop("required", true);
            $("[id$=TxtMonto]").prop("required", true);
            $("[id$=imagen]").prop("required", true);
            $("[id$=ComboTienda]").prop("required", true);
            $("[id$=cboComprobante]").prop("required", true);
        }

        function QuitarCamposRequeridos() {
            $("[id$=TxtBanco]").prop("required", false);
            $("[id$=TxtNumOperacion]").prop("required", false);
            $("[id$=datepicker]").prop("required", false);
            $("[id$=TxtMonto]").prop("required", false);
            $("[id$=imagen]").prop("required", false);
            $("[id$=ComboTienda]").prop("required", false);
            $("[id$=cboComprobante]").prop("required", false);

            var IdCliente = document.getElementById('hf_IdCliente').value;
            EliminarVouchersTemporal(IdCliente);
        }

        function pageLoad() {
            $('.file-upload').file_upload();

            function filePreview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imagePreview').html("<img src='" + e.target.result + "' style='height:200px' />");
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $('.imagen').change(function () {
                filePreview(this);
            });

        }

        function validarLetras(e) {
            var keyCode = (e.keyCode ? e.keyCode : e.which);
            if (keyCode > 47 && keyCode < 58 || keyCode > 95 && keyCode < 107) {
                e.preventDefault();
            }
        }

        function validarNumeros(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js" defer></script>

    <link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {

            $(document).mouseup(function (e) {
                var buttons = $("#nav-home-tab, #nav-efectivo-tab,#nav-pendpe-tab,#nav-pen-tupay-tab,#nav-visa-tab,#nav-rpe-tab,#nav-re-tupay-tab,#nav-profile-tab,#nav-contact-tab,#nav-about-tab");
                var btn = e.target.id;
                if (btn == 'nav-home-tab') {
                    // alert('PENDING PURCHASES');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-efectivo-tab') {
                    // alert('PENDING PURCHASES CASH');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-pendpe-tab') {
                    //alert('PENDING PURCHASES CASH PAYMENT');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-pen-tupay-tab') {
                    //alert('PENDING PURCHASES CASH PAYMENT');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-visa-tab') {
                    //alert('PURCHASE MADE VISANET');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-rpe-tab') {
                    //alert('PURCHASE MADE CASH PAYMENT');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-re-tupay-tab') {
                    //alert('PURCHASE MADE CASH PAYMENT');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-profile-tab') {
                    //alert('PURCHASE MADE CASH');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-contact-tab') {
                    //alert('PURCHASE MADE DEPOSIT');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-about-tab') {
                    //alert('CANCELED');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-bbva-tab') {
                    //alert('CANCELED');
                    $('.active').removeClass('active');
                }
                if (btn == 'nav-bbva-r-tab') {
                    //alert('CANCELED');
                    $('.active').removeClass('active');
                }

                $("#cmbTienda").on("change", function () {

                    var ValorTienda = $("#cmbTienda").val();

                    if (ValorTienda == 0) {
                        alert("no existe seleccion");
                    } else {
                        alert(ValorTienda);
                    }

                });

            });
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePendingPurchases(IdCliente);
        });

        function EliminarCompraExpiradaEfectivo(Ticket) {
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/EliminarCompraExpirada',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{Ticket: "' + Ticket + '"}',
                success: function (data) {
                    Swal.fire({
                        title: 'Perfecto!',
                        text: 'La compra ha sido eliminada',
                        type: "success"
                    }).then(function () {
                        TabPendingPurchasesCashPayment();
                    });
                }
            })
        }

        function LlenarDatatableComprasRealizadasEfectivo(Ticket) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetalleComprasRealizadasEfectivo',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{Ticket: "' + Ticket + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#tablaDetalleComprasRealizadasEfectivo').DataTable({
                        data: ndata,
                        columns: [
                            {
                                "data": { 'Foto': 'Foto', 'Nombre': 'Nombre' },
                                "render": function (data) {
                                    var btnFoto = '<div class="col-12 center-block" id="div-image" onclick="openProducto(' + "'" + data.Foto + "'" + ',' + "'" + data.Nombre + "'" + ');"><img src="https://yosoymitosis.com/products/' + data.Foto + '" class="img-responsive" style="width:100%;cursor:pointer" title="click here" /></div>'
                                    return btnFoto;
                                }
                            },
                            { data: 'Nombre' },
                            { data: 'Cantidad' },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true
                    });
                }
            })
        }

        function TabPendingPurchases() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePendingPurchases(IdCliente);
        }
        function TabPendingPurchasesCash() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePendingPurchasesCash(IdCliente);
        }
        function TabPendingPurchasesBBVACash() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePendingPurchasesBBVACash(IdCliente);
        }
        function TabPendingPurchasesCashPayment() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseCashPayment(IdCliente);
        }
        function TabPendingPurchasesTupay() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseTupay(IdCliente);
        }
        function TabPendingPurchasesMadeVisanet() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseMadeVisanet(IdCliente);
        }
        function TabPendingPurchasesMadeCashPayment() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseMadeCashPayment(IdCliente);
        }
        function TabPendingPurchasesMadeTupay() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseMadeTupay(IdCliente);
        }
        function TabPendingPurchasesMadeCash() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseMadeCash(IdCliente);
        }
        function TabPendingPurchasesMadeBBVACash() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseMadeBBVACash(IdCliente);
        }
        function TabPendingPurchasesMadeDeposit() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatablePurchaseMadeDeposit(IdCliente);
        }
        function TabCanceladas() {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            LlenarDatatableCanceladas(IdCliente);
        }

        function LlenarDatatablePendingPurchases(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchases',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    var NombreCliente;
                    var idTipoCompra;
                    var FechaPago;
                    var TipoCompra;
                    var NotaDelivery;
                    var Ruc;

                    $.each(ndata, function (i) {
                        NombreCliente = ndata[i].NombreCliente;
                        idTipoCompra = ndata[i].idTipoCompra;
                        FechaPago = ndata[i].FechaPago2;
                        TipoCompra = ndata[i].TipoCompra;
                        NotaDelivery = ndata[i].NotaDelivery;
                        Ruc = ndata[i].Ruc;

                        $('#<%=HiddenField_NombreCliente.ClientID%>').val(NombreCliente);
                        $('#<%=HiddenField_idTipoCompra.ClientID%>').val(idTipoCompra);
                        $('#<%=HiddenField_FechaPago.ClientID%>').val(FechaPago);
                        $('#<%=HiddenField_TipoCompra.ClientID%>').val(TipoCompra);
                        $('#<%=HiddenField_NotaDelivery.ClientID%>').val(NotaDelivery);
                        $('#<%=HiddenField_Ruc.ClientID%>').val(Ruc);

                    });

                    table = $('#TablePendingPurchases').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'FotoVaucher' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">PENDIENTE</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnVoucher = '';
                                    //btnVoucher = ' <button type="button" title="Voucher" class="btn btn-primary btn-lg btn-xs" onclick="VerVocuher(' + "'" + data.Ticket + "'" + ',);" ><i class="glyphicon glyphicon-list-alt"></i> Voucher</button>';
                                    btnVoucher = ' <button type="button" title="Voucher" class="btn newButtonTableHistorial btnVoucher btn-lg btn-xs" onclick="VerVocuher(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/voucher.png" alt="Alternate Text" width="17" /> Voucher</button>';
                                    return btnVoucher;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btnDetalle btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnRemove = '';
                                    //btnRemove = ' <button type="button" title="Eliminar" class="btn btn-danger btn-lg btn-xs" onclick="RemoverPendingPurchases(' + "'" + data.Ticket + "'" + ',);" ><i class="glyphicon glyphicon-remove"></i> Eliminar</button>';
                                    btnRemove = ' <button type="button" title="Eliminar" class="btn newButtonTableHistorial btnRemove btn-lg btn-xs" onclick="RemoverPendingPurchases(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/delete.png" alt="Alternate Text" width="13" /> Eliminar</button>';
                                    return btnRemove;
                                }
                            },

                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true
                    });
                }
            })
        }

        /*COMPRA PENDIENTE BBVA*/

        function LlenarDatatablePendingPurchasesBBVACash(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesBBVACash',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#tablePendingPurchasesBBVACash').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">PENDIENTE</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    //btnDetalle = ' <button type="button" title="Ver detalle" class="btn btn-success btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" ><i class="glyphicon glyphicon-chevron-right"></i> Ver detalle</button>';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btnDetalle btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        /*COMPRAS PENDIENTE EFECTIVO*/
        function LlenarDatatablePendingPurchasesCash(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesCash',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#tablePendingPurchasesCash').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">PENDIENTE</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }
        /* COMPRAS PENDIENTE - PAGO EFECTIVO CIP*/
        function LlenarDatatablePurchaseCashPayment(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesCashPayment',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePendingPurchasesCashPayment').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaCreacion' },
                            { data: 'FechaExpiracion' },
                            { data: 'CIP' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">PENDIENTE</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    //btnDetalle = ' <button type="button" title="Ver detalle" class="btn btn-success btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" ><i class="glyphicon glyphicon-chevron-right"></i> Ver detalle</button>';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btnDetalle btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                            {
                                data: { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    var day = moment().format("DD/MM/YYYY HH:mm:ss");
                                    day = moment(day, "DD/MM/YYYY HH:mm:ss").toDate();
                                    var exp = moment(data.FechaExpiracion, 'DD/MM/YYYY HH:mm:ss').toDate();
                                    var dis = (exp > day) ? "none" : "";
                                    console.log(day + " " + dis + " " + exp);
                                    btnDetalle = ' <button type="button" style="display:' + dis + '" class="btn btn-danger btn-lg btn-xs" onclick="EliminarCompra(' + "'" + data.Ticket + "'" + ',);" ><i class="glyphicon glyphicon-chevron-right"></i> Eliminar</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        /* COMPRAS PENDIENTE - TUPAY*/
        function LlenarDatatablePurchaseTupay(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesTupay',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePendingPurchasesTupay').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaCreacion' },
                            { data: 'FechaExpiracion' },
                            { data: 'Codigo_Tupay' },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var label1 = '<span onclick="window.open(\'' + data.URL + '\')" style="text-decoration: underline; color: blue; cursor: pointer;">URL</span>';
                                    return label1;
                                }
                            },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">PENDIENTE</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btnDetalle btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                            {
                                data: { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    var day = moment().format("DD/MM/YYYY HH:mm:ss");
                                    day = moment(day, "DD/MM/YYYY HH:mm:ss").toDate();
                                    var exp = moment(data.FechaExpiracion, 'DD/MM/YYYY HH:mm:ss').toDate();
                                    var dis = (exp > day) ? "none" : "";
                                    console.log(day + " " + dis + " " + exp);
                                    btnDetalle = ' <button type="button" style="display:' + dis + '" class="btn btn-danger btn-lg btn-xs" onclick="EliminarCompra(' + "'" + data.Ticket + "'" + ',);" ><i class="glyphicon glyphicon-chevron-right"></i> Eliminar</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        function LlenarDatatablePurchaseMadeVisanet(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesMadeVisanet',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePurchasesMadeVisanet').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">REALIZADO</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" style="transition: .3s ease all" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        /*COMPRAS REALIZADAS PAGO EFECTIVO - CIP*/
        function LlenarDatatablePurchaseMadeCashPayment(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesMadeCashPayment',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePurchasesMadeCashPayment').DataTable({
                        order: [[0, "desc"]],
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'FechaPagada' },
                            { data: 'CIP' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">REALIZADO</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btn-lg btn-xs btnDetalle" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" style="transition: .3s ease all" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        /*COMPRAS REALIZADAS TUPAY*/
        function LlenarDatatablePurchaseMadeTupay(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePurchasesMadeTupay',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePurchasesMadeTupay').DataTable({
                        order: [[0, "desc"]],
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'FechaPagada' },
                            { data: 'Codigo_Tupay' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">REALIZADO</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btn-lg btn-xs btnDetalle" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" style="transition: .3s ease all" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        function LlenarDatatablePurchaseMadeCash(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesMadeCash',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePurchasesMadeCash').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">REALIZADO</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" style="transition: .3s ease all" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        /*COMPRA REALIZADA BBVA*/
        function LlenarDatatablePurchaseMadeBBVACash(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesMadeBBVACash',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePurchasesMadeBBVACash').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">REALIZADO</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" style="transition: .3s ease all" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        function LlenarDatatablePurchaseMadeDeposit(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetallePendingPurchasesMadeDeposit',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TablePurchasesMadeDeposit').DataTable({
                        order: [[0, "desc"]],
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'PuntosTotalPromo' },
                            { data: 'FotoVaucher' },
                            { data: 'DespachoVoucher' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">REALIZADO</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btnDetalle btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" style="transition: .3s ease all" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true


                    });
                }
            })
        }

        function LlenarDatatableCanceladas(IdCliente) {
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DetalleCanceladas',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{IdCliente: "' + IdCliente + '"}',
                success: function (data) {
                    ndata = data.d;
                    table = $('#TableCanceled').DataTable({
                        data: ndata,
                        columns: [
                            { data: 'Ticket' },
                            { data: 'FechaPago2' },
                            { data: 'Cantidad' },
                            { data: 'MontoAPagar' },
                            { data: 'PuntosTotal' },
                            { data: 'FotoVaucher' },
                            { data: 'TipoCompra' },
                            { data: 'ApodoYW' },
                            {
                                "data": 'Ticket',
                                "render": function (Ticket) {
                                    var label1 = '<label for="name">REALIZADO</label>';
                                    return label1;
                                }
                            },
                            {
                                "data": { 'Ticket': 'Ticket' },
                                "render": function (data) {
                                    var btnDetalle = '';
                                    btnDetalle = ' <button type="button" title="Ver detalle" class="btn newButtonTableHistorial btn-lg btn-xs" onclick="VerDetalle(' + "'" + data.Ticket + "'" + ',);" > <img src="img/iconosNavHeadHistorial/ver detalle.png" alt="Alternate Text" width="15" style="transition: .3s ease all" /> Ver detalle</button>';
                                    return btnDetalle;
                                }
                            },
                        ],
                        language: {
                            "decimal": "",
                            "emptyTable": "There is no information",
                            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Mostrar _MENU_ Entradas",
                            "loadingRecords": "Cargando...",
                            "processing": "Procesando...",
                            "search": "Buscar: ",
                            "zeroRecords": "Sin resultados encontrados",
                            "paginate": {
                                "first": "First",
                                "last": "Latest",
                                "next": "Siguiente",
                                "previous": "Anterior"
                            }
                        },
                        "scrollY": false,
                        "scrollX": true,
                        "scrollCollapse": true,
                        "ordering": true,
                        "bInfo": false,
                        "bLengthChange": false,
                        "paging": true,
                        "responsive": true,
                        "select": false,
                        "bDestroy": true,
                        "autoWidth": true

                    });
                }
            })
        }

        function RemoverPendingPurchases(Ticket) {
            $('#confirm-delete').modal('show');
            hdnTicket.value = Ticket
        }
        function RemoverSi() {
            var Ticket = hdnTicket.value;
            var ndata; var table;
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/EliminarCompraCliente',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                data: '{Ticket: "' + Ticket + '"}',
                success: function (data) {
                    ndata = data.d;

                    var IdCliente = document.getElementById('hf_IdCliente').value;
                    LlenarDatatablePendingPurchases(IdCliente);
                }
            });
        }

        function VerDetalle(Ticket) {
            $('#comprasPendientesEfectivoModal').modal('show');
            LlenarDatatableComprasRealizadasEfectivo(Ticket);
        }

        function EliminarCompra(Ticket) {
            Swal.fire({
                title: 'Está seguro de eliminar la compra? Si ya realizó el pago debe esperar a que se facture la compra.',
                text: "Esto no puede revertirse!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, eliminar!'
            }).then((result) => {
                if (result.isConfirmed) {
                    EliminarCompraExpiradaEfectivo(Ticket);
                }
            });

        }

        function VerVocuher(Ticket) {
            var IdCliente = document.getElementById('hf_IdCliente').value;
            $('#<%=HiddenTicket.ClientID%>').val(Ticket);
            limpiar_campos();
            EliminarVouchersTemporal(IdCliente);
            ListarEstablecimiento(Ticket);
            $('#editarComprasPendientes').modal('show');

        }
        function ListarEstablecimiento(Ticket) {
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/ListadoEstablecimiento',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                async: true,
                cache: false,
                success: function (data) {
                    var Tienda = data.d;
                    $("#cmbTienda").empty();
                    $("#cmbTienda").append("<option value=" + 0 + ">" + '--- Seleccionar ---' + "</option>");
                    $.each(Tienda, function (i) {
                        $("#cmbTienda").append("<option value=" + Tienda[i].IdPeruShop + ">" + Tienda[i].apodo + "</option>")
                    });
                    DevolverDatosTicket(Ticket);
                },
                error: function (xhr, status, error) {
                    var error_especifico = eval("(" + xhr.responseText + ")");
                    var error_mostrar = '';
                    if (xhr.status === 0) {
                        error_mostrar = ('Verificar conexión a internet - ' + error_especifico.Message);
                    } else if (xhr.status == 404) {
                        error_mostrar = ('URL solicitada no encontrada [Error 404] - ' + error_especifico.Message);
                    } else if (xhr.status == 500) {
                        error_mostrar = ('Error interno del servidor [Error 500] - ' + error_especifico.Message);
                    } else if (status === 'parsererror') {
                        error_mostrar = ('JSON solicitado falló - ' + error_especifico.Message);
                    } else if (status === 'timeout') {
                        error_mostrar = ('Error en tiempo de espera - ' + error_especifico.Message);
                    } else if (status === 'abort') {
                        error_mostrar = ('Solicitud Ajax abortada - ' + error_especifico.Message);
                    } else {
                        error_mostrar = ('Error desconocido: - ' + error_especifico.Message);
                    }

                }
            });
        }

        function DevolverDatosTicket(Ticket) {
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DevolverDespachoTicket',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                async: true,
                cache: false,
                data: '{Ticket: "' + Ticket + '"}',
                success: function (data) {
                    var Datos = data.d;
                    var Despacho;
                    var MontoPagar;
                    $.each(Datos, function (i) {
                        MontoPagar = Datos[i].MontoAPagar;
                        Despacho = Datos[i].Despacho;
                        $("#TxtMonto").val(MontoPagar);
                        $("#cmbTienda option[value='" + Despacho + "']").attr("selected", true);
                        $('#<%=HiddenTienda.ClientID%>').val(Despacho);
                        $('#<%=HiddenMondoPagar.ClientID%>').val(MontoPagar);
                    });

                },
                error: function (xhr, status, error) {
                    var error_especifico = eval("(" + xhr.responseText + ")");
                    var error_mostrar = '';
                    if (xhr.status === 0) {
                        error_mostrar = ('Verificar conexión a internet - ' + error_especifico.Message);
                    } else if (xhr.status == 404) {
                        error_mostrar = ('URL solicitada no encontrada [Error 404] - ' + error_especifico.Message);
                    } else if (xhr.status == 500) {
                        error_mostrar = ('Error interno del servidor [Error 500] - ' + error_especifico.Message);
                    } else if (status === 'parsererror') {
                        error_mostrar = ('JSON solicitado falló - ' + error_especifico.Message);
                    } else if (status === 'timeout') {
                        error_mostrar = ('Error en tiempo de espera - ' + error_especifico.Message);
                    } else if (status === 'abort') {
                        error_mostrar = ('Solicitud Ajax abortada - ' + error_especifico.Message);
                    } else {
                        error_mostrar = ('Error desconocido: - ' + error_especifico.Message);
                    }

                }
            });
        }
        function subir() {
            $("#Progress").show();

            var IdCliente = document.getElementById('hf_IdCliente').value;
            var Usuario = IdCliente;
            $.ajax({
                url: 'Handler_UploadVoucher.ashx?Usuario=' + Usuario,
                type: 'POST',
                data: new FormData($('form')[0]),
                cache: false,
                contentType: false,
                processData: false,
                success: function (file) {

                    if (file.name === 'FORMATO INCORRECTO') {
                        $("#fileProgress").hide();
                        $("#Progress").hide();
                        $("#file_archivos").val(null);
                        error("Formato Incorrecto");
                    }
                    else {
                        if (file.name == 'EXISTE') {
                            $("#fileProgress").hide();
                            $("#Progress").hide();
                            $("#file_archivos").val(null);
                            error("Voucher Existe");
                        }
                        else if (file.name == 'NO EXISTE') {
                            $("#fileProgress").hide();
                            $("#Progress").hide();
                            $("#file_archivos").val(null);

                            DevolverVouchersTemporal(Usuario);
                            alerta("Voucher Registrado Temporal");

                        } else {
                            $("#fileProgress").hide();
                            $("#Progress").hide();
                            $("#file_archivos").val(null);
                            error("Error Carga Voucher");
                        }
                    }

                },
                xhr: function () {
                    var fileXhr = $.ajaxSettings.xhr();
                    if (fileXhr.upload) {
                        $("progress").show();
                        fileXhr.upload.addEventListener("progress", function (e) {
                            if (e.lengthComputable) {
                                $("#fileProgress").attr({
                                    value: e.loaded,
                                    max: e.total
                                });
                            }
                        }, false);
                    }
                    return fileXhr;
                }
            });
        }

        function DevolverVouchersTemporal(Usuario) {
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/DevolverVouchersTemporal',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                async: true,
                cache: false,
                data: '{Usuario: "' + Usuario + '"}',
                success: function (data) {
                    var Datos = data.d;
                    var ruta;
                    var name_ruta;
                    $.each(Datos, function (i) {
                        ruta = Datos[i].Ruta;
                        name_ruta = ruta.substring(17, 100);
                        $('#<%=HiddenRuta.ClientID%>').val(ruta);

                        document.getElementById('id_download').setAttribute('href', ruta);
                        document.getElementById('div_download').style.display = 'block';

                        var html = `<a download  id="id_download" href="${ruta}" target="_blank"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;${name_ruta}</a>   `
                        $("#div_download").html(html);


                    });

                },
                error: function (xhr, status, error) {
                    var error_especifico = eval("(" + xhr.responseText + ")");
                    var error_mostrar = '';
                    if (xhr.status === 0) {
                        error_mostrar = ('Verificar conexión a internet - ' + error_especifico.Message);
                    } else if (xhr.status == 404) {
                        error_mostrar = ('URL solicitada no encontrada [Error 404] - ' + error_especifico.Message);
                    } else if (xhr.status == 500) {
                        error_mostrar = ('Error interno del servidor [Error 500] - ' + error_especifico.Message);
                    } else if (status === 'parsererror') {
                        error_mostrar = ('JSON solicitado falló - ' + error_especifico.Message);
                    } else if (status === 'timeout') {
                        error_mostrar = ('Error en tiempo de espera - ' + error_especifico.Message);
                    } else if (status === 'abort') {
                        error_mostrar = ('Solicitud Ajax abortada - ' + error_especifico.Message);
                    } else {
                        error_mostrar = ('Error desconocido: - ' + error_especifico.Message);
                    }

                }
            });
        }
        function EliminarVouchersTemporal(Usuario) {
            $.ajax({
                type: 'POST',
                url: 'MisComprasV2.aspx/EliminarVouchersTemporal',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                async: true,
                cache: false,
                data: '{Usuario: "' + Usuario + '"}',
                success: function (data) {
                    var result = data.d;
                    if (result == true) {
                        document.getElementById('div_download').style.display = 'none';
                    }
                },
                error: function (xhr, status, error) {
                    var error_especifico = eval("(" + xhr.responseText + ")");
                    var error_mostrar = '';
                    if (xhr.status === 0) {
                        error_mostrar = ('Verificar conexión a internet - ' + error_especifico.Message);
                    } else if (xhr.status == 404) {
                        error_mostrar = ('URL solicitada no encontrada [Error 404] - ' + error_especifico.Message);
                    } else if (xhr.status == 500) {
                        error_mostrar = ('Error interno del servidor [Error 500] - ' + error_especifico.Message);
                    } else if (status === 'parsererror') {
                        error_mostrar = ('JSON solicitado falló - ' + error_especifico.Message);
                    } else if (status === 'timeout') {
                        error_mostrar = ('Error en tiempo de espera - ' + error_especifico.Message);
                    } else if (status === 'abort') {
                        error_mostrar = ('Solicitud Ajax abortada - ' + error_especifico.Message);
                    } else {
                        error_mostrar = ('Error desconocido: - ' + error_especifico.Message);
                    }

                }
            });
        }
        function alerta(mensaje) {
            //un alert
            if (mensaje == 'Voucher Registrado Temporal') {
                alertify.alert("<b>Voucher Registrado Correctamente</b>", function () {
                    //aqui introducimos lo que haremos tras cerrar la alerta.
                    //por ejemplo -->  location.href = 'http://www.google.es/';  <-- Redireccionamos a GOOGLE.
                });
            }
            if (mensaje == 'Voucher Actualizado Correctamente') {
                alertify.alert("<b>Voucher Actualizado Correctamente</b>", function () {
                    //aqui introducimos lo que haremos tras cerrar la alerta.
                    //por ejemplo -->  location.href = 'http://www.google.es/';  <-- Redireccionamos a GOOGLE.
                });
            }
        }
        function confirmar() {
            //un confirm
            alertify.confirm("<p>Aquí confirmamos algo.<br><br><b>ENTER</b> y <b>ESC</b> corresponden a <b>Aceptar</b> o <b>Cancelar</b></p>", function (e) {
                if (e) {
                    alertify.success("Has pulsado '" + alertify.labels.ok + "'");
                } else {
                    alertify.error("Has pulsado '" + alertify.labels.cancel + "'");
                }
            });
            return false
        }
        function datos() {
            //un prompt
            alertify.prompt("Esto es un <b>prompt</b>, introduce un valor:", function (e, str) {
                if (e) {
                    alertify.success("Has pulsado '" + alertify.labels.ok + "'' e introducido: " + str);
                } else {
                    alertify.error("Has pulsado '" + alertify.labels.cancel + "'");
                }
            });
            return false;
        }
        function notificacion() {
            //una notificación normal
            alertify.log("Esto es una notificación cualquiera.");
            return false;
        }
        function ok() {
            //una notificación correcta
            alertify.success("Visita nuestro <a href=\"https://blog.reaccionestudio.com/\" style=\"color:white;\" target=\"_blank\"><b>BLOG.</b></a>");
            return false;
        }
        function error(mensaje) {
            if (mensaje == 'Voucher Existe') {
                //una notificación de error
                alertify.error("Ya existe un archivo con ese nombre, cambie el nombre y vuelva a cargar el archivo.");
                return false;
            }
            if (mensaje == 'Error Carga Voucher') {
                //una notificación de error
                alertify.error("Error al cargar el archivo, inténtelo de nuevo.");
                return false;
            }
            if (mensaje == 'Upload Vacio') {
                //una notificación de error
                alertify.error("Debe Cargar el Voucher.");
                return false;
            }
            if (mensaje == 'Formato Incorrecto') {
                //una notificación de error
                alertify.error("Formato Incorrecto. El archivo debe ser imagen PNG | JPG | JPEG");
                return false;
            }
        }
        function validar_campos() {
            var banco = $("#cboBanco").val();
            var NumOperacion = $("#TxtNumOperacion").val();
            var Fecha = $("#datepicker").val();
            var TipoPago = $("#cboTipoPago").val();
            var Comprobante = $("#cboComprobante").val();

            var ruta = $("#HiddenRuta").val();


            var element_cboBanco = document.getElementById("cboBanco");
            var element_TxtNumOperacion = document.getElementById("TxtNumOperacion");
            var element_datetimepicker2 = document.getElementById("datetimepicker2");
            var element_cboTipoPago = document.getElementById("cboTipoPago");
            var element_cboComprobante = document.getElementById("cboComprobante");

            var status;
            var status_upload;
            if (ruta == '') {
                status_upload = "vacio";
            }
            if (banco == '0') {
                element_cboBanco.style.border = "1px solid red";
                status = "vacio";
            }
            else {
                element_cboBanco.style.border = "1px solid gainsboro";
            }
            if (NumOperacion == '') {
                element_TxtNumOperacion.style.border = "1px solid red";
                status = "vacio";
            }
            else {
                element_TxtNumOperacion.style.border = "1px solid gainsboro";
            }
            if (Fecha == '') {
                element_datetimepicker2.style.border = "1px solid red";
                status = "vacio";
            }
            else {
                element_datetimepicker2.style.border = "1px solid gainsboro";
            }
            if (TipoPago == '0') {
                element_cboTipoPago.style.border = "1px solid red";
                status = "vacio";
            }
            else {
                element_cboTipoPago.style.border = "1px solid gainsboro";
            }
            if (Comprobante == '0') {
                element_cboComprobante.style.border = "1px solid red";
                status = "vacio";
            }
            else {
                element_cboComprobante.style.border = "1px solid gainsboro";
            }

            if (status_upload == 'vacio') {
                error("Upload Vacio");
                return;
            }

            if (status != 'vacio') {
                alerta("Voucher Actualizado Correctamente");
                $("#BtnAgregarVaucher").trigger("click");
            }
        }
        function limpiar_campos() {
            $('#cboBanco').val('0');
            $("#TxtNumOperacion").val('');
            $("#datepicker").val('');
            $('#cboTipoPago').val('0');
            $('#cboComprobante').val('0');
            $("#HiddenRuta").val('');
        }

        function openProducto(Foto, Nombre) {
            //let comprasPendientesEfectivoModal = document.querySelector(".modal.show .dataTables_wrapper.no-footer .dataTables_scrollBody");
            //comprasPendientesEfectivoModal.style.height = "200px";
            Foto = "https://yosoymitosis.com/products/" + Foto;
            document.getElementById('img_result').setAttribute('src', Foto);
            document.getElementById('TituloProducto').innerHTML = Nombre;
            $('#ModalProducto').modal('show');
            $('#comprasPendientesEfectivoModal').modal('hide');
        }
        
    </script>
</asp:Content>
