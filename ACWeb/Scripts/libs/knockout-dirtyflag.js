/*
    From Knock Me Out:
    http://www.knockmeout.net/2011/05/creating-smart-dirty-flag-in-knockoutjs.html
*/
ko.dirtyFlag = function (root, isInitiallyDirty) {
    var debug = true;

    var result = function () { };
    var _initialState = ko.observable(ko.toJSON(root));
    var _isInitiallyDirty = ko.observable(isInitiallyDirty);

    result.isDirty = ko.computed(function () {
        if (debug) {
            console.log('initial state:');
            console.log(_initialState());
            console.log('currentstate:')
            console.log(ko.toJSON(root));
        }
        return _isInitiallyDirty() || _initialState() != ko.toJSON(root);
    });

    result.reset = function () {
        _initialState(ko.toJSON(root));
        _isInitiallyDirty(false);
    };

    return result;
};