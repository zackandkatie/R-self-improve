# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/07
library("shiny")
library("datasets")


# Data pre-processing ---
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

#Define UI for dataset viewer app---

ui <- fluidPage(
  
  # App title ----
  titlePanel("Miles per Gallon"),
  
  # Sidebar layout with input and output definitions ---
  sidebarLayout(
    
    # siderbar panel for inputs ---
    sidebarPanel(
      

      #Input: Selector for variable to plot against mpg ---
      selectInput("variable",
                 "variable:",
                  c("Cylinders" = "cyl",
                    "Transmission" = "am", 
                    "Gears" = "gear")),
      #Input: Checkbox for whether outliers should be included ---
     checkboxInput(inputId = "outliers",
                   label = "Show outliers",
                   TRUE)
    ),
    # Main panel for displaying outputs ---
    mainPanel(
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      #Output:Plot of the requested variable against mpg ---
      plotOutput("mpgPlot")
    )
  )
)

# Define server logic to summarize and view selected datasets ---
server <- function(input, output){
  #Compute the formula text ----
  formulaText <- reactive({
    paste("mpg~", input$variable)
    
  })
  
  ##Return the formula text for printing as a caption---
  output$caption <- renderText({
    formulaText()
  })
  #Generate a plot of the requested variable against mpg---
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = mpgData,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })

}

#Create Shiny app
shinyApp(ui = ui, server = server)