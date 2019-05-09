library(shiny)
library(ggplot2)
library(tidyverse)

# ricedata <- read_csv("Rice_44K_genotypes.csv.gz",na=c("NA","00")) %>%
#   select(-`6_17160794_1`)
# colnames(ricedata)[1] <- "ID"

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
    pl <- ggplot(data = gather(iris, key= "key", value = "value", Sepal.Length,Sepal.Width,Petal.Length,Petal.Width) %>%
                                 filter(Species == input$species),
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes(x=key,y=value))
                 #Sepal.Length,Sepal.Width,Petal.Length,Petal.Width

    
    # draw the boxplot for the specified species
    pl + geom_boxplot()
  })
})




