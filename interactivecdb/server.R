#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/


# Define server logic required to draw a histogram
library(shiny)
library(DT)
library(shinydashboard)
library(plotly)
library(dplyr)

mergedf6.6$Offset.Project.Operator <- as.character(mergedf6.6$Offset.Project.Operator)
devnames <- unique(mergedf6.6$Offset.Project.Operator)
protnames <- unique(mergedf6.6$`Project Type`)
desnamesnames <- unique(mergedf6.6$`Offset Designation`)
vintnames <- unique(mergedf6.6$`Vintage Year`)

devnames <- sort(devnames)

shinyServer(function(input, output, session) {
  
  updateSelectizeInput(session, 'x',
                       choices = c("All", unique(mergedf6.6$`Project Type`)), selected = "All", 
                       server = TRUE
  )
  updateSelectizeInput(session, 'y',
                       choices = c("All", unique(mergedf6.6$`Offset Designation`)), selected = "All", 
                       server = TRUE
  )
  updateSelectizeInput(session, 'color',
                       choices = c("All", unique(mergedf6.6$`Vintage Year`)), selected = "All", 
                       server = TRUE)
  updateSelectizeInput(session, 'dev',
                       choices = c("All", devnames), selected = "All",
                       server = TRUE)
  
  
  getData <- reactive({
    mergedf6.6 %>% filter(Vintage.Year %in% input$color &
                            `Project Type` %in% input$x &
                            `Offset Designation` %in% input$y
                          & `Project Administrator` %in% input$dev)
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
      data <- data[data$`Vintage Year` %in% input$color,]
    }
    if (input$dev != "All") {
      data <- data[data$`Offset.Project.Operator` %in% input$dev,]
    }
   
    data$Website <- paste0('<a href="', data$Website,'">',data$Website,"</a>")
    
    data$`Offsets Issued` <- format(as.numeric(data$`Offsets Issued`), big.mark=",") 
    data$`Number of Offsets Unretired (Estimated as of 12/18)` <- format(as.numeric(data$`Number of Offsets Unretired (Estimated as of 12/18)`), big.mark=",") 
    
    data <- as.data.frame(data)
    data <- data[rev(order(data$`Issuance Date`)),] 
    
  }, escape = FALSE,  selection = 'multiple', filter ='top', rownames = FALSE,
  extensions = c('Buttons', 'Responsive'), options = list(initComplete = JS(
    "function(settings, json) {",
    "$('body').css({'font-family': 'Calibri'});",
    "}"
  ), autoWidth = TRUE,  pageLength = 10,
  lengthMenu = c(10, 20, 50), dom = 'Brtip', buttons = c('copy','excel', 'pdf', 'print'), rownames=FALSE,
  column = list(list(width = '150px', width = '50px'))))  %>% 
    DT::formatStyle(columns = c(1:13), fontSize = '75%'))
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(Combineddata, file)
    })
  output$trendPlot <- renderPlotly({
    data <- mergedf6.6
    if (input$y != "All") {
      data <- data[data$`Offset Designation` %in% input$y,]
    }
    if (input$x != "All") {
      data <- data[data$`Project Type` %in% input$x,]
    }
    if (input$color != "All") {
      data <- data[data$`Vintage Year` %in% input$color,]
    }
    if (input$dev != "All") {
      data <- data[data$`Offset.Project.Operator` %in% input$dev,]
    }
    data
    
    marker_style <- list(line = list(width = 5,
                                     color = 'rgb(0, 0, 0)'))
    
    data$Year <- year(data$`Issuance Date`)
    p <- plot_ly(data, x = data$Year, y = data$`Offsets Issued`, text= data$`Project Administrator`, 
                 hovertemplate = paste("<b>%{text}</b>"),  type = "bar", color =  ~data$`Project Type`, line = ~data$Project.Name) %>% 
      layout(yaxis = list(title = 'Offsets Issued (by year)'), barmode = 'stack') 
  })
})

names(mergedf6.6)
