<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectExpenditures.ascx.cs" Inherits="ACWeb.PlanManager.ProjectExpenditures" %>


<script id="projectExpenditures" type="text/template">
    <div class="row">
        <h3 data-bind="text: 'Total Expenditures: $ ' + numeral(expendituresTotal()).format('0,0')"></h3>

        <div class="pull-right">
            <button class="btn btn-sm btn-success"
                 data-bind="click: $root.notImplemented">Add Expenditure</button>
        </div>
    </div>
    <table class="table table-condensed table-hover">
        <thead>
            <th></th>
            <th class="text-muted">Date</th>
            <th class="text-muted text-right">Amt</th>
        </thead>
        <tbody data-bind="foreach: expenditures">
            <tr>
                <td data-bind="text: name"></td>
                <td data-bind="text: date"></td>
                <td class="text-right" data-bind="text: dollarVal"></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td></td>
                <td></td>
                <td class="text-right" data-bind="text: numeral(expendituresTotal()).format('0,0')"></td>
            </tr>
        </tfoot>
    </table>
    
</script>
