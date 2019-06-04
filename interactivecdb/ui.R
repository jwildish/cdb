#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(shinydashboard)
library(plotly)
library(dplyr)


# Define UI for application that draws a histogram
shinyUI(dashboardPage(
    dashboardHeader(title = "Emissions Reductions, by Digester Type "),
    dashboardSidebar(selectizeInput('x', label = 'Project Type',
                                    choices = c("All", protnames)),
                     selectizeInput('y', label = 'Offset Designation', 
                                    choices = c("All", desnamesnames)),
                     selectizeInput("color", label = "Vintage Year", 
                                    choices = c("All", vintnames),
                                    selected = "All"),
                     selectizeInput("dev", label = "Project Developer", 
                                    choices = c("All", devnames),
                                    selected = "All")
                     
    ),
    dashboardBody(box(DT::dataTableOutput("mytable"), width = 12)
    )
))