<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="HistoryTest.aspx.cs" Inherits="ACWeb.ACTest.HistoryTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 data-bind="text: title">Hello World</h1>
                <h2 data-bind="text: subtitle">Hello World</h2>
                <a data-bind="click: goSomewhere" class="btn">Go Somewhere!</a>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Javascript" runat="server">

    <script>

        var vm = myViewModel();

        function myViewModel () {
            var md = this;
            
            md.title = ko.observable('My first try');
            md.subtitle = ko.observable('This is a test.');

            md.goSomewhere = function (e) {

                //console.log('goSomewhere');

                history.pushState({ subtitle: md.subtitle() },
                    'pastState',
                    md.subtitle());

                md.subtitle('Somewhere new!');

                //e.preventDefault();
            };

            //md.setState = function (s) {
            //    md.title(s.title);
            //    md.subtitle(s.subtitle);
            //};
            
            //history.replaceState({ title: md.title(), subtitle: md.subtitle() },
            //    '',
            //    '');
        }

        window.addEventListener("popstate", function (e) {

            //console.log('popstate, e.state=');
            //console.log(e.state);

            //var newVm = myViewModel();
            //console.log()

            //if (e.state) {
            //    newVm.setState(e.state);
            //    ko.applyBindings(newVm);
            //}

        });

        ko.applyBindings(vm);
    
        </script>


</asp:Content>
