library(shiny)
library(ggplot2)
library(tidyverse)
<<<<<<< HEAD
devtools::install_github("UCDBIS180L/BIS180LTutorials") 
learnr::run_tutorial("Gather_And_Spread", package = "BIS180LTutorials") 
=======
>>>>>>> 96c982a11b5f6bdbedc430d66a0b9675c0378a03


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
<<<<<<< HEAD
    pl <- ggplot(data = filter(iris, Species==input$species),
                 #Use aes_string below so that input$species is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(y=gather(key = "Traits",value = "value", Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
                            iris
                 )
    )
=======
    pl <- ggplot(data = gather(iris, key= "key", value = "value", Sepal.Length,Sepal.Width,Petal.Length,Petal.Width) %>%
                                 filter(Species == input$species),
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes(x=key,y=value))
                 #Sepal.Length,Sepal.Width,Petal.Length,Petal.Width
     
>>>>>>> 96c982a11b5f6bdbedc430d66a0b9675c0378a03
    
    # draw the boxplot for the specified species
    pl + geom_boxplot()
  })
})




