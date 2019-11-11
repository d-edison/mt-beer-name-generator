
library(shiny)
library(shinythemes)

preds <- readRDS("predictions.rds")

# UI ----------------------------------------------------------------------

ui <- fluidPage(
    theme = shinytheme("cosmo"),
    titlePanel("MT Beer Name Generator"),
    sliderInput(
        "temp",
        "Outrageousness",
        value = 3,
        min = 1,
        max = 4,
        step = 1,
        width = "100%",
        ticks = FALSE
    ),
    actionButton("go", "Generate Name", width = "100%"),
    tags$br(),
    h2(textOutput("beer_name"))
)

# Server ------------------------------------------------------------------

server <- function(input, output) {
    bn <- eventReactive(input$go, {
        sample(preds[[as.numeric(input$temp)]], 1)
    })
    output$beer_name <- renderText(bn())
}

# Run App -----------------------------------------------------------------

shinyApp(ui = ui, server = server)
