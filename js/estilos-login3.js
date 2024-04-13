// https://selimdoyranli.com
// https://www.RadKod.com

$(document).ready(function () {

    //Kaydol - Şifre Unuttum Linkleri Arası Geçiş
    $(document).ready(function () {
        $("#kayit-form").hide();
        $("#sifre-hatirlat-form").hide();
        $(".hesap-olustur-link").click(function (e) {
            $("#form1").slideUp(0);
            $("#kayit-form").fadeIn(300);
        });

        $(".zaten-hesap-var-link").click(function (e) {
            $("#kayit-form").slideUp(0);
            $("#sifre-hatirlat-form").slideUp(0);
            $("#form1").fadeIn(300);
        });

        $(".sifre-hatirlat-link").click(function (e) {
            $("#form1").slideUp(0);
            $("#sifre-hatirlat-form").fadeIn(300);
        });



        //$('.pass_show').append('<span class="ptxt">Show</span>');
        $('.pass_show').append('<span class="ptxt" style="cursor: pointer; margin-left: 15px; color: white;">mostrar</span>');



        $(document).on('click', '.pass_show .ptxt', function () {

            $(this).text($(this).text() == "mostrar" ? "ocultar" : "mostrar");

            $(this).prev().attr('type', function (index, attr) { return attr == 'password' ? 'text' : 'password'; });

        });  


    });

});