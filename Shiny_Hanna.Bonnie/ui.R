
library(shiny)

# ricedata <- read_csv("Rice_44K_genotypes.csv.gz",na=c("NA","00")) %>%
#   select(-`6_17160794_1`)
# colnames(ricedata)[1] <- "ID"

#`Seed length` <dbl>, `Seed width` <dbl>, `Seed volume` <dbl>, `Seed surface area`, Plant
## #   height

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
      selectInput("xaxistrait", #the input variable that the value will go into
                   "Choose a trait to display:",
                   c("Seed length","Seed width","Seed volume", "Seed surface area", "Plant Height")),
      selectInput("yaxistrait", #the input variable that the value will go into
                "Choose a trait to display:",
                c("Seed length","Seed width","Seed volume", "Seed surface area", "Plant Height")),
      selectInput("colortrait", #the input variable that the value will go into
              "Choose a trait to display:",
              c("Seed length","Seed width","Seed volume", "Seed surface area", "Plant Height"))
    
    # Show a plot of the generated distribution
    ),
    mainPanel(plotOutput("boxPlot"))
)))