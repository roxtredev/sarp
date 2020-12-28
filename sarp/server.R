library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {

    # Applying filters

    output$table <- renderDataTable({

        hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
        avg_sq <- seq(from = input$avg[1], to = input$avg[2], by = .1)
        q_sec <- seq(from = input$qsec[1], to = input$qsec[2], by = .1)

        dataCars <- transmute(mtcars,
                          Car = rownames(mtcars),
                          Milage = mpg,
                          Cylinders = cyl,
                          Horsepower = hp,
                          Transmission = am,
                          Carb=carb,
                          Quater_Mile_Time= qsec)

        dataCars <- filter(dataCars,
                       Milage %in% avg_sq,
                       Cylinders %in% input$cyl,
                       Horsepower %in% hp_seq,
                       Quater_Mile_Time %in% q_sec,
                       Transmission %in% input$am,
                       Carb %in% input$carb)

        dataCars <- mutate(dataCars,
                       Transmission = ifelse(Transmission==0, "Automatic", "Manual"))

        dataCars

    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))

})
