<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="Chartjs_Test.aspx.cs" Inherits="ACWeb.ACTest.Chartjs_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Css" runat="server">
    <style>
        .chart-link
        {
            display: inline-block;
            /*border: 1px dotted #e8e8e8;*/
            padding: 10px;
        }

            .chart-link canvas
            {
                /*border: 1px dotted #eee;*/
            }

        .chart-legend
        {
            display: block;
            /*border: 1px dotted #eee;*/
            padding: 5px 0px;
            text-align: center;
        }

        .legend-color
        {
            padding: 0 8px;
            height: 12px;
            display: inline-block;
            background-color: red;
            border: 1px solid white;
            margin-right: 5px;
            position: relative;
            top: 2px;
            margin-left: 20px;
        }

        .legend-set
        {
            white-space: nowrap;
            width: auto;
            float: left;
        }
        .legend-text
        {
        }

        .chart-title
        {
            display: block;
            font-size: 17.5px;
            font-family: 'Anaheim', sans-serif;
            margin: 10px 0;
            font-weight: bold;
            line-height: 20px;
            text-rendering: optimizelegibility;
            color: #006666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">

    <div class="container-fluid">

        <div class="row-fluid">

            <div class="offset3 span6">
        
                <div id="lineChart" class="chart-link">
                    <span class="chart-title">Default Line Chart</span>
                    <canvas width="500" height="300"></canvas>
                    <span id="lineChartLegend" class="chart-legend">test</span>
                </div>
            </div>
            <div class="offset3 span6">
        
                <div id="pieChart" class="chart-link" style="position: relative;">
                    <span class="chart-title">Default Pie Chart</span>
                    <canvas width=500 height="300"></canvas>
                    <span id="pieChartLegend" class="chart-legend">test</span>
                </div>
            </div>
        
        </div><div class="row-fluid">

        <div class="offset3 span6">
            <div id="barChart" class="chart-link">
                <span class="chart-title">Default Bar Chart</span>
                <canvas width=500 height="300"></canvas>
                <span id="barChartLegend" class="chart-legend">test</span>
            </div>
        </div>
    </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Javascript" runat="server">
    <script src="../Scripts/chart.js"></script>
    <script>

        //Get context with jQuery - using jQuery's .get() method.
        var lineCtx = $("#lineChart canvas").get(0).getContext("2d");
        var pieCtx = $("#pieChart canvas").get(0).getContext("2d");
        var barCtx = $("#barChart canvas").get(0).getContext("2d");

        pieCtx.fillRect(50, 25, 150, 100);

        var data = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "Maintain",
                    fillColor: "rgba(256,0,0,.1)",
                    strokeColor: "none",
                    pointColor: "none",
                    pointStrokeColor: "none",
                    data: [100, 100, 100, 100, 100, 100, 100]
                },
                {
                    label: "Maintain 2",
                    fillColor: "yellow",
                    strokeColor: "yellow",
                    pointColor: "none",
                    pointStrokeColor: "none",
                    data: [68, 68, 68, 68, 68, 68, 68]
                },
                {
                    label: "Maintain 2",
                    fillColor: "green",
                    strokeColor: "none",
                    pointColor: "none",
                    pointStrokeColor: "none",
                    data: [18, 18, 18, 18, 18, 18, 18]
                },
                {
                    label: "Light blue ",
                    fillColor: "rgba(0,120,120,1)",
                    strokeColor: emgColors.lightBlue,
                    pointColor: emgColors.green,
                    pointStrokeColor: "#fff",
                    data: [65, 59, 90, 81, 56, 55, 40]
                },
                
            
            ]
        }

        var options = { bezierCurve: false, animationEasing: "easeOutCirc", animationSteps: 50, animateRotate: false, animateScale: true }

        var pieData = testPieData
        // add auto colors
        chartAutoColor(pieData);
        

        new Chart(lineCtx).Line(data, options);
        lineLegend(data, "#lineChartLegend");

        new Chart(barCtx).Bar(data, options);
        lineLegend(data, "#barChartLegend");

        new Chart(pieCtx).Pie(pieData, options);
        pieLegend(pieData, "#pieChartLegend");

        // set up click-to-download
        $(".chart-link").click(function () {
            var canvas = $(this).find("canvas").get(0);
            var img = canvas.toDataURL("image/jpeg");
            var link = $(this);
            link.attr('href', img);
            link.attr('download', 'chart.jpg');
        });

        // create legend
        function lineLegend(data, legendId) {
            $(legendId).text("");
            $.each(data.datasets, function (index, item) {

                $(legendId)
                    .append(
                        $('<span></span>')
                        .addClass('legend-color')
                        .css('background-color', item.fillColor)
                        .css('border-color', item.strokeColor)
                        )
                    .append(item.label);
            });
        }
        function pieLegend(data, legendId) {
            $(legendId).text("");
            $.each(data, function (index, item) {
                
                $(legendId)
                    .append(

                        $('<span></span>').addClass('legend-set')
                        .append(
                            $('<span></span>')
                            .addClass("legend-color")
                            .css('background-color', item.color)
                            .css('border-color', "white"))
                        .append($("<span></span>").addClass("legend-text").append(item.label)
                        )
                    );
            });
        }

    </script>

</asp:Content>
