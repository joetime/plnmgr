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
                    <!--
<div data-field-span="1"
data-help-text="Project Contingency: A percentage added to the Project Subtotal to determine the Project Total Estimate.">
<label class="label bg-color-4">Project Contingency (%)</label>
<input type="number"
data-bind="value: projectContingency" />
</div>-->
                    <!--
<div data-field-span="1"
class="estimate-help"
data-help-text="Base Contingency: This percentage is tacked on to the base cost to determine the Base w/ Contingency.">
<label class="label bg-color-2">Base Contingency (%)</label>
<input type="number"
data-bind="value: baseContingency" />
</div>
<div data-field-span="1"
data-help-text="Base w/ Contingency: The Base Cost with an added Base Contingency percentage.">
<label>Base w/ Contingency ($)</label>
<input type="text" disabled
data-bind="value: numeral(baseSubtotal()).format('0,0')" />
</div>
-->
                </div>


                <!--<div data-field-span="1"
data-help-text="Markups Subtotal: The total of the chosen Markups below.">
<label class="label bg-color-3">Markups Subtotal ($)</label>
<input type="text"
data-bind="value: numeral(markupsTotal()).format('0,0')" />
</div>
<div data-field-span="1"
data-help-text="Project Subtotal: The Base w/ Contingency plus the Markups Subotal.">
<label>Project Subtotal ($)</label>
<input type="text" disabled
data-bind="value: numeral(projectSubtotal()).format('0,0')" />
</div>
-->


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
            <div data-row-span="10" data-bind="css: { success: uiChecked }">
                <div data-field-span="4">
                    <label></label>
                    <label>
                        <input type="checkbox" data-bind="checked: uiChecked" />
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
                        data-bind="css: { hideme: !uiChecked() }, value: defaultValue" />
                </div>
                <div data-field-span="1">
                    <label></label>
                    <select data-bind="css: { hideme: !uiChecked() }, value: type">
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

        <!-- old table 
<div class="row">
<div class="col-md-12">
<table class="table table-hover table-sort">

<thead>
<tr>
<th data-sort="string">
<!--&#10003-- >
</th>
<th data-sort="string">Category
</th>
<th data-sort="string">Type
</th>
<th colspan="2">Value
</th>
<th class="text-right">Total
</th>
</tr>
</thead>
                        
<tbody data-bind="foreach: markupTemplates">
<tr data-bind="css: { success: uiChecked, 'text-muted': !uiChecked() }">
<td>
<!--  data-bind="attr: { 'data-sort-value': uiChecked() ? 0 : 1 }" -- >
<input type="checkbox" data-bind="checked: uiChecked" /></td>
<td data-bind="text: category"></td>
<td data-bind="text: name"></td>
<td>
<input class="form-control input-sm text-right"
data-bind="css: { hideme: !uiChecked() }, value: defaultValue">
</td>
<td>
<select class="form-control input-sm"
data-bind="css: { hideme: !uiChecked() }, value: type">
<option>$</option>
<option>%</option>
</select></td>
<td class="text-right">
<span data-bind="css: { hideme: !uiChecked() }, text: calculatedValue($parent.baseSubtotal())"></span>
</td>

</tr>
</tbody>

</table>
</div>

</div>
-->

        <br />
        <br />
        <br />
    </div>
</script>
