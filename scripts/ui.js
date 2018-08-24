function NavModel() {
	const self = this;
	self.sections = ko.observableArray([
		"Plot", 
		"Section B", 
		"Section C"
	]);
	self.currentSection = ko.observable(self.sections()[0]);
	self.onClick = function(section) {
		self.currentSection(section);
	};
}

ko.applyBindings(new NavModel());