# Packages
library(DBI)
library(odbc)
library(RSQLite)
library(tidyverse)
library(magrittr)
library(dbplyr)


# db creation
setwd("C:/Users/aso.RCTS/Desktop/R_/afnewsAPI/db")
con <- dbConnect(RSQLite::SQLite(), dbname = "afnews.db")



# verificarion Creation de la table
df <- data.frame()
dbWriteTable(con, "DataCollect", df)
dbListTables(con)

# Collecte
newdata_tbl <- newdata


# Insertion
dbWriteTable(con, "DataCollect", newdata_tbl, append=TRUE, row.names=FALSE)


# Deconnexion
dbDisconnect(con)