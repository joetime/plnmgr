<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectBreakouts.ascx.cs" Inherits="ACWeb.PlanManager.ProjectBreakouts" %>


<script id="projectBreakouts" type="text/template">

    <div class="row" data-bind="foreach: breakouts">
        <div class="col-md-6">
            <h3 data-bind="text: name"></h3>
            <div class="text-center">
                <canvas height="200" width="200" id="piechartCanvas" data-bind="pieChart: pieData()"></canvas>
            </div>
            <table class="table table-borderxed table-hover">
                <tbody data-bind="foreach: categories">
                    <tr>
                        <td>
                            <div data-bind="attr: { style: 'background-color: ' + color() }">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </td>
                        <td data-bind="text: name"></td>
                        <td data-bind="text: numeral(100 * dollarVal() / $parents[1].projectTotal()).format('0') + ' %' "></td>
                        <td>
                            <input type="number" step="1" class="form-control input-sm"
                                data-bind="value: dollarVal"></td>
                    </tr>
                </tbody>
                <tfoot>
                    <td></td>
                    <td>Unallocated </td>
                    <td data-bind="text: numeral(100 * ($parent.projectTotal() - allocatedTotal()) / $parent.projectTotal()).format('0') + ' %' "></td>
                    <td data-bind="text: numeral($parent.projectTotal() - allocatedTotal()).format('0')"></td>
                </tfoot>
            </table>
        </div>
    </div>

</script>
