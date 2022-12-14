# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/02

library("shiny")

#Define UI for app that draws a histogram---

ui <- fluidPage(
  
  # App title ----
 titlePanel("Hello Shiny!"),
 
  # Sidebar layout with input and output definitions ---
 sidebarLayout(
   
   # siderbar panel for inputs ---
   sidebarPanel(
     
     #Input: Slider for the number of bins ---
     sliderInput(inputId = "bins",
                 label = "number of bins",
                 min = 1,
                 max = 50,
                 value = 30)
   ),
   # Main panel for displaying outputs ---
   mainPanel(
     
     #Output:Histgram ---
     plotOutput(outputId = "distPlot")
   )
 )
)

# Define server logic required to draw a histogram ---
server <- function(input, output){
  
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins+1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "waiting time to next eruption(in mins)",
         main= "Histogram of waiting times")
  })
}

#Create Shiny app
shinyApp(ui = ui, server = server)