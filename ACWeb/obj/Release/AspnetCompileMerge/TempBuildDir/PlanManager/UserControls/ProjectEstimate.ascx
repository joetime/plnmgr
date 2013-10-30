<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectEstimate.ascx.cs" Inherits="ACWeb.PlanManager.ProjectEstimate" %>

<script id="projectEstimate" type="text/template">

    <!-- Title, Progress Bar and Form
    -->
    <div>

        <h3 data-bind="text: 'Project Total Estimate: $' + projectTotalFormatted()"></h3>

        <!-- Progress Bar
        -->
        <div class="row">
            <div class="progress progress-fat bg-color-4">
                <div class="progress-bar bg-color-1"
                    data-bind="attr: { style: 'width: ' + numeral(baseCost() / projectTotal()).format('00%') }">
                </div>
                <div class="progress-bar bg-color-2"
                    data-bind="attr: { style: 'width: ' + numeral(baseCost() * baseContingency() / 100 / projectTotal()).format('00%') }">
                </div>
                <div class="progress-bar bg-color-3"
                    data-bind="attr: { style: 'width: ' + numeral(markupsTotal() / projectTotal()).format('00%') }">
                </div>
            </div>
        </div>

        <br />

        <!-- Top Boxes
-->
        <div class="row">

            <form class="grid-form">

                <div data-row-span="10">
                    <div data-field-span="3"
                        class="estimate-help"
                        data-help-text="Base Cost: This is the estimate from EMG, or an altered version thereof.">
                        <label class="label bg-color-1">Base Cost ($)</label>
                        <!--<span class="label bg-color-1">&nbsp;</span>-->
                        <input type="number"
                            data-bind="value: baseCost" />
                    </div>
                    <div data-field-span="3"
                        data-help-text="Markups Subtotal: The total of the chosen Markups below.">
                        <label class="label bg-color-3">Markups Subtotal ($)</label>
                        <input type="text" disabled
                            data-bind="value: numeral(markupsTotal()).format('0,0')" />
                    </div>
                    <div data-field-span="3"
                        data-help-text="Total Project Estimate: The Base Cost plus the Markups Subotal.">
                        <label>Total Project Estimate ($)</label>
                        <input type="text" disabled
                            data-bind="value: numeral(projectSubtotal()).format('0,0')" />
                    </div>
                </div>

            </form>

        </div>

        <div class="">
            <br />
            <span class="label label-info">Info</span>&nbsp;
            <span id="estimateHelp" class="text-info">Hover on a box for explanation.</span>
        </div>

    </div>

    <br />

    <!-- Markups form 
-->
    <div>
        <h3>Markups</h3>

        <form class="grid-form">
            <!-- Header -->
            <div data-row-span="10">
                <div data-field-span="4">
                    <label>Markup</label>
                </div>
                <div data-field-span="2">
                    <label>Category</label>
                </div>
                <div data-field-span="1">
                    <label>Value</label>
                </div>
                <div data-field-span="1">
                    <label></label>
                </div>
                <div data-field-span="2">
                    <label>Total</label>
                </div>
            </div>
            <!-- ko foreach: markupTemplates -->
            <div data-row-span="10" data-bind="css: { success: isSelected }">
                <div data-field-span="4">
                    <label></label>
                    <label>
                        <input type="checkbox" data-bind="checked: isSelected" />
                        &nbsp;&nbsp;
                        <span data-bind="text: name"></span>
                    </label>
                </div>
                <div data-field-span="2">
                    <label></label>
                    <span data-bind="text: category"></span>
                </div>
                <div data-field-span="1">
                    <label></label>
                    <input type="text" class="text-right"
                        data-bind="css: { hideme: !isSelected() }, value: defaultValue" />
                </div>
                <div data-field-span="1">
                    <label></label>
                    <select data-bind="css: { hideme: !isSelected() }, value: type">
                        <option>$</option>
                        <option>%</option>
                    </select>
                </div>
                <div data-field-span="2">
                    <label></label>
                    <input type="text" class="text-right" disabled
                        data-bind="value: calculatedValue($parent.baseSubtotal())" />
                </div>
            </div>
            <!-- /ko -->
        </form>

        <br />
        <br />
        <br />
    </div>
</script>
