<%@ Page Title="" Language="C#" MasterPageFile="~/ProjectManager/ProjectManager.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ACWeb.ProjectManager.HomePage" %>

<asp:Content ID="CssContent" ContentPlaceHolderID="Css" runat="server">
   
</asp:Content>

<asp:Content ID="LeftPanel" ContentPlaceHolderID="ContentLeft" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
        Recent Activity</div>
        <div class="panel-body">
        <ul class="list-unstyled">
            <li class="activity">
                <span class="activity-time">today</span>
                <span class="activity-user">jscala</span>
                added 4 tasks to <span class="activity-project">Rec Building Repurpose</span>
            </li>
            <li class="activity">
                <span class="activity-time">yesterday</span>
                <span class="activity-user">hsmith</span>
                commented on 
                        <span class="activity-project">Rec Building Repurpose</span> </li>
            <li class="activity">
                <span class="activity-time">last week</span>
                <span class="activity-user">twhite</span>
                deleted 1 task from 
                        <span class="activity-project">Site Work</span> </li>
            <li class="activity">
                <span class="activity-time">last week</span>
                <span class="activity-user">jscala</span>
                changed status of 
                        <span class="activity-project">Library Maintenance</span> </li>
        </ul>
        <span class="muted">see all activity</span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="RightPanel" ContentPlaceHolderID="ContentRight" runat="server">

    <div class="tab-content">

        <div id="activeProjectsView" class="tab-pane active in">

            <div class="toolbar pull-right">
                <a class="btn btn-default" rel="add" data-bind="click: $root.createNewProject">New Project...</a>
            </div>

            <h3>Active Projects</h3>
            <!-- ko template: { name: 'projectsTableTemplate', data: $root.projects, afterRender: $root.afterTemplateBinding  } -->
            <!-- /ko -->
        </div>

        <div id="activeProjectView" class="tab-pane" data-bind="with: activeProject">

            <div class="toolbar pull-right">
                <!--
            <!-- ko template: { name: 'actionsToolbarTemplate', data: $root.activeProject, afterRender: $root.afterTemplateBinding } -->
                <!-- /ko -->
                <button class="btn btn-success" data-bind="click: addBlankTask">
                    <i class="icon-plus icon-white"></i>Add blank task 
                </button>
            </div>

            <h3 data-bind="text: name"></h3>

            <!-- Active Project menu tabs 
            -->
            <ul id="activeProjectMenu" class="nav nav-tabs">

                <li class="active"><a href="#projectSummary" data-toggle="tab">Summary</a></li>
                <li><a href="#projectTasks" data-toggle="tab">Tasks (<span data-bind="text: $root.activeProject().tasks.length"></span>)</a></li>
                <li><a href="#projectPhotosAndDocuments" data-toggle="tab">Photos & Documents</a></li>
                <li><a href="#projectActivity" data-toggle="tab">Activity</a></li>
                <li id="#searchAndAddMenuItem"><a href="#projectSearchAndAdd" data-toggle="tab">Search &amp; Add</a></li>
                <li class="tab-actions"><a class="" href="#projectActions" data-toggle="tab">Actions</a></li>
            </ul>

            <!-- Content tabs for the active Project
                -->
            <div class="tab-content" id="projectContent">

                <!-- Project Summary 
                    -->
                <div id="projectSummary" class="tab-pane active row-fluid">
                    <div class="span6">
                        <input id="projectNameTextBox" class="h3 input-block-level input-quiet" data-bind="value: name" />
                        <textarea class="project-description input-block-level input-quiet"
                            placeholder="Project description"
                            data-bind="value: description"></textarea>
                        <dl>
                            <dt>Status</dt>
                            <dd>
                                <select class="input-quiet" data-bind="value: status, options: [status]"></select></dd>
                            <dt>Percent Complete</dt>
                            <dd data-bind="text: percentComplete">In Progress</dd>
                            <dt>Budget Breakout</dt>
                            <dd>
                                <canvas id="budgetBreakoutCanvas"></canvas>
                                <table class="table table-condensed">
                                    <tbody data-bind="foreach: budgetBreakout">
                                        <tr>
                                            <td data-bind="text: label"></td>
                                            <td class="money" data-bind="text: amt"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </dd>
                        </dl>
                    </div>
                    <div class="span6">
                        <a href="#">
                            <img class="thumbnail" data-bind="attr: { src: defaultPhoto != '' ? defaultPhoto : '../content/images/click-to-add-photo.png' }" />
                        </a>

                    </div>
                </div>

                <!-- Task list 
                    -->
                <div id="projectTasks" class="tab-pane row-fluid">
                    <table class="table table-hover table-sortable" id="tasksTable">
                        <thead>
                            <tr>
                                <th>
                                    <!-- for status icon -->
                                </th>
                                <th data-sort="number" class="th-center th-muted">ID</th>
                                <th data-sort="string">Task</th>
                                <th data-sort="string">Priority</th>
                                <th>Status</th>
                                <th class="th-right">Est. Cost</th>
                                <th class="th-right">Actual Cost</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: tasks">
                            <tr class="tr-clickable" data-bind="click: $root.taskRowClick">
                                <td><i class="icon-ok" data-bind="visible: status() == 'Complete'"></i></td>
                                <td class="td-center muted" data-bind="text: id"></td>
                                <td class="td-focus" data-bind="text: name"></td>
                                <td class="" data-bind="text: priority"></td>
                                <td class="" data-bind="text: status"></td>
                                <td class="td-right money" data-bind="text: estCost"></td>
                                <td class="td-right money" data-bind="text: actualCost"></td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- ko template: { if: $root.activeTask, name: 'taskDetailsTemplate', data: $root.activeTask } -->
                    <!-- /ko -->

                </div>

                <!-- Photos and docs 
                    -->
                <div id="projectPhotosAndDocuments" class="tab-pane row-fluid">
                    <div class="row-fluid">
                        <h4>Photos</h4>

                        <img class="thumbnail span3" data-bind="attr: { src: defaultPhoto }" />
                    </div>
                    <div class="row-fluid">
                        <h4>Documents</h4>
                        <table class="table table-condensed table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody data-bind="foreach: documents">
                                <tr>
                                    <td><i class="icon-file"></i></td>
                                    <td data-bind="text: name" class="td-focus"></td>
                                    <td data-bind="text: date"></td>
                                    <td data-bind="text: user"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Activity 
                    -->
                <div id="projectActivity" class="tab-pane row-fluid"></div>

                <!-- Search & Add
                    -->
                <div id="projectSearchAndAdd" class="tab-pane">

                    <div class="row-fluid">

                        <div class=" offset1 span4">
                            <label>Sites</label>
                            <select class="chzn-select" multiple="multiple" data-placeholder=" - All Sites - ">
                                <option>Library</option>
                                <option>Firehouse</option>
                                <option>Town Hall</option>
                                <option>Rec Center</option>
                            </select>

                            <label>Priorities</label>
                            <select class="chzn-select" multiple="multiple" data-placeholder=" - All Priorities - ">
                                <option>1-Highest</option>
                                <option>2-Medium</option>
                                <option>3-Lowest</option>
                            </select>
                            <label>Keywords</label>
                            <input type="search" class="input input-block-level" />
                            <button data-bind="click: $root.doSearch" class="btn btn-primary">Search</button>
                        </div>
                        <div class="span6">
                            <label>Categories</label>
                            <select class="chzn-select" multiple="multiple" data-placeholder=" - All Categories - ">
                                <option>ADA</option>
                                <option>Mechanical</option>
                                <option>Roofing</option>
                            </select>

                            <label>Cost Range</label>
                            <select class="chzn-select" multiple="multiple" data-placeholder=" - All Costs - ">
                                <option>0-1,000</option>
                                <option>1,000-5,000</option>
                                <option>5,000-25,000</option>
                                <option>25,000-100,000</option>
                                <option>100,000+</option>
                            </select>

                        </div>

                    </div>

                    <div class="row-fluid">
                        <div class="span12">
                            <hr />
                            <table id="searchResultsTable" class="table table-condensed table-sortable table-hover"
                                data-bind="visible: $root.searchResults().length > 0">
                                <thead>
                                    <tr>
                                        <th data-sort="number" class="th-muted">Id</th>
                                        <th data-sort="string">Site</th>
                                        <th data-sort="string">Description</th>
                                        <th data-sort="string">Category</th>
                                        <th data-sort="string">Priority</th>
                                        <th data-sort="number">RUL</th>
                                        <th data-sort="number" class="th-right">Cost</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: $root.searchResults">
                                    <tr data-bind="attr: { 'data-id': id }">
                                        <td data-bind="text: id" class="muted"></td>
                                        <td data-bind="text: site"></td>
                                        <td data-bind="text: name"></td>
                                        <td data-bind="text: category"></td>
                                        <td data-bind="text: priority"></td>
                                        <td data-bind="text: rul"></td>
                                        <td data-bind="text: cost" class="td-right"></td>
                                        <td class="td-right">
                                            <button class="btn btn-link btn-small">Details</button>
                                            <button class="btn btn-small btn-success"
                                                data-bind="click: $root.addResultToProject">
                                                <i class="icon-plus icon-white"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>

                <!-- Project Actions 
                    -->
                <div id="projectActions" class="tab-pane row-fluid">
                    <dl class="button-list">
                        <dt><a class="btn btn-success input-block-level">Complete</a></dt>
                        <dd>Mark this project as completed.</dd>

                        <dt><a class="btn input-block-level">Archive</a></dt>
                        <dd>Move the current Project to the Archives folder. It will be removed from the active projects list.</dd>
                        <dt><a class="btn input-block-level">Lock</a></dt>
                        <dd>Lock the project so no further changes can be made.</dd>
                        <dt><a class="btn btn-danger input-block-level">Delete</a></dt>
                        <dd>Move the current Project to the recycle bin (it can be restored later if necessary).</dd>

                    </dl>
                </div>

            </div>

        </div>

        <div id="overviewView" class="tab-pane">
            <h3>Overview</h3>
            <p class="explanation">
                This section will show graphs and tables summarizing across all Projects. These are just some samples.
            </p>
            <div class="row-fluid">
                <div class="span6 well well-bright">
                    <canvas height="300" width="400" id="piechartCanvas" data-bind="pieChart: pieData, chartRefresh: doRefresh"></canvas>
                    <button class="btn" data-bind="click: pushPie">push</button>
                    <button class="btn" data-bind="click: refreshPie">refresh</button>
                    <div class="well" data-bind="foreach: pieData">
                        <div><input data-bind="value: valueInput" />
                        <input data-bind="value: colorInput" />
                        </div>
                    </div>
                </div>
                <div class="span6 well well-bright">
                    <canvas height="300" width="400" data-bind="lineChart: $root.lineData"></canvas>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6 well well-bright">
                    <canvas height="300" width="400" data-bind="barChart: $root.barData"></canvas>
                </div>
                <div class="span6 well well-bright">
                  
                </div>
            </div>
        </div>

        <div id="reportsView" class="tab-pane">
            <h3>Reports</h3>
            <p class="explanation">
                Here you'll find a list of printable Reports.
            </p>
        </div>

        <div id="photosAndDocumentsView" class="tab-pane">
            <h3>Photos & Documents</h3>
            <p class="explanation">
                View Photos and Documents for all Projects.
            </p>
        </div>

        <div id="searchView" class="tab-pane">
            <h3>Search</h3>
            <p class="explanation">
                Search within all Projects.
            </p>
        </div>

        <div id="activityView" class="tab-pane">
            <h3>Activity</h3>
            <p class="explanation">
                This section will contain a summary of all Activity/History for all the projects.<br />
                A record will be kept of:
            </p>
            <ul class="unstyled">
                <li>Creating new Projects or Tasks</li>
                <li>Editing Projects or Tasks</li>
                <li>Changing the status of Projects or Tasks</li>
                <li>Deleting Projects or Tasks</li>
                <li>Adding comments</li>
            </ul>
        </div>

        <div id="markupsView" class="tab-pane">
            <h3>Markups</h3>
            <p class="explanation">
                Here you can view and edit the list of available Markups.
            </p>
        </div>

        <div id="archiveView" class="tab-pane">
            <h3>Archive</h3>
            <p class="explanation">
                Archived projects are saved but removed from the 'Active Projects' tab.<br />
                These projects will be excluded from the Overview and reports by default.
            </p>
        </div>
    </div>

    <hr />

</asp:Content>

<asp:Content ID="Javascript" ContentPlaceHolderID="Javascript" runat="server">

    <!--
        ** Test script -- contains projects/tasks etc for testing
        -->
    <script src="../Scripts/assetcalc.test.pm.js"></script>

    <!--
        ** Page Model
        -->
    <script src="../Scripts/assetcalc.pm.vm.js"></script>
    <script>
        // ** apply KO and CHZN bindings
        //
        $(document).ready(function () {

            //myPageModel.pieData(testPieChartData);
            //console.log(myPageModel.pieData());

            ko.applyBindings(myPageModel);  // apply bindings
            console.log('ko bindings applied')

            $("chzn-select").chosen();
            console.log('chzn applied')

            //myPageModel.pieData(testPieChartData);
            //console.log(myPageModel.pieData());
        });

    </script>

</asp:Content>

<asp:Content ID="NavBarItems" ContentPlaceHolderID="MenuLeft" runat="server">
</asp:Content>