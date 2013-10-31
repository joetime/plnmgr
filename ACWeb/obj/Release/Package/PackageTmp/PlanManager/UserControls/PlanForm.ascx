<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlanForm.ascx.cs" Inherits="ACWeb.PlanManager.PlanForm" %>

<script id="planForm" type="text/template">
    <form class="grid-form">

        <fieldset>
            <legend></legend>

            <!-- ID, Plan Name -->
            <div data-row-span="5">

                <div data-field-span="4">
                    <label>Plan Name</label>
                    <input id="planNameInput" type="text" class="fiexld-em" data-bind="value: name">
                </div>
                <div data-field-span="1">
                    <label>Identifier</label>
                    <input type="text" data-bind="value: identifier">
                </div>
            </div>

            <!-- Summary -->
            <div data-row-span="1">
                <div data-field-span="1">
                    <label>Summary</label>
                    <input type="text" data-bind="value: summary" />
                </div>
            </div>

            <!-- Fiscal Year, Start Date, End Date -->
            <div data-row-span="5">
                <div data-field-span="1">
                    <label>Fiscal Year</label>
                    <input type="text" data-bind="value: fiscalYear" />
                </div>
                <div data-field-span="2">
                    <label>Start Date</label>
                    <input type="date" data-bind="value: startDate" />
                </div>
                <div data-field-span="2">
                    <label>End Date</label>
                    <input type="date" data-bind="value: endDate" />
                </div>
            </div>

            <!-- Status, Contact -->
            <div data-row-span="5">
                <div data-field-span="2">
                    <label>Status</label>
                    <select class=""
                        data-bind="value: status, options: statusArray">
                    </select>
                </div>
                <div data-field-span="3">
                    <label>Contact</label>
                    <input type="text" data-bind="value: contact" />
                </div>
            </div>

            <!-- Details -->
            <div data-row-span="1">
                <div data-field-span="1">
                    <label>Details</label>
                    <textarea data-bind="value: description" />
                </div>
            </div>


            <!-- Notes -->
            <div data-row-span="1">
                <div data-field-span="1">
                    <label>Notes</label>
                    <textarea data-bind="value: notes" />
                </div>
            </div>

            <!-- Details -->
            <div data-row-span="1">
                <div data-field-span="1">
                    <label>Exceptions</label>
                    <textarea data-bind="value: exceptions" />
                </div>
            </div>

        </fieldset>

    </form>
</script>
