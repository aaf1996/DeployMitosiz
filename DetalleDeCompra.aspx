﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DetalleDeCompra.aspx.cs" Inherits="SantaNaturaNetwork.DetalleDeCompra" ClientIDMode="Static" %>

<%@ OutputCache Location="None" NoStore="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Banner de Store Template/animate.css">
    <!--Para que el banner salga muy bien diseñado-->
    <link rel="stylesheet" href="css/proyecto2/estilosDetalleDeCompra-Banner.css?Fv56">
    <link href="css/proyecto2/vendors/elegant-icon/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="icon" href="img/Natural_Food_icon.png" type="image/x-icon" />

    <!--Para el boton ingresar foto de perfil-->
    <link rel="stylesheet" type="text/css" href="css/file-upload.css" />
    <link href="css/carritoDeCompra.css" rel="stylesheet" />
    <link href="css/estilosDetalleCompra.css?Fv56" rel="stylesheet" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/proyecto2/eskju.jquery.scrollflow.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.8.7/dist/sweetalert2.all.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .parallax2 {
            /* The image used */
            background: url("img/detalledecompra-1355x210.png");
            /*width:100vw;*/
            /* Set a specific height */
            /* Create the parallax scrolling effect */
            background-attachment: fixed;
            background-position: bottom;
            background-repeat: no-repeat
        }

        /*.modal-body {
            height: initial;
            overflow: hidden;
            text-align: justify;
        }*/

        /*.modal-body1 {
            text-align:justify;
            height: 470px;
            overflow: auto;
        }*/

        /*.modal-body1:hover {
                overflow-y: auto;
            }*/

        .btn-visa-upload {
            height: 49px;
            border-radius: 8px;
            background: #3850A1;
            font-size: 15px;
            color: white;
            line-height: 46px;
            border: 1px solid transparent;
            margin: 10px 0px 10px 0px;
        }

            .btn-visa-upload:hover {
                background-color: #D6D9D9;
                color: #3850A1;
            }


        #txtNombreDatosCompra, #txtDNIDatosCompra, #txtCelularDatosCompra, #txtDireccionDatosCompra, #txtTransporteDatosCompra, #txtDirecTransporteDatosCompra, #txtProvinciaDatosCompra, #txtDirecProvinciaDatosCompra {
            height: 24.5px
        }

        .btnValidar {
            margin-top: 10px;
            height: calc(2.25rem + 2px);
        }

        .txtRUC {
            height: calc(2.25rem + 2px);
        }

        .lblValidarFacturacion {
            justify-content: center;
        }
    </style>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 style="text-align: center; font-weight: bold" class="modal-title" id="exampleModalLabel">Ingresar dirección</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <label id="lblMensajeRUC"></label>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <label>Dirección Fiscal RUC</label>
                            <br />
                            <input class="form-control" maxlength="150" id="txtDireccionRUC" type="text" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnCancelM" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button id="btnSaveAddress" type="button" class="btn btn-success">Registrar</button>
                </div>
            </div>

        </div>
    </div>
    <!-- Modal -->

    <asp:ScriptManager runat="server">
        <Scripts>
            <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
            <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
            <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
            <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
            <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
            <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
            <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
            <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
        </Scripts>
    </asp:ScriptManager>
    <%--    <!--================Categories Banner Area =================-->
    <!--================End Categories Banner Area =================-->--%>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

    <aside id="colorlib-hero" class="breadcrumbs">
        <div class="flexslider">
            <ul class="slides">
                <li <%--class="parallax2" style="background-size:100% 500px"--%>>
                    <img src="img/detalledecompra.png" style="width: 100vw; height: 300px; background-attachment: fixed" />
                    <div class="overlay">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
                                    <div class="slider-text-inner text-center" style="z-index: 1">
                                        <%--<h1>Carrito </h1>--%>
                                        <h2 class="bread">
                                            <span><a class="enlaceRetroceder" id="reiniciarPedido" href="DatosPedidoSN.aspx" style="color: rgba(0, 0, 0, .5); font-weight: bold; transition: color 0.5s ease;">Reiniciar pedido</a></span>
                                            <span><a class="glyphicon glyphicon-chevron-right"></a></span>
                                            <span><a class="enlaceRetroceder" id="inicio" href="TiendaSN.aspx" style="color: rgba(0, 0, 0, .5); font-weight: bold; transition: color 0.5s ease;">Tienda</a></span>
                                            <span><a class="glyphicon glyphicon-chevron-right"></a></span>
                                            <span><a class="enlaceActual" style="color: rgba(0, 0, 0, .5)">Carrito</a></span>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </aside>



    <div id="ContenidoFluido" class="container-fluid" style="width: 92%; margin-top: 20px">

        <div class="row row-pb-md" style="padding-top: 30px; display: block;">
            <div class="col-md-10 col-md-offset-1">
                <div class="process-wrap">
                    <div id="circle01" class="process text-center active">
                        <p><span>01</span></p>
                        <h3 id="carritoDeCompras" class="active">CARRITO DE COMPRAS</h3>
                    </div>
                    <div id="circle02" class="process text-center">
                        <p><span style="transition: all 1s;">02</span></p>
                        <h3 id="afiliacion" style="transition: all 1s;">AFILIACION</h3>
                    </div>
                    <div id="circle03" class="process text-center">
                        <p><span id="circulito" style="transition: all 1s;">03</span></p>
                        <h3 id="ordenCompletada" style="transition: all 1s;">ORDEN COMPLETADA</h3>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12" id="01carritoDeCompras" style="padding-left: 0px; padding-bottom: 40px">
                <!--TABLA DETALLE DE COMPRA-->
                <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-xs-12 scrollflow -slide-top" style="padding-top: 30px; z-index: 3">
                    <div id="tablaCompra" class="container">
                        <div class="box-body table-responsive">
                            <table id="tblDetProd" class="table table-hover table-condensed table-bordered w-auto">
                                <thead class="table-info">
                                    <tr class="text-center">
                                        <th style="width: 150px"></th>
                                        <th>Producto</th>
                                        <th>Precio</th>
                                        <th>Puntos</th>
                                        <th>Cantidad</th>
                                        <th>Subtotal neto</th>
                                        <th>Subtotal puntos</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (productosCarrito != null)
                                        {
                                            foreach (var productoCarrito in productosCarritoPaquete)
                                            {%>
                                    <tr>
                                        <td>
                                            <div class="row">
                                                <div class="col-7 col-sm-7 col-md-7 center-block">
                                                    <img id="ImgFotoo" src="products/<%=productoCarrito.Foto %>" class="img-responsive" />
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">

                                            <%=productoCarrito.NombreProducto %>
                                           
                                        </td>
                                        <td data-th="Price" class="text-center">S/. <%=productoCarrito.PrecioUnitario.ToString("N2").Replace(",", ".") %></td>
                                        <td class="text-center">
                                            <%=productoCarrito.Puntos.ToString("N2").Replace(",", ".") %>
                                        </td>
                                        <td data-th="Quantity">
                                            <input type="number" id="<%=productoCarrito.Codigo %>" class="form-control text-center" value="<%=productoCarrito.Cantidad %>">
                                        </td>
                                        <td class="text-center">
                                            <label id="Sub<%=productoCarrito.Codigo %>"><%=productoCarrito.SubTotalNeto.ToString("N2").Replace(",", ".") %></label>

                                        </td>
                                        <td class="text-center">
                                            <label id="SubP<%=productoCarrito.Codigo %>"><%=productoCarrito.SubTotalPuntos.ToString("N2").Replace(",", ".") %></label>
                                        </td>
                                        <td class="actions" data-th="">
                                            <a onclick="ActualizarProducto('<%=productoCarrito.Codigo %>')" class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></a>
                                            <%--                                            <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>--%>
                                            <a onclick="EliminarProducto('<%=productoCarrito.Codigo %>',this)" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                    </tr>

                                    <%}
                                        } %>
                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>
                <!--DATOS DE COMPRA-->
                <div id="datosDeLaCompra" class="col-xl-3 col-lg-6 col-md-8 col-sm-8 scrollflow -slide-left -opacity" style="padding-top: 10px; z-index: 2">
                    <div id="resumenDeLaCompra">

                        <div id="bloqueDatosDeLaCompra" class="form-group" style="margin-top: -20px">
                            <div class="col-md-12 text-center">
                                <label style="font-size: 17px; font-weight: bolder">DATOS DE LA COMPRA</label>
                            </div>

                            <div class=" row form-group" id="MostrarSoloLogueado">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Tipo de compra: </label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <select id="STipoCompra" disabled="true" runat="server" class="form-control btn-lg marginTop">
                                        </select>
                                    </div>
                                </div>
                                <div class="row col-md-12" style="display: none;">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Corazones:</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="LbCorazones" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Puntos Totales:</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="LbPuntosRango" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Puntos:</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="LbPuntosCompra" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Precio Público:</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="LbPrecioTotal" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px; display:none;" >
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Precio sin delivery:</label>
                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="LbPrecioPagar" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px; display:none;">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Delivery:</label>
                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="lblDelivery" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Precio Empresario:</label>
                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="lblNetoConDelivery" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px;">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Mayorista:</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <select id="ComboTienda" disabled="true" class="form-control btn-lg marginTop" runat="server"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Medio de pago:</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <select id="SMedioPago" class="form-control btn-lg marginTop" runat="server"></select>
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group" style="margin-top: -10px; display: none;" id="DatosPreRegistro" runat="server">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelComprobante">Usuario PreRegistro: </label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <select id="cboPreRegistro" class="form-control btn-lg marginTop" runat="server"></select>
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group" style="margin-top: -10px;" id="DatosComboComprobante" runat="server">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelComprobante">Comprobante: </label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:DropDownList runat="server" ID="cboComprobante" CssClass="form-control btn-lg marginTop">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Boleta" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Factura" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group" style="margin-top: -10px; display: none;" id="MostrarBotonValidar" runat="server">
                                <div class="row col-md-12 lblValidarFacturacion">
                                    <label>VALIDACIÓN PARA FACTURACIÓN</label>
                                </div>
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelComprobante">A nombre de: </label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:DropDownList runat="server" ID="ddlTitularRUC" CssClass="form-control btn-lg marginTop">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row col-md-12" id="dvRUC">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelRUC">RUC: </label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:TextBox ID="TextBoxRUC" runat="server" CssClass="form-control marginTop txtRUC"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row col-md-12" id="dvBtnValRUC">
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <button id="ButtonValida" class="btn form-control btnValidar" style="background-color: #2a2929; color: white">Validar</button>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="btnRegistrarAfiliado" class="row col-md-12" runat="server">
                            <div class="col-sm-8 col-sm-offset-2">
                                <a class="btn btn-success form-control tablaSiguiente" runat="server" style="font-size: 12px" href="javascript:void('');">Siguiente <span class="glyphicon glyphicon-arrow-right"></span></a>
                            </div>
                        </div>
                        <div class="row col-md-12" id="CompraNormal" runat="server">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button id="BntComprar" class="btn btn-success form-control" type="button">Comprar </button>
                            </div>
                        </div>
                        <div class="row col-md-12" id="CompraPE" runat="server">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button id="btnCompraPE" class="btn form-control" style="color: #000000; background: #FFCC00; font-size: Smaller; font-weight: bold;" type="button">Comprar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" id="02afiliacion">
                <div style="width: 165px; padding-bottom: 20px">
                    <a class="btn btn-danger form-control retroceder 01" style="font-size: 13px" href="javascript:void('01');"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp RETROCEDER</a>
                </div>
                <!--REGISTRO AFILIACION-->
                <div id="MostrarRegistroCliente" class="col-md-8">
                    <div class="row form-group colorlib-form">
                        <div class="form-group scrollflow -pop -opacity" style="margin-left: auto; margin-right: auto">
                            <h1>REGISTRO DE AFILIACIÓN</h1>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <label style="font-weight: bold; font-size: 16px">DATOS DE LA CUENTA</label>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Usuario</label>
                                    <asp:TextBox ID="txtUl" title="Se necesita un nombre de Usuario" runat="server" CssClass="form-control text-uppercase marginTop"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Clave</label>
                                    <asp:TextBox ID="TxtCl" runat="server" CssClass="form-control text-uppercase marginTop"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity" id="btnCargaImagen" runat="server" style="display: none;">
                                    <label class="label" style="font-weight: bold">Foto de Perfil</label>
                                    <label class="file-upload btn btn-success form-control marginTop" style="font-size: 15px">
                                        Ingresa tu foto
                                    <input type="file" class="imagen form-control" id="imagen" name="MiImagen" accept="image/x-png,image/jpeg" runat="server" style="margin-top: 4px" />
                                    </label>
                                </div>
                            </div>

                            <div class="row col-md-12" id="imagenMostrada" runat="server" style="display: none;">
                                <div class="form-group col-md-4 scrollflow -opacity" style="margin-left: auto; margin-right: auto">
                                    <label>Mi foto de perfil</label>
                                    <div id="imagePreview" class="center-block align-content-center">
                                        <img src="img/usuario1.png" class="img-fluid" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 13px">
                            <label style="font-weight: bold; font-size: 16px">Datos Personales</label>


                            <div class="row col-md-12">
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">UpLine</label>
                                    <asp:DropDownList ID="CboUpLine" runat="server" CssClass="form-control btn-lg marginTop" />

                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Tipo de cliente</label>
                                    <asp:DropDownList ID="cboTipoCliente" runat="server" CssClass="form-control btn-lg marginTop" Enabled="False" />
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Y.W. Preferido</label>
                                    <asp:DropDownList ID="cboTipoEstablecimiento" runat="server" CssClass="form-control btn-lg marginTop" />
                                </div>
                            </div>

                            <div class="row col-md-12">
                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Nombres</label>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control text-uppercase marginTop" onkeydown="validarLetras(event)"
                                        onkeyup="validarLetras(event)"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Ap. Paterno</label>
                                    <asp:TextBox ID="txtApPaterno" runat="server" CssClass="form-control text-uppercase marginTop" onkeydown="validarLetras(event)"
                                        onkeyup="validarLetras(event)"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Ap. Materno</label>
                                    <asp:TextBox ID="txtApMaterno" runat="server" CssClass="form-control text-uppercase marginTop" onkeydown="validarLetras(event)"
                                        onkeyup="validarLetras(event)"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Patrocinador</label>
                                    <asp:TextBox ID="txtPatrocinador" runat="server" CssClass="form-control text-uppercase marginTop" onkeydown="validarLetras(event)"
                                        onkeyup="validarLetras(event)"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row col-md-12">

                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Nacimiento</label>
                                    <input type="text" id="datepicker" class="form-control text-uppercase marginTop" readonly runat="server" />
                                    <asp:HiddenField ID="FechaNaci" runat="server" />
                                    <asp:HiddenField ID="DivTipCompraAndPuntos" runat="server" />
                                </div>

                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Sexo</label>
                                    <asp:DropDownList ID="ComboSexo" runat="server" CssClass="form-control marginTop">
                                        <asp:ListItem Value="">Seleccione</asp:ListItem>
                                        <asp:ListItem Value="1">MASCULINO</asp:ListItem>
                                        <asp:ListItem Value="2">FEMENINO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Tipo documento</label>
                                    <asp:DropDownList ID="ComboTipoDocumento" runat="server" CssClass="form-control marginTop">
                                        <asp:ListItem Value="">Seleccione</asp:ListItem>
                                        <asp:ListItem Value="1">DNI</asp:ListItem>
                                        <asp:ListItem Value="2">PASAPORTE</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group col-md-3 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">N° Documento</label>
                                    <asp:TextBox ID="txtNumDocumento" runat="server" CssClass="form-control text-uppercase marginTop" onkeypress="return validarNumeros(event)"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row col-md-12">
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Correo electronico</label>
                                    <asp:TextBox ID="TxtCorreo" runat="server" CssClass="form-control text-uppercase marginTop" TextMode="Email"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Teléfono</label>
                                    <asp:TextBox ID="TxtTelefono" runat="server" onkeypress="return validarNumeros(event)" CssClass="form-control text-uppercase marginTop"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Celular</label>
                                    <asp:TextBox ID="TxtCelular" runat="server" onkeypress="return validarNumeros(event)" CssClass="form-control text-uppercase marginTop"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Pais de operaciones</label>
                                    <asp:DropDownList ID="cboPais" runat="server" CssClass="form-control marginTop" />
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Dirección</label>
                                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control text-uppercase marginTop"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Referencia</label>
                                    <asp:TextBox ID="TxtReferencia" runat="server" CssClass="form-control text-uppercase marginTop"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row col-md-12">
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Departamento</label>
                                    <asp:DropDownList ID="cboDepartamento" runat="server" CssClass="form-control marginTop" />
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Provincia</label>
                                    <asp:DropDownList ID="cboProvincia" runat="server" CssClass="form-control marginTop" />
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Distrito</label>
                                    <asp:DropDownList ID="cboDistrito" runat="server" CssClass="form-control marginTop" />
                                    <br />
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Y.W. Premio</label>
                                    <asp:DropDownList ID="cboPremio" runat="server" CssClass="form-control btn-lg marginTop" />
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold; font-size: 16px">DATOS BANCARIOS</label>


                            <div class="row col-md-12">
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">RUC</label>
                                    <asp:TextBox ID="TxtRUC" runat="server" CssClass="form-control marginTop" onkeypress="return validarNumeros(event)"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">Banco</label>
                                    <asp:TextBox ID="TxtBanco" runat="server" CssClass="form-control text-uppercase marginTop" onkeydown="validarLetras(event)"
                                        onkeyup="validarLetras(event)"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">N° Cuenta depósito</label>
                                    <asp:TextBox ID="TxtNumCuenDeposito" runat="server" CssClass="form-control marginTop" onkeypress="return validarNumeros(event)"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row col-md-12">
                                <div class="form-group col-md-6 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">N° Cuenta detracciones</label>
                                    <asp:TextBox ID="TxtNumCuenDetracciones" runat="server" CssClass="form-control marginTop" onkeypress="return validarNumeros(event)"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6 scrollflow -opacity">
                                    <label class="label" style="font-weight: bold">N° Cuenta interbancaria</label>
                                    <asp:TextBox ID="TxtNumCuenInterbancaria" runat="server" CssClass="form-control marginTop" onkeypress="return validarNumeros(event)"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--RESUMEN FINAL DE LA COMPRA-->
                <div class="col-md-4">
                    <div id="resumenDeLaCompra2">

                        <div class="form-group colorlib-form">
                            <div class="col-md-12 text-center">
                                <label style="font-size: 17px; font-weight: bolder">RESUMEN DE LA COMPRA</label>
                            </div>
                            <div class=" row form-group" id="MostrarSoloLogueado2" style="display: block;">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Tipo de compra: </label>
                                    </div>
                                    <div disabled="true" class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label CssClass="labelResuCompra" runat="server" ID="lbTCompra2"></asp:Label>
                                    </div>
                                </div>
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Puntos Totales:</label>
                                    </div>
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label ID="lbPuntosRango2" CssClass="labelResuCompra" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Puntos:</label>
                                    </div>
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label ID="lblPuntos2" CssClass="labelResuCompra" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Precio Público:</label>
                                    </div>
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label ID="lblPTotal2" CssClass="labelResuCompra" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Precio sin Delivery:</label>
                                    </div>

                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label ID="Label1" CssClass="labelResuCompra" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Delivery:</label>
                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="lblDelivery2" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <label class="labelResuCompra">Precio Empresario:</label>
                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <asp:Label ID="lblNetoConDelivery2" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Precio Empresario:</label>
                                    </div>

                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label ID="lblPPagar2" CssClass="labelResuCompra" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div id="MostrarComboTienda2" class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Mayorista:</label>
                                    </div>
                                    <div disabled="true" class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label CssClass="labelResuCompra" ID="lbTienda2" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group" style="margin-top: -10px">
                                <div class="row col-md-12">
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <label class="labelResuCompra">Medio de Pago:</label>
                                    </div>
                                    <div class="col-md-6 col-xs-6 scrollflow -opacity">
                                        <asp:Label ID="lbMPago2" CssClass="labelResuCompra" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row col-md-12" id="CompraNormal2" runat="server">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-7">
                                <button class="btn btn-success form-control" id="btnCompra2" type="button">Comprar</button>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                        <div class="row col-md-12" id="CompraPE2" runat="server">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-7">
                                <button class="btn form-control" style="color: #000000; background: #FFCC00; font-size: Smaller; font-weight: bold;" type="button" id="btnCompraPE2">Comprar</button>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-12" id="03ordenCompletada">
                <div class="row" id="complet" runat="server">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        <img src="img/shoppingcart_accept_compra_12832.png" />
                        <br />
                        <br />
                        <br />
                        <h2>Gracias por comprar, su pedido está realizado</h2>
                        <br />
                        <p>
                            <a href="TiendaSN.aspx" class="btn btn-primary" style="width: 60px; height: 30px">Tienda</a>
                            <a href="MisComprasV2.aspx" class="btn btn-primary btn-outline" style="height: 30px">Historial de Compras</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <br />

    </div>
    <asp:HiddenField ID="PuntosEmprendedor" runat="server" />
    <asp:HiddenField ID="PuntosEmpresarial" runat="server" />
    <asp:HiddenField ID="PuntosProfesional" runat="server" />
    <asp:HiddenField ID="PuntosMillonario" runat="server" />
    <asp:HiddenField ID="CompraDeTodosModos" runat="server" />

    <asp:HiddenField ID="NombreDelivery" runat="server" />
    <asp:HiddenField ID="DNIDelivery" runat="server" />
    <asp:HiddenField ID="CelularDelivery" runat="server" />
    <asp:HiddenField ID="DireccionDelivery" runat="server" />
    <asp:HiddenField ID="TransporteDelivery" runat="server" />
    <asp:HiddenField ID="DirecTransporteDelivery" runat="server" />
    <asp:HiddenField ID="ProvinciaDelivery" runat="server" />
    <asp:HiddenField ID="DirecProvinciaDelivery" runat="server" />

    <asp:HiddenField ID="Nombress" runat="server" />
    <asp:HiddenField ID="ApPaterno" runat="server" />
    <asp:HiddenField ID="ApMaterno" runat="server" />
    <asp:HiddenField ID="TipoDocumento" runat="server" />
    <asp:HiddenField ID="NumDocumento" runat="server" />
    <asp:HiddenField ID="Telefono" runat="server" />
    <asp:HiddenField ID="Direccion" runat="server" />
    <asp:HiddenField ID="Usuario" runat="server" />
    <asp:HiddenField ID="Clave" runat="server" />
    <asp:HiddenField ID="UpLine" runat="server" />
    <asp:HiddenField ID="Patrocinador" runat="server" />

    <asp:HiddenField ID="Correo" runat="server" />
    <asp:HiddenField ID="Celular" runat="server" />
    <asp:HiddenField ID="Referencia" runat="server" />
    <asp:HiddenField ID="RUC" runat="server" />
    <asp:HiddenField ID="Banco" runat="server" />
    <asp:HiddenField ID="NumCuenDeposio" runat="server" />
    <asp:HiddenField ID="NumCuenDetrac" runat="server" />
    <asp:HiddenField ID="NumCuenInterbancaria" runat="server" />
    <asp:HiddenField ID="Provincia" runat="server" />
    <asp:HiddenField ID="Departamento" runat="server" />
    <asp:HiddenField ID="Pais" runat="server" />
    <asp:HiddenField ID="Distrito" runat="server" />
    <asp:HiddenField ID="Sexo" runat="server" />

    <asp:HiddenField ID="TipoCliente" runat="server" />
    <asp:HiddenField ID="TipoEstablecimiento" runat="server" />
    <asp:HiddenField ID="CDRPremio" runat="server" />
    <asp:HiddenField ID="Foto" runat="server" />

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <script src="js/carritoDeCompra5.js?v7"></script>
    <script src="js/file-uploadv1.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            var completada = "<%=Session["mostrarCompraTerminada"]%>";

            if (completada == 0) {
                $("#02afiliacion").hide();
                $("#03ordenCompletada").hide();
            }

            /*RETROCEDER DEL PASO 2 AL PASO 1*/
            $(".01").click(function (e) {
                $("#tablaCompra").fadeIn(300);
                $("#resumenDeLaCompra").fadeIn(300);
                $("#02afiliacion").slideUp(0);
                var elemento = document.getElementById("circle02");
                elemento.classList.remove('active');
                //$("#resumenDeLaCompra2").slideUp(0);
            });

            /*IR DEL PASO 2 AL PASO 3*/
            $(".registrarPedido").click(function (e) {
                $("#03ordenCompletada").fadeIn(300);
                $("#02afiliacion").slideUp(0);
                $("01carritoDeCompras").slideUp(0);
                var ordenCompletada = document.getElementById("ordenCompletada");
                var elemento = document.getElementById("circle03");
                elemento.className += " active"
                ordenCompletada.className += " active"
                //$("#resumenDeLaCompra2").slideUp(0);
            });

            /**/
            $(".02").click(function (e) {
                $("#02afiliacion").fadeIn(300);
                $("#03ordenCompletada").slideUp(0);
                var elemento = document.getElementById("circle03");
                elemento.classList.remove('active');
                //$("#resumenDeLaCompra2").slideUp(0);
            });

            $('.tablaSiguiente').click(function () {
                $('body,html').animate({
                    scrollTop: 0
                }, 100);
                return false;
            });

            var tipoComS = $("#STipoCompra").val();

            if (tipoComS == "07" | tipoComS == "08" | tipoComS == "09" | tipoComS == "10" |
                tipoComS == "11" | tipoComS == "12" | tipoComS == "13") {
                $("#circle02").hide();
                $("#circulito").text("02");
            } else {
                $("#circle02").show();
                $("#circulito").text("03");
            }



        });

    </script>
    <script type="text/javascript">

        function IrCompraTerminada() {
            var ordenCompletada = document.getElementById("ordenCompletada");
            var elemento = document.getElementById("circle03");
            $("#03ordenCompletada").fadeIn(300);
            $("#02afiliacion").slideUp(0);
            $("#01carritoDeCompras").slideUp(0);
            $("#resumenDeLaCompra").slideUp(0);
            $("#tablaCompra").slideUp(0);
            elemento.className += " active"
            ordenCompletada.className += " active"
        }

        function formatDate(date) {
            var day = date.getDate();
            var monthIndex = date.getMonth();
            var year = date.getFullYear();

            return day + '/' + monthIndex + '/' + year;
        }

        function FormatearFecha(fecha) {
            var ms = Date.parse(fecha);
            var fecha = new Date(ms);

            var dd = fecha.getDate();
            var mm = fecha.getMonth() + 1;
            var yyyy = fecha.getFullYear();

            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }

            return dd + '/' + mm + '/' + yyyy;
        }

        function toDate(dateStr) {
            var parts = dateStr.split("/")
            return new Date(parts[2], parts[1] - 1, parts[0])
        }

        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4'
        });

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

    </script>
    <script>

        //Para que el menu del navbar se quede de un color cuando esté seleccionado
        window.onload = function () {
            if (window.innerWidth < 1148) {
                //document.getElementById("liTienda").style.background = '#E8E8E8';

                document.getElementById("idMenuTienda").style.color = 'white';
                //document.getElementById("idMenuTienda").style.fontWeight = '700';
                document.getElementById("idMenuTienda").classList.add("peso700");
                document.getElementById("idSubMenuTienda").style.fontWeight = "700";


                //var naranja = document.getElementById("navtienda2");
                //naranja.classList.add('menu__item--active2');
            }
            else {
                document.getElementById("idMenuTienda").style.color = 'white';
                document.getElementById("idMenuTienda").style.borderBottom = '3px solid white';
                document.getElementById("idSubMenuTienda").style.color = 'white';
                document.getElementById("idSubMenuTienda").style.fontWeight = "700";
            }
        }
    </script>

    <script src="js/Banner de Store Template/jquery.flexslider-min.js"></script>
    <script src="js/Banner de Store Template/jquery.magnific-popup.min.js"></script>
    <script src="js/Banner de Store Template/jquery.stellar.min.js"></script>
    <script src="js/Banner de Store Template/main.js"></script>
</asp:Content>
