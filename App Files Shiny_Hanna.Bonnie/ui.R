
library(shiny)



# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Iris Data"),
  
  # Some helpful information
  helpText("This application creates a boxplot to show difference between",
           "iris traits  Please use the radio box below to choose a species",
           "for plotting"),
  
  # Sidebar with a radio box to input which species will be plotted
  sidebarLayout(
    sidebarPanel(
      selectInput("xaxistrait", 
                   "Choose a x-axis trait to display:",
                  c("`Seed length`","`Seed width`","`Seed volume`", "`Seed surface area`", "`Plant height`")),
      selectInput("yaxistrait", 
                "Choose a y-axis trait to display:",
                c("`Seed length`","`Seed width`","`Seed volume`", "`Seed surface area`", "`Plant height`")),
      selectInput("colortrait", 
              "Choose a third trait to display:",
              c("`Seed length`","`Seed width`","`Seed volume`", "`Seed surface area`", "`Plant height`")),
      sliderInput("slider", "Size of dots", min = 1, max = 3, value = 1),
      checkboxInput("checkbox", "Display linear regression line", value=FALSE)),
    mainPanel(plotOutput("boxPlot")))))