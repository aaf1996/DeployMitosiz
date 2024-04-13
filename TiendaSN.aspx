<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TiendaSN.aspx.cs" Inherits="SantaNaturaNetwork.TiendaSN" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<link href="css/proyecto2/bootstrap-3.3.0-css-bootstrap.min-v3.css" rel="stylesheet">--%>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="css/proyecto2/file-upload.css" />
    <link href="css/proyecto2/tiendav2.css" rel="stylesheet" />
    <link href="css/proyecto2/product-list.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />
    <script type="text/javascript" src="engine1/jqueryv2.js"></script>

    <link rel="stylesheet" href="assets/Estilos/alertify.core.css" />
    <link rel="stylesheet" href="assets/Estilos/alertify.default.css" id="toggleCSS" />
    <script src="assets/Estilos/alertify.min.js" type="text/javascript"></script>

    <style type="text/css">
        .ddl {
            border: 0.5px solid white;
            border-radius: 5px;
            padding: 3px;
            -webkit-appearance: none;
            background-image: url('img/Arrowhead-Down-01.png');
            background-position: right;
            background-repeat: no-repeat;
            text-indent: 0.01px;
            text-overflow: '';
        }

        .txtCantProd {
            margin-right: 1px;
            margin-left: 1px;
            text-align: center;
            width: 70px !important
        }

        .addtocart {
            box-shadow: inset 0px 0px 0px 2px #ffffff;
            margin: 4px 1px;
            border-radius: 2px;
        }

        .agregarAlCarrito {
            transition: .5s;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 8px 9px 6px 8px !important
        }

        @media(max-device-width: 500px) {
            .txtCantProd {
                width: 50px !important
            }
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/proyecto2/eskju.jquery.scrollflow.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/base.css" />
    <script>document.documentElement.className = "js"; var supportsCssVars = function () { var e, t = document.createElement("style"); return t.innerHTML = "root: { --tmp-var: bold; }", document.head.appendChild(t), e = !!(window.CSS && window.CSS.supports && window.CSS.supports("font-weight", "var(--tmp-var)")), t.parentNode.removeChild(t), e }; supportsCssVars() || alert("Please view this demo in a modern browser that supports CSS Variables.");</script>
    <link href="css/proyecto2/pushbar.css" rel="stylesheet" />
    <link href="css/proyecto2/estilosCrearCuenta2.css" rel="stylesheet" />
    <link href="css/proyecto2/estilosCatalogo.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <svg class="hidden">
        <symbol id="icon-arrow" viewBox="0 0 24 24">
            <title>arrow</title>
            <polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 " />
        </symbol>
        <symbol id="icon-drop" viewBox="0 0 24 24">
            <title>drop</title>
            <path d="M12,21c-3.6,0-6.6-3-6.6-6.6C5.4,11,10.8,4,11.4,3.2C11.6,3.1,11.8,3,12,3s0.4,0.1,0.6,0.3c0.6,0.8,6.1,7.8,6.1,11.2C18.6,18.1,15.6,21,12,21zM12,4.8c-1.8,2.4-5.2,7.4-5.2,9.6c0,2.9,2.3,5.2,5.2,5.2s5.2-2.3,5.2-5.2C17.2,12.2,13.8,7.3,12,4.8z" />
            <path d="M12,18.2c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7c1.3,0,2.4-1.1,2.4-2.4c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7C15.8,16.5,14.1,18.2,12,18.2z" />
        </symbol>
        <svg id="icon-github" viewBox="0 0 33 33">
            <title>github</title>
            <path d="M16.608.455C7.614.455.32 7.748.32 16.745c0 7.197 4.667 13.302 11.14 15.456.815.15 1.112-.353 1.112-.785 0-.386-.014-1.411-.022-2.77-4.531.984-5.487-2.184-5.487-2.184-.741-1.882-1.809-2.383-1.809-2.383-1.479-1.01.112-.99.112-.99 1.635.115 2.495 1.679 2.495 1.679 1.453 2.489 3.813 1.77 4.741 1.353.148-1.052.569-1.77 1.034-2.177-3.617-.411-7.42-1.809-7.42-8.051 0-1.778.635-3.233 1.677-4.371-.168-.412-.727-2.069.16-4.311 0 0 1.367-.438 4.479 1.67a15.602 15.602 0 0 1 4.078-.549 15.62 15.62 0 0 1 4.078.549c3.11-2.108 4.475-1.67 4.475-1.67.889 2.242.33 3.899.163 4.311C26.37 12.66 27 14.115 27 15.893c0 6.258-3.809 7.635-7.437 8.038.584.503 1.105 1.497 1.105 3.017 0 2.177-.02 3.934-.02 4.468 0 .436.294.943 1.12.784 6.468-2.159 11.131-8.26 11.131-15.455 0-8.997-7.294-16.29-16.291-16.29"></path>
        </svg>
    </svg>



    <!-- Start WOWSlider.com BODY section -->
    <div id="wowslider-container1" style="margin-top: 70px">
        <div class="ws_images">
            <ul>
                <% foreach (var banners in ListaBanners)
                    {%>
                <li>
                    <img src="https://yosoymitosis.com/banners/<%=banners.Archivo%>" alt="<%=banners.Nombre%>" title="" id="<%=banners.ID_DATOS%>" /></li>
                <% } %>
            </ul>
        </div>
    </div>
    <!-- End WOWSlider.com BODY section -->

    <svg id="fondoDatosCompra" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" style="position: absolute; margin-top: -1px; display:none;">
        <path fill="#5c35d7" fill-opacity="1" d="M0,192L30,208C60,224,120,256,180,245.3C240,235,300,181,360,176C420,171,480,213,540,229.3C600,245,660,235,720,234.7C780,235,840,245,900,240C960,235,1020,213,1080,218.7C1140,224,1200,256,1260,250.7C1320,245,1380,203,1410,181.3L1440,160L1440,0L1410,0C1380,0,1320,0,1260,0C1200,0,1140,0,1080,0C1020,0,960,0,900,0C840,0,780,0,720,0C660,0,600,0,540,0C480,0,420,0,360,0C300,0,240,0,180,0C120,0,60,0,30,0L0,0Z"></path>
    </svg>

    <div class="container-fluid" style="margin-top: 50px; width: 95%">
        <div class="row" style="display: block">
            <div id="bloqueDatosCompra" class="col-xl-12 col-lg-12 col-md-12 col-sm-12" style="background-color: white">
                <a class="cart_anchor" style="float: right; position: absolute; margin-top: -23px; border-color: yellowgreen; padding: 2px; margin-left: -14px; filter: drop-shadow(0px 5px 10px #fff);"
                    data-pushbar-target="pushbar-carrito">
                    <img src="img/presionar.png" style="width: 50px; float: right; position: relative; z-index: 1000;" />
                    <img src="img/icon_shopping.png" style="width: 22px; float: right; position: absolute; z-index: 1000; transform: rotate(-75deg); filter: invert(0.4) sepia(1) hue-rotate(460deg) saturate(1000%); left: 30px; top: -2px;" />
                </a>

                <a class="cart_anchor"></a>
                <div id="divMayorDatosCompra" class="row" style="margin-top: 13px">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 text-center" style="width: auto; margin: auto;">
                        <label id="lblDatosCompra">INFORMACION DE COMPRA</label>
                    </div>
                </div>

                <!--//////////////////////BEING BLOQUE DE LOS COMBOS : DATOS DE LA COMPRA////////////////////////-->
                <div class="row" style="padding-bottom: 40px">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-xs-12" style="display:none;">
                        <div id="MostrarSoloLogueado" runat="server" style="margin-top: 5px; padding-left: 15px; padding-right: 15px">
                            <div class="row " style="margin-top: 5px">
                                <div class="btn-block btn-group center-block" style="display: flex;">
                                    <asp:Label ID="Label11" runat="server" Text="Tipo de compra" CssClass="lblTipoEntrega"></asp:Label>
                                </div>
                            </div>
                            <div class="row  ddlComboTienda" style="margin-top: 5px; width: 300px">
                                <select disabled="true" id="STipoCompra" style="height: 35px; width: 330px; box-shadow: 0 0 5px 5px aliceblue; font-family: Andalus; color: #7d6754; background-color: white;" runat="server" class="ddl">
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div id="MostrarComboTiena" runat="server" style="display: none; margin-top: 5px; padding-left: 15px; padding-right: 15px">
                            <div class="row" style="margin-top: 5px">
                                <div class="btn-block btn-group center-block" style="display: flex;">
                                    <asp:Label ID="Label13" runat="server" Text="Tienda" CssClass="lblTienda"></asp:Label>
                                </div>
                            </div>
                            <div class="row  ddlComboTienda" style="margin-top: 5px; width: 300px">
                                <select disabled="true" id="ComboTienda" style="height: 35px; box-shadow: 0 0 5px 5px aliceblue; background-color: white; width: 330px; font-family: Andalus; color: #7d6754;" class="ddl" runat="server">
                                </select>
                                <%--<asp:DropDownList Style="height: 35px; box-shadow: 0 0 5px 5px aliceblue;" AutoPostBack="true" OnSelectedIndexChanged="ComboTienda_SelectedIndexChanged" ID="ComboTienda2" BackColor="White" CssClass="ddl" Width="330px" ForeColor="#7d6754" Font-Names="Andalus" runat="server">
                                </asp:DropDownList>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-xs-12">
                        <div id="Div1" runat="server" style="display: block; margin-top: 5px; padding-left: 15px; padding-right: 15px">
                            <div class="row ">
                                <div class="btn-block btn-group center-block" style="display: flex;">
                                    <asp:Label ID="Label15" runat="server" Text="Método de pago" CssClass="" ForeColor="Black" Font-Bold="True"></asp:Label>
                                </div>
                            </div>
                            <div class="row  ddlMedioDePago" style="margin-top: 5px; width: 300px;">
                                <select id="SMedioPago" runat="server" style="height: 35px; box-shadow: 0 0 5px 5px aliceblue; background-color: white; width: 330px; font-family: Andalus; color: #7d6754;" class="ddl">
                                </select>
                                <%--<asp:DropDownList Style="height: 35px; box-shadow: 0 0 5px 5px aliceblue" ID="SMedioPago2" BackColor="White" CssClass="ddl" Width="330px" ForeColor="#7d6754" Font-Names="Andalus" runat="server">
                                </asp:DropDownList>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <!--//////////////////////END BLOQUE DE LOS COMBOS : DATOS DE LA COMPRA////////////////////////-->
            </div>

            <!----------------------------------BEGING PRODUCTOS SANTA NATURA------------------------------------->

            <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
                <div class="center-block" style="height: 60px; text-align: center">
                    <h1 style="margin: auto;">PRODUCTOS</h1>
                </div>

                <div class="container-fluid scrollflow">
                    <div class="row bloqueProductosSantaNatura" style="margin-top: 28px">
                        <div class="col-xl-6 col-lg-6 col-md-6 margenTopMovil">
                            <div class="row">
                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                    <label style="font-size: 12px; float: left; height: 33px" class="lblProducto">PRODUCTO:</label>
                                </div>
                                <div class="col-xl-7 col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                    <asp:TextBox Width="100%" ID="txtNomProducto" runat="server" CssClass="MiTextbox border-primary form-control form-control-lg form-control-borderless"></asp:TextBox>
                                </div>
                                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    <div class="row">
                                        <%--<button runat="server" id="btnBuscarByNombre" onserverclick="btnBuscarByNombre_Click" class="btn-block btn btn-success searchButton" title="Search">--%>
                                        <button runat="server" id="btnBuscarByNombre" class="btn-block btn btn-success searchButton" style="display: none" title="Buscar" onclick="btnBuscarByNombre_Click()">
                                            <i class="fa fa-search" style="cursor: pointer"></i>
                                        </button>
                                        <button type="button" title="Buscar" class="btn btn-success btn-lg btn-xs" onclick="BuscarProducto();">
                                            <i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-xs-6 margenTopMovil" style="display:none;">
                            <div class="row">
                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-3 col-xs-4">
                                    <label style="font-size: 12px; float: left; height: 33px" class="linea">LINEA:</label>
                                </div>
                                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-9 col-xs-8">
                                    <div class="row">
                                        <div class="btn-block lineaNombre">
                                            <button id="buttonLineaNombre" type="button" style="width: 100%; height: 48px; transition: .5s" class="btn-block btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Línea</button>

                                            <div class="dropdown-menu" id="cboLinea" style="width: 95%; background-color: white;">
                                                <a id="LinkGeneral" onclick="BuscarProductoxLinea('General');" name="General" class="dropdown-item" href="#" style="display: none;">General</a>
                                                <a id="LinkConsumoSaludable" onclick="BuscarProductoxLinea('Healthy');" name="consumo saludable" class="dropdown-item" href="#" style="display: none;">Consumo saludable</a>

                                                <button type="button" title="All the Products" class="dropdown-item" onclick="BuscarProductoxLinea('General');">General</button>
                                                <button type="button" title="All the Products" class="dropdown-item" onclick="BuscarProductoxLinea('Healthy');">Consumo saludable</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-xs-6 margenTopMovil">
                            <div class="row" style="padding-left: 10%;">
                                <div class="btn-block center-block btnTodosLosProductos">
                                    <a aria-haspopup="true" aria-expanded="false" style="font-size: 13px; color: white; height: 33px; display: none" id="BtnVerProductos2" onclick="VerTodosProductos()" class="btn-block btn btn-success todosLosProductos">All the Products</a>
                                </div>
                                <button type="button" title="All the Products" class="btn btn-success btn-lg btn-xs" onclick="BuscarProducto();">
                                    <i class=""></i>Lista de Productos</button>

                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="paginadoProductos" style="margin-top: 35px;" id="idpaginadoProductos">
                    <% foreach (var producto in listaProductos)
                        {
                            int cant = listaProductos.Count(); %>
                    <div>
                        <input hidden id="CantidadProductos" class="pagination" value="<%=cant %>" />

                        <div class="text-center">
                            <div class="product-entry" style="padding: 40px;">
                                <div class="product-img">
                                    <div class="l_p_img" style="display: flex; justify-content: center; align-items: center; height: inherit">
                                        <img src="https://yosoymitosis.com/products/<%=producto.Foto%>" alt="" />
                                    </div>
                                    <p class="tag" style="display: none"><span class="nuevo">New</span></p>
                                    <div class="cart">
                                        <div class="cajaProductos">
                                            <input type="number" class="txtCantProd" step="1" min="0" max="100" id="<%=producto.Codigo%>" value="1">
                                        </div>
                                        <span class="addtocart">

                                            <a class="agregarAlCarrito" href="#<%=producto.Codigo%>" id="idAgregarCarrito" onclick="AgregarCarrito('<%=producto.Codigo%>')"><i class="icon-shopping-cart"></i></a>

                                            <%--<a class="agregarAlCarrito" href="#" onclick="AgregarCarritov2('<%=producto.Codigo%>')" style="transition: .5s;"><i class="icon-shopping-cart"></i></a>--%>                                            
                                        </span>
                                        <span style="display: none;"><a href="#" style="transition: .5s" onclick="VerDetalle('<%=producto.Codigo%>', this)"><i class="icon-eye"></i></a></span>
                                    </div>
                                </div>
                                <div class="desc">
                                    <h3><a href="DetalleProducto.aspx"><%=producto.NombreProducto %></a></h3>
                                    <p class="price"><span>S/. <%=producto.PrecioUnitario.ToString().Replace(",", ".") %></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>

            <!--------------------------------------END PRODUCTOS SANTA NATURA------------------------------------------>
            <!--*************************************BEGIN RESUMEN DE LA COMPRA****************************************-->
            <div id="resumenDeLaCompra" class="col-xl-4 col-lg-4 col-md-4 col-sm-4" <%--style="background-image: url('../img/hojasCaen.gif'); --%>background-position: top; border: 2px dashed #d7d7e2; height: 220px">
                <div class="row" style="margin-top: 13px">
                    <div class="col-md-12 text-center">
                        <label>RESUMEN DE COMPRA</label>
                    </div>
                </div>
                <div id="MostrarSoloLogueado2">
                    <div class="row" style="margin-top: 10px">
                        <div class="col-6 col-sm-6 col-md-6">
                            <asp:Label ID="Label2" runat="server" Text="Puntos Totales:"></asp:Label>
                        </div>
                        <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                            <asp:Label ID="LbPuntosRango" CssClass="price" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 2px; display: none;">
                        <div class="col-6 col-sm-6 col-md-6">
                            <asp:Label ID="Label6" runat="server" Text="Corazones:"></asp:Label>
                        </div>
                        <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                            <asp:Label ID="LbCorazones" CssClass="price" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 2px">
                        <div class="col-6 col-sm-6 col-md-6">
                            <asp:Label ID="Label3" runat="server" Text="Puntos:"></asp:Label>
                        </div>
                        <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                            <asp:Label ID="LbPuntosCompra" CssClass="price" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div id="lblresumenDeLaCompra" class="row" style="margin-top: 2px">
                    <div class="col-6 col-sm-6 col-md-6">
                        <asp:Label ID="Label4" runat="server" Text="Precio Público:"></asp:Label>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                        <asp:Label ID="LbPrecioTotal" CssClass="price" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row" style="margin-top: 2px">
                    <div class="col-6 col-sm-6 col-md-6">
                        <asp:Label ID="Label5" runat="server" Text="Precio Empresario:"></asp:Label>
                    </div>

                    <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                        <asp:Label ID="LbPrecioPagar" CssClass="price" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row" style="margin-top: 13px;display:none;" id="preRe1">
                    <div class="col-md-12 text-center">
                        <label>PRE-REGISTRO</label>
                    </div>
                </div>
                <div class="row" style="margin-top: 2px;display:none;" id="preRe2">
                    <div class="col-6 col-sm-6 col-md-6">
                        <asp:Label ID="Label8" runat="server" Text="Usuario Pre registrado:"></asp:Label>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6">
                        <select id="cboPreRegistro" runat="server" class="form-control btn-md" style="width:80%"></select>
                    </div>
                </div>
                <br />
                <div class="row" style="margin-top: 1px">
                    <div class="col-sm-3 col-md-3">
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <a aria-haspopup="true" aria-expanded="false" onclick="irCarrito()" style="margin-top: 3px;" href="#" class="btn-block btn btn-success">Continuar</a>
                    </div>
                    <div class="col-sm-3 col-md-3">
                    </div>
                </div>
            </div>
            <!--*************************************END RESUMEN DE LA COMPRA****************************************-->
        </div>

        <div class="row" style="display:none;">
            <div class="col-12 col-sm-12 col-md-12">
                <div class="table-responsive">
                    <table id="tableProductos" class="table table-bordred table-striped">
                        <thead class="table-success">
                            <tr class="text-center" style="color: white">
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <div data-pushbar-id="pushbar-carrito" class="pushbar from_right pushbar-carrito">
        <div class="btn-cerrar">
            <button data-pushbar-close>
                <i class="fa fa-times"></i>
            </button>
        </div>

        <p class="titulo">SUMMARY OF PURCHASE</p>

        <div id="MostrarSoloLogueado22">
            <div class="row" style="margin-top: 10px">
                <div class="col-6 col-sm-6 col-md-6">
                    <asp:Label ID="Label22" runat="server" Text="Puntos Totales:"></asp:Label>
                </div>
                <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                    <asp:Label ID="LbPuntosRango2" CssClass="price" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 2px; display: none;">
                <div class="col-6 col-sm-6 col-md-6">
                    <asp:Label ID="Label7" runat="server" Text="Corazones:"></asp:Label>
                </div>
                <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                    <asp:Label ID="LbCorazones2" CssClass="price" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-top: 2px">
                <div class="col-6 col-sm-6 col-md-6">
                    <asp:Label ID="Label33" runat="server" Text="Puntos:"></asp:Label>
                </div>
                <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                    <asp:Label ID="LbPuntosCompra2" CssClass="price" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 2px">
            <div class="col-6 col-sm-6 col-md-6">
                <asp:Label ID="Label44" runat="server" Text="Precio Público:"></asp:Label>
            </div>
            <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                <asp:Label ID="LbPrecioTotal2" CssClass="price" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row" style="margin-top: 2px">
            <div class="col-6 col-sm-6 col-md-6">
                <asp:Label ID="Label55" runat="server" Text="Precio Empresario:"></asp:Label>
            </div>

            <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                <asp:Label ID="LbPrecioPagar2" CssClass="price" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row" style="margin-top: 2px; display:none;">
            <div class="col-6 col-sm-6 col-md-6">
                <asp:Label ID="Label9" runat="server" Text="Usuario PreRegistro:"></asp:Label>
            </div>
            <div class="col-6 col-sm-6 col-md-6" style="padding-left: 0px">
                <select id="cboPreRegistro2" runat="server" class="form-control btn-md" style="width:80%"></select>
            </div>
        </div>
        <br />
        <div class="row" style="margin-top: 1px">
            <div class="col-sm-3 col-md-3">
            </div>
            <div class="col-sm-6 col-md-6">
                <a id="irCarrito" aria-haspopup="true" aria-expanded="false" onclick="irCarrito()" style="margin-top: 3px;" href="#" class="btn-block btn btn-success">Continuar</a>
            </div>
            <div class="col-sm-3 col-md-3">
            </div>
        </div>
    </div>


    <%--<script src="js/nombre.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type='text/javascript' src="js/proyecto2/fly.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


    <!--**********************************BEGIN ESTILOS PARA EL COMBO BOX TIPO ENTREGA***************************************************-->
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
    <%--<script src="js/tiendaaaaaa2.js?v1"></script>--%>
    <script src="js/Store.js?v18" type="text/javascript"></script>
    <!--**********************************END ESTILOS PARA EL COMBO BOX TIPO ENTREGA***************************************************-->

    <script src="js/proyecto2/paginathinggg.js"></script>
    <script src="js/proyecto2/estilos-combo.js"></script>
    <script src="js/proyecto2/file-uploadv1.js"></script>
    <!--Para aumentar o disminuir la cantidad en el asp:textbox -->
    <script src="js/proyecto2/bootstrap-input-spinner.js"></script>


    <script src="js/proyecto2/popper.min.js"></script>


    <script>                          
        //$("[id*=STipoCompra] option[value='']").hide()
        //$("[id*=ComboTienda] option[value='0']").hide()

        //function ObtenerStock() {
        //    var SendObj = {
        //        "a": "all_prod",
        //    }

        //    const proxyurl = 'https://cors-anywhere.herokuapp.com/';
        //    const uu = 'http://santanatura.cti.lat/santa2/webservices/pedidos.php';
        //    var pp = proxyurl + uu

        //    $.ajax({
        //        url: pp,
        //        type: 'post',
        //        dataType: 'json',
        //        CORS: true,
        //        contentType: 'application/json; charset=utf-8',
        //        success: function (data) {
        //            if (data.d != null) {
        //                alert(data.d);
        //                console.log(data.d);
        //            }
        //        },
        //        data: JSON.stringify(SendObj),
        //        error: function (XMLHttpRequest, textStatus, errorThrown) {
        //            console.log("In The ERROR");
        //            console.log(XMLHttpRequest);
        //            console.log(textStatus);
        //            console.log(errorThrown);
        //        }
        //    });
        //}

        //function AplicarDescuento(value) {
        //    var sTipoCom = value;
        //    location.href = ("TiendaSN.aspx?sTipoCom=" + sTipoCom);
        //}

        //function pageLoad() {
        //    var divComboTienda = $("[id$=MostrarComboTiena]")[0];
        //    divComboTienda.style.display = "block";
        //}

        //function MostrarTienda() {
        //    var divComboTienda = document.getElementById('MostrarComboTiena');
        //    var divDatosDelivery = document.getElementById('MostrarDatosParaDelivery');

        //    divComboTienda.style.display = "block";
        //    divDatosDelivery.style.display = "none";
        //}

        //function MostrarTipoCopraAndPuntos() {
        //    var divTipoCompraAndPuntos = document.getElementById('MostrarSoloLogueado');
        //    var divTipoCompraAndPuntos2 = document.getElementById('MostrarSoloLogueado2');
        //    var divTipoCompraAndPuntos22 = document.getElementById('MostrarSoloLogueado22');
        //    divTipoCompraAndPuntos.style.display = "block";
        //    divTipoCompraAndPuntos2.style.display = "block";
        //    divTipoCompraAndPuntos22.style.display = "block";
        //}

        //function MostrarTipoCopraAndPuntosAndTienda() {
        //    var divComboTienda = $("[id$=MostrarComboTiena]")[0];
        //    var divTipoCompraAndPuntos = document.getElementById('MostrarSoloLogueado');
        //    var divTipoCompraAndPuntos2 = document.getElementById('MostrarSoloLogueado2');
        //    var divTipoCompraAndPuntos22 = document.getElementById('MostrarSoloLogueado22');

        //    divTipoCompraAndPuntos.style.display = "block";
        //    divTipoCompraAndPuntos2.style.display = "block";
        //    divTipoCompraAndPuntos22.style.display = "block";
        //    divComboTienda.style.display = "block";
        //}

        //function MostrarTipoCopraAndPuntosAndDelivery() {
        //    var divTipoCompraAndPuntos = document.getElementById('MostrarSoloLogueado');
        //    var divTipoCompraAndPuntos2 = document.getElementById('MostrarSoloLogueado2');
        //    var divTipoCompraAndPuntos22 = document.getElementById('MostrarSoloLogueado22');
        //    var divDatosDelivery = document.getElementById('MostrarDatosParaDelivery');

        //    divTipoCompraAndPuntos.style.display = "block";
        //    divTipoCompraAndPuntos2.style.display = "block";
        //    divTipoCompraAndPuntos22.style.display = "block";
        //    divDatosDelivery.style.display = "block"
        //}

        //function MostrarDelivery() {
        //    var divComboTienda = document.getElementById('MostrarComboTiena');
        //    var divDatosDelivery = document.getElementById('MostrarDatosParaDelivery');

        //    divComboTienda.style.display = "none";
        //    divDatosDelivery.style.display = "block"
        //}

        <%--function ObtenerFechaNac() {
            var fechaNacimiento = document.getElementById('<%= FechaNaci.ClientID %>');
            fechaNacimiento.value = $("[id$=datepicker]").val();
            alert(fechaNacimiento.value);

            var Nombre = document.getElementById('<%= Nombre.ClientID %>');
            Nombre.value = $("[id$=TxtNombre]").val();

            var Provincia = document.getElementById('<%= Provincia.ClientID %>');
            Provincia.value = $("[id$=ComboProvincia]").val();

        }--%>

        //function validarLetras(e) {
        //    var keyCode = (e.keyCode ? e.keyCode : e.which);
        //    if (keyCode > 47 && keyCode < 58 || keyCode > 95 && keyCode < 107) {
        //        e.preventDefault();
        //    }
        //}

        //function validarNumeros(evt) {
        //    var charCode = (evt.which) ? evt.which : event.keyCode
        //    if (charCode > 31 && (charCode < 48 || charCode > 57))
        //        return false;
        //    return true;
        //}

        //function MostrarComboTienda() {
        //    var divComboTienda = document.getElementById('MostrarComboTiena');

        //    divComboTienda.style.display = "block";
        //    divDatosDelivery.style.display = "none";
        //}



        //if (screen.width < 499) {
        //    $(".bloqueImagenProducto").each(function () {
        //        $(this).addClass("-opacity");
        //    });
        //}
    </script>

    <script>      
        function CargaBoton() {
            var ventana_ancho = $(window).width();
            if (ventana_ancho < 1920) {
                $("input[type='number']").inputSpinner({
                    incrementButton: '<b class="glyphicon glyphicon-chevron-up"></b>',
                    decrementButton: '<b class="glyphicon glyphicon-chevron-down"></b>',
                    groupClass: 'input-group-md',
                    buttonsClass: 'btn-success',

                    transformButton: 'rotate(-90deg)',
                    buttonsHeight: '3rem',
                    buttonsWidth: '3rem',
                    textAlign: 'center',
                });

                $(".txtCantProd").css("font-size", "inherit");
                $(".txtCantProd").css("border", "none");
                $(".cart").css("padding", "0 20px");
                $(".btn-decrement").css("background-color", "#333333");
                $(".btn-decrement").css("border", "2px solid white");
                $(".btn-decrement").css("margin-right", "3px");
                $(".btn-increment").css("background-color", "#333333");
                $(".btn-increment").css("border", "2px solid white");
                $(".btn-increment").css("margin-left", "3px");
            }
        }
        //Caja de texto para aumentar o disminuir cantidad de productos
        $(document).ready(function ($) {
            var ventana_ancho = $(window).width();
            if (ventana_ancho < 1920) {
                $("input[type='number']").inputSpinner({
                    incrementButton: '<b class="glyphicon glyphicon-chevron-up"></b>',
                    decrementButton: '<b class="glyphicon glyphicon-chevron-down"></b>',
                    groupClass: 'input-group-md',
                    buttonsClass: 'btn-success',

                    transformButton: 'rotate(-90deg)',
                    buttonsHeight: '3rem',
                    buttonsWidth: '3rem',
                    textAlign: 'center',
                });

                $(".txtCantProd").css("font-size", "inherit");
                $(".txtCantProd").css("border", "none");
                $(".cart").css("padding", "0 20px");
                $(".btn-decrement").css("background-color", "#333333");
                $(".btn-decrement").css("border", "2px solid white");
                $(".btn-decrement").css("margin-right", "3px");
                $(".btn-increment").css("background-color", "#333333");
                $(".btn-increment").css("border", "2px solid white");
                $(".btn-increment").css("margin-left", "3px");
            }
        });


        //Paginado
        var cant = $("[id$=CantidadProductos]").val();
        cant = cant / 9;
        var entero = Math.floor(cant);
        var decimal = cant - Math.floor(cant);

        if (decimal > 0) {
            decimal = 1;
        }

        $('.paginadoProductos').paginathing({
            perPage: 6,
            limitPagination: entero + decimal,
            containerClass: 'panel-footer',
            pageNumbers: true
        })

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

    <!--Begin Para el banner carrusel de la página Tienda-->
    <script type="text/javascript" src="engine1/wowsliderv2.js"></script>
    <script type="text/javascript" src="engine1/scriptv2.js"></script>
    <!--End Para el banner carrusel de la página Tienda-->

    <!--Para el bloque con efecto jover-->
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/three.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="js/hover.js"></script>
    <script>

        Array.from(document.querySelectorAll('.grid__item-img')).forEach((el) => {
            const imgs = Array.from(el.querySelectorAll('img'));
            new hoverEffect({
                parent: el,
                intensity: el.dataset.intensity || undefined,
                speedIn: el.dataset.speedin || undefined,
                speedOut: el.dataset.speedout || undefined,
                easing: el.dataset.easing || undefined,
                hover: el.dataset.hover || undefined,
                image1: imgs[0].getAttribute('src'),
                image2: imgs[1].getAttribute('src'),
                displacementImage: el.dataset.displacement
            });
        });
    </script>
    <!--Para el pushbar-->

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
    <script src="js/proyecto2/pushbar.js"></script>
    <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/tables/datatables/extensions/fixed_columns.min.js"></script>
    <%--  <link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />--%>

    <style>
        .dataTables_wrapper .dataTables_info,
        .dataTables_wrapper .dataTables_paginate {
            float: none;
            text-align: center;
        }
    </style>

    <script>
        var pushbar = new Pushbar({
            blur: true,
            overlay: true
        });

        function LlenarDatatableProductos(Pais, Buscar) {

            $.ajax({
                type: 'POST',
                url: 'TiendaSN.aspx/ListaProductos',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                async: true,
                cache: false,
                data: '{Pais: "' + Pais + '",Buscar: "' + Buscar + '"}',
                success: function (data) {
                    $('#idpaginadoProductos').empty();
                    $('.panel-footer').css("display", "none");
                    var Lista = data.d;
                    var data = [];
                    var Codigo;
                    var Foto;
                    var Nombre;
                    var Precio;
                    var tmpHtml;
                    var cant;
                    var html = "";
                    for (i = 0; i < Lista.length; i++) {
                        Codigo = Lista[i].Codigo;
                        Foto = Lista[i].Foto;
                        Nombre = Lista[i].NombreProducto;
                        Precio = Lista[i].PrecioUnitario;
                        cant = Lista.length;
                        var html = html + ` <div><input hidden id="CantidadProductos" class="pagination" value="${cant}" /><div class="text-center">
                            <div class="product-entry" style="padding: 40px;">
                                <div class="product-img">
                                    <div class="l_p_img" style="display: flex; justify-content: center; align-items: center; height: inherit">
                                        <img src="https://yosoymitosis.com/products/${Foto}" alt="" />
                                    </div>
                                    <p class="tag" style="display: none"><span class="nuevo">New</span></p>
                                    <div class="cart">
                                        <div class="cajaProductos">
                                            <input type="number" class="txtCantProd" step="1" min="0" max="100" id="${Codigo}" value="1">
                                        </div>
                                        <span class="addtocart">
                                            <img src="https://yosoymitosis.com/products/${Foto}" alt="" style="display: none" />
                                            <a class="agregarAlCarrito" id="idAgregarCarrito" href="#" onclick="AgregarCarrito('${Codigo}');" style="transition: .5s;"><i class="icon-shopping-cart"></i></a>
                 
                                             


                                        </span>
                                        <span style="display: none;"><a href="#" style="transition: .5s" onclick="VerDetalle('${Codigo}', this)"><i class="icon-eye"></i></a></span>
                                    </div>
                                </div>
                                <div class="desc">
                                    <h3><a href="DetalleProducto.aspx">${Nombre}</a></h3>
                                    <p class="price"><span>S/. ${Precio}</span></p>
                                </div>
                            </div>
                        </div></div>`
                        $("#idpaginadoProductos").html(html);
                    }
                    CargaBoton();

                    cant = cant / 9;
                    var entero = Math.floor(cant);
                    var decimal = cant - Math.floor(cant);

                    if (decimal > 0) {
                        decimal = 1;
                    }

                    $('.paginadoProductos').paginathing({
                        perPage: 6,
                        limitPagination: entero + decimal,
                        containerClass: 'panel-footer',
                        pageNumbers: true
                    })

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
            })
        }
        function LlenarProductosLinea(Linea) {
            $.ajax({
                type: 'POST',
                url: 'TiendaSN.aspx/Lineas_Productos',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                async: true,
                cache: false,
                data: '{Linea: "' + Linea + '"}',
                success: function (data) {
                    $('#idpaginadoProductos').empty();
                    $('.panel-footer').css("display", "none");

                    var Lista = data.d;
                    var data = [];
                    var Codigo;
                    var Foto;
                    var Nombre;
                    var Precio;
                    var tmpHtml;
                    var cant;
                    var html = "";
                    for (i = 0; i < Lista.length; i++) {
                        Codigo = Lista[i].Codigo;
                        Foto = Lista[i].Foto;
                        Nombre = Lista[i].NombreProducto;
                        Precio = Lista[i].PrecioUnitario;
                        cant = Lista.length;

                        var html = html + ` <div><input hidden id="CantidadProductos" class="pagination" value="${cant}" /><div class="text-center">
                            <div class="product-entry" style="padding: 40px;">
                                <div class="product-img">
                                    <div class="l_p_img" style="display: flex; justify-content: center; align-items: center; height: inherit">
                                        <img src="https://yosoymitosis.com/products/${Foto}" alt="" />
                                    </div>
                                    <p class="tag" style="display: none"><span class="nuevo">New</span></p>
                                    <div class="cart">
                                        <div class="cajaProductos">
                                            <input type="number" class="txtCantProd" step="1" min="0" max="100" id="${Codigo}" value="1">
                                        </div>
                                        <span class="addtocart">
                                            <img src="https://yosoymitosis.com/products/${Foto}" alt="" style="display: none" />
                                            <a class="agregarAlCarrito" id="idAgregarCarrito" href="#" onclick="AgregarCarrito('${Codigo}');" style="transition: .5s;"><i class="icon-shopping-cart"></i></a>
                 
                                             


                                        </span>
                                        <span style="display: none;"><a href="#" style="transition: .5s" onclick="VerDetalle('${Codigo}', this)"><i class="icon-eye"></i></a></span>
                                    </div>
                                </div>
                                <div class="desc">
                                    <h3><a href="DetalleProducto.aspx">${Nombre}</a></h3>
                                    <p class="price"><span>S/. ${Precio}</span></p>
                                </div>
                            </div>
                        </div></div>`
                        $("#idpaginadoProductos").html(html);
                    }
                    CargaBoton();

                    if (cant > 0) {
                        cant = cant / 9;
                        var entero = Math.floor(cant);
                        var decimal = cant - Math.floor(cant);

                        if (decimal > 0) {
                            decimal = 1;
                        }

                        $('.paginadoProductos').paginathing({
                            perPage: 6,
                            limitPagination: entero + decimal,
                            containerClass: 'panel-footer',
                            pageNumbers: true
                        })
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
            })
        }

        function BuscarProducto() {
            var producto = $("#txtNomProducto").val();
            var element_linea = document.getElementById("buttonLineaNombre");
            element_linea.innerHTML = "Línea";

            if (producto == "") {
                //error("Vacio");
                $("#txtNomProducto").val("");
                LlenarDatatableProductos("Peru", "Todo");
                return;
            }
            $("#txtNomProducto").val("");
            LlenarDatatableProductos("Peru", producto);


        }
        function alerta(mensaje) {
            //un alert
            if (mensaje == 'Voucher Registrado Temporal') {
                alertify.alert("<b>Voucher Loaded Correctly</b>", function () {
                    //aqui introducimos lo que haremos tras cerrar la alerta.
                    //por ejemplo -->  location.href = 'http://www.google.es/';  <-- Redireccionamos a GOOGLE.
                });
            }
            if (mensaje == 'Voucher Actualizado Correctamente') {
                alertify.alert("<b>Voucher Updated Correctly</b>", function () {
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
            if (mensaje == 'Vacio') {
                //una notificación de error
                alertify.error("You must enter Product.");
                return false;
            }
            if (mensaje == 'TipoCompra') {
                //una notificación de error
                alertify.error("Debe elegir el Tipo de Compra.");
                return false;
            }
            if (mensaje == 'Tienda') {
                //una notificación de error
                alertify.error("Debe elegir la Tienda.");
                return false;
            }
            if (mensaje == 'MedioPago') {
                //una notificación de error
                alertify.error("Debe elegir el Método de Pago.");
                return false;
            }

        }
        //function AgregarCarritov2(Codigo) {
        //    var TipoCompra = $("#STipoCompra").val();
        //    var Tienda = $("#ComboTienda").val();
        //    var MedioPago = $("#SMedioPago").val();
        //    var element_TipoCompra = document.getElementById("STipoCompra");
        //    var element_Tienda = document.getElementById("ComboTienda");
        //    var element_MedioPago = document.getElementById("SMedioPago");

        //    var vacio_tipo_compra;
        //    var vacio_tienda;
        //    var vacio_MedioPago;

        //    if (TipoCompra == "0") {
        //        vacio_tipo_compra = "1";
        //        element_TipoCompra.style.border = "1px solid red";               
        //    }
        //    else {
        //        vacio_tipo_compra = "0";
        //        element_TipoCompra.style.border = "1px solid white";
        //    }
        //    if (Tienda == "0") {
        //        vacio_tienda = "1";
        //        element_Tienda.style.border = "1px solid red";               
        //    }
        //    else {
        //        vacio_tienda = "0";
        //        element_Tienda.style.border = "1px solid white";
        //    }
        //    if (MedioPago == "0") {
        //        vacio_MedioPago = "1";
        //        element_MedioPago.style.border = "1px solid red";                
        //    }
        //    else {
        //        vacio_MedioPago = "0";
        //        element_MedioPago.style.border = "1px solid white";
        //    }

        //    if (vacio_tipo_compra != "0") {
        //        $("#STipoCompra").focus;
        //        error("TipoCompra");
        //    }
        //    if (vacio_tienda != "0") {
        //      $("#ComboTienda").focus;
        //        error("Tienda");
        //    }
        //    if (vacio_MedioPago != "0") {
        //         $("#SMedioPago").focus;
        //        error("MedioPago");
        //    }

        //    if (vacio_tipo_compra == "0" && vacio_tienda == "0" && vacio_MedioPago == "0") {
        //        $("#idAgregarCarrito").trigger("click");
        //    }            
        //}

        function BuscarProductoxLinea(Linea) {
            var element_linea = document.getElementById("buttonLineaNombre");
            element_linea.innerHTML = "Línea: " + Linea;
            LlenarProductosLinea(Linea);
        }
    </script>

</asp:Content>
