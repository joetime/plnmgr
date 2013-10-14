//<!-- object : task -->
var Task = function (id, name, status, est, act, pri) {
    var task = this;
    
    task.id = id;
    task.name = ko.observable(name);
    task.status = ko.observable(status);
    task.estCost = ko.observable(est);
    task.actualCost = ko.observable(act);
    
    task.description = ko.observable();
    task.scopeAlterations = ko.observable();
    task.markupComments = ko.observable();

    task.priority = ko.observable(pri);
    task.category = ko.observable();
    task.funding = ko.observable();
    task.accountNumber = ko.observable();

    task.budgetBreakout = ko.observableArray(testbudgetBreakout);
    task.markups = ko.observableArray([]);
    task.documents = ko.observableArray([]);
};
