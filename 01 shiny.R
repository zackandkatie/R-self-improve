# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/09/01


# #load packages -------------------------------------------------
pacman::p_load(
  skimr,
  flextable,
  readr,
  tidyverse,
  epikit,
  janitor,
  car,
  gt,
  gtsummary,
  here,
  DataExplorer,
  webshot,
  officer,
  officedown,
  rvg,
  mschart,
  shiny,
  openxlsx,
  bannerCommenter,
  ggpubr,
  pROC,
  lmtest
)

# #load packages -------------------------------------------------



##---------------------------------------------------------------
##                              01 Shiny                       -
##---------------------------------------------------------------

ui <- fluidPage(
  "Hello, world!"
)
server <- function(input, output, session) {
}
shinyApp(ui, server)

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)
server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}
shinyApp(ui, server)