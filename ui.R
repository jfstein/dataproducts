library(shiny)
shinyUI(
        pageWithSidebar(
        
        # Application Title
        headerPanel("MPG Prediction Based on the MTCARS Dataset"),
        
        sidebarPanel(
                h4('This Shiny application predicts fuel economy (in MPG) using horsepower and transmission type, based on the 1974 Motor Trend dataset mtcars.  The adjusted R-square of the model is approximately 0.77 and the p-values for each predictor are statistically significant at the 99% level.'),
                hr(),
                h4('Instructions: Select a value for horsepower and transmission type, then press Submit.'),
                numericInput('horsepower','Horsepower',100,min=50,max=300,step=5),
                selectInput("ismanual", "Transmission Type", 
                            choices = list("Manual" = 1, "Automatic" = 0), 
                            selected = 1),
                #checkboxGroupInput("ismanual","",c("Is Manual"="1"),selected="1"),
                submitButton('Submit')
        ),
        
        mainPanel(
                h3('Results of Prediction'),
                h4('You entered Horsepower:'),
                verbatimTextOutput("inputValue"),
                h4('You entered Transmission Type (1=Manual; 0=Automatic):'),
                verbatimTextOutput("inputValue2"),
                h4('Which resulted in a MPG prediction of:'),
                verbatimTextOutput("prediction")
        )
))