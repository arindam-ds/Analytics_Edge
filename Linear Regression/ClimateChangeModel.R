climate = read.csv("climate_change.csv")

train = subset(climate, Year <= 2006)

test = subset(climate, Year > 2006)

climatelm = lm(Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data=train)

summary(climatelm)

cor(train)

#We can create this simplified model with the command:

LinReg = lm(Temp ~ MEI + N2O + TSI + Aerosols, data=train)

#We can create a model using the step function by typing:

StepModel = step(climateLM)

#where "climateLM" is the name of the full model.

summary(StepModel)

#The R code to calculate the R-squared can be written as follows (your variable names may be different):

tempPredict = predict(climateStep, newdata = test)

SSE = sum((tempPredict - test$Temp)^2)

SST = sum( (mean(train$Temp) - test$Temp)^2)

R2 = 1 - SSE/SST