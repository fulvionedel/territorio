#' @title Classifica os municípios nas unidades administrativas e de saúde brasileiras
#' @aliases territorio
#' @export
#'
#' @description Classifica os municípios brasileiros em divisões administrativas e de saúde segundo as listas do DATASUS
#' @note O arquivo na "Transferência de arquivos" ou no servidor `ftp` do DATASUS fala em "base territorial 2005", mas inclui um município criado em 2009 e cinco em 2013. Esses municípios podem ser excluídos com o argumento `ano` (v. `Arguments`).
#'
#' No momento a função tá pensada pra trabalhar com os municípios de Santa Catarina em 2012.
#'
#' @param local "SC" (padrão) seleciona apenas os municípios de Santa Catarina, "RS" seleciona apenas os municípios do Rio Grande do Sul. Qualquer outra opção (deve ir entre aspas, simples ou duplas) retorna um banco com todos os municípios brasileiros.
#'
#' @param ano Exclui municípios com data de instalação posterior ao ano de escolha. O padrão é 2012.
#'
#' @param tipo "curto" (padrão) retorna um banco com oito variáveis, qualquer outra opção (deve ir entre aspas, simples ou duplas) retorna um banco com 30 variáveis
#'
#'
#'
territorio <-
  function (local = "SC", ano = 2012, tipo = "curto") # agregado)
  {
    # stopifnot(require(territorio, quietly=TRUE))

    # load("data/regiao.RData") ## Aqui o erro?
    # data("regiao")
    # data(regiao)

    # regiao <- droplevels(regiao[as.numeric(as.character(regiao$DT_INSTAL)) <= ano, ])
    # names(regiao)[22]
    regiao <- droplevels(regiao[as.numeric(as.character(regiao[,22])) <= ano, ])

    if (local == "SC")
      regiao <- droplevels(subset(regiao, subset = CO_UF == "42"))
    if (local == "RS")
      regiao <- droplevels(subset(regiao, subset = CO_UF == "43"))

    if(tipo == "curto")
      regiao <- subset(regiao, select = c(CO_MUNICIP:CO_REGSAUD, DS_NOME, NU_LATITUD, NU_LONGIT))

    rownames(regiao) <- NULL

return(regiao)
  }
