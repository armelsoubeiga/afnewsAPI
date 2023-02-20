# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

library(DBI)
library(RPostgres)


# Initialisation
#dsn_database <- "fqlmzfec" #"afnewsdb"
#dsn_hostname <- "kandula.db.elephantsql.com"
#dsn_port <- 5432
#dsn_uid <- "fqlmzfec"
#dsn_pwd <- "b0y3toCFCkdgmFphxasO0LhQIejVjy5B"

print(Sys.getenv("DSN_DATABASE"))
print(Sys.getenv("DSN_PWD"))

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
