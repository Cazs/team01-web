﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="IceBreak.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/scripts.js"></script>
    <script src="scripts/jquery.backstretch.min.js"></script>
     <script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAAQZBI76K_oRkxy-1qAyMC2w8AnfimZM&libraries=places"></script>
    <link rel="stylesheet" href="stylesheets/addeventform.css"/>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div id="page-content-wrapper">
        
        <div class="register-container container">
            <div class="row">
                 <div class="maps span5">
                     <input id="pac-input" class="controls" type="text" placeholder="Enter a location"/>
                        <div id="type-selector" class="controls">
                          <input type="radio" name="type" id="changetype-all" checked="checked"/>
                          <label for="changetype-all">All</label>

                          <input type="radio" name="type" id="changetype-establishment"/>
                          <label for="changetype-establishment">Establishments</label>

                          <input type="radio" name="type" id="changetype-address"/>
                          <label for="changetype-address">Addresses</label>

                          <input type="radio" name="type" id="changetype-geocode"/>
                          <label for="changetype-geocode">Geocodes</label>
                        </div>
                        <div id="map"></div>
                      
                 </div>
                    <div class="form">
                        <h2>Add Event To <strong style="color:#59D0F7">IceBreak</strong></></h2>
                        <div class="form-group" style="text-align:left">
                            <label for="eventname"  runat="server">Event Name</label><span id="lbl_name" runat="server" style="color:red; display:none"> - Please enter your event name.</span>
                            <input type="text" id="eventname" name="eventname" placeholder="enter your event name..." runat="server"/>
                       </div>
                        <div class="form-group" style="text-align:left">
                             <label for="EventAddress">Event Address</label><span id="address_span" runat="server" style="color:red; display:none"> - Please enter your event address.</span>
                             <input type="text" id="eventaddress" name="eventaddress" placeholder="enter your event address..."  runat="server"/>
                       </div>
                        <div class="form-group" style="text-align:left">
                            <label for="EventDescription">Event Description</label><span id="descrip_span" runat="server" style="color:red; display:none"> - Please enter your event description.</span>
                            <textarea class="form-control" rows="4" id="eventdescrip" name="eventdescrip" placeholder="enter your event description..."  runat="server"></textarea>
                        </div>
                        <div class="form-group" style="text-align:left">
                            <label for="Event Date ">Event Date</label><span id="date_span" runat="server" style="color:red; display:none"> - Please enter your event date.</span>
                            <input type="date" id="date" name="date" runat="server"/>
                        </div>
                        <div class="form-group" style="text-align:left">
                            <label for="Event Time">Event Time</label><span id="time_span" runat="server" style="color:red; display:none"> - Please enter your event name.</span>
                            <input type="time" id="time" name="time" runat="server"/>
                        </div>
                        <div class="form-group" style="text-align:left">
                            <label for="Meeting Places">Meeting Places at Event</label><span id="meeting_span" runat="server" style="color:red; display:none"> - Please enter all event meeting places.</span>
                        </div>    
                        <div class="form-group" style="text-align:left">
                            <asp:DropDownList ID="NumEvents" runat="server" CssClass="dropdown-toggle" AutoPostBack="True">
                                <asp:ListItem Enabled="true" Text="Select number of meeting places" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            </asp:DropDownList>      
                            </div>                 
                           <div class="form-group"style="text-align:left">
                             <input type="text" id="meeting_place_1" placeholder="enter meeting place 1" runat="server"/>
                           </div>
                             <div class="form-group"style="text-align:left">
                                <input type="text" id="meeting_place_2" placeholder="enter meeting place 2" runat="server"/>
                             </div>
                             <div class="form-group"style="text-align:left">
                                 <input type="text" id="meeting_place_3" placeholder="enter meeting place 3" runat="server"/>
                            </div>
                             <div class="form-group"style="text-align:left">
                                  <input type="text" id="meeting_place_4" placeholder="enter meeting place 4" runat="server"/>
                            </div>
                             <div class="form-group"style="text-align:left">
                                  <input type="text" id="meeting_place_5" placeholder="enter meeting place 5" runat="server"/>
                             </div>
                        <div class="form-group" style="text-align:left">                            
                        <asp:FileUpload id="FileUpload" runat="server" CssClass="UploadButton AddButton" /> <span id="upload" runat="server" style="color:red;display:none"></span>
                     
                        </div>
                        <asp:Button runat="server" ID="btnAddButton"  UseSubmitBehavior="true" CssClass="AddButton" OnClick="btnAdd_Event" Text="ADD EVENT"></asp:Button>
                   </div>
               </div>
            </div>
    </div>

    
   <script type="text/javascript">
       function showAlert()
       {
           $('#alertModal').modal('show');
       }
       function showAlert2() {
           $('#alertModal2').modal('show');
       }
       function initMap() {
           var map = new google.maps.Map(document.getElementById('map'), {
               center: { lat: -33.8688, lng: 151.2195 },
               zoom: 13
           });
           var input = /** @type {!HTMLInputElement} */(
               document.getElementById('pac-input'));

           var types = document.getElementById('type-selector');
           map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
           map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

           var autocomplete = new google.maps.places.Autocomplete(input);
           autocomplete.bindTo('bounds', map);

           var infowindow = new google.maps.InfoWindow();
           var marker = new google.maps.Marker({
               map: map,
               anchorPoint: new google.maps.Point(0, -29)
           });

           autocomplete.addListener('place_changed', function () {
               infowindow.close();
               marker.setVisible(false);
               var place = autocomplete.getPlace();
               if (!place.geometry) {
                   window.alert("Autocomplete's returned place contains no geometry");
                   return;
               }

               // If the place has a geometry, then present it on a map.
               if (place.geometry.viewport) {
                   map.fitBounds(place.geometry.viewport);
               } else {
                   map.setCenter(place.geometry.location);
                   map.setZoom(17);  // Why 17? Because it looks good.
               }
               marker.setIcon(/** @type {google.maps.Icon} */({
                   url: place.icon,
                   size: new google.maps.Size(71, 71),
                   origin: new google.maps.Point(0, 0),
                   anchor: new google.maps.Point(17, 34),
                   scaledSize: new google.maps.Size(35, 35)
               }));
               marker.setPosition(place.geometry.location);
               marker.setVisible(true);

               var address = '';
               if (place.address_components) {
                   address = [
                     (place.address_components[0] && place.address_components[0].short_name || ''),
                     (place.address_components[1] && place.address_components[1].short_name || ''),
                     (place.address_components[2] && place.address_components[2].short_name || '')
                   ].join(' ');
               }

               infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
               infowindow.open(map, marker);
           });

           // Sets a listener on a radio button to change the filter type on Places
           // Autocomplete.
           function setupClickListener(id, types) {
               var radioButton = document.getElementById(id);
               radioButton.addEventListener('click', function () {
                   autocomplete.setTypes(types);
               });
           }

           setupClickListener('changetype-all', []);
           setupClickListener('changetype-address', ['address']);
           setupClickListener('changetype-establishment', ['establishment']);
           setupClickListener('changetype-geocode', ['geocode']);
       }
       google.maps.event.addDomListener(window, "load", initMap);

   </script>
     
   

</asp:Content>
