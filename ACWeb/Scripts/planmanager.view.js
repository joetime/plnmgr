var myPageModel =
$.extend(masterPageModel(),  // ** extend the basepage pagemodel
{
    pageTitle: 'Arlington VA, Plans',


    menuExpanded: true,
    toggleMenu: function () {
        if (myPageModel.menuExpanded) myPageModel.collapseMenu();
        else myPageModel.expandMenu();

        myPageModel.menuExpanded = !myPageModel.menuExpanded;
    },
    collapseMenu: function () {    
        $('#column-nav').fadeOut(500);
        window.setTimeout(function () {
            $('#column-main').addClass("col-md-12");
        }, 501);
    },
    expandMenu: function () {
        console.log('expand');
        $('#column-main').removeClass("col-md-12");
        $('#column-nav').fadeIn(500);
    },


    queuedFiles: ko.observableArray(),



    searchResults: ko.observableArray([]),
    openSearch: function () {
        $('#searchModal').modal('show');
        //$('#searchInput').focus();
        $('#searchInput').select();
    },
    doSearch: function () {
        myPageModel.searchResults(testSearchResults);
    },
    clearSearch: function () {
        myPageModel.searchResults([]);
        $('#searchInput').val('');
        //$('#searchInput').focus();
        $('#searchInput').select();
    },


    /* Plans UI Controllers */

    

    allPlans: ko.observableArray(dummyPlanSet),
    selectedPlan: ko.observable(),
    statusOptions: ko.observable(statusArray),

    deselectPlan: function () {
        if (myPageModel.selectedProject())
            myPageModel.selectedProject().uiSelected(false);
        myPageModel.selectedProject(null);
        if (myPageModel.selectedPlan())
            myPageModel.selectedPlan().uiSelected(false);
        myPageModel.selectedPlan(null);
    },
    selectPlan: function (plan) {

        console.log(plan.fiscalYear());
        console.log(plan.summary());

        myPageModel.deselectPlan();

        plan.uiSelected(true);
        myPageModel.selectedPlan(plan)

        $(".table-sort").stupidtable(); console.log('stupidtable');
        
        $("textarea").height($("textarea")[0].scrollHeight);
        console.log('resize textarea');
    },
    selectFirstPlan: function () {
        myPageModel.selectPlan(myPageModel.allPlans()[0]);
    },
    newPlan: function () {
        myPageModel.deselectPlan();
        myPageModel.selectPlan(new Plan({
            name: 'New Plan',
            identifier: 'P004',
            fiscalYear: 2013,
            startDate: '2013-10-11',
            endDate: '',
            ui: { uiNew: true }
        }));
        // start with the details page
        //#planDetailsTabTrigger
        $('#planTabs a:last').tab('show');
        //$('#planNameInput').focus();
        $('#planNameInput').select();

    },
    savePlan: function (plan) {

        console.log('savePlan... ' + plan.uiNew());

        if (plan.uiNew()) {
            //console.log('uiNew=true');
            myPageModel.allPlans.push(plan);
            plan.uiNew(false);
            myPageModel.selectPlan(plan);
            toastr.success('Plan saved!');
        }
        else {
            //console.log('uiNew=false');

            toastr.success('Changes saved!');
        }

        //myPageModel.deselectPlan();
        return false;
    },
    closePlan: function (plan) {
        myPageModel.deselectPlan();
    },
    exportPlan: function (plan) {
        console.log(ko.toJSON(plan));
    },

    changeMarkup: function () {
        $("#markupTotalInputGroup").effect("pulsate",
              {times:5}, 3000 );
    },


    /* Add Project , blank and assetcalc*/
    addProjectAssetCalc: function (acobservation) {
        console.log('addProjectAssetCalc');
        if (!myPageModel.selectedPlan()) {
            toastr.error('No plan selected.');
            return;
        }
        myPageModel.selectedProject(new Project({
            name: acobservation.name,
            location: acobservation.location,
            ui: { uiNew: true },
            identifier: 'AC' + acobservation.id,
            category: acobservation.category,
            category: acobservation.priority,
            fiscalYear: 2013,
            baseCost: acobservation.cost,
            markupTemplates: emptyMarkupSet(),
            baseContingency: 10,
            projectContingency: 10,
            breakouts: emptyBreakoutSet() //dummyBreakoutSet
        }));
        $('#searchModal').modal('hide');
        $('#projectNameInput').select();
    },
    addProject: function (plan) {
        if (!myPageModel.selectedPlan()) {
            toastr.error('No plan selected.');
            return;
        }
        myPageModel.selectedProject(new Project({
            name: 'New Project',
            ui: { uiNew: true },
            identifier: 'P0333',
            fiscalYear: 2013,
            baseCost: 0,
            markupTemplates: emptyMarkupSet(), //dummyMarkupTemplates,
            baseContingency: 10,
            projectContingency: 10,
            breakouts: emptyBreakoutSet() //dummyBreakoutSet
        }));

        $('#projectNameInput').select();
    },



    /* Projects UI Controllers */

    allProjects: ko.observableArray([]),
    selectedProject: ko.observable(),

    deselectProject: function () {
        myPageModel.selectedProject(null);
    },
    selectProject: function (project)
    {
        $('#planDetailsForm').slideDown();
        myPageModel.selectedProject(project);

        $(".table-sort").stupidtable(); console.log('stupidtable');

        $("[data-help-text]").hover(function () {
            console.log(this);
            $("#estimateHelp").text($(this).attr("data-help-text"));
        });
    },
    
    saveProject: function () {
        var project = myPageModel.selectedProject();

        if (project.uiNew && myPageModel.selectedPlan()) {
            myPageModel.selectedPlan().projects.push(project);
            project.uiNew(false);
            toastr.success("Project created");
        }
        else if (myPageModel.selectedPlan()) {
            toastr.success("Project saved");
        }

        console.log(project);
    },
    closeProject: function () { },
    attAttachment: function () { },

});


function PreviewImage() {
    var oFReader = new FileReader();
    myPageModel.queuedFiles([]);
    var files = document.getElementById("uploadImage").files

    //console.log(files);

    for (var i = 0; i < files.length; i++)  //for multiple files          
    {
        //console.log('here');
        (function (file) {
            var name = file.name;
            if (file.type == 'image/jpeg') {
                var reader = new FileReader();
                reader.onload = function (e) {
                    myPageModel.queuedFiles.push({ source: e.target.result, name: name });
                }
                reader.readAsDataURL(file);
            }
            else {
                //todo
                myPageModel.queuedFiles.push({ source: 'http://www.philobia.com/images/pdf.png', name: name });
            }
        })(files[i]);
    }
};