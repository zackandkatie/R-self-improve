# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/04
library("shiny")
library("openxlsx")

#Define UI for dataset viewer app---

ui <- fluidPage(
  
  # App title ----
  titlePanel("Shiny Text"),
  
  # Sidebar layout with input and output definitions ---
  sidebarLayout(
    
    # siderbar panel for inputs ---
    sidebarPanel(
      
      #Input: Selector for choosing dataset ---
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("rock", "pressure", "cars", "Raw")),
      #Input: Numeric entry for number of obs to view ---
      numericInput(inputId = "obs",
                  label = "Number of observations to view:",
                  value = 10)
    ),
    # Main panel for displaying outputs ---
    mainPanel(
      
      #Output:Verbayim text for data summary ---
      verbatimTextOutput("summary"),
      #Output:HTML table with requested number of observations ---
      tableOutput("view")
    )
  )
)

# Define server logic to summarize and view selected datasets ---
server <- function(input, output){
  #Rreturn the requested dataset ----
  datasetInput <- reactive({
    switch(
      input$dataset,
      "rock" = rock,
      "pressure" = pressure,
      "cars" = cars,
      "Raw" = Raw
    )
  })
  #Generate a summary of the dataset---
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  #Show the first "n" obs---
  output$view <- renderTable({
    head(datasetInput(),n = input$obs)
  })
}

#Create Shiny app
shinyApp(ui = ui, server = server)