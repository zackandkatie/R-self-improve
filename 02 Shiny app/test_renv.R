# #Project:R-self-improve
# #Author:Zack
# #File description:To learn some new packages and do some little projects
# #Date:2022/10/09
library("shiny")
pacman::p_load("bannerCommenter", "renv")


##----------------------------------------------------------------
##                              Basic example                             -
##----------------------------------------------------------------

runApp('02 Shiny app')

renv::history()
renv::activate()
renv::snapshot()
