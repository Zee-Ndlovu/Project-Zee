<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NonkosiBoutique._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="container" style = "background-image:url('image/cas.jpg');width:100%;height: 400px">
            <h1 style="color:white; margin-top: 50px; margin-left: 50px;font-size: 70px;">The Biggest.</h1>
            <h1 style="color:white; margin-left: 50px;font-size: 70px;">Deals. Ever</h1>
            <p style="color:white; margin-left: 50px; font-size:20px">Special Deals for christmas...</p>
            <asp:LinkButton ID="Booksp" runat="server" style='font-size:18px;color:white; background-color:transparent; border: 2px solid white;  padding: 10px 50px; margin-left: 50px;text-align: center; ' OnClick="Booksp_Click">Book Now</asp:LinkButton>
        </div>
    <br />
    <h2 style="text-align: center;font-family:cursive"><span>Categories</span></h2>

    <div class="row" >
        <div class="col-md-4" style="background-color:black;" onclick="location.href='#';">
            <h2 style="color:white; margin-top: 20px; margin-left: 20px">Wedding Gowns</h2>
            <p style="color:white; margin-left: 30px; font-size:20px">Fell more beautifull and comfortable at you wedding</p>
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" style='font-size:18px;color:white; background-color:transparent;  padding: 10px 50px;text-align: center; '>Book Now</asp:LinkButton>
            <img src="image/wedding.jpg" alt="wedding gown" width="300" height="400" style="vertical-align:top;float:right">
            
        </div>
        <div class="col-md-4" style="background-color:white">
            <h2 style="margin-top: 20px; margin-left: 20px">Suit</h2>
            <p style="margin-left: 30px; font-size:20px">Find your style</p>
            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click" style='font-size:18px;color:black; background-color:transparent;  padding: 10px 50px;text-align: center; '>Book Now</asp:LinkButton>
            <img src="image/suit.jpg" alt="suit" width="300" height="400" style="vertical-align:top;float:right">
            
        </div>
        <div class="col-md-4" style="background-color:black">
            <h2 style="color:white; margin-top: 20px; margin-left: 20px">Dress</h2>
            <p style="color:white; margin-left: 30px; font-size:20px">Fell more beautifull and comfortable at you wedding</p>
            <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click" style='font-size:18px;color:white; background-color:transparent;  padding: 10px 50px;text-align: center; '>Book Now</asp:LinkButton>
            <img src="image/dress.jpg" alt="tradition" width="300" height="400" style="vertical-align:top;float:right">
            
        </div>
    </div>
    <br />
    <hr />

    <div style="display: inline-block">
        <div style="display: inline-block;  margin-right: 2cm;">
            <img src="image/21.JPG" alt="Girl in a jacket" width="150" height="200">
            <p>
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">See more...</asp:LinkButton>
            </p>
        </div>
        <div style="display: inline-block;  margin-right: 2cm;">
            <img src="image/20.JPG" alt="Girl in a jacket" width="150" height="200">
            <p>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">See more...</asp:LinkButton>
            </p>
        </div>
        <div style="display: inline-block; margin-right: 2cm;">
            <img src="image/14.JPG" alt="Girl in a jacket" width="150" height="200">
            <p>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">See more...</asp:LinkButton>
            </p>
        </div>
        <div style="display: inline-block; margin-right: 2cm;">
            <img src="image/decor.PNG" alt="Girl in a jacket" width="150" height="200">
            <p>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">See more...</asp:LinkButton>
            </p>
        </div>
    </div>

</asp:Content>
