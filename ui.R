library(shiny)
library(shinydashboard)
library(plotly)
library(DT)

shinyUI(
  dashboardPage(skin = "red",
                dashboardHeader(title = "Bharat Sharma",titleWidth = 180,dropdownMenu(type = "tasks", badgeStatus = "success",
                                                                                      taskItem(value = 20, color = "green",
                                                                                               "Documentation"
                                                                                      ),
                                                                                      taskItem(value = 60, color = "aqua",
                                                                                               "Project X"
                                                                                      ),
                                                                                      taskItem(value = 100, color = "yellow",
                                                                                               "Server deployment"
                                                                                      ),
                                                                                      taskItem(value = 70, color = "red",
                                                                                               "Overall project"
                                                                                      )
                ),
                dropdownMenu(type = "messages",
                             messageItem(
                               from = "New",
                               message = "Bharat Sharma"
                             ),
                             messageItem(
                               from = "New User",
                               message = "How do I used it DSS",
                               icon = icon("question"),
                               time = "13:45"
                             ),
                             messageItem(
                               from = "Support",
                               message = "The new server is ready.",
                               icon = icon("life-ring"),
                               time = "2014-12-01"
                             )
                ),
                dropdownMenu(type = "notifications",
                             notificationItem(
                               text = "Indian population grow rapidally",
                               icon("users")
                             ),
                             notificationItem(
                               text = "World GDP Here",
                               icon("truck"),
                               status = "success"
                             ),
                             notificationItem(
                               text = "Server load at 86%",
                               icon = icon("exclamation-triangle"),
                               status = "warning"
                             )
                )),
                dashboardSidebar( width = 180,
                                  sidebarMenu(
                                    menuItem("Dashboard",tabName = "dashboard",icon = icon("dashboard"),badgeLabel = "new",badgeColor = "green"),br(),
                                    menuItem("Country Data",tabName = "cdata",icon = icon("bar-chart")),br(),
                                    menuItem("Overview",tabName = "overview",icon = icon("industry")))
                                  ),
    
                
      dashboardBody(
         
        tabItems(
          tabItem(tabName = "dashboard",
                  fluidRow(
                    valueBox("133.92 crores (2017)","Indian Population",icon = icon("plane"),color = "red"),
                    valueBox("2.6 Lack crores USD","GDP",icon=icon("line-chart"),color = "green"),
                    valueBox("27.0 Years","Median Age",icon = icon("street-view"),color = "aqua")),
                  
                  fluidRow(
                    
                    box(plotlyOutput("line_graph"),DT::dataTableOutput("world_data"),title = "Population Forcast"
                        ,status = "warning",color='yellow'
                        ,solidHeader = TRUE 
                        
                        
                        
                        ,width = 13,collapsed = TRUE),
                    box(plotlyOutput("gdp_line"),status = "primary",title = "Indian GDP Rate from 2001",solidHeader = TRUE,width = 13,background = "red",collapsible = TRUE,collapsed = TRUE )                      
                  )),
          
          tabItem(tabName = "cdata",
                  fluidRow(
                    
                    box(plotlyOutput("bar"),status = "primary",title = "Gender Ratio",collapsible = TRUE,collapsed = TRUE,background = "maroon"),
                    box(plotlyOutput("pie"),status = "primary",title = "Male and Female Ratio in 2017",background = "maroon",solidHeader = TRUE,collapsible = TRUE,collapsed = TRUE),
                    
                    DT::dataTableOutput("population"),status = "primary",title = "Countrywise Population",collapsible = TRUE,options = list(
                      pageLength = 5))
                  
                  ),
          tabItem(tabName = "overview",
            tabsetPanel(type = "tab",
                        tabPanel(" Indian GDP Overview",
                                 box(DT::dataTableOutput("overview_gdp"),status = "warning",title = "Overview of country growth",solidHeader = TRUE,width = 13)),
                        tabPanel("Labour",
                                 box(DT::dataTableOutput("labour"),status = "primary",title = "Labour Overview in India",solidHeader = TRUE,width = 13)),
                        tabPanel("World GDP",
                                 box(DT::dataTableOutput("world_gdp"),status = "warning",title = "World GDP in USD Billion",solidHeader = TRUE,width = 13))
              
              
            )
          )
                  )
                 )
                  
                )
  
      )
                  
                 
