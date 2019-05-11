library(shiny)

# Define UI for application that draws a scatterplot
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Relationship between the phenotypes of 413 rice species"),
  
  # Some helpful information
  helpText("This application creates a scatterplot to show the relationship between",
           "quantitative phenotypes of 413 rice species. Please use the drop down menus below to choose",
           "three different traits for plotting. Use the slider to change the size of the data points and",
            "the check box to display the linear regression line."),
  
  # Sidebar with a select boxes to input which traits will be plotted, slide bar for size of the data points and check box for linear regression line.
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
      
      sliderInput("slider", "Size of the data points", min = 1, max = 3, value = 1),
      
      checkboxInput("checkbox", "Display linear regression line", value=FALSE)),
    mainPanel(plotOutput("scatterPlot")))))