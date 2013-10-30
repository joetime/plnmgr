<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchModal.ascx.cs" Inherits="ACWeb.PlanManager.SearchModal" %>

<script id="searchModalTemplate" type="text/template">
    <div class="modal faxde" id="searchModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Search &amp; Add</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6 col-md-offset-2">
                            <input id="searchInput" class="form-control search-field" placeholder="Type to Search"
                                value="Type to Search" />
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-primary" data-bind="click: doSearch">Search</button>
                            <button class="btn btn-default" data-bind="click: clearSearch">Clear</button>
                        </div>
                    </div>
                    <hr />
                    <table id="searchResultsTable" class="table table-condensed table-sort table-hover"
                        data-bind="visible: $root.searchResults().length > 0">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" /></th>
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
                                <th>
                                    <input type="checkbox" /></th>
                                <td data-bind="text: id" class="muted"></td>
                                <td data-bind="text: site"></td>
                                <td data-bind="text: name"></td>
                                <td data-bind="text: category"></td>
                                <td data-bind="text: priority"></td>
                                <td data-bind="text: rul"></td>
                                <td data-bind="text: cost" class="td-right"></td>
                                <td>
                                    <button class="btn btn-sm btn-success"
                                        data-bind="click: $root.addProjectAssetCalc">
                                        Add</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</script>
