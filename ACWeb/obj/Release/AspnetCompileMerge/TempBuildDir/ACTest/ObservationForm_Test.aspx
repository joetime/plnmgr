<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="ObservationForm_Test.aspx.cs" Inherits="ACWeb.ACTest.ObservationForm_Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Css" runat="server">
    <style>
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeft" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">

    <div class="container">
        
        <!--Observation Form  
            -->
        <div class="row">
            
            <div class="col-md-8 col-md-offset-2">

                <!-- Buttons 
                    -->
                <div class="pull-right">
                    <button class=" btn btn-primary">Save</button>
                    <button class=" btn btn-warning">Actions <span class="caret"></span></button>
                </div>

                <h2 data-bind="text: name"></h2>

                <div class="grid-form" data-bind="with: observation">
                    
                    <!-- Site and Id -->
                    <div data-row-span="5">
                        <div data-field-span="4">
                            <label>Site</label>
                            <input type="text" data-bind="value: site" />

                        </div>
                        <div data-field-span="1">
                            <label>Identifier</label>
                            <input type="text" data-bind="value: identifier" />
                        </div>
                    </div>

                    <!-- Component, Action -->
                    <div data-row-span="5">
                        <div data-field-span="3">
                            <label>Component</label>
                            <input type="text" data-bind="value: component" />
                        </div>
                        <div data-field-span="2">
                            <label>Action</label>
                            <select data-bind="value: action, options: $root.actionOptions"></select>
                        </div>
                    </div>

                    <!-- Condition, Category -->
                    <div data-row-span="5">
                        <div data-field-span="3">
                            <label>Condition</label>
                            <select data-bind="value: condition, options: $root.conditionOptions">
                                <option>TEST</option>
                            </select>
                        </div>
                        <div data-field-span="2">
                            <label>Category</label>
                            <select data-bind="value: category, options: $root.categoryOptions"></select>
                        </div>
                    </div>

                    <!-- Cost Row: Quantity, Unit Cost, Subtotal -->
                    <div data-row-span="8">
                        <div data-field-span="2">
                            <label>Quantity</label>
                            <input type="number" data-bind="value: quantity" />
                        </div>
                        <div data-field-span="2">
                            <label>Unit Cost</label>
                            <input type="number" data-bind="value: unitCost" />
                        </div>
                        <div data-field-span="4" class="calculated">
                            <label>Subtotal</label>
                            <input type="text"
                                data-bind="value: $root.subtotal" />
                        </div>
                    </div>
                    
                    <!-- Age Row: Install Year, Estimated Age, Lifespan, Remaining Life -->
                    <div data-row-span="8">
                        <div data-field-span="2">
                            <label>Install Year</label>
                            <input type="number" data-bind="value: installYear" />
                        </div>
                        <div data-field-span="2">
                            <label>Estimated Age</label>
                            <input type="number" data-bind="value: estimatedAge" />
                        </div>
                        <div data-field-span="2">
                            <label>Lifespan</label>
                            <input type="text" data-bind="value: lifespan" />
                        </div>
                        <div data-field-span="2" class="calculated">
                            <label>Remaining Life</label>
                            <input type="text" data-bind="value: $root.rul" />
                        </div>
                    </div>
                    
                    <!-- Inventory Info: Make, Model, Serial, Barcode -->
                    <div data-row-span="8">
                        <div data-field-span="2">
                            <label>Make</label>
                            <input type="text" data-bind="value: make" />
                        </div>
                        <div data-field-span="2">
                            <label>Model</label>
                            <input type="text" data-bind="value: model" />
                        </div>
                        <div data-field-span="2">
                            <label>Serial #</label>
                            <input type="text" data-bind="value: serial" />
                        </div>
                        <div data-field-span="2">
                            <label>Barcode</label>
                            <input type="text" data-bind="value: barcode" />
                        </div>
                    </div>

                </div>

            </div>

        </div>
    
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Javascript" runat="server">
    
    <script src="../Scripts/libs/odometer.min.js"></script>
    
    <script>

        var view = function () {
            var vw = this;

            vw.name = 'Observation Test';
            
            vw.observation = ko.observable({
                site: 'Hunt Valley Homes',
                identifier: 'MD-0001',
                component: 'Windows',
                action: 'Replace',
                condition: 'Good',
                category: 'Reserve',
                make: 'Pella',
                model: 'Deluxe',
                serial: 'A445-998-2294595',
                barcode: '1303564',
                quantity: ko.observable(13),
                unitCost: ko.observable(535.87),
                installYear: ko.observable(2009),
                estimatedAge: ko.observable(7),
                lifespan: ko.observable(15)
                });

            vw.subtotal = ko.computed(function () {
                var val = parseFloat(vw.observation().unitCost())
                    * parseFloat(vw.observation().quantity());
                return numeral(val).format('0,0.00');
            });

            vw.rul = ko.computed(function () {
                var val = parseInt(vw.observation().lifespan()) -
                    (2013 - parseInt(vw.observation().installYear()))
                return numeral(val).format('00');
            })

            vw.conditionOptions = [
                '',
                'New',
                'Good',
                'Fair',
                'Poor'
            ];

            vw.categoryOptions = [
                '',
                'Reserve',
                'Accessibility',
                'Energy',
                'Life Safety',
                'Code Compliance',
                'Modernization',
            ];
            vw.actionOptions = [
                '',
                'Replace',
                'Repair',
                'Alter',
                'Demolish',
                'Test'
            ];
        }

        $(document).ready(function () {
            ko.applyBindings(new view());
        });
    </script>
</asp:Content>
