library(shiny)
library(shinydashboard)


ui <- dashboardPage(
  dashboardHeader( title = "Uji Hipotesis",titleWidth = 250),
  
  dashboardSidebar(width = 250,
                   sidebarMenu(
                     menuItem("Menu Item 1", tabName = "Overview"),
                     menuItem("Menu Item 2", tabName = "Test",
                              menuSubItem("T-test", tabName = "T-test"),
                              menuSubItem("Prop-test", tabName = "Prop-test"),
                              menuSubItem("Varians-test", tabName = "Varians-test")
                     ),
                     menuItem("Menu Item 3", tabName = "Data")
                     
                   )
  ),
  
  
  
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "Overview",
              h1("Overview about Uji Hipotesis"),
              box(title= "Uji Hipotesis dan Daerah Kritis ", status = "primary", solidHeader = TRUE,collapsible = TRUE,
                  h4("Uji hipotesis adalah metode pengambilan keputusan yang didasarkan dari analisa data,
                          baik dari percobaan yang terkontrol,
                          maupun dari observasi(tidak terkontrol)"),
                  imageOutput(outputId = "img")),
              
              box(title = "Hipotesis nol (Ho) dan Hipotesis alternatif (Ha)", 
                  h4("1. Hipotesis Nol (Ho): menyatakan tidak ada perbedaan atau tidak ada hubungan antara variabel satu dengan variabel yang lain"),
                  br(),
                  h4("2. Hipotesis Alternatif (Ha): menyatakan adanya perbedaan atau adanya hubungan antara variabel satu dengan variabel yang lain.")),
      ),
      
      
      tabItem(tabName = "Test",
              h1(" ")),
      
      
      tabItem(tabName = "T-test",
              sidebarPanel( h1(" Uji terhadap Mean"),
                            h6("Uji T Test dilakukan ketika sudah melakukan 
                              uji varians untuk dua populasi mean!"),
                            sliderInput("bins", "Number of Bins", min=1, max=50, value=2),
                            p("Untuk Bins digunakan pada Histogram!"),
                            p("Dengan warna red : var 1, blue : var 2"),
                            radioButtons("sample",
                                         "Pilih t-test satu sample atau dua sample:",
                                         choices = c("One sample" = "OneSample",
                                                     "Two sample" = "TwoSample")),
                            helpText("UNTUK SATU POPULASI MAKA GUNAKAN VARIABEL DI BAWAH INI!"),
                            selectInput("var1",
                                        label = "Pilih Variabel Numerik",
                                        ""),
                            helpText("VARIANS KEDUA SAMPEL SAMA DIGUNAKAN UNTUK DUA POPULASI!"),
                            helpText("TAMBAHAN VARIABEL KEDUA DI BAWAH INI!"),
                            condition = "input.sample == 'TwoSample'", selectInput(
                              "var2", label = "Pilih Variabel Numerik",""),
                            radioButtons("varequal", "Varians kedua sampel sama?", 
                                         choices=c("Yes" = "y", "No" = "n")),
                            
                            selectInput("tail",
                                        label = "Pilih Alternative Hipotesis",
                                        choices = c("Equal" = "two.sided",
                                                    "Less" = "less",
                                                    "Greater" = "greater")),
                            condition ="input.sample == 'OneSample'", numericInput(
                              "test", "Nilai mean yang ingin diuji",value = 0 ),
                            
                            numericInput("conf",
                                         label = "Confident Interval",
                                         value = 0.95,
                                         min = 0.8,
                                         max = 0.99),
              ),
              #output
              mainPanel(
                h2(strong("HASIL PENGUJIAN T TEST"),align ="center"),
                fluidRow(verbatimTextOutput(outputId="ttestout")),
                p("Daerah Penolakan atau Kritis : Tolak Ho, jika nilai P-value < nilai alfa"),
                h2(strong("HISTOGRAM T TEST"),align ="center"),
                fluidRow(plotOutput(outputId="histo")),
              ),
      ),  
      
      tabItem(tabName = "Prop-test",
              sidebarPanel( h1(" Uji terhadap Proporsi"),
                            
                            numericInput("x",
                                         "Banyaknya sukses dari sampel",
                                         value = 1,
                                         min = 1),
                            
                            numericInput("n",
                                         "Banyaknya sampel",
                                         value = 1,
                                         min = 1),
                            
                            numericInput("p",
                                         "Probabilitas kesuksesan (proporsi dalam H0)",
                                         value = 0.1,
                                         min = 0.1,
                                         max = 0.95),
                            
                            selectInput("tail",
                                        label = "Alternatif Hipotesis",
                                        choices = c("Equal" = "two.sided",
                                                    "Less" = "less",
                                                    "Greater" = "greater")),
                            
                            numericInput("conf",
                                         label = "Confident Interval",
                                         value = 0.95,
                                         min = 0.8,
                                         max = 0.99),
                            helpText("Masukkan angka 0 hingga 1 untuk Confidence Interval"),
                            radioButtons("correct",
                                         "Pilihlah TRUE jika terdapat atau menggunakan 
                         faktor koreksi, begitu sebaliknya", 
                                         choices = c("TRUE" = "y", "FALSE" = 
                                                       "n")),
              ),
              #output
              mainPanel(
                h2(strong("HASIL PENGUJIAN PROPOSI TEST"),align ="center"),
                fluidRow(verbatimTextOutput(outputId="proptestout")),
                p("Daerah Penolakan atau Kritis : Tolak Ho, jika nilai P-value < nilai alfa"),
              ),
              
      ),
      tabItem(tabName = "Varians-test",
              sidebarPanel(
                h1(" Uji terhadap Varians"),
                
                selectInput("x2",
                            label = "Pilih Variabel Numerik",
                            ""),
                
                selectInput("y",
                            label = "Pilih Variabel Numerik",
                            ""),
                
                numericInput("p",
                             "Probabilitas kesuksesan (proporsi dalam H0)",
                             value = 0),
                
                selectInput("tail",
                            label = "Pilih Alternative Hipotesis:",
                            choices = c("Equal" = "two.sided",
                                        "Less" = "less",
                                        "Greater" = "greater")),
                numericInput("conf",
                             label ="Pilih Confidence Interval",
                             value = 0.95,
                             min = 0.8,
                             max = 0.99),
                helpText("Masukkan angka 0 sampai 1 untuk Confidence Interval"),
              ),
              
              #output
              mainPanel(
                h2(strong("HASIL PENGUJIAN VARIANCE TEST"),align ="center"),
                fluidRow(verbatimTextOutput(outputId="vartestout")),
                p("Daerah Penolakan atau Kritis : Tolak Ho, jika nilai P-value < nilai alfa"),
              ),
      ),
      
      tabItem(tabName = "Data",
              h1("Input Data"),
              
              #file input csv
              box(fileInput('file1', 'PILIH FILE CSV',
                            accept = c('text/csv',
                                       'text/comma-separated-values,text/plain','.csv')),
                  
                  tags$hr(),
                  checkboxInput('header', 'Header', TRUE),
                  radioButtons('sep', 'separator' ,
                               c(Comma=',',
                                 Semicolon=';',
                                 Tab='\t'),
                               ','),
                  radioButtons('quote', 'Quote',
                               c(None='',
                                 'Double Quote'='"',
                                 'Single Quote'="'"),
                               '"'),width = 3, height=500),
              #output
              mainPanel(
                h2(strong("SUMMARY DATA"),align ="center"),
                fluidRow(verbatimTextOutput(outputId="desc")),
                box(h2(strong("TABEL DATA"),align ="center"),width = 1500,
                dataTableOutput(outputId="contents")), 
              
      )
    ) 
    
  )
  
))