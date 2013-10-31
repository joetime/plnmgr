<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectTabs.ascx.cs" Inherits="ACWeb.PlanManager.ProjectTabs" %>

<script id="projectTabsTemplate" type="text/template">

    <!-- 
        Button to return
        Project Name
        -->
    <h3>
        <button class="btn btn-sm btn-default hidden-print" data-bind="click: $root.deselectProject">
            &larr;All Projects</button>
        <span data-bind="text: name"></span>
    </h3>

    <!-- 
        Save Button
        Action Button (Dropdown)
        -->
    <div class="pull-right hidden-print">
        
        <!--
        <button type="button" class="btn btn-primary btn-sm" 
            data-bind="visible: dirtyFlag.isDirty, click: $root.saveProject">
            Save Project</button>
        -->
        <!-- Action Button -->
        <div class="btn-group">
            <button type="button" class="btn btn-warning btn-sm dropdown-toggle" data-toggle="dropdown">
                Project Actions <span class="caret"></span>
            </button>
            <!-- Action Dropdown -->
            <ul class="dropdown-menu" role="menu">
                <li><a href="#" data-bind="click: $root.notImplemented">Move Project</a></li>
                <li><a href="#" data-bind="click: $root.notImplemented">Copy Project</a></li>
                <li><a href="#" data-bind="click: $root.notImplemented">Lock Project</a></li>
                <li><a href="#" data-bind="click: $root.notImplemented">Cancel Project</a></li>
                <li><a href="#" data-bind="click: $root.notImplemented">Delete Project</a></li>
                <li class="divider"></li>
                <li><a href="#" data-bind="click: $root.clearExpenditures">Clear Expenditures</a></li>
            </ul>
        </div>

    </div>

    <!-- 
        Tabs - Details, Attachments, Estimate
            Breakouts, Expenditures 
        -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#projectDetails" data-toggle="tab">Details</a></li>
        <li><a href="#attachments" data-toggle="tab">Attachments</a></li>
        <li><a href="#estimate" data-toggle="tab">Estimate</a></li>
        <li><a href="#breakouts" data-toggle="tab">Breakouts</a></li>
        <li><a href="#expenditures" data-toggle="tab">Expenditures</a></li>
    </ul>

    <!-- 
        Content 
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
