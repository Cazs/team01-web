﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="SubscriptionFormDetails.aspx.cs" Inherits="IceBreak.SubscriptionFormDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="stylesheets/SubscriptionForm.css" />
 <link rel="stylesheet" href="~/stylesheets/sidebar.css" runat="server"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body>
        <div class ="thecontainer">
             <h1 >Become an Event Manager today!</h1>
  
        <form>


            <div class="contentform">


                <div class="leftcontact">
                    <div class="form-group">
                        <p>Surname<span>*</span></p>
                        <span class="icon-case"><i class="fa fa-male"></i></span>
                        <input type="text" name="nom" id="nom" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Nom' doit être renseigné." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Name <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-user"></i></span>
                        <input type="text" name="prenom" id="prenom" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Prénom' doit être renseigné." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>E-mail <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-envelope-o"></i></span>
                        <input type="email" name="email" id="email" data-rule="email" data-msg="Vérifiez votre saisie sur les champs : Le champ 'E-mail' est obligatoire." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Company <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-home"></i></span>
                        <input type="text" name="society" id="society" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Société' doit être renseigné." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Company Address <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-location-arrow"></i></span>
                        <input type="text" name="adresse" id="adresse" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Adresse' doit être renseigné." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Postcode <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-map-marker"></i></span>
                        <input type="text" name="postal" id="postal" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Code postal' doit être renseigné." />
                        <div class="validation"></div>
                    </div>



                </div>

                <div class="rightcontact">

                    <div class="form-group">
                        <p>City <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-building-o"></i></span>
                        <input type="text" name="ville" id="ville" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Ville' doit être renseigné." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Phone number <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-phone"></i></span>
                        <input type="text" name="phone" id="phone" data-rule="maxlen:10" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Téléphone' doit être renseigné. Minimum 10 chiffres" />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Function <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-info"></i></span>
                        <input type="text" name="fonction" id="fonction" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Fonction' doit être renseigné." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Subject <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-comment-o"></i></span>
                        <input type="text" name="sujet" id="sujet" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Sujet' doit être renseigné." />
                        <div class="validation"></div>
                    </div>

                    <div class="form-group">
                        <p>Message <span>*</span></p>
                        <span class="icon-case"><i class="fa fa-comments-o"></i></span>
                        <textarea name="message" rows="14" data-rule="required" data-msg="Vérifiez votre saisie sur les champs : Le champ 'Message' doit être renseigné."></textarea>
                        <div class="validation"></div>
                    </div>
                </div>
            </div>
            <button type="submit" class="bouton-contact">Submit</button>

        </form>	
        </div>
	 

  
</body>
</html>

</asp:Content>