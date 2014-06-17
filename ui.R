library(shiny)
shinyUI(
        fluidPage(
                #Application title
                titlePanel("Iris Classification"),
                p('This app helps you to predict the classification of an Iris specie.For classification, the iris data set is used. The app predicts the specie from a given width and length measures of sepals and petals'),
                p('Random Forest is used in order to predict the classification'),
                br(),
                
                sidebarPanel(
                        p('Please enter below your meassurments (use up to one decimal place)'),
                        p('After entering your measurement please press submit button below'),
                        numericInput('SL', 'Sepal length in cm', 0, min=0, max=10, step=0.1),
                        numericInput('SW', 'Sepal width in cm', 0, min=0, max=5, step=0.1),
                        numericInput('PL', 'Petal length in cm', 0, min=0, max=10, step=0.1),
                        numericInput('PW', 'Petal length in cm', 0, min=0, max=5, step=0.1),
                        submitButton('Submit'),
                        p('If you wish to see the R code or any further information, please visit this ', a("Link", href="https://github.com/letirodribrey/ShinyApp"))
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