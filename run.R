library(DBI)
library(RPostgres)

# Connexion
getcon <- tryCatch({
  drv <- RPostgres::Postgres()
  con <- dbConnect(drv,
                   dbname = Sys.getenv("DSN_DATABASE"),
                   host = Sys.getenv("DSN_HOSTNAME"),
                   port = 5432,
                   user = Sys.getenv("DSN_UID"),
                   password = Sys.getenv("DSN_PWD"))
  TRUE},
  error=function(cond) {
    FALSE
  })

# run scraping
x <- data.frame(col=rnorm(1:10))


#Creation et enregistrement
if(getcon){
  if(dbExistsTable(con, "afnewsdb")){
    dbAppendTable(con, "afnewsdb", x)
  }else{
    dbCreateTable(con, "afnewsdb", x)
  }
  dbDisconnect(con)
}else{print("Error")}
