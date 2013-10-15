
var dummyAttachmentSet1 = [
	new Attachment({ path: '../tmp/', filename: 'image1.jpg', description: 'A sample photo', type: 'Photo' }),
	new Attachment({ path: '../tmp/', filename: 'image2.jpg', description: 'Another sample photo', type: 'Photo' }),
	new Attachment({ path: '../tmp/', filename: 'contract.pdf', description: 'Signed contract', type: 'PDF' })
];

var dummyMarkupTemplates = [
	new MarkupTemplate({ category: 'Staff Salaries', name: 'Project Manager', isDefault: false, defaultValue: 8.00, type: '%'}),
	new MarkupTemplate({ category: 'Staff Salaries', name: 'Agency', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({
		category: 'Staff Salaries', name: 'Construction Manager', isDefault: true, defaultValue: 8.00, type: '%',
		ui: { uiChecked: true }
	}),
	new MarkupTemplate({ category: 'Architect', name: 'Arch. Base Fee', isDefault: false, defaultValue: 10.00, type: '%' }),
	new MarkupTemplate({ category: 'Architect', name: 'Arch Contingency', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'Commissioning', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'Peer Review', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'Third Party Inspection', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'FF&E/Signage', isDefault: false, defaultValue: 5.00, isFixed: false, type: '%' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'Security', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'IT/Telecoms', isDefault: true, defaultValue: 1500.00, type: '$' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'Audio-Visual', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'Public Art', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: '', isDefault: false, defaultValue: 5.00, type: '%' }),

];

var dummyBreakoutSet = [
	new BreakoutTemplate({
		name: 'Scope of Work',
		categories: [
			new BreakoutCategory({ name: 'Catch-up', dollarVal: 5000, color: colorArray[0] }),
			new BreakoutCategory({ name: 'Keep-up', dollarVal: 4000, color: colorArray[1] }),
			new BreakoutCategory({ name: 'Alterations', dollarVal: 13000, color: colorArray[2] })
		]
	}),
	new BreakoutTemplate({
		name: 'Funding Source',
		categories: [
			new BreakoutCategory({ name: 'Pay-Go', dollarVal: 500, color: colorArray[3] }),
			new BreakoutCategory({ name: 'Bond', dollarVal: 11000, color: colorArray[4] }),
			new BreakoutCategory({ name: 'Operations', dollarVal: 3000, color: colorArray[5] })
		]
	})
];


var dummyBreakoutSet2 = [
	new BreakoutTemplate({
	    name: 'Scope of Work',
	    categories: [
			new BreakoutCategory({ name: 'Catch-up', dollarVal: 20000, color: colorArray[0] }),
			new BreakoutCategory({ name: 'Keep-up', dollarVal: 13000, color: colorArray[1] }),
			new BreakoutCategory({ name: 'Alterations', dollarVal: 1000, color: colorArray[2] })
	    ]
	}),
	new BreakoutTemplate({
	    name: 'Funding Source',
	    categories: [
			new BreakoutCategory({ name: 'Pay-Go', dollarVal: 10000, color: colorArray[3] }),
			new BreakoutCategory({ name: 'Bond', dollarVal: 30000, color: colorArray[4] }),
			new BreakoutCategory({ name: 'Operations', dollarVal: 50000, color: colorArray[5] })
	    ]
	})
];

function emptyBreakoutSet () {
    var x = 
    [
        new BreakoutTemplate({
        name: 'Scope of Work',
        categories: [
			new BreakoutCategory({ name: 'Catch-up', dollarVal: 0, color: colorArray[0] }),
			new BreakoutCategory({ name: 'Keep-up', dollarVal: 0, color: colorArray[1] }),
			new BreakoutCategory({ name: 'Alterations', dollarVal: 0, color: colorArray[2] })
        ]
    }),
	new BreakoutTemplate({
	    name: 'Funding Source',
	    categories: [
			new BreakoutCategory({ name: 'Pay-Go', dollarVal: 0, color: colorArray[2] }),
			new BreakoutCategory({ name: 'Bond', dollarVal: 0, color: colorArray[3] }),
			new BreakoutCategory({ name: 'Operations', dollarVal: 0, color: colorArray[4] })
	    ]
	})
    ];
    console.log(x);
    console.log(dummyBreakoutSet2);
    return x;
}

function emptyMarkupSet() {
    return [
	new MarkupTemplate({ category: 'Staff Salaries', name: 'Project Manager', isDefault: false, defaultValue: 8.00, type: '%' }),
	new MarkupTemplate({ category: 'Staff Salaries', name: 'Agency', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({
	    category: 'Staff Salaries', name: 'Construction Manager', isDefault: true, defaultValue: 8.00, type: '%',
	    ui: { uiChecked: true }
	}),
	new MarkupTemplate({ category: 'Architect', name: 'Arch. Base Fee', isDefault: false, defaultValue: 10.00, type: '%' }),
	new MarkupTemplate({ category: 'Architect', name: 'Arch Contingency', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'Commissioning', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'Peer Review', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'Third Party Inspection', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: 'FF&E/Signage', isDefault: false, defaultValue: 5.00, isFixed: false, type: '%' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'Security', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'IT/Telecoms', isDefault: true, defaultValue: 1500.00, type: '$' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'Audio-Visual', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'County Infrastructure', name: 'Public Art', isDefault: false, defaultValue: 5.00, type: '%' }),
	new MarkupTemplate({ category: 'Other', name: '', isDefault: false, defaultValue: 5.00, type: '%' }),
    ];
}



var dummyBreakoutSet3 = [
	new BreakoutTemplate({
	    name: 'Scope of Work',
	    categories: [
			new BreakoutCategory({ name: 'Catch-up', dollarVal: 25000, color: colorArray[0] }),
			new BreakoutCategory({ name: 'Keep-up', dollarVal: 60000, color: colorArray[1] }),
			new BreakoutCategory({ name: 'Alterations', dollarVal: 33000, color: colorArray[2] })
	    ]
	}),
	new BreakoutTemplate({
	    name: 'Funding Source',
	    categories: [
			new BreakoutCategory({ name: 'Pay-Go', dollarVal: 110000, color: colorArray[3] }),
			new BreakoutCategory({ name: 'Bond', dollarVal: 30000, color: colorArray[4] }),
			new BreakoutCategory({ name: 'Operations', dollarVal: 100000, color: colorArray[5] })
	    ]
	})
];



var dummyExpenditureSet1 = [
	new Expenditure({ name: 'Upfront Payment', dollarVal: 5000, date: '4/1/2013' }),
	new Expenditure({ name: 'Permit fees', dollarVal: 150, date: '4/9/2013' }),
	new Expenditure({ name: 'Fees to architect', dollarVal: 250, date: '4/11/2013' }),
	new Expenditure({ name: 'Second installment', dollarVal: 5000, date: '5/1/2013' }),
];


var dummyExpenditureSet2 = [
	new Expenditure({ name: 'Upfront Payment', dollarVal: 2000, date: '4/1/2013' }),
	new Expenditure({ name: 'Permit fees', dollarVal: 1500, date: '4/9/2013' }),
	new Expenditure({ name: 'A/V installation', dollarVal: 1250, date: '4/11/2013' }),
	new Expenditure({ name: 'Second installment', dollarVal: 2305, date: '5/1/2013' }),
];

var dummyExpenditureSet3 = [
	new Expenditure({ name: 'Upfront Payment', dollarVal: 2000, date: '4/1/2013' }),
	new Expenditure({ name: 'Permit fees', dollarVal: 15000, date: '4/9/2013' }),
	new Expenditure({ name: 'A/V installation', dollarVal: 12500, date: '4/11/2013' }),
	new Expenditure({ name: 'Second installment', dollarVal: 2305, date: '5/1/2013' }),
];


var dummyProjectSet = [
	new Project({
		name: 'Woodmont Center - Roof Replacement',
		identifier: 'P001',
		baseCost: 300000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet3,
		status: statusArray[2],
		expenditures: dummyExpenditureSet1
	}),
	new Project({
		name: 'Argus House - Paint Interior Walls - Drywall',
		identifier: 'P002',
		baseCost: 18000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet,
		status: statusArray[4]
	}),
	new Project({
		name: 'WETA - replace various HVAC equiptment',
		identifier: 'P003',
		baseCost: 390000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet3,
		status: statusArray[3],
		expenditures: dummyExpenditureSet2
	}),
	new Project({
		name: 'WETA - replace plexiglass skylight',
		identifier: 'P004',
		baseCost: 31877,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet,
		status: statusArray[2]
	}),
	new Project({
		name: 'Independence House - point brick wall first floor',
		identifier: 'P005',
		baseCost: 21000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet,
		status: statusArray[0]
	}),
	new Project({
		name: 'Community Residences - Replace wooden fence',
		identifier: 'P011',
		baseCost: 29000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet,
		status: statusArray[2],
		expenditures: dummyExpenditureSet1
	}),
	new Project({
		name: 'Long Branch Nature Center - Replace sheet vinyl',
		identifier: 'P012',
		baseCost: 51000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet2,
		status: statusArray[4],
		expenditures: dummyExpenditureSet3
	}),
	new Project({
		name: 'Glen Carlyn Branch Library - Mill asphalt and overlay',
		identifier: 'P013',
		baseCost: 39000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet2,
		status: statusArray[3],
		expenditures: dummyExpenditureSet2
	}),
	new Project({
		name: 'Lee Community Center - Replace fire alarm system',
		identifier: 'P0014',
		baseCost: 75000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet,
		status: statusArray[2]
	}),
	new Project({
		name: 'Detention Facility - replace drinking fountain',
		identifier: 'P0015',
		baseCost: 18000,
		markupTemplates: dummyMarkupTemplates,
		baseContingency: 10,
		projectContingency: 10,
		breakouts: dummyBreakoutSet2,
		status: statusArray[0]
	})
];


var dummyExpenditureSet3 = [
	new Expenditure({ name: 'Upfront Payment', dollarVal: 2000, date: '4/1/2013' }),
	new Expenditure({ name: 'Permit fees', dollarVal: 1500, date: '4/9/2013' }),
	new Expenditure({ name: 'A/V installation', dollarVal: 1250, date: '4/11/2013' }),
	new Expenditure({ name: 'Second installment', dollarVal: 2305, date: '5/1/2013' }),
];

var dummyProjectSet2 = [
    new Project({
        name: 'Detention Facility - replace drinking fountain',
        identifier: 'P0015',
        baseCost: 18000,
        markupTemplates: dummyMarkupTemplates,
        baseContingency: 10,
        projectContingency: 10,
        breakouts: dummyBreakoutSet2,
        status: statusArray[0],
        expenditures: dummyExpenditureSet3
    })];

var dummyPlanSet = [
    new Plan({
        name: 'Fiscal Year 2014 Plan',
        identifier: 'FY14',
        summary: 'A modest proposal for the 2014 fiscal year.',
        description: 'Capital improvements to libraries, fire stations and courthouses. ' +
            'More repairs to public walkways and infrastructure. Some other details here other details here other details here other details here other details here. Some other details here other details here other details here other details here other details here.' +
            'More repairs to public walkways and infrastructure. Some other details here other details here other details here other details here other details here. Some other details here other details here other details here other details here other details here.',
        fiscalYear: 2014,
        startDate: '2013-07-01',
        endDate: '2014-06-30',
        contact: 'Joe Scala',
        notes: 'More repairs to public walkways and infrastructure. Some other details here other details here other details here other details here other details here.',
        exceptions: 'Some other details here other details here other details here other details here other details here.',
        projects: dummyProjectSet,
    }),
	new Plan({ name: 'Fiscal Year 2015 Plan' }),
	new Plan({ name: 'Fiscal Year 2016 Plan' }),
	new Plan({ name: 'Test Plan 1' }),
    new Plan({
        name: 'Another Test Plan', identifier: 'FY14',
        projects: dummyProjectSet2,
    }),
	//new Plan({ name: 'Test Plan 2' }),
//	dummyPlan1
];

var testSearchResults = [
    { id: 10, rul: 7, site: 'Firehouse 1', category: 'Interiors', priority: '3-Lowest', cost: 10000, name: 'Replace office furniture' },
    { id: 9, rul: 4, site: 'Carlin Hall', category: 'Interiors', priority: '2-Medium', cost: 5510, name: 'Interior painting' },
    { id: 3, rul: 0, site: 'Firehouse 2', category: 'Roofing', priority: '1-Highest', cost: 300000, name: 'Roof replacement' },
    { id: 223, rul: 1, site: 'Firehouse 4', category: 'Mechanical', priority: '3-Lowest', cost: 15000, name: 'Replace 100kw roof unit' },
    { id: 3345, rul: 5, site: 'Carlin Hall', category: 'Roofing', priority: '1-highest', cost: 33400, name: 'Roof replacement' },
    { id: 334, rul: 1, site: 'Firehouse 3', category: 'mechanical', priority: '1-highest', cost: 12340, name: 'Boiler install' },
    { id: 24, rul: 3, site: 'Firehouse 5', category: 'Exterior', priority: '3-Lowest', cost: 9900, name: 'Sidewalk repair' },
    { id: 32, rul: 2, site: 'Detention Center', category: 'Exterior', priority: '1-highest', cost: 2045, name: 'Asphalt Paving' },
    { id: 99, rul: 0, site: 'Firehouse 1', category: 'Mechanical', priority: '3-Lowest', cost: 3603, name: 'A/C Upgrade' },
    { id: 258, rul: 0, site: 'Carlin Hall', category: 'Exterior', priority: '2-Medium', cost: 22003, name: 'Repoint brick' },
    { id: 112, rul: 1, site: 'Firehouse 2', category: 'Exterior', priority: '3-Lowest', cost: 2400, name: 'Window replacement' },
    { id: 101, rul: 3, site: 'Detention Center', category: 'Interiors', priority: '3-Lowest', cost: 43400, name: 'Carpet' },
];
