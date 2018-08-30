function NavModel() {
	const self = this;
	self.sections = ko.observableArray([
		"Survey data",
		"Model parameters",
		"Results"
	]);
	self.currentSection = ko.observable(self.sections()[0]);
	self.onClick = function(section) {
		self.currentSection(section);
	};
}

ko.applyBindings(new NavModel());