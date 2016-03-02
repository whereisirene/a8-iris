# Read in data and packages
library(shiny)
library(plotly)
library(rsconnect)

shinyUI(fluidPage(
  #Create the title
  titlePanel("Iris Data Set"),
  
  #Create the sidebar for input
  sidebarLayout(
    sidebarPanel(
      
      #Create a filter to choose which species of flower
      selectInput("species", 
                  label = "Select Species of Flower",
                  choices = list("Setosa" = "setosa",
                                 "Versicolor" = "versicolor",
                                 "Virginica" = "virginica"),
                  selected = "setosa"),
      
      #Choose the x-axis of width of the filtered species
      radioButtons("width", label = "Select Width",
                   choices = list("Sepal Width" = "Sepal Width", 
                                  "Petal Width" = "Petal Width")),
      
      #Choose the y-axis of length of the filtered species
      radioButtons("length", 
                  label = "Select Length",
                  choices = list("Sepal Length" = "Sepal Length", 
                                 "Petal Length" = "Petal Length"))
    ),
    
    #Display the graph
    mainPanel(
      plotlyOutput('graph')
    )
  )
))
