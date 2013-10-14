

function ObservablePieDataItem(val, col, chart) {
    var item = this;
    item._value = ko.observable(val);
    item._color = ko.observable(col);

    item.value = ko.computed({
        read: function () {
            console.log('reading');
            return item._value();
        },
        write: function (newVal) {
            console.log('writing!')
            item._value(newVal);

        },
        owner: this,
        deferEvaluation: true
    });

    item.value.subscribe(item._value);

    item.color = ko.computed(function () { return item._color(); });

    return {
        value: item.value(),
        color: item.color(),
        valueInput: item.value,
        colorInput: item.color
    }
}


var chartko = {
    debug: false,
    utils: {
        log: function (chartType, element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
            console.log("chart.ko.js:");
            console.log("chartType: " + chartType);
            console.log(element);
            console.log(valueAccessor);
            console.log(allBindingsAccessor());
            console.log(viewModel);
            console.log(bindingContext);
        },
        bind: function (chartType, element, valueAccessor) {
            // 1. Unwrap value, so we can use observables or regular arrays
            // 2. Create a context, set options
            // 3. Create chart

            // 1
            var value = valueAccessor();
            var valueUnwrapped = ko.utils.unwrapObservable(value);
            // 2
            var ctx = element.getContext("2d");
            var options = {
                animateRotate: false,
                animateScale: true,
                animationEasing: "easeInOutQuint",
                animationSteps: 50
            };   // would like a way to set these dynamically, somehow, someway
            // 3
            if (chartType == "Pie")
                new Chart(ctx).Pie(valueUnwrapped, options);
            if (chartType == "Bar")
                new Chart(ctx).Bar(valueUnwrapped, options);
            if (chartType == "Line")
                new Chart(ctx).Line(valueUnwrapped, options);
        },
        update: function (chartType, element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
            // debug
            if (chartko.debug)
                chartko.utils.log(chartType, element, valueAccessor, allBindingsAccessor, viewModel, bindingContext);

            chartko.utils.bind(chartType, element, valueAccessor);

            //if (element.hasOwnProperty("chartRefreshCallback")) chartRefreshCallback();
        }
    },
    factory: {
        pieArrayItem: function (val, color) {
            return new ObservablePieDataItem(val, color)   
        }
    }
};

//ko.bindingHandlers.chartRefresh = {
//    init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
//        element.chartRefreshCallback = valueAccessor;
//    }
//};

ko.bindingHandlers.pieChart = {
    update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
        chartko.utils.update("Pie", element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)
    }
};

ko.bindingHandlers.barChart = {
    update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
        chartko.utils.update("Bar", element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)
    }
};

ko.bindingHandlers.lineChart = {
    update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
        chartko.utils.update("Line", element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)
    }
};