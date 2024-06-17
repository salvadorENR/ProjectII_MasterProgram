install.packages("tidyverse")
install.packages("janitor")
install.packages("dplyr")
install.packages("ggplot2")


library(tidyverse)
library(janitor)
library(dplyr)
library(ggplot2)

#*********************************************************************************************************************************************************************************************************
#******************** Problema 1: Realizar el código necesario para visualizar la variación de la variable Target ****************************************************************************************
#*********************************************************************************************************************************************************************************************************
dat <- read.csv("https://raw.githubusercontent.com/ricardo-rios/fund_prog_est/main/ProyectoII/train.csv")
dim(dat)
names(dat)
dat <- dat |> clean_names()
names(dat)
head(dat)
dat %>% summarise(across(everything(), ~ sum(is.na(.))))

# Convert the 'Target' variable to a factor
dat$target <- as.factor(dat$target)

ggplot(dat, aes(x = target)) +
  geom_bar() +
  labs(title = "Variation of Target Variable", x = "Target", y = "Count")

#*********************************************************************************************************************************************************************************************************
#******************** Problema 2: Realizar el código necesario para visualizar la co-variación de la variable Target y GDP ****************************************************************************************
#*********************************************************************************************************************************************************************************************************

ggplot(dat, aes(x = target, y = gdp)) +
  geom_boxplot() +
  labs(title = "Co-variación de la Variable Target y GDP", x = "Target", y = "GDP")

#*********************************************************************************************************************************************************************************************************
#******************** Problema 3: Realizar el código necesario para visualizar la co-variación de la variable Target e International ****************************************************************************************
#*********************************************************************************************************************************************************************************************************
dat$international <- as.factor(dat$international)
ggplot(dat, aes(x = target, y = international)) +
  geom_count() +
  labs(title = "Co-variación de la Variable Target y International", x = "Target", y = "International")
#*********************************************************************************************************************************************************************************************************
#******************** Problema 4: Realizar el código necesario para visualizar la co-variación de la variable Unemployment rate y GDP ****************************************************************************************
#*********************************************************************************************************************************************************************************************************
ggplot(dat, aes(x = unemployment_rate, y = gdp)) +
  geom_point() +
  labs(title = "Co-variación de la Variable Unemployment rate y GDP", x = "Unemployment Rate", y = "GDP")






