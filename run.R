

# run scraping
x <- data.frame(col=rnorm(1:10))
head(x)

# Creation et enregistrement
if(getcon){
  if(dbExistsTable(con, "afnewsdb")){
    dbAppendTable(con, "afnewsdb", x)
  }else{
    dbCreateTable(con, "afnewsdb", x)
  }
  dbDisconnect(con)
}else{print("Error")}
