var myPageModel =
    $.extend(pageModel(),  // ** extend the basepage pagemodel
    {
        /// OBSERVABLES ///////////////////////////

        projects: ko.observableArray(testProjects),
        activeProject: ko.observable(),
        activeTask: ko.observable(),
        searchResults: ko.observableArray(),
        ddValues: ko.observable({
            status: testStatusOptions,
            priority: testPriorityOptions,
            funding: testFundingOptions,
            category: testCategoryOptions
            }),

        /// TEST DATA //////////////////////////////

        // note that pieData is an observableArray, 
        // while barData and lineData are just observables
        // (you can also use non-observable arrays/vars)

        pieData: ko.observableArray(testPieChartDataObservables),
        barData: ko.observable(testBarChartData),
        lineData: ko.observable(testLineChartData),


        pushPie: function () {
            this.pieData.push(new chartko.factory.pieArrayItem(100, "#123456", this));
        },

        refreshPie: function () {
            piechartCanvas.width = piechartCanvas.width + 10;
        },

        doRefresh: function () {
            toastr.success('ahhh refreshing');
        },

        //modPie: function () {
        //    this.pieData()[0].value = 5;
        //},

        ///////////////////////////////////////////

        // ** switch active tab
        //
        resolveTabs: function () {
            //console.log('here');
            $("#activeProjectMenu li").removeClass("active");
            $("#searchAndAddMenuItem").addClass("active");
        },

        // ** open project (change activeProject)
        //
        projectRowClick: function (item) {

            console.log(item);

            myPageModel.activeProject(item);

            $("#leftMenu li").removeClass("active");
            $("#activeProjectsView").removeClass("active");

            $("#activeProjectView").addClass("active");

            $("#taskDetailsPanel").fadeOut();

            $(".chzn-select").chosen();
        },

        // ** open task (change activeTask)
        //
        taskRowClick: function (item) {

            myPageModel.activeTask(item);
            $("#taskDetailsPanel").fadeIn();
            scrollToElement("#taskDetailsPanel", null, -10);
        },

        // ** dismiss and scroll top
        //
        closeTaskDetails: function (item) {

            $("#taskDetailsPanel").fadeOut();
            scrollToElement("#activeProjectView", null, -10);
        },

        // ** blank project and open
        //
        createNewProject: function () {
            var project = new Project();

            // add to front of array
            myPageModel.projects.splice(0, 0, project);

            // clear activeTask
            myPageModel.activeTask();

            toastr.success("New project created.");
            myPageModel.projectRowClick(myPageModel.projects()[0]);

            $("#projectNameTextBox").select();
        },

        // ** execute search
        //
        doSearch: function () {
            myPageModel.searchResults(testSearchResults);
            console.log(myPageModel.searchResults());
            scrollToElement("#searchResultsTable");
        },

        // ** not implemented - show search window
        //
        addEmgTask: function () {

        },

        // ** not implemented - show search window
        //
        addBlankTask: function () {
        },

        // ** creates new task (with defaults) and adds to project
        //
        addResultToProject: function (item) {
            $('tr[data-id=' + item.id + ']').addClass('tr-adding');

            var t = new Task(item.id);

            t.name(item.name);
            t.priority(item.priority);
            t.status("NEW");
            t.estCost(item.cost);
            t.category(item.category);

            myPageModel.activeProject().tasks.splice(0, 0, t);
            //myPageModel.activeProject().tasks.push(t);

            toastr.success("New task created.");

            $('tr[data-id=' + item.id + ']').fadeOut();
        }
    });