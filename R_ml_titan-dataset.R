## Step 1 - Install and load package "titanic"
install.packages("titanic")
library(titanic)

View(titanic_train) # view dataset
?titanic_train


## Step 2 - Clean data
titanic_train_clean <- na.omit(titanic_train) # drop NA

View(titanic_train_clean)
nrow(titanic_train_clean)


## Step 3 - Split data into train and test
set.seed(39)
n <- nrow(titanic_train_clean)
id <- sample(1:n, size =  n*0.7) # get 70% for train, 30% for test

train_data <- titanic_train_clean[id, ] # create a train dataset
test_data <- titanic_train_clean[-id, ] # create a test dataset


## Step 4 - Create a logistic regression (x = Parch)
model <- glm(Survived ~ Parch,
             data = train_data,
             family = "binomial")

summary(model)


## Step 5 - Create new columns for predicted y
test_data$prob_surv <- predict(model,
                               newdata = test_data,
                               type = "response")

test_data$pred_surv <- ifelse(test_data$prob_surv > 0.5, 1, 0)


## Step 6 - Evaluate the model with a confusion matrix
confusion <- table(test_data$pred_surv,
                   test_data$Survived,
                   dnn = c("Predicted",
                           "Actual"))

confusion

accuracy <- (confusion[1, 1] + confusion[2, 2]) / sum(confusion)
precision <- confusion[2, 2] / (confusion[2, 1] + confusion[2, 2])
recall <- confusion[2, 2] / (confusion[1, 2] + confusion[2, 2])
f1 <- 2 * (precision * recall) / (precision + recall)


## Step 7 - Create a report table
report <- data.frame(Metric = c("Accuracy",
                                "Precision",
                                "Recall",
                                "F1 Score"),
                     Value = c(round(accuracy, 2),
                               round(precision, 2),
                               round(recall, 2),
                               round(f1, 2)))
  
report
