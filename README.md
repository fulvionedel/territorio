# territorio
Divisões administrativas e de saúde do SUS

### Apresentação

Pacote em **R** para a classificação dos municípios brasileiros segundo sua divisão territorial no ano de 2012, apresentando o nome do município e das regiões a que pertencem. É particularmente voltado ao trabalho com as bases de dados disponibilizadas pelo Departamento de Informática do SUS (DATASUS), do Ministério da Saúde do Brasil. O SUS é o Sistema Único de Saúde brasileiro.

O pacote `territorio` apresenta a lista de todos os municípios brasileiros, com seu 
  - código do IBGE
  - nome
  - coordenadas geográficas
  - regiões administrativas e de saúde (Estado, macrorregião de saúde, microrregião do IBGE, etc.) a que pertencem

### Justificativa

O DATASUS oferece duas ferramentas para a tabulação de dados dos Sistemas de Informação do SUS, o TABNET, para tabulação on-line, e o TabWin, com mais opções de tabulação e a possibilidade de criar scripts para tabulações personalizadas. Nessas tabulações, o nome do município ou o agrupamento regional selecionado aparece com seu nome. Entretanto, a informação do nome está ausente das bases de dados, que contêm apenas o código IBGE do município. Tampouco há informação das regiões a que pertence o município, salvo a Unidade da Federação (Estado), que pode ser identificada pelos dois primeiros dígitos do código IBGE do município.

Assim, ao trabalhar com os bancos de dados do SUS num pacote estatístico, a identificação da região a que pertence cada município, assim como a apresentação dos seus nomes, exige um trabalho adicional de decodificação, com necessidade de buscar essa informação em outras fontes. 

O pacote `territorio` facilita esse processo, apresentando uma base de dados --`regiao`-- com essas informações para cada um dos municípios brasileiros e uma função --`territorio()`-- para a seleção de municípios por Unidade da Federação. As coordenadas geográficas facilitam a visualização das informações em mapas.

### Instalação

O pacote `territorio` pode ser instalado no **R** através do pacote `devtools`, com os seguintes comandos:
      
    install.packages("devtools") # desnecessário se o pacote devtools já estiver instalado
    devtools::install_github("fulvionedel/territorio")

### Conteúdo

O pacote `territorio` contém quatro objetos:
  - `regiao` Base de dados com as informações
  - `macsaude` Função para nomear as Macrorregiões de Saúde
  - `regional` Função para nomear as Regiões de Saúde
  - `territorio` Função para a seleção das informações por Estado   
  
***Fonte dos dados:*** ftp://ftp.datasus.gov.br/territorio/tabelas/base_territorial.zip

### Exemplos de uso

  - Criar um `data frame` com todos os municípios brasileiros:
  
        brasil = territorio::territorio(local = " ")
  
  - Criar um `data frame` com os municípios de Santa Catarina:
  
        sc = territorio::territorio() # ou
        sc = territorio::territorio(local = "SC")

  - Criar um `data frame` com os municípios do Rio Grande do Sul:
  
        rs = territorio::territorio(local = "RS")
  
  - Criar um `data frame` com os municípios do Paraná (opção ainda não implementada na função `territorio`):
  
        pr = droplevels(territorio::regiao[territorio::regiao$CO_UF == 41, ]) # ou
        library(territorio)
        pr = droplevels(regiao[regiao$CO_UF == 41, ])
  
  Ou seja, para uma seleção ainda não implementada na função `territorio`, pode-se dispensar a função e usar diretamente a base de dados `regiao`.  
  
  - Acrescentar o nome da Macrorregião ou da Regiao de Saúde a uma base de dados com municípios brasileiros:
      
      1. Crie uma variável de nome `CO_MUNICIP` com o código IBGE do município
      - Aplique as funções `macsaude` ou `regional` sobre a base de dados:
      
            base = macsaude(basededados) # Acrescenta o nome da Macrorregião de Saúde
            base = regional(basededados) # # Acrescenta o nome da Região de Saúde
            base = macsaude(regional(basededados)) # Acrescenta o nome da Macrorregião e da Região de Saúde
          
### Nota

A base de dados `regiao` contém todos os municípios da federação e pode assim ser subdividida das mais variadas formas, de acordo com o interesse do usuário. As mais frequentes, nos estudos sobre o SUS, me parecem ser a seleção por estado e a classificação por região de saúde. A função `territorio` foi desenvolvida para facilitar essas seleções. Entretanto, por enquanto ela permite apenas a seleção de municípios do Rio Grande do Sul ou de Santa Catarina (obviamente por interesses pessoais, o pacote foi desenvolvido especialmente para @s alun@s ;-) ).

### TODO

1. Completar as opções de seleção, incluir todas as UF
2. Incluir os nomes das UF e outras regiões
3. Incluir coordenadas geográficas das UF e outras regiões

