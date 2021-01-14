#Criado por Andressa Siqueira

#Definindo diretorio
setwd("G:/Estudo/Data_Science_Academy/Analise_temperatura")
getwd()

# Instalando pacotes necessarios
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

#Chamando as bibliotecas instaladas
library(dplyr)
library(data.table)
library(ggplot2)

#lendo arquivo
system.time(df<- fread("TemperaturasGlobais/TemperaturasGlobais.csv"))

#Primeiro analisando o Brasil
cidadesBRasil = subset(df,Country=='Brazil')
cidadesBRasil = na.omit(cidadesBRasil)

# Preparando os dados
cidadesBRasil$ddt = as.POSIXct(cidadesBRasil$dt, format='%Y-%m-%d')
cidadesBRasil$mes= month(cidadesBRasil$dt)
cidadesBRasil$ano= year(cidadesBRasil$dt)

#Listando todas as cidades brasileiras
lista_cidades= distinct(cidadesBRasil,City)

#Analise por estado
#Rio de janeiro
rio_janeiro = subset(cidadesBRasil,City=='Rio De Janeiro')
p_rio_janeiro = ggplot (rio_janeiro, aes(x=(dt), y=AverageTemperature)) +
                         geom_smooth(se=FALSE, fill=NA, size=1) +
                         theme_light(base_size = 12) +
                         xlab("Mês") +
                         ylab("Temperatura média") +
                         scale_color_discrete("") +
                         ggtitle("Temperatura média entre 1832 e 2013 no Rio de Janeiro") +
                         theme(plot.title = element_text(size=12))
p_rio_janeiro                    

