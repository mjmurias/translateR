googleTranslate <-
function(x, api.key, source.lang, target.lang){
    base <- 'https://www.googleapis.com/language/translate/v2?'
    key.str <- paste('key=', api.key, sep = '')
    query <- paste('&q=', curlEscape(x), sep = '')
    source.str <- paste('&source=', source.lang, sep = '')
    target.str <- paste('&target=', target.lang, sep = '')
    
    api.url <- paste(base, key.str, query, source.str, target.str, sep = '')
 
     api.url <- paste(base, key.str, query, source.str, target.str, sep = '')
    
    resp = GET(url=api.url[1])
    resp = rawToChar(resp$content)
    Encoding(resp) <-"UTF-8"
    translated  = fromJSON(resp, flatten = T)$data$translations$translatedText
    
    #translated <- fromJSON(getURL(api.url, .opts = list(ssl.verifypeer = FALSE)))$data$translations[[1]]
    return(translated)
}
