
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinyjs)

shinyUI(pageWithSidebar(
  headerPanel("Title"),
  sidebarPanel( 
    fileInput('file1', 'Choose CSV File',accept=
                c('text/csv', 
                'text/comma-separated-values,text/plain', 
                '.csv')),
    tags$hr(),
    checkboxInput('header', 'Header', TRUE),
    radioButtons('sep', 'Separator',
                 c(Comma=',',
                   Semicolon=';',
                   Tab='\t'),
                 ','),
    radioButtons('quote', 'Quote',
                 c(None='',
                   'Double Quote'='"',
                   'Single Quote'="'"),
                 '"')
  ),
  mainPanel()
))
