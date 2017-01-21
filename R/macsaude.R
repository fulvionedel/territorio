#' @title Nomeia as macrorregiões de saúde
#' @aliases macsaude
#'
#' @description Inclui o nome da Macrorregião de Saúde do município numa base de dados com municípios brasileiros identificados pelo código do IBGE em variável de nome `CO_MUNICIP`.
#'
#' @param x objeto da classe `data.frame` com pelo menos uma variável, de nome `CO_MUNICIP`, com o código IBGE do município
#'
#' @export
#'
macsaude <- function(x){
  macsaude = regiao[, c("CO_MUNICIP", "CO_MACSAUD", "nomemacsaude")]
  regiao <- merge(x, macsaude)
  return(regiao)
}

