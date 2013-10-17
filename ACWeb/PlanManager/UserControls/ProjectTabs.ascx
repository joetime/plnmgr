<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectTabs.ascx.cs" Inherits="ACWeb.PlanManager.ProjectTabs" %>

<script id="projectTabsTemplate" type="text/template">

    <h3>
        <button class="btn btn-sm btn-default hidden-print" data-bind="click: $root.deselectProject">&#935;</button>
        <span data-bind="text: name"></span></h3>

    <!-- Buttons 
-->
    <div class="pull-right hidden-print">

        <!-- Action Button -->
        <div class="btn-group">
            <button type="button" class="btn btn-warning btn-sm dropdown-toggle" data-toggle="dropdown">
                Project Actions <span class="caret"></span>
            </button>
            <!-- Action Dropdown -->
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">Move Project</a></li>
                <li><a href="#">Copy Project</a></li>
                <li><a href="#">Lock Project</a></li>
                <li><a href="#">Cancel Project</a></li>
                <li><a href="#">Delete Project</a></li>

            </ul>
        </div>

        <!-- More Buttons 
-->
        <button class="btn btn-sm btn-primary puxll-right"
            data-bind="visible: uiNew || uiDirty, click: $root.saveProject">
            Save</button>
    </div>

    <!-- Tabs 
-->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#projectDetails" data-toggle="tab">Details</a></li>
        <li><a href="#attachments" data-toggle="tab">Attachments</a></li>
        <li><a href="#estimate" data-toggle="tab">Estimate</a></li>
        <li><a href="#breakouts" data-toggle="tab">Breakouts</a></li>
        <li><a href="#expenditures" data-toggle="tab">Expenditures</a></li>
    </ul>

    <!-- Content 
-->
    <div class="tab-content">
        <div class="tab-pane active" id="projectDetails">
            <!-- ko template: { name: 'projectForm' } -->
            <!-- /ko -->
        </div>
        <div class="tab-pane" id="attachments">
            <!-- ko template: { name: 'projectAttachments' } -->
            <!-- /ko -->
        </div>
        <div class="tab-pane" id="estimate">

            <!-- ko template: { name: 'projectEstimate' } -->
            <!-- /ko -->
        </div>
        <div class="tab-pane" id="breakouts">
            <!-- ko template: { name: 'projectBreakouts' } -->
            <!-- /ko -->
        </div>
        <div class="tab-pane" id="expenditures">
            <!-- ko template: { name: 'projectExpenditures' } -->
            <!-- /ko -->
        </div>

    </div>

</script>
