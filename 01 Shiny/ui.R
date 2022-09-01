# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/01

ui <- fluidPage(
  numericInput(inputId  = "n",
               "Sample size", value = 25),
  plotOutput(outputId = "hist")
)