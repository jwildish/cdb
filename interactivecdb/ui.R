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

head
# Define UI for application that draws a histogram
shinyUI(fluidPage(
    headerPanel(title = "Offset Database"), 
    fluidRow(column(3, selectizeInput('x', label = 'Project Type',
                                    choices = c("All", protnames))),
                     column(3, selectizeInput('y', label = 'Offset Designation', 
                                    choices = c("All", desnamesnames))),
                    column(3, selectizeInput("color", label = "Vintage Year", 
                                    choices = c("All", vintnames),
                                    selected = "All")),
                   column(3, selectizeInput("dev", label = "Project Developer", 
                                    choices = c("All", devnames),
                                    selected = "All"))
                     
    ),
    (DT::dataTableOutput("mytable"))
    ))
