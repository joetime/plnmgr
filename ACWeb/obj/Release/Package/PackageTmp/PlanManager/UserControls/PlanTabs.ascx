<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlanTabs.ascx.cs" Inherits="ACWeb.PlanManager.PlanTabs" %>

<script id="planTabsTemplate" type="text/template">

    <h2 data-bind="text: name, click: $root.deselectProject"></h2>

    <!-- buttons 
-->
    <div class="pull-right hidden-print">

        <div class="btn-group" data-bind="visible: !$root.selectedProject()">
            <button type="button" class="btn btn-warning btn-sm dropdown-toggle" data-toggle="dropdown">
                Plan Actions <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">Copy Plan</a></li>
                <li><a href="#">Lock Plan</a></li>
                <li><a href="#">Cancel Plan</a></li>
                <li><a href="#">Delete Plan</a></li>
            </ul>
        </div>
        <button class="btn btn-sm btn-primary"
            data-bind="visible: uiNew() || uiDirty(), click: $root.savePlan">
            Save</button>
    </div>

    <!-- when a project is selected,
tabs appear here 
-->
    <div class="">
        <!-- ko template: { if: $root.selectedProject, name: 'projectTabsTemplate', data: $root.selectedProject } -->
        <!-- /ko -->
    </div>

    <!-- plan tabs 
-->
    <div data-bind="visible: !($root.selectedProject())">

        <!-- tabs 
-->
        <ul id="planTabs" class="nav nav-tabs">
            <li>
                <a href="#planDashboard" data-toggle="tab">Dashboard</a></li>
            <li><a href="#planProjects" data-toggle="tab">Projects</a></li>
            <li class="active"><a id="planDetailsTabTrigger" href="#planDetails" data-toggle="tab">Details</a></li>
        </ul>

        <!-- content 
-->
        <div class="tab-content">

            <div class="tab-pane" id="planDashboard">

                <h3 data-bind="text: 'Total Estimate: ' + numeral(planTotal()).format('$ 0,0')"></h3>
                <hr />


                <div>
                    <h4>Expenditures: 
                        <span data-bind="text: numeral(planExpendituresTotal()).format('$ 0,0')"></span>
                        (<span data-bind="text: numeral(planExpendituresTotal() / planTotal()).format('00%')"></span>)
                    </h4>
                    <div class="progress progress-fat">
                        <div class="progress-bar progress-bar-success" role="progressbar"
                            data-bind=" attr: { style: 'background-color: #006666; width:' + numeral(planExpendituresTotal() / planTotal()).format('00%') }">
                        </div>
                    </div>
                </div>
                <div data-bind="foreach: breakouts">

                    <h4><span data-bind="text: name"></span></h4>

                    <div class="progress progress-fat" data-bind="foreach: vals">
                        <div class="progress-bar progress-bar-success"
                            data-bind="visible: parseInt(value) > 10, attr: {
    style:
    'width:' + numeral(value / $parents[1].planTotal()).format('00%') + '; ' +
    'background-color:' + color
}">
                            <span class="label label-default"
                                data-bind="text: name + ' ' + numeral(value).format('$0.0a'), attr: { style: 'background-color:' + color }"></span>
                        </div>
                    </div>

                </div>



                <!-- table with some dollar figures -->
                <table class="table table-bordered table-hover">
                    <tr>
                        <td>Plan Total Estimate</td>
                        <td class="text-right" data-bind="text: numeral(planTotal()).format('$ 0,0')"></td>
                    </tr>
                    <tr>
                        <td>Base Subtotal</td>
                        <td class="text-right" data-bind="text: numeral(planBaseSubtotal()).format('0,0')"></td>
                        <td class="text-right" data-bind="text: numeral(planBaseSubtotal() / planTotal()).format('00%')"></td>
                    </tr>
                    <tr>
                        <td>Markup Subtotal</td>
                        <td class="text-right" data-bind="text: numeral(planMarkupsTotal()).format('0,0')"></td>
                        <td class="text-right" data-bind="text: numeral(planMarkupsTotal() / planTotal()).format('00%')"></td>
                    </tr>
                </table>

            </div>

            <div class="tab-pane" id="planProjects">
                <div class="row">
                    <div class="col-md-6">
                        <h3 data-bind="text: 'Plan Total Estimate: $ ' + numeral(planTotal()).format('0,0')"></h3>
                    </div>
                    <div class="well-sm pull-right hidden-print">

                        <div class="btn-group">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                Add Project <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a data-bind="click: $root.addProject"
                                    href="#">Empty Project</a></li>
                                <li><a data-bind="click: $root.openSearch" href="#searchModal">AssetCALC Cost</a></li>

                            </ul>
                        </div>

                    </div>
                </div>

                <table class="table table-hover table-sort">
                    <thead>
                        <tr>
                            <th data-sort="string" class="text-muted">Id</th>
                            <th data-sort="string">Projects</th>
                            <th data-sort="string">Status</th>
                            <th data-sort="float" class="text-right">Estimate</th>
                            <th data-sort="float" class="text-right">Markups</th>

                            <th data-sort="float" class="text-right">Expenditures</th>
                        </tr>
                    </thead>
                    <tbody data-bind="foreach: projects">
                        <tr class="tr-clickable" data-bind="click: $root.selectProject">
                            <td class="text-muted" data-bind="text: identifier"></td>
                            <td class="text-focus" data-bind="text: name"></td>
                            <td data-bind="text: status"></td>
                            <td class="text-right" data-bind="text: projectTotalFormatted"></td>
                            <td class="text-right" data-bind="text: numeral(markupsTotal()).format('0,0')"></td>
                            <td class="text-right" data-bind="text: numeral(expendituresTotal()).format('0,0')"></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="text-right" data-bind="text: numeral(planTotal()).format('0,0')"></td>
                            <td class="text-right" data-bind="text: numeral(planMarkupsTotal()).format('0,0')"></td>
                            <td class="text-right" data-bind="text: numeral(planExpendituresTotal()).format('0,0')"></td>
                        </tr>
                    </tfoot>
                </table>

            </div>

            <div id="planDetails" class="tab-pane active">
                <!-- ko template: { name: 'planForm', data: $root.selectedPlan } -->
                <!-- /ko -->
            </div>
        </div>

    </div>

</script>

