
var descriptionSet = function(vars) {
    var set = this;
    if (!vars) vars = {};

	set.summary = ko.observable(vars.summary);
	set.description = ko.observable(vars.description);
	set.notes = ko.observable(vars.notes);
	set.exceptions = ko.observable(vars.exceptions);
};

var timeSpanSet = function (vars) {
    var set = this;
    if (!vars) vars = {};

    set.date = ko.observable(vars.date);
	set.startDate = ko.observable(vars.startDate);
	set.endDate = ko.observable(vars.endDate);
	set.fiscalYear = ko.observable(vars.fiscalYear);
};

var uiSet = function (vars) {
    var set = this;

    if (!vars.uiSelected) vars.uiSelected = false;
	set.uiSelected = ko.observable(vars.uiSelected);

	set.uiNew = ko.observable(vars.uiNew);
	set.uiChecked = ko.observable(vars.uiChecked);
	set.uiDirty = ko.observable(vars.uiDirty);
};

var flagSet = function (vars) {
    var set = this;

    set.isLocked = ko.observable(vars.isLocked);
    //set.isLocked = ko.observable(vars.isLocked);
    //set.isLocked = ko.observable(vars.isLocked);
    //set.isLocked = ko.observable(vars.isLocked);
}

var metaSet = function (vars) {
	var set = this;
	set.createdBy = ko.observable('');
	set.createdDate = ko.observable('');
	set.modifiedBy = ko.observable('');
	set.modfiedDate = ko.observable('');
	set.deletedBy = ko.observable('');
	set.deletedDate = ko.observable('');
};

var myFactory = function (data, Creator) {

    // loads data into model
    if (!data) data = [];
    var tmp = [];
    $.each(data, function (index, value) {
        tmp.push(new Creator(value));
    });
    return tmp;
};

var Plan = function (vars) {
    var plan = this;

    plan.name = ko.observable(vars.name);
    plan.identifier = ko.observable(vars.identifier);
    plan.contact = ko.observable(vars.contact);
    plan.priority = ko.observable(vars.priority);
    plan.status = ko.observable(vars.status);

    if (!vars.ui) vars.ui = {};
    $.extend(plan, new uiSet(vars.ui));

    $.extend(plan, new descriptionSet(vars));
    $.extend(plan, new timeSpanSet(vars));
    $.extend(plan, new metaSet());


    // loads Project data into model
    plan.projects = ko.observableArray(
        myFactory(vars.projects, Project)
        );

    plan.planTotal = ko.computed(function () {
        var sum = 0;
        //console.log('planTotal...');
        var loop = ko.utils.arrayForEach(plan.projects(), function (item) {
            sum += parseInt(item.projectTotal());
            //console.log(sum);
        });
        return sum;
    });

    plan.planMarkupsTotal = ko.computed(function () {
        var sum = 0;
        //console.log('planTotal...');
        var loop = ko.utils.arrayForEach(plan.projects(), function (item) {
            sum += parseInt(item.markupsTotal());
            //console.log(sum);
        });
        return sum;
    });

    plan.planBaseSubtotal = ko.computed(function () { 
        var sum = 0;
        //console.log('planTotal...');
        var loop = ko.utils.arrayForEach(plan.projects(), function (item) {
            //console.log(ko.toJSON(item));
            sum += parseInt(item.baseSubtotal());
            //console.log(sum);
        });
        return sum;
    });

    plan.planExpendituresTotal = ko.computed(function () {
        var sum = 0;
        console.log('planExpendituresTotal...');
        var loop = ko.utils.arrayForEach(plan.projects(), function (item) {
            sum += parseInt(item.expendituresTotal());
            console.log(sum);
        });
        console.log("=");
        console.log(sum);
        return sum;
    })

    plan.breakouts = new BreakoutCalculator(plan.projects());
}

