<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="kurye_first_demo.index" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
                        <input type="radio" name="radio1" id="basic" onclick="calcRoute()" value="basic"><label class="basic-label four col bg-white" for="basic">Araba</label>
                    </section>
                </form>

                <form class="form cf" style="margin-top: 20px">
                    <section class="payment-plan cf">
                        <h5>Ağırlık Seçin</h5>
                        <input type="radio" name="radio2" id="monthly" value="monthly" checked><label class="monthly-label bg-white four col" for="monthly">10Kg'a Kadar</label>
                        <input type="radio" name="radio2" id="yearly" value="yearly"><label class="yearly-label bg-white four col" for="yearly">20Kg'a Kadar</label>
                        <input type="radio" name="radio2" id="new" value="new"><label class="yearly-label bg-white four col" for="new">50Kg'a Kadar</label>
                    </section>
                </form>

                <form runat="server">
                    <div class="card" style="padding: 15px; margin-top: 20px; background-color: white !important;">
                        <h6 class="card-header">Çıkış Adresi</h6>
                        <div class="card-body">
                            <asp:TextBox ID="location_1" CssClass="form-control" type="text" placeholder="Başlangıç" runat="server"></asp:TextBox>
                            <!-- <input type="text" class="form-control" id="location-1" name="origin" placeholder="başlangıç">-->
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4" style="margin-top: 10px !important;">
                                        <span style="float: center;">Cep Telefonu</span>

                                        <asp:TextBox placeholder="000 000 0000" required class="form-control tablet-full" type="number" Style="margin-top: 5px; width: 50%;" ID="txt_first_phone" runat="server"></asp:TextBox>
                                        <!-- <input placeholder="000 000 0000" class="form-control tablet-full" type="tel" style="margin-top: 5px; width: 50%;">-->
                                    </div>
                                    <div class="col-md-8" style="margin-top: 10px !important;">
                                        <span class="mg-left-span" style="float: center;">Çıkış Tarihi</span><br>

                                        <%--                <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; width: 20%; display: inline-block;"><option value="1">Bugün</option><option value="2">Yarın</option></select>--%>
                                        <asp:DropDownList class="form-control tablet-full mg-left-span" Style="margin-top: 5px !important; width: 20%; display: inline-block;" ID="DropDownListDate" runat="server">
                                        </asp:DropDownList>
                                        <span class="mg-left-span" style="margin-left: 30px">Saat:</span>
                                        <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; margin-left: 5px; width: 20%; display: inline-block;">
                                            <option value="1">Hemen</option>
                                            <option value="2">22.00</option>
                                        </select>
                                        <span class="mg-left-span" style="margin-left: 30px">İle:</span>
                                        <select class="form-control tablet-full mg-left-span" style="margin-top: 5px !important; margin-left: 5px; width: 20%; display: inline-block;">
                                            <option value="1">22.30</option>
                                            <option value="2">22.00</option>
                                        </select>

                                    </div>
                                </div>

                            </div>
                            <asp:TextBox class="form-control" Style="margin-top: 10px;" ID="txt_first_extra_inf" cols="5" Rows="2" TextMode="MultiLine" placeholder="GEREKLİ BİLGİLER: Mahalle, Cadde/Sokak, Ofis/Apartman Numarası, Teslim Alınacak/Edilecek Kişi Adı, Şirket Adı (varsa), Gönderici/Alıcı Ödemeli" runat="server"></asp:TextBox>
                            <!-- <textarea class="form-control" style="margin-top: 10px;" name="" id="" cols="5" rows="2" placeholder="GEREKLİ BİLGİLER: Mahalle, Cadde/Sokak, Ofis/Apartman Numarası, Teslim Alınacak/Edilecek Kişi Adı, Şirket Adı (varsa), Gönderici/Alıcı Ödemeli"></textarea>-->
                        </div>
                    </div>


                    <div class="card" style="padding: 15px; margin-top: 20px; background-color: white !important;">
                        <h6 class="card-header">Teslim Adresi</h6>
                        <div class="card-body">
                            <asp:TextBox type="text" onfocusout="calcRoute()" placeholder="Bitiş" class="form-control" ID="location_2" name="destination" runat="server"></asp:TextBox>
                            <!-- <input type="text" onfocusout="calcRoute()" class="form-control" id="location_2a" name="destinationa" placeholder="Bitiş">-->
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4" style="margin-top: 10px !important;">
                                        <span style="float: center;">Cep Telefonu</span>
                                        <asp:TextBox placeholder="000 000 0000" class="form-control tablet-full" required type="number" Style="margin-top: 5px; width: 50%;" ID="txt_final_phone" runat="server"></asp:TextBox>

                                        <!-- <input placeholder="000 000 0000" class="form-control tablet-full " type="tel" style="margin-top: 5px; width: 50%;">-->
                                    </div>
                                    <div class="col-md-8" style="margin-top: 10px !important;">
                                    </div>
                                </div>

                            </div>
                            <asp:TextBox class="form-control" Style="margin-top: 10px;" ID="txt_final_extra_inf" cols="5" Rows="2" TextMode="MultiLine" placeholder="GEREKLİ BİLGİLER: Mahalle, Cadde/Sokak, Ofis/Apartman Numarası, Teslim Alınacak/Edilecek Kişi Adı, Şirket Adı (varsa), Gönderici/Alıcı Ödemeli" runat="server"></asp:TextBox>

                            <!-- <textarea class="form-control" style="margin-top: 10px;" name="" id="" cols="5" rows="2" placeholder="GEREKLİ BİLGİLER: Mahalle, Cadde/Sokak, Ofis/Apartman Numarası, Teslim Alınacak/Edilecek Kişi Adı, Şirket Adı (varsa), Gönderici/Alıcı Ödemeli"></textarea>-->
                        </div>
                    </div>
                    <div class="card" style="padding: 15px; margin-top: 20px; background-color: white !important;">

                        <div class="card-body">
                            <asp:TextBox type="text" placeholder="Gönderinin İçeriğini Belirtiniz" class="form-control" Style="margin-bottom: 5px" ID="txt_icerik" name="destination" runat="server"></asp:TextBox>
                            <!--<asp:LinkButton ID="cicek" OnClick="cicek_Click" onfocusout="calcRoute()"  Style="color: hsl(94, 99%, 37%); margin-right:8px; text-decoration: none;" runat="server">Çiçek</asp:LinkButton>
                            <asp:LinkButton ID="Evrak" OnClick="Evrak_Click"  Style="color: hsl(94, 99%, 37%); margin-right:8px; text-decoration: none;" runat="server">Evrak</asp:LinkButton>
                            <asp:LinkButton ID="Hediye" OnClick="Hediye_Click" Style="color: hsl(94, 99%, 37%); text-decoration: none;" runat="server">Hediye</asp:LinkButton>-->


                            <!-- <input type="text" onfocusout="calcRoute()" class="form-control" id="location_2a" name="destinationa" placeholder="Bitiş">-->


                            <!-- <textarea class="form-control" style="margin-top: 10px;" name="" id="" cols="5" rows="2" placeholder="GEREKLİ BİLGİLER: Mahalle, Cadde/Sokak, Ofis/Apartman Numarası, Teslim Alınacak/Edilecek Kişi Adı, Şirket Adı (varsa), Gönderici/Alıcı Ödemeli"></textarea>-->
                        </div>
                    </div>
                    <div class="card" style="padding: 15px; margin-top: 20px; background-color: white !important;">
                        <div class="card-body">
                            <h5><span>Toplam: </span>
                                <span id="output2"></span></h5>
                            <br />
                            <asp:TextBox style="display:none;" ID="TextBox1" runat="server"></asp:TextBox>

                            <asp:Button class="btn btn_order" Style="background-color: hsl(94, 99%, 37%); width: 30%; color: white; font-weight: bold; height: 50px" ID="btn_order" runat="server" OnClick="btn_order_Click" Text="Gönderiyi Oluştur" /><br />



                            <span class="container">
                                <p style="color: #969493">Fiyatlarımıza KDV dahildir. Kurye adreste ilk 15 dakika ücretsiz bekler, sonrasında beklediği her 1 dakika 1 TL olarak sistem tarafından ekstra fiyatlandırılır.</p>
                                <br />
                                <p>Gönderi fiyatlarını öğrenmek için; çıkış ve varış noktaları için semtleri seçerek fiyatları kolayca öğrenebilirsiniz. Gönderi talebi oluşturmak için aşağıdaki adımları izleyin:</p>
                                <ol>
                                    <li>
                                        <p>
                                            Gönderinin teslim edileceği ve alınacağı adresi, ödemenin kim tarafından yapılacağını, iletişim bilgileri, gönderi bilgileri (ağırlık,içerik vb.) gerekli bilgileri ilgili alanlara girin.
