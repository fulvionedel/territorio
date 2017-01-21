#' @title Nomeia as regiões de saúde
#' @aliases regional
#'
#' @description Inclui o nome da Região de Saúde do município numa base de dados com municípios brasileiros identificados pelo código do IBGE em variável de nome `CO_MUNICIP`.
#'
#' @param x objeto da classe `data.frame` com pelo menos uma variável, de nome `CO_MUNICIP`, com o código IBGE do município
#' @export

regional <- function(x){
  regional = regiao[, c("CO_MUNICIP", "CO_REGSAUD", "nomeregsaude")]
  regiao <- merge(x, regional)
  return(regiao)
}

