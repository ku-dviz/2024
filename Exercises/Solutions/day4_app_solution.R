library(ggplot2)
library(plotly)
library(shiny)

source("../config.R")

df <- read.csv("../../data/Malaria_Dataset_DataViz.csv")

df$mtsi <- df$mosquito_temperature_suitability_index / 1000

# All unique countries
unique_countries <- sort(unique(df$country))

server <- function(input, output) {
  country <- reactive({
    input$country
  })

  sub_df <- reactive({
    df |> filter(country == country())
  })

  # Get mean and SD of PfPr grouped by year
  sub_df_pfpr_stats <- reactive({
    sub_df() %>%
      group_by(year) %>%
      summarise(PfPr_mean = mean(PfPr), PfPr_sd = sd(PfPr))
  })

  output$plot <- renderPlotly({
    fig1 <- ggplot(sub_df(), aes(x = year, fill = method)) +
      geom_bar() +
      theme_minimal() +
      scale_fill_manual(values = colourblind) +
      labs(
        x = "Year",
        y = "# Surveys"
      )

    fig2 <- ggplot(data = sub_df_pfpr_stats()) +
      geom_point(aes(x = year, y = PfPr_mean)) +
      geom_line(aes(x = year, y = PfPr_mean)) +
      geom_errorbar(
        aes(x = year, ymin = PfPr_mean - PfPr_sd, ymax = PfPr_mean + PfPr_sd),
        width = 0.2
      ) +
      labs(
        x = "Year",
        y = "PfPr (%)"
      ) +
      theme_minimal()

    fig3 <- ggplot(sub_df() %>% filter(rural_urban != ""), aes(x = PfPr, color = rural_urban)) +
      geom_density(aes(y = after_stat(scaled))) +
      theme_minimal() +
      labs(
        y = "Density",
        x = "PfPr (%)",
      )

    fig4 <- ggplot(sub_df(), aes(x = elevation, y = precipitation, colour = mtsi)) +
      geom_point() +
      theme_minimal() +
      scale_colour_distiller(palette = "Purples", direction = 1) +
      labs(
        y = "Precipitation [mm]",
        x = "Elevation [m]",
      )

    m <- list(
      l = 50L,
      r = 50L,
      b = 100L,
      t = 100L,
      pad = 4L
    )

    size <- 800L

    plotly_fig <- subplot(
      ggplotly(fig1, width = size, height = size),
      ggplotly(fig2, width = size, height = size),
      ggplotly(fig3, width = size, height = size),
      ggplotly(fig4, width = size, height = size),
      nrows = 2,
      titleX = TRUE,
      titleY = TRUE,
      margin = 0.1
    )

    plotly_fig |> layout(margin = m)
  })
}

ui <- fluidPage(

  # Give the page a title
  titlePanel("Exploring malaria survey data from African countries"),

  # Generate a row with a sidebar
  sidebarLayout(

    # Define the sidebar with one input
    sidebarPanel(
      # Selection input
      selectInput("country", "Country:",
        choices = unique_countries
      ),
      hr(),
      helpText("Select a country using the drop-down menu.")
    ),
    mainPanel(
      plotlyOutput("plot")
    )
  )
)

shinyApp(ui = ui, server = server)
