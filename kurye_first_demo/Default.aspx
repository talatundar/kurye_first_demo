<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="kurye_first_demo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css">    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Distance Between Two Cities</title>
</head>
<body>
    <div class="container">
		<h1>Demo Form</h1>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
        <!--<div class="card" style="padding: 15px; margin-bottom: 20px; background-color: #f4f4f4;">
            <h6 class="card-header">Araç Seçin</h6>
            <div class="card-body">
              
             
            </div>

        </div>-->
        <h5 style="margin-top: 20px;">Araç Seçin</h5>
		<form class="form cf">
			<section class="plan cf">
				
				<input type="radio" name="radio1" id="free" onclick="calcRoute()" value="free" checked><label class="free-label four col bg-white" for="free">Motor</label>
				<input type="radio" name="radio1" id="basic" onclick="calcRoute()" value="basic" ><label class="basic-label four col bg-white" for="basic">Araba</label>
			</section></form>
        
            <form class="form cf" style="margin-top:20px">
			<section class="payment-plan cf">
				<h5>Ağırlık Seçin</h5>
				<input type="radio" name="radio2"  id="monthly" value="monthly" checked><label class="monthly-label bg-white four col" for="monthly">10Kg'a Kadar</label>
				<input type="radio" name="radio2" id="yearly" value="yearly"><label class="yearly-label bg-white four col"  for="yearly">20Kg'a Kadar</label>
                <input type="radio" name="radio2" id="new" value="new"><label class="yearly-label bg-white four col"  for="new">50Kg'a Kadar</label>
			</section>
        </form>


        <div class="card" style="padding: 15px; margin-top: 20px; background-color: #f4f4f4 !important;">
            <h6 class="card-header">Çıkış Adresi</h6>
            <div class="card-body">
                <input type="text" class="form-control" id="location-1" name="origin" placeholder="başlangıç">
            <div class="container">
                <div class="row">
                <div class="col-md-4" style="margin-top: 10px !important;">
                <span style="float: center;">Cep Telefonu</span>
                
                <input placeholder="000 000 0000" class="form-control tablet-full" type="tel" style="margin-top: 5px; width: 50%;">
            </div>
            <div class="col-md-8" style="margin-top: 10px !important;">
                <span class="mg-left-span" style="float: center;">Çıkış Saati</span><br> 
                
                <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; width: 20%; display: inline-block;"><option value="1">Bugün</option><option value="2">Yarın</option></select>
                <span class="mg-left-span" style="margin-left:30px">Saat:</span>
                <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; margin-left: 5px;width: 20%; display: inline-block;"><option value="1">Hemen</option><option value="2">22.00</option></select>
                <span class="mg-left-span" style="margin-left:30px">İle:</span>
                <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; margin-left: 5px;width: 20%; display: inline-block;"><option value="1">22.30</option><option value="2">22.00</option></select>
                
            </div>
            </div>
            
        </div> 
        <textarea class="form-control" style="margin-top: 10px;" name="" id="" cols="5" rows="2" placeholder="GEREKLİ BİLGİLER: Mahalle, Cadde/Sokak, Ofis/Apartman Numarası, Teslim Alınacak/Edilecek Kişi Adı, Şirket Adı (varsa), Gönderici/Alıcı Ödemeli"></textarea>
            </div>
            </div>
       
            <div class="card" style="padding: 15px; margin-top: 20px; background-color: #f4f4f4;">
                <h6 class="card-header">Teslim Adresi</h6>
                <div class="card-body">
                    <input type="text" onfocusout="calcRoute()" class="form-control" id="location-2" name="destination" placeholder="Bitiş">
                    <div class="container">
                        <div class="row">
                        <div class="col-md-4" style="margin-top: 10px !important;">
                        <span style="float: center;">Cep Telefonu</span>
                        
                        <input placeholder="000 000 0000" class="form-control tablet-full " type="tel" style="margin-top: 5px; width: 50%;">
                    </div>
                    <div class="col-md-8" style="margin-top: 10px !important;">
                        <span class="mg-left-span" style="float: center;">Çıkış Saati</span><br> 
                        
                        <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; width: 20%; display: inline-block;"><option value="1">Bugün</option><option value="2">Yarın</option></select>
                        <span class="mg-left-span" style="margin-left:30px">Saat:</span>
                        <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; margin-left: 5px;width: 20%; display: inline-block;"><option value="1">Hemen</option><option value="2">22.00</option></select>
                        <span class="mg-left-span" style="margin-left:30px">İle:</span>
                        <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; margin-left: 5px;width: 20%; display: inline-block;"><option value="1">22.30</option><option value="2">22.00</option></select>
                        
                    </div>
                    </div>
                    
                </div> 
                <textarea class="form-control" style="margin-top: 10px;" name="" id="" cols="5" rows="2" placeholder="GEREKLİ BİLGİLER: Mahalle, Cadde/Sokak, Ofis/Apartman Numarası, Teslim Alınacak/Edilecek Kişi Adı, Şirket Adı (varsa), Gönderici/Alıcı Ödemeli"></textarea>
                </div>
            </div>
        </div>
    </div>
</div>

   
            <!-- Submit button -->
         
            <!-- Stats table -->                
            <span id="output" class="tablet-widht" style="position: sticky; bottom: 0; background-color: #212529; color:#f4f4f4; display: inherit; border-top-left-radius:8px; border-top-right-radius:8px; width: 10%; font-size: 18px;"></span>
       </form>
                
            <div class="container-map" style="display: none;"  id="google-map"></div>   
    </div>



            <!-- Footer with dynamic year change -->
       

</body>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArO6Sm47dRfgYuGLtNuUmpJXC1_iQ-WVk&libraries=places&callback=initMap"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/main.js"></script>
</html>
    
    
    
    
    
    
    
    
    
    
   
       
    Day: <asp:DropDownList ID="DropDownListDate" runat="server">
        </asp:DropDownList>
    

</asp:Content>
