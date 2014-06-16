library(shiny)
shinyUI(
        pageWithSidebar(
                #Application title
                headerPanel("Iris Prediction"),
                
                sidebarPanel(
                        numericInput('SL', 'Sepal length in cm', 0, min=0, max=10),
                        numericInput('SW', 'Sepal width in cm', 0, min=0, max=5),
                        numericInput('PL', 'Petal length in cm', 0, min=0, max=10),
                        numericInput('PW', 'Petal length in cm', 0, min=0, max=5),
                        submitButton('Submit')
                ),
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered'),
                        verbatimTextOutput("SL"),
                        verbatimTextOutput("SW"),
                        verbatimTextOutput("PL"),
                        verbatimTextOutput("PW"),
                        h4('Which resulted in a prediction of '),
                        verbatimTextOutput("prediction")
                )
        )
)