// FML
var BreakoutCalculator = function (projects) {
    var bc = this;

    bc.name = ko.observable('test');

    //console.log(projects);

    // 1 run through projects, and sort the breakouts into templates based on name
    // 2 create a dictionary-like structure, where name is the key
    // 3 put pie data into that bucket grab pie data
    // 4 for each of these, do essentially the same thing and sum the value
    var arr = [];
    ko.utils.arrayForEach(projects, function (item) {
        var i = 0;
        while (item.breakouts()[i]) {
            // 2
            var key = item.breakouts()[i].name();
            if (!arr[key]) arr[key] = { name: key, vals: [], data: [] };
            // 3
            arr[key].vals.push(item.breakouts()[i].pieData());
            i++;
        }
    });
    //console.log('afterstep3:');
    //console.log();
    var cheater = [arr['Scope of Work'], arr['Funding Source']];
    //console.log(cheater);
    // 4
    var stuff = [];
    // cheater = [ { name: xxx, vals: xxx[] }, ... ]
    var FINAL = [];
    var colorInt = 0;
    cheater.forEach(function (item) {
        var SUBFINAL = [];
        if (item && item.vals) {
            item.vals.forEach(function (cat) {
                var i = 0;

                while (cat[i]) {
                    if (!SUBFINAL[cat[i].name]) SUBFINAL[cat[i].name] = 0;
                    SUBFINAL[cat[i].name] += cat[i].value;
                    i++;
                }

            });
            var pushme = [];
            colorInt = 0;
            for (var fml in SUBFINAL) {
                if (SUBFINAL[fml] > 0) {
                    pushme.push({ name: fml, value: SUBFINAL[fml], color: colorArray[colorInt] });
                    colorInt++;
                }
            };

            FINAL.push({ name: item.name, vals: pushme });
        }
    });
    //console.log(FINAL);
    return ko.observable(FINAL);
    //console.log(vals);
}

var Project = function (vars) {
	var project = this;

	project.name = ko.observable(vars.name);
	project.identifier = ko.observable(vars.identifier);
	project.ac_location = ko.observable();
	project.ac_observationReferences = ko.observableArray([]);
	project.accountNumber = ko.observable(vars.accountNumber);
	project.location = ko.observable(vars.location);

	project.priority = ko.observable(vars.priority);
	project.status = ko.observable(vars.status);
	project.category = ko.observable(vars.category);

	if (!vars.ui) vars.ui = {};
	$.extend(project, new uiSet(vars.ui));

	$.extend(project, new ProjectEstimate(vars));

	$.extend(project, new descriptionSet(vars));
	$.extend(project, new timeSpanSet(vars));
	$.extend(project, new metaSet(vars));

	project.attachments = ko.observableArray(vars.attachments);


    // loads Breakout data into model
	project.breakouts = ko.observableArray(
        myFactory(vars.breakouts, BreakoutTemplate)
	    );

    // loads Expenditure data into model
	project.expenditures = ko.observableArray(
        myFactory(vars.expenditures, Expenditure)
        );

	project.expendituresTotal = ko.computed(function () {
	    var sum = 0;
	    console.log('project.expendituresTotal: ' + project.name());
	    var exp = ko.utils.arrayForEach(project.expenditures(), function (item) {
	        console.log(item.name() + ':     ' + sum);
	        sum += item.dollarVal();
	    });
	    console.log('=');
	    console.log(sum);
	    return sum;
	});

	project.dirtyFlag = ko.dirtyFlag(this, false);
};


ko.dirtyFlag = function (root, isInitiallyDirty) {
    //console.log(ko.toJSON(root));
    var result = function () { },
        _initialState = ko.observable(ko.toJSON(root)),
        _isInitiallyDirty = ko.observable(isInitiallyDirty);

    result.isDirty = ko.computed(function () {
        console.log('initial state:');
        console.log(_initialState());
        console.log('currentstate:')
        console.log(ko.toJSON(root));
        return _isInitiallyDirty() || _initialState() != ko.toJSON(root);
    });

    result.reset = function () {
        _initialState(ko.toJSON(root));
        _isInitiallyDirty(false);
    };

    return result;
};

