# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/01

server <- function(input, output){
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}