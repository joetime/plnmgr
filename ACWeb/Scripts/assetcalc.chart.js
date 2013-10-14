var emgColors = {
    emg: "#006666",
    lightBlue: "#528CCC",
    brown: "#73301D",
    darkBlue: "#0F5199",
    mediumGreen: "#067D5B",
    red: "#991A0F",
    teal: "#12B2B2",
    amber: "#B24200",
    purple: "#730B57",
    gold: "#B29709",
    darkGreen: "#067335"
}

var defaultChartColors = [];
$.each(emgColors, function (index, item) {
    defaultChartColors.push(item);
});

chartAutoColor = function (data) {
    var d = data.hasOwnProperty('datasets') ? data.datasets : data;

    $.each(data, function (index, item) {
        console.log('autocolor:' + item);
        item.color = defaultChartColors[index];
    })
}