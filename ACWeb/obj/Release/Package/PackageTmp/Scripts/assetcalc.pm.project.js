//<!-- object : task -->
var Project = function () {
    var project = this;
    
    project.id = ko.observable(); 
    project.name = ko.observable('New Project');
    project.taskCount = ko.computed(function () {
        return tasks().length;
    });
    project.status = ko.observable();
    project.percentComplete = ko.observable('0%');
    project.budget = ko.observable(0);
    project.priority = ko.observable();
    project.description = ko.observable('');
    project.defaultPhoto = ko.observable();

    project.tasks = ko.observableArray([]);
    project.budgetBreakout = ko.observableArray([]);
    project.documents = ko.observable([]);
};
