# territorio
Divisões administrativas e de saúde do SUS

O pacote `territorio` apresenta a lista de todos os municípios brasileiros, com seu 
  - código do IBGE
  - nome
  - coordenadas geográficas
  - regiões administrativas e de saúde (Estado, macrorregião de saúde, microrregião do IBGE, etc.) a que pertencem

O Departamento de Informática do SUS (DATASUS) oferece duas ferramentas para a tabulação de dados dos Sistemas de Informação do SUS, o TABNET, para tabulação on-line, e o TabWin, com mais opções de tabulação e a possibilidade de criar scripts para tabulações personalizadas. Nessas tabulações, o nome do município ou o agrupamento regional selecionado aparece com seu nome. Entretanto, a informação do nome está ausente das bases de dados, que contêm apenas o código IBGE do município. Tampouco há informação das regiões a que pertence o município, salvo a Unidade da Federação (Estado), que pode ser identificada pelos dois primeiros dígitos do código IBGE do município.

Assim, ao trabalhar com os bancos de dados do SUS num pacote estatístico, a identificação da região a que pertence cada município, assim como a apresentação dos seus nomes, exige um trabalho adicional de decodificação, com necessidade de buscar essa informação em outras fontes. 

O pacote `territorio` facilita esse processo, apresentando uma base de dados --`regiao`-- com essas informações para cada um dos municípios brasileiros e uma função --`territorio()`-- para a seleção de municípios por Unidade da Federação.

***Fonte dos dados:*** ftp://ftp.datasus.gov.br/territorio/tabelas/base_territorial.zip
