<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Site_Master_Test.aspx.cs" Inherits="ACWeb.ACTest.Site_Master_Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Css" runat="server">
    <link href="../Content/assetcalc.test.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
    <div class="container-fluid test-pad-top-10">
        
        <div class="row-fluid">
            <div class="span2 test-bg-blue">
                <h2>h2.span2</h2>
                <div class="well">test</div>
            </div>
            <div class="span10 xtest-bg-green">
                <h1>AssetCALC 4</h1>
                <h2>h2.span10</h2>
                <div class="well">test</div>
            </div>
        </div>

    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="Javascript" runat="server">
    <script src="../Scripts/assetcalc.test.js"></script>
</asp:Content>