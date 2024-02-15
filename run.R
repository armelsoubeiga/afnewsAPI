library(DBI)
library(RPostgres)

db_name <- Sys.getenv("DB_NAME")
db_host <- Sys.getenv("DB_HOST")
db_port <- Sys.getenv("DB_PORT")
db_user <- Sys.getenv("DB_USER")
db_pass <- Sys.getenv("DB_PASS")


# Connexion
getcon <- tryCatch({
  drv <- RPostgres::Postgres()
  con <- dbConnect(drv,
                   dbname = db_name,
                   host = db_host,
                   port = db_port,
                   user = db_user,
                   password = db_pass)
  TRUE},
  error=function(cond) {
    FALSE
  })

# run scraping
x <- data.frame(col=rnorm(1:10))

# Creation et enregistrement
if(getcon){
  #db <- dbReadTable(con, "tlbafnews")
  db <- dbGetQuery(con, 'SELECT * FROM "tlbafnews"')
  print(dim(db))
  dbDisconnect(con)
}else{print("Error")}
