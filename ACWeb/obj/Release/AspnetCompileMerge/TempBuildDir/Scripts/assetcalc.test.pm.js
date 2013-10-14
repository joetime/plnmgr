
var testSearchResults = [
    { id: 10, rul: 7, site: 'Firehouse 1', category: 'Interiors', priority: '3-Lowest', cost: 1003, name: 'Replace office furniture' },
    { id: 9, rul: 4, site: 'Firehouse 1', category: 'Interiors', priority: '2-Medium', cost: 551, name: 'Interior painting' },
    { id: 3, rul: 0, site: 'Firehouse 2', category: 'Roofing', priority: '1-Highest', cost: 103, name: 'Roof replacement' },
    { id: 223, rul: 1, site: 'Firehouse 4', category: 'Mechanical', priority: '3-Lowest', cost: 150, name: 'Replace 100kw roof unit' },
    { id: 3345, rul: 5, site: 'Firehouse 1', category: 'Roofing', priority: '1-highest', cost: 334, name: 'Roof replacement' },
    { id: 334, rul: 1, site: 'Firehouse 3', category: 'mechanical', priority: '1-highest', cost: 1234, name: 'Boiler install' },
    { id: 24, rul: 3, site: 'Firehouse 5', category: 'Exterior', priority: '3-Lowest', cost: 990, name: 'Sidewalk repair' },
    { id: 32, rul: 2, site: 'Firehouse 2', category: 'Exterior', priority: '1-highest', cost: 245, name: 'Asphalt Paving' },
    { id: 99, rul: 0, site: 'Firehouse 1', category: 'Mechanical', priority: '3-Lowest', cost: 363, name: 'A/C Upgrade' },
    { id: 258, rul: 0, site: 'Firehouse 4', category: 'Exterior', priority: '2-Medium', cost: 223, name: 'Repoint brick' },
    { id: 112, rul: 1, site: 'Firehouse 2', category: 'Exterior', priority: '3-Lowest', cost: 24, name: 'Window replacement' },
    { id: 101, rul: 3, site: 'Firehouse 2', category: 'Interiors', priority: '3-Lowest', cost: 434, name: 'Carpet' },
];


//<!-- mockup : budget factors -->

var testDocList = [
    { name: 'Contract template', type: 'PDF', date: 'last week', user: 'jscala' },
    { name: 'Bid document', type: 'DOC', date: 'last month', user: 'msmith' },
    { name: 'Contrator Insurance', type: 'PDF', date: 'last month', user: 'twilliams' },
];

var testbudgetBreakout = [
    { label: 'EMG Estimate', amt: 234 },
    { label: 'Scope Alterations', amt: 212 },
    { label: 'Markups', amt: 100 },
    { label: 'Catch up', amt: 100 },
    { label: 'Keep up', amt: 100 }
];




var testTask = function () {
    var t = new Task(3, "Office renovation", "In Progress", 17, 0);
    t.description = "Replace carpet, lighting, and furniture";
    t.markups = [
        { name: 'Staff Chargeback', percent: '15', dollars: '' },
        { name: 'Design', percent: '20', dollars: '' },
        { name: 'Permits', percent: '', dollars: '1500' }
    ];
    t.scopeAlterations = "Some text here";
    t.markupComments = "comments about the markups"

    t.funding = "Capital";
    t.category = "Renovate";
    t.priority = "2-Medium";
    t.accountNumber = "A1034";

    t.documents(testDocList);
    
    return t;
};

//<!-- mockup : list of tasks -->
var testTasks = [
    new Task(1, "Repair front steps", "Complete", 13, 18, '1-High'),
    new Task(3, "Recarpet periodicals area", "Planning", 33, 0, '2-Medium'),
    testTask(),
    new Task(4, "Paint interior", "Out for Bid", 49, 0, '2-Medium'),
    new Task(8, "AC Upgrade", "On Hold", 67, 0, '3-Low'),
    new Task(11, "Repoint brick exterior", "Not Started", 109, 0, '3-Low'),
];


//<!-- mockup : project w/ details -->

var testProjectFly = {
    id: 22,
    name: 'Library Renovation',
    taskCount: 18,
    status: 'In Progress',
    percentComplete: '30%',
    budget: 33,
    description: 'Repairs and upgrades to the Community Library.'
};

var testProject = $.extend(testProjectFly, {
    defaultPhoto: '../ACTest/pic.jpg',
    tasks: testTasks,
    budgetBreakout: testbudgetBreakout,
    documents: testDocList
});

//<!-- mockup : list of projects -->

var testProjects = [
        testProject, // already set these
        {
            id: 23, name: 'Rec Center', taskCount: 12,
            status: 'In Progress', percentComplete: '15%',
            budget: 22, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        },
        {
            id: 23, name: 'Site Work', taskCount: 12,
            status: 'In Progress', percentComplete: '80%',
            budget: 60, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            budgetBreakout: testbudgetBreakout,
        documents: testDocList
        },
        {
            id: 23, name: 'Accessibility Improvements', 
            status: 'In Planning', percentComplete: '0%',
            budget: 120, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            taskCount: 6,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        },
        {
            id: 23, name: 'Firestation #5 Rehab', 
            status: 'In Progress', percentComplete: '66%',
            budget: 22, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            taskCount: 6,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        },
        {
            id: 23, name: 'Furniture Upgrade', taskCount: 8,
            status: 'Complete', percentComplete: '100%',
            budget: 60, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        },
        {
            id: 23, name: 'Playground Improvements', taskCount: 6,
            status: 'In Planning', percentComplete: '65%',
            budget: 120, priority: '1-High',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        },
        {
            id: 23, name: 'County Roof Rehab', taskCount: 14,
            status: 'In Progress', percentComplete: '30%',
            budget: 22, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        },
        {
            id: 23, name: 'Pedestrian Paving Repairs', taskCount: 9,
            status: 'In Progress', percentComplete: '50%',
            budget: 60, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        },
        {
            id: 23, name: 'Energy Savings', taskCount: 12,
            status: 'In Planning', percentComplete: '0%',
            budget: 120, priority: '2-Medium',
            description: '',
            defaultPhoto: '',
            tasks: testTasks,
            budgetBreakout: testbudgetBreakout,
            documents: testDocList
        }

];
