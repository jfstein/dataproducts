library(shiny)
data(mtcars)

predictMPG <- function(horsepower,ismanual)  {
        m1 <- lm(mpg ~ hp+am,data=mtcars)
        predict(m1,newdata=data.frame(hp=horsepower,am=as.numeric(ismanual)))
        }

shinyServer(
        function(input, output) {
                output$inputValue <- renderPrint({input$horsepower})
                output$inputValue2 <- renderPrint({input$ismanual})
                output$prediction <- renderPrint({predictMPG(input$horsepower,input$ismanual)})
        }
)