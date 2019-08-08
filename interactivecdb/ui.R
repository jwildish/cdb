#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(dplyr)
library(readxl)
library(DT)
library(shiny)
library(shinydashboard)
library(plotly)
library(ggplot2)
library(lubridate)
#
library(shiny)
library(DT)
library(shinydashboard)
library(plotly)
library(dplyr)
library(RCurl)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    headerPanel(title = "Regulatory Carbon Offset Database"), 
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
                     
    ), tabsetPanel(type = "tabs",
                        tabPanel("Table", DT::dataTableOutput("mytable")%>% withSpinner(color="#0dc5c1")),
                        tabPanel("Graph", plotlyOutput("trendPlot")),
                        tabPanel("Map", br(), br(), plotlyOutput("mapPlot"))))
    )
