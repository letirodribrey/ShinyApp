library(shiny)
library(caret)
library(randomForest)

irisClass<- function (SL,SW,PL,PW) {
        # Create data directory
        if(!file.exists("./data")){dir.create("./data")}
        
        # Download test file
        url <- ("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")
        download.file(url, "./data/iris.csv")
        
        # Change to data directory for reading the data
        setwd("./data/")
        
        # Load datasets
        iris <- read.csv("iris.csv", header=FALSE, sep=",")
        
        #Nombre de las variables
        colnames(iris)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

        set.seed(1234)
        ind<-sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))
        irisTrain<-iris[ind==1,]
        irisTest<-iris[ind==2,]
        colnames(irisTrain)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")
        colnames(irisTest)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")
        
        rf_model <- randomForest(Species ~ ., irisTrain, ntree=500)
        
        training_pred <- predict(rf_model, irisTrain)
        testing_pred <- predict(rf_model, irisTest)
        
        Sepal.Length<-SL
        Sepal.Width<-SW
        Petal.Length<-PL
        Petal.Width<-PW
        
        prtesting<-matrix(c(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width),nrow=1,ncol=4)
        answer <- predict(rf_model, prtesting)
        answer
}


# Change directory
setwd("./")

shinyServer(
        function(input, output) {
                output$SL<-renderPrint({input$SL})
                output$SW<-renderPrint({input$SW})
                output$PL<-renderPrint({input$PL})
                output$PW<-renderPrint({input$PW})
                output$prediction<-renderPrint({irisClass(input$SL,input$SW,input$PL,input$PW)})
        }
)