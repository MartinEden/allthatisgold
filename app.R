#!/usr/bin/env Rscript
library(shiny)

ui <- fluidPage(
	includeCSS("style.css"),
	div(class="row align-items-center mb-3",
		div("All that is gold", class="header")
	),
	div(class="row main-content",
		div(class="col-md-3 col-lg-2 col-sm-12 sidebar nopadding",
			tags$ul(class="nav", `data-bind`="foreach: sections",
				tags$li(class="nav-item",
					a(class="nav-link", href="#", `data-bind`="text: $data, click: $parent.onClick, css: { active: $parent.currentSection() == $data }", "")
				)
			)
		),
		div(class="col-md-9",
			h1(`data-bind`="text: currentSection"),
			div(`data-bind`="visible: currentSection() == 'Plot'",
				sliderInput(inputId = "bins", label=NULL, min=1, max=50, value=30, width='100%'),
				plotOutput(outputId = "distPlot")
			),
			div(`data-bind`="visible: currentSection() == 'Section B'",
				div("Stuff in B")
			),
			div(`data-bind`="visible: currentSection() == 'Section C'",
				div("Stuff in C")
			)
		)
	),
	includeScript("scripts/knockout.js"),
	includeScript("scripts/ui.js")
)

server <- function(input, output) {
	output$distPlot <- renderPlot({
	    x    <- faithful$waiting
	    bins <- seq(min(x), max(x), length.out = input$bins + 1)

	    hist(x, breaks = bins, col = "#75AADB", border = "white",
	         xlab = "Waiting time to next eruption (in mins)",
	         main = "Histogram of waiting times")
    })
}

app <- shinyApp(ui = ui, server = server)
runApp(app, port=8080)