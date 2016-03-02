library(plotly)
library(shiny)
library(dplyr)
library(rsconnect)
data <- iris

shinyServer(function(input, output) {
  #Create an adjustable histogram
  output$graph <- renderPlotly({
    
    #Change the data with the user's choice of species
    data_species <- switch(input$species, 
                           "setosa" = filter(data, Species == "setosa"),
                           "versicolor" = filter(data, Species == "versicolor"),
                           "virginica" = filter(data, Species == "virginica"))
    
    
    #Select the width column
    width <- switch(input$width, 
                    "Sepal Width" = data_species$Sepal.Width,
                    "Petal Width" = data$Petal.Width)
    
    #Select the length column
    length <- switch(input$length, 
                    "Sepal Length" = data_species$Sepal.Length,
                    "Petal Length" = data$Petal.Length)
    
    #Create the graph that adjusts its labels and shows the area information when hovering over the columns.
    plot_ly(x = width, y = length,
            text = paste('Total Area: ', length * width),
            name = "Flower Graph",
            type = "bar") %>%  
     layout(title = paste0("Length and Width of ", input$species), 
            xaxis = list(title = input$width),
            yaxis = list(title = input$length))
    
  })
}
)