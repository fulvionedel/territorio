#' @title Classifica os municípios nas unidades administrativas e de saúde brasileiras
#' @aliases territorio
#' @export
#'
#' @description Classifica os municípios brasileiros em divisões territoriais do IBGE usadas pelos Sistemas de Informação do SUS
#' @note O arquivo na "Transferência de arquivos" ou no servidor `ftp` do DATASUS fala em "base territorial 2005", mas inclui um município criado em 2009 e cinco em 2013. Esses municípios podem ser excluídos com o argumento `ano` (v. `Arguments`).
#'
#' @param local "SC" (padrão) seleciona apenas os municípios de Santa Catarina, "RS" seleciona apenas os municípios do Rio Grande do Sul. Qualquer outra opção (deve ir entre aspas, simples ou duplas) retorna um banco com todos os municípios brasileiros.
#'
#' @param ano Exclui municípios com data de instalação posterior ao ano de escolha. O padrão é 2012.
#'
#' @param tipo "curto" (padrão) retorna um banco com oito variáveis, qualquer outra opção (deve ir entre aspas, simples ou duplas) retorna um banco com 30 variáveis
#'
#' @examples
#' # Criar um data frame com todos os municípios brasileiros:
#' brasil = territorio::territorio(local = " ")
#' str(brasil)
#'
#' # Criar um data frame com os municípios de Santa Catarina:
#' sc = territorio::territorio() # ou
#' # sc = territorio::territorio(local = "SC")
#' str(sc)
#'
#' # Criar um data frame com os municípios do Rio Grande do Sul:
#' rs = territorio::territorio(local = "RS")
#' str(rs)
#'
#' # Criar um data frame com os municípios do Paraná:
#' # Como a opção local = "PR" ainda não implementada,
#' # dispensa-se a função e usa-se diretamente o banco de
#' # dados regiao para a seleção desejada:
#' pr = territorio::regiao[territorio::regiao$CO_UF == 41, ] # ou
#' # library(territorio)
#' # pr = regiao[regiao$CO_UF == 41, ]
#' str(pr)
#'
territorio <-
  function (local = "SC", ano = 2012, tipo = "curto")
  {
    # stopifnot(require(territorio, quietly=TRUE))

    # load("data/regiao.RData") ## Aqui o erro?
    # data("regiao")
    # data(regiao)

    regiao <- droplevels(regiao[as.numeric(as.character(regiao$DT_INSTAL)) <= ano, ])
    names(regiao)[26]
    # regiao <- droplevels(regiao[as.numeric(as.character(regiao[,26])) <= ano, ])

    if (local == "SC")
      regiao <- droplevels(subset(regiao, subset = CO_UF == "42"))
    if (local == "RS")
      regiao <- droplevels(subset(regiao, subset = CO_UF == "43"))

    if(tipo == "curto")
      regiao <- subset(regiao, select = c(CO_MUNICIP:nomeregsaude, NU_LATITUD, NU_LONGIT))


    rownames(regiao) <- NULL

return(regiao)
  }
