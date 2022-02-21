googleTranslate <-
function(x, api.key, source.lang, target.lang){
    base <- 'https://www.googleapis.com/language/translate/v2?'
    key.str <- paste('key=', api.key, sep = '')
    query <- paste('&q=', curlEscape(x), sep = '')
    source.str <- paste('&source=', source.lang, sep = '')
    target.str <- paste('&target=', target.lang, sep = '')
    
    api.url <- paste(base, key.str, query, source.str, target.str, sep = '')
 
    resp = GET(url=api.url[1])
    resp = rawToChar(resp$content)
    Encoding(resp) <-"UTF-8"
    translated  = fromJSON(resp)$data$translations[[1]]
   return(translated)
}