Kurye tipini ve istediğiniz ek hizmetleri seçin.
                                        </p>
                                    </li>
                                    <p>
                                        <li>Siparişi onayla butonuna tıklayarak gönderinizi oluşturabilirsiniz.</li>
                                    </p>
                                    <p>
                                        <li>Herhangi bir sorunuz olursa, siparişinizi oluşturduktan sonra size verilecek olan sipariş numaranız ile birlikte 0212 000 00 00 numaralı telefonumuzdan müşteri hizmetlerimize ulaşabilirsiniz.</li>
                                        <p>
                                            <li>Size daha iyi hizmet verebilmek için gönderiniz gerçekleştiğinde kuryelere puan vermeyi unutmayın.</li>
                                        </p>
                                </ol>

                            </span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Submit button -->

    <!-- Stats table -->
    <span id="output" class="tablet-widht" style="position: sticky; bottom: 0; background-color: #212529; color: #f4f4f4; display: inherit; border-top-left-radius: 8px; border-top-right-radius: 8px; width: 10%; font-size: 18px;"></span>
    </form>
                
            <div class="container-map" style="display: none;" id="google-map"></div>
    </div>



            <!-- Footer with dynamic year change -->


</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArO6Sm47dRfgYuGLtNuUmpJXC1_iQ-WVk&libraries=places&callback=initMap"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/main.js"></script>
</html>
