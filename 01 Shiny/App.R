# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/01

library("shiny")
ui <- fluidPage(
  numericInput(inputId  = "n",
               "Sample size", value = 25),
  plotOutput(outputId = "hist")
)

server <- function(input, output){
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}
shinyApp(ui = ui, server = server)