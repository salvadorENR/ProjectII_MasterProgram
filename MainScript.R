#A fin de practicar los temas de visualización de datos realizaremos un análisis exploratorio con algunas variables del siguiente dataset del sitio de kaggle.com:
#Técnicas de clasificación con un conjunto de datos académico
#El dataset tiene la licencia creative commons la cual permite su uso y se detalla en el siguiente enlace:
# Licencia creative commons
#Además los datos son del instituto de Portalegre en Portugal.
#A continuación vamos a revisar aspectos del dataset los cuales se han traducido del siguiente sitio web:
# Sito web del dataset
#Con que próposito se creo el dataset? El dataset fue creado en un proyecto para contribuir a la reducción de la deserción y falla en educación superior usando para ello técnicas de análisis de datos.
#El dataset incluye información que se conocia en el tiempo que el estudiante estaba matriculado, camino académico (academic path), demografía, y factores económicos sociales.
#La variable respuesta o variable a predecir (Target) es cualitativa y tiene tres categorías (deserción, matriculados y egresados) los valores de las variables se registran al final del curso.
#Que representan las instancias (filas) del dataset? Cada instancia es un estudiante.
#Se ha realizado algún procesamiento al dataset? Se realizo un procesamiento riguroso a fin de manejar anomalías, inexplicables outliers, y datos ausentes.
#Hay valores ausentes No
#A continuación presentaremos un detalle de las variables.
install.packages("tidyverse")
install.packages("janitor")
library(tidyverse)
library(janitor)
#En la siguiente linea cargamos la información del dataset en la variable dat usando la función del tidyverse read_csv, la variable dat es un tibble el cual es un variable tipo dataframe adaptada para trabajar en el tidyverse.
dat <- read_csv("https://raw.githubusercontent.com/ricardo-rios/fund_prog_est/main/ProyectoII/train.csv")
#En la siguiente linea nos dice que el dataset tiene 76518 observaciones (filas) y 38 variables (columnas).
dim(dat)
#A continuación mostramos los nombres de las variables.
names(dat)
#Los nombres de las variables son un completo desorden, usaremos la función clean_names junto con el operador tuberia "|>" para corregir esto en la siguiente linea de código.
dat <- dat |> clean_names()
#A continuación volvemos a verificar que los nombres estan corregidos con el siguiente código.
names(dat)
#En el siguiente código mostramos las primeras 6 observaciones del dataset.
head(dat)
#A continuación calculamos los números ausentes por columnas.
dat %>% summarise(across(everything(), ~ sum(is.na(.))))
#Problema 1 [25%]
#Realizar el código necesario para visualizar la variación de la variable Daytime/evening attendance.
#Solución
#Como la variable es cualitativa debo convertirla primero en factor con el siguiente código:
  dat$daytime_evening_attendance <- as.factor(dat$daytime_evening_attendance)
  #A continuación usaremos ggplot para visualizar la variación de la variable Daytime/evening attendance con el siguiente código.
  ggplot(dat, aes(x = daytime_evening_attendance)) +
    geom_bar()
#Problema 2 [25%]
#Realizar el código necesario para visualizar la co-variación de la variable Daytime/evening attendance y Unemployment rate.
#Solución
#Debo de tener en cuenta lo siguiente:
#La variable Daytime/evening attendance es cualitativa.
#La variable Unemployment rate es cuantitativa.
#Por simplicidad usaremos el lado-a-lado boxplots (side-by-side boxplots).
  ggplot(dat, aes(x = daytime_evening_attendance, y = unemployment_rate)) +
    geom_boxplot()
#Problema 3 [25%]
#Realizar el código necesario para visualizar la co-variación de la variable Daytime/evening attendance y Marital Status.
#Solución
#Debo de tener en cuenta lo siguiente:
#La variable Daytime/evening attendance es cualitativa.
#La variable Marital Status rate es cualitativa.
  ggplot(dat, aes(x = daytime_evening_attendance, y = marital_status)) +
    geom_count()
#Problema 4 [25%]
#Realizar el código necesario para visualizar la co-variación de la variable Unemployment rate y Inflation rate.
#Solución
#Debo de tener en cuenta lo siguiente:
#La variable Unemployment rate es cuantitativa.
#La variable Inflation rate es cuantitativa.
  ggplot(dat, aes(x = unemployment_rate, y =  inflation_rate)) +
    geom_point()
  