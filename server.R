library(shiny)
library(shinydashboard)
library(plotly)
library(DT)
library(readxl)
shinyServer(function(input,output){
  
  
  output$line_graph <- renderPlotly({
    plot_ly(read_xlsx("bhara.xlsx"), x = ~year, y = ~male,name='male', type = 'scatter', mode = 'lines+markers')%>%
      add_trace(y = ~female, name = 'female',type='scatter', mode = 'lines+markers') %>%
      add_trace(y = ~total, name = 'total',type='scatter', mode = 'lines+markers')%>%
      layout(title = "Population Forcast",  xaxis=list(title="year"),yaxis=list(title="Population"))
  })
  
  
  output$gdp_line <- renderPlotly({
    plot_ly(read_xlsx("gdp.xlsx"),x = ~Year, y = ~ GDP,type = 'scatter', mode = 'line+markers') %>%
      layout(title = "Indian GDP Rate", annotations=~GDP)
  })
  output$pie <- renderPlotly({
    plot_ly(read_xlsx("male_female.xlsx"), labels = ~gender, values = ~count, type = 'pie', textposition = 'inside',
            textinfo = 'label+percent')
  })
  output$bar <- renderPlotly({
    plot_ly(read.csv("data.csv"), x = ~gender, y = ~count, type = 'bar', color = ~gender,orientation='v') %>%
      
      layout(autosize = F, width = 610, height = 400)
    
    
  })
  
  output$world_data <- DT::renderDataTable({
    
    DT::datatable(read.csv("ind.csv"), options = list(
      pageLength = 5) )
  })
  
  output$population <- DT::renderDataTable({
    DT::datatable(read_xlsx("population.xlsx"))
  })
  output$overview_gdp <- DT::renderDataTable({
    DT::datatable(read_xlsx("overview.xlsx"))
  })
  
  output$labour <- DT::renderDataTable({
    DT::datatable(read_xlsx("labour.xlsx"))
  })
  output$world_gdp <- DT::renderDataTable({
    DT::datatable(read_xlsx("world_gdp.xlsx"))
  })
})