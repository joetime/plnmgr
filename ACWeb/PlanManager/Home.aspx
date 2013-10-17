<%@ Page Title="" Language="C#" MasterPageFile="~/PlanManager/PlanManager.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ACWeb.PlanManager.Home" %>

<asp:Content ContentPlaceHolderID="CssPlaceHolder" runat="server">
    <style>
        [data-sort="string"]:hover,[data-sort="float"]:hover,[data-sort="int"]:hover {
            text-decoration: underline;
            cursor: pointer;    
        }
        #planDetails {
            padding-bottom: 100px;
        }
        .hideme {
            display: none;
        }
        .tab-pane {
            padding-top: 10px;
           
        }
        .container-content {
            padding: 0px 4%;   
        }
        #column-nav {
            padding-right: 5%;
        }
        #column-main {
            padding-top: 20px;
            padding-left: 4%;
            border-left: 2px solid #eee;
            min-height: 600px;
            /*box-shadow: -3px 0px -3px #eee;*/
        }
        tfoot td {
            background-color: #f0f6f6; }
        .tr-clickable, clickable {
            cursor: pointer;
        }
        .navbar {
            margin-bottom: 5px;
        }
        .toast-top-right {
          top: 62px;
        }
        #searchModal .modal-dialog {
            width: 70%;
        }
        .text-focus {
            color: #004444;
        }
        
        h3 button.btn.btn-sm.btn-default {
            padding: 0px 5px;
        }

        #collapseButton {
            position: fixed;
            top:80px;
            left:-10px;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div id="debugPanel"></div>
    
    <!-- ko template: { name: 'searchModalTemplate' } -->
    <!-- /ko -->

    <div class="container-content">

        <button id="collapseButton" class="btn btn-sm btn-default hidden-print" 
            data-bind="click: toggleMenu">&nbsp;&laquo;</button>
        <div class="row">
            
            <!-- nav panel 
                -->
            <div id="column-nav" class="col-md-3 hidden-print">

                <h2 data-bind="text: pageTitle, click: selectFirstPlan"></h2>
                
                <ul id="" class="nav nav-pills nav-stacked">
                    <li>&nbsp;</li>
                    
                    <!-- ko foreach: allPlans -->
                    <li data-bind="css: { active: uiSelected }">
                    <a href="#" data-bind="text: name, click: $root.selectPlan"></a></li>
                    <!-- /ko -->
                    
                    <li class="nav-divider"></li>
                    <li><br />
                         <button class="btn btn-success btn-sm" data-bind="click: newPlan">New Plan...</button> </li>
                </ul>
            </div>
            <div id="column-main" class="col-md-9">
                
                <div>
                <!-- ko template: { if: selectedPlan, name: 'planTabsTemplate', data: selectedPlan } -->
                <!-- /ko -->
                </div>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ContentPlaceHolderID="AsidePlaceHolder" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="JavascriptPlaceHolder" runat="server">
    
    <script src="../Scripts/planmanager.testdata.js"></script>
    <script src="../Scripts/planmanager.view.js"></script>
    <script src="../Scripts/libs/stupidtable.min.js"></script>

    <script>
        $(document).ready(function () {
            
            ko.applyBindings(myPageModel);

            myPageModel.selectFirstPlan();
        });
    </script>

</asp:Content>
