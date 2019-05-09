library(shiny)
library(ggplot2)
library(tidyverse)

<<<<<<< HEAD
# ricedata <- read_csv("Rice_44K_genotypes.csv.gz",na=c("NA","00")) %>%
#   select(-`6_17160794_1`)
# colnames(ricedata)[1] <- "ID"
=======
ricedata <- read_csv("Rice_44K_genotypes.csv.gz",na=c("NA","00")) %>% 
  select(-`6_17160794_1`)
colnames(ricedata)[1] <- "ID"
>>>>>>> d63d23b928390d0fe4e66d1e9946f9ae0fe0be5a

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
                 #Use aes below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 
                 aes(x=xaxistrait, y=yaxistrait, color=colortrait))
                 #Sepal.Length,Sepal.Width,Petal.Length,Petal.Width
    
    
    

    # draw the scatter plot for the specified species
    pl + geom_point()
  })
})




