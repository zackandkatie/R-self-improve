# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/06
library("shiny")


#Define UI for dataset viewer app---

ui <- fluidPage(
  
  # App title ----
  titlePanel("Reactivity"),
  
  # Sidebar layout with input and output definitions ---
  sidebarLayout(
    
    # siderbar panel for inputs ---
    sidebarPanel(
      
      #Input: Text for providing a caption ---
      #Note: Changes made to the caption in the textInput control
      # are updated in the output area immediately as you type
      textInput(inputId = "caption",
                  label = "Caption:",
                  value = "Data Summary"),
      #Input: Selector for choosing dataset ---
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      #Input: Numeric entry for number of obs to view ---
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10)
    ),
    # Main panel for displaying outputs ---
    mainPanel(
      # Output: Formatted text for caption ----
      h3(textOutput("caption", container = span)),
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
      "cars" = cars
    )
  })
  
  ##Create caption---
  output$caption <- renderText({
    input$caption
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