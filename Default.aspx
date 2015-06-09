<%@ Page Language="C#" MasterPageFile="~/Common/Public.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="PinYin_Default" Title=" جۇغراپىيەلىك ئورۇن بىكىتىش (HTML5 Geolocation Example)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="text-align: center">
                 جۇغراپىيەلىك ئورۇن بىكىتىش   <br />
                HTML5 Geolocation Example<br />
                <hr class="HorzentalLineHeader" dir="rtl" />
            </td>
        </tr>
        <tr>
            <td>
                <!--start -->
                 <meta name="viewport" content="width=620" />

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <article>
      <p>ئورنىڭىز: <span id="status">تەڭشۈرلىۋاتىدۇ...</span></p>
      <p>كوردىنات(كەڭلىك، ئۇزۇنلۇق): <span id="cordinat">...</span></p>
    </article>
<script>
    function success(position) {
        var s = document.querySelector('#status');
        var c = document.querySelector('#cordinat');

        if (s.className == 'success') {
            // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
            return;
        }

        s.innerHTML = "تېپىلدى!";
        s.className = 'success';

        //added by sarwan
        c.innerHTML =  + position.coords.latitude + "،" + position.coords.longitude;

        var mapcanvas = document.createElement('div');
        mapcanvas.id = 'mapcanvas';
        mapcanvas.style.height = '400px';
        mapcanvas.style.width = '100%';

        document.querySelector('article').appendChild(mapcanvas);

        var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        var myOptions = {
            zoom: 15,
            center: latlng,
            mapTypeControl: false,
            navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL },
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: "ئورنىڭىز (تەخمىنەن" + position.coords.accuracy + " مېتېر دائىرىدە)"
        });
    }

    function error(msg) {
        var s = document.querySelector('#status');
        s.innerHTML = typeof msg == 'string' ? msg : "تېپىلمىدى";
        s.className = 'fail';

        // console.log(arguments);
    }

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(success, error);
    } else {
        error('تور كۆرگۈچ قوللىمايدۇ');
    }

</script>  
   <!--end -->


                <br />
               <img src="http://www.w3.org/html/logo/badge/html5-badge-h-device.png" />
                <br />
                مۇناسىۋەتلىك ئۇلىنىشلار<hr align="right" class="HorzentalLineLinks" />
                <a href="https://github.com/remy/html5demos/blob/master/demos/geo.html">https://github.com/remy/html5demos/blob/master/demos/geo.html
                </a>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

