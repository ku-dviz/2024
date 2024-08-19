library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)

df <- read.csv("../../data/Malaria_Dataset_DataViz.csv")

df$mtsi <- df$mosquito_temperature_suitability_index / 1000

# All unique countries
unique_countries <- sort(unique(df$country))

ui <- fluidPage(
  # ////////////////////////////////////////////////////////////
  #                      Exercise 2.1 CODE HERE
  # ////////////////////////////////////////////////////////////
)

server <- function(input, output) {
  # ////////////////////////////////////////////////////////////
  #                      Exercise 2.2 CODE HERE
  # ////////////////////////////////////////////////////////////

  output$plot <- renderPlotly({
    plotly_empty()

    # ////////////////////////////////////////////////////////////
    #                    Exercise 2.3 HERE
    # ////////////////////////////////////////////////////////////
  })
}

shinyApp(ui = ui, server = server)
