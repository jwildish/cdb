#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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

mergedf6.6<-read.csv("./interactivecdb/Data/mergedf6.6.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    updateSelectizeInput(session, 'x',
                         choices = c("All", protnames), selected = "All",
                         server = TRUE
    )
    updateSelectizeInput(session, 'y',
                         choices = c("All", desnamesnames), selected = "All",
                         server = TRUE
    )
    updateSelectizeInput(session, 'color',
                         choices = c("All", vintnames), selected = "All",
                         server = TRUE)
    updateSelectizeInput(session, 'dev',
                         choices = c("All", devnames), selected = "All",
                         server = TRUE)
    
    
    getData <- reactive({
        mergedf6.6 %>% filter(Vintage.Year %in% input$color &
                                  `Project Type` %in% input$x &
                                  `Offset Designation` %in% input$y
                              & `Offset.Project Operator` %in% input$dev)
    })
    
    output$mytable <- DT::renderDataTable(DT::datatable({
        data <- mergedf6.6
        if (input$y != "All") {
            data <- data[data$`Offset Designation` %in% input$y,]
        }
        if (input$x != "All") {
            data <- data[data$`Project Type` %in% input$x,]
        }
        if (input$color != "All") {
            data <- data[data$Vintage.Year %in% input$color,]
        }
        if (input$dev != "All") {
            data <- data[data$`Offset.Project Operator` %in% input$dev,]
        }
        data
    }, escape = FALSE,  selection = 'multiple', filter ='top',extensions = 'Buttons', options = list(
        searching = TRUE,
        ordering = TRUE,
        filter = 'top',
        selection ='multiple',
        dom = 'Bfrtip',
        buttons = c('copy', 'csv', 'excel')
    ), class = 'display'
    ))
    output$downloadData <- downloadHandler(
        filename = function() {
            paste("data", Sys.Date(), ".csv", sep="")
        },
        content = function(file) {
            write.csv(Combineddata, file)
        })
})