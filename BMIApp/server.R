library(shiny)

#calculate the BMI with weight in Kg and height in cm
calcBMI <- function (weightKg, heightCm){
    bmi <- NaN
    if (as.numeric(heightCm) > 0){
        bmi <- weightKg / (heightCm / 100)^2
    }
    bmi
}

#Get the BMI category from the BMI number
#BMI categories according to the WHO
#http://apps.who.int/bmi/index.jsp?introPage=intro_3.html
#accessed Nov 20, 2015
getBMICat <- function (bmi){
    bmiCat <- "N/A"
    if (bmi < 16){
        bmiCat <- "Severe thiness"
    } else if (bmi < 17) {
        bmiCat <- "Moderate thiness"
    } else if (bmi < 18.5) {
        bmiCat <- "Mild thiness"
    } else if (bmi < 25) {
        bmiCat <- "Normal"
    } else if (bmi < 30) {
        bmiCat <- "Overweight: Pre-obese"
    } else if (bmi < 35) {
        bmiCat <- "Obese Class I"
    } else if (bmi < 40) {
        bmiCat <- "Obese Class II"
    } else {
        bmiCat <- "Obese Class III"
    } 
    bmiCat
}

# Define server logic to output BMI and BMI category
shinyServer(function(input, output) {
    bmi <- reactive(calcBMI(input$weight, input$height))
    output$bmiNum <- renderText({
        input$okButton 
        isolate(bmi())
        })
    output$bmiCat <- renderText({
        input$okButton
        isolate(getBMICat(bmi()))
        })
})