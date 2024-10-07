server <- function(input, output, session) {
  #memunculkan logo
  output$img <- renderImage({
    list(src= "E:PENS/Semester 1/STATISTIKA DASAR/projekUAS_SDT22/kritis.png", width = "100%", height = 350)
 }, deleteFile = F)
  
  data<- reactive({
    inFile<- input$file1
    if( is.null(inFile)){return(NULL)}
    read.csv(inFile$datapath, header=input$header, sep=input$sep,
             quote=input$quote)
    
  })
  
  observe({
    updateSelectInput(session,"var1", choices=names(data()))
  })
  
  observe({
    updateSelectInput(session,"var2", choices=names(data()))
  })
  observe({
    updateSelectInput(session,"var3", choices=names(data()))
  })
  observe({
    updateSelectInput(session,"x2", choices=names(data()))
  })
  observe({
    updateSelectInput(session,"y", choices=names(data()))
  })
  
  
  #Summary Data
  output$desc<- renderPrint({
    Data<-data()
    if (is.null(Data)){return(NULL)}
    summary(Data)
  })
  
  
  #Tabel
  output$contents<-renderDataTable({
    inFile<-input$file1
    if(is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
  })

  
  #histogram
  output$histo<-renderPlot({
    var1<-data()[,input$var1]
    var2<-data()[,input$var2]
    if(is.null(var1)){return(NULL)}
    if(is.null(var2)){return(NULL)}
    histogram<-ifelse(input$sample== "OneSample", FALSE,TRUE)
    p1 <-hist(var1,main="Histogram T Test", breaks = input$bins )
    p2 <-hist(var2, main="Histogram T Test", breaks = input$bins )
    plot(p1, col='red',type='l', main= "Histogram T-Test")
    if(input$sample=="TwoSample")
      plot(p2, , col ='blue', add = histogram, main= "Histogram T-Test")
  })
  
  #Pengujian T-Test
  ttestoutput<-reactive({
    var1 <- data()[, input$var1]
    conf<- input$conf
    if (is.null(var1)){return(NULL)}
    ttestone<- t.test(var1, alternative = input$tail, mu = input$test, conf.level = conf)
    var2 <-data()[, input$var2]
    vareqq <- ifelse(input$varequal =="y", TRUE, FALSE)
    ttesttwo<- t.test(var1,var2, alternative=input$tail, var.equal= vareqq, conf.level = conf)
    if(input$sample == "OneSample") {return(ttestone)}
    if(input$sample == "TwoSample") {return(ttesttwo)}
    
  })
  
  #Output T-Test
  output$ttestout<- renderPrint({
    out<-ttestoutput()
    if(is.null(out)){return(NULL)}
    out
  })
  
  #Prop Test
  proptestoutput<- reactive({
    conf <-input$conf
    p1 <- prop.test( x = input$x , n = input$n , p = input$p , alternative = input$tail
                     ,conf.level = input$conf, correct = TRUE)
    p2 <- prop.test( x = input$x , n = input$n , p = input$p , alternative = input$tail
                     ,conf.level = input$conf, correct = FALSE)
    if(input$correct == "y"){ return(p1)}
    if(input$correct == "n"){ return(p2)}
  })
  
  #Output Prop Test 
  output$proptestout<- renderPrint({
    out2<-proptestoutput()
    if(is.null(out2)){return(NULL)}
    out2
  })
  
  #Variance Test
  vartestoutput<- reactive({
    x2 <- data()[,input$x2]
    y <- data()[, input$y]
    conf<- input$conf
    if(is.null(x2)){return(NULL)}
    if(is.null(y)){return(NULL)}
    var <- var.test(x2, y, alternative = input$tail, conf.level = input$conf)
    
  })
  
  #Output Variance
  output$vartestout<- renderPrint({
    out3 <- vartestoutput()
    if(is.null(out3)){return(NULL)}
    out3
  })
}