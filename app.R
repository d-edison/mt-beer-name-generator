
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
    h2(textOutput("beer_name")),
    tags$br(),
    downloadButton("fl", "Export All Unique Names", style = "width:100%;")
)

# Server ------------------------------------------------------------------

server <- function(input, output) {
    bn <- eventReactive(input$go, {
        preds[[as.numeric(input$temp)]]
    })
    nm <- eventReactive(input$go, {
        paste0("Outrageous-", input$temp, ".txt")
    })
    output$beer_name <- renderText(sample(bn(), 1))
    output$fl <- downloadHandler(
        filename = function() {
            paste0("Outrageous-", input$temp, ".csv")
        },
        content = function(file) {
            readr::write_csv(
                tibble::tibble(`Beer Name` = sort(preds[[as.numeric(input$temp)]])), 
                file
            )
        }
    )
}

# Run App -----------------------------------------------------------------

shinyApp(ui = ui, server = server)
