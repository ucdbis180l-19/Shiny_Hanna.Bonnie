library(shiny)
library(ggplot2)
library(tidyverse)

ricedata <- read_csv("RiceDiversity.44K.MSU6.Phenotypes.csv",na=c("NA","00"))
summary(ricedata)
ricedata <- ricedata[c("Seed length", "Seed width", "Seed volume", "Seed surface area", "Plant height")]

# Define server logic required to draw a scatterplot
shinyServer(function(input, output) {
  
  output$scatterPlot <- renderPlot({

    ggplot(data = ricedata, aes_string(x=input$xaxistrait, y=input$yaxistrait, color=input$colortrait, size=I(input$slider)))+
      #make a scatterplot
      geom_point() +
      #if user checks the box, then display the linear regression line
      if(input$checkbox==TRUE){geom_smooth(method = lm)}
  }) 
})