var ProjectEstimate = function (vars) {
    var est = this;

    est.baseCost = ko.observable(vars.baseCost)
    est.baseContingency = ko.observable(0);
    est.projectContingency = ko.observable(0);

    // loads Markup data into model
    est.markupTemplates = ko.observableArray(
        myFactory(vars.markupTemplates, MarkupTemplate)
        );

    est.baseSubtotal = ko.computed(function () {
        return est.baseCost() * (1 + est.baseContingency() / 100);
    });

    est.markupsTotal = ko.computed(function () {
        var sum = 0;
        var categories = ko.utils.arrayForEach(est.markupTemplates(), function (item) {
            sum += item.calculatedValue(est.baseSubtotal())();
        });
        return sum;
    });


    est.projectSubtotal = ko.computed(function () {
        return est.markupsTotal() + est.baseSubtotal();
    });

    est.projectTotal = ko.computed(function () {
        return numeral(((est.projectContingency() / 100) + 1) * est.projectSubtotal())
			.format('0');
    })
    est.projectTotalFormatted = ko.computed(function () {
        return numeral(((est.projectContingency() / 100) + 1) * est.projectSubtotal())
			.format('0,0');
    })
};

var Expenditure = function (vars) {
    var exp = this;

    exp.name = ko.observable(vars.name);
    exp.dollarVal = ko.observable(vars.dollarVal);
    
    $.extend(exp, new timeSpanSet(vars));
    $.extend(exp, new descriptionSet(vars));
};

var Attachment = function (vars) {
	var file = this;

	this.path = ko.observable(vars.path);
	this.filename = ko.observable(vars.filename);
	this.description = ko.observable(vars.description);
	this.type = ko.observable(vars.type);
};

var MarkupTemplate = function (vars) {
	var tmp = this;

	tmp.category = ko.observable(vars.category);
	tmp.name = ko.observable(vars.name);
	tmp.type = ko.observable(vars.type);
	tmp.isSelected = ko.observable(vars.isSelected);
	tmp.defaultValue = ko.observable(vars.defaultValue);

	if (!vars.ui) vars.ui = {};
	//if (vars.isSelected) vars.ui.uiChecked = true;

	$.extend(tmp, new uiSet(vars.ui));

    // calculates markup value 
	// based on a given base value
	tmp.calculatedValue = function (val) {
		return ko.computed({
			read: function () {
				if (!tmp.isSelected()) return 0;
				if (tmp.type() == '$') return parseInt(tmp.defaultValue());
				return parseInt(val * (tmp.defaultValue() / 100));
			}
		});
	};
};

var BreakoutTemplate = function (vars) {
    //console.log('BreakoutTemplate:');
    //console.log(vars);

	var tmp = this;

	tmp.name = ko.observable(vars.name);

	if (!vars.ui) vars.ui = {};
	$.extend(tmp, new uiSet(vars.ui));

	tmp.categories = ko.observableArray(
        myFactory(vars.categories, BreakoutCategory)
	    );

	tmp.pieData = ko.computed(function () {
		var arr = [];
		ko.utils.arrayForEach(tmp.categories(), function (item) {
			arr.push({ value: parseInt(item.dollarVal()), color: item.color(), name: item.name() });
		});
		return arr;
	});

	tmp.allocatedTotal = ko.computed(function () {
		var sum = 0;
		ko.utils.arrayForEach(tmp.categories(), function (item) {
			sum += parseInt(item.dollarVal());
		});
		return sum;
	});	
}

var BreakoutCategory = function (vars) {
    var cat = this;

    cat.name = ko.observable(vars.name);
    cat.dollarVal = ko.observable(vars.dollarVal);
    cat.color = ko.observable(vars.color);

    if (!vars.ui) vars.ui = {};
    $.extend(cat, new uiSet(vars.ui));
}


var colorArray = [
    //'#002222',
    '#006666',
    '#5bc0de',
    '#f0ad4e',
    '#d9534f',
    '#463265',
    '#00CCCC',
    '#5cb85c'];

var colorArray2 = [
	'#4DB27C', '#634873', '#332916', '#36664C', '#B29256', '#9E65BF',
];

var statusArray = [
    '',
    'Project definition',
    'Planning',
    'Design',
    'Implementation',
    'Close-out'
];


var categoryArray = [
    '',
    'Accessibility',
    'Transportation',
    'Infrastructure',
    'Energy',
    'Other'];

var priorityArray = [
    '',
    'High',
    'Medium',
    'Low'];
