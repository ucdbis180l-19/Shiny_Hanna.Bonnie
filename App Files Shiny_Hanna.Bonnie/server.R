library(shiny)
library(ggplot2)
library(tidyverse)

ricedata <- read_csv("RiceDiversity.44K.MSU6.Phenotypes.csv",na=c("NA","00"))
summary(ricedata)
ricedata <- ricedata[c("Seed length", "Seed width", "Seed volume", "Seed surface area", "Plant height")]

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

    ggplot(data = ricedata, aes_string(x=input$xaxistrait, y=input$yaxistrait, color=input$colortrait,size=I(input$slider)))+
      geom_point() +
      geom_text(aes(x=1,y=1), label="test")+
      if(input$checkbox==TRUE){geom_smooth(method = lm)}
  })
})




