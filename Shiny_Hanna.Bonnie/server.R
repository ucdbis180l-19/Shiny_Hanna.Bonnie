#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
devtools::install_github("UCDBIS180L/BIS180LTutorials") 
learnr::run_tutorial("Gather_And_Spread", package = "BIS180LTutorials") 


# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$boxPlot <- renderPlot({
    
    # set up the plot
    pl <- ggplot(data = filter(iris, Species==input$species),
                 #Use aes_string below so that input$species is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(y=gather(key = "Traits",value = "value", Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
                            iris
                 )
    )
    
    # draw the boxplot for the specified species
    pl + geom_boxplot()
  })
})




