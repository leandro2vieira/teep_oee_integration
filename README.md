![Vedois Produção Tecnologia](http://vedois.com.br/site/wp-content/uploads/2018/04/logovedoispreto3.png)

## Introdução sobre Integração

A integração com o sistema da Vedois Produção pode ser feito com N tecnologias, por exemplo:
Webservice, Tabela, View, CSV. A Vedois Produção recomenda o uso de webservice ou tabela, pois possuem melhor performance/segurança.

A integração deve ser separada em duas etapas.

- 1 - Importação ( Vedois Produção <-- ERP )
- 2 - Exportação ( Vedois Produção --> ERP )

Abaixo segue os layouts necessários, basta expandir.
Além de ser possível baixar os scripts prontos com os creates tanto de import quanto export.

## 1 - Importação

<details>
    <summary>Ver Tabelas</summary>
    
    **Sistema: Vedois-Produção** <br>
    **Atualizado em: 06/04/2023**

    <summary>Nome da Tabela = IMPORTPRODUCT</summary>
    <h4>São cadastrados os produtos, para posterior associar às ordens de produção.</h4>
    
    |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
    |---------------|--------------|----------------|------------------------------------|-------------|
    |**company**|Integer||default=1|Código da empresa|
    |**code**|Varchar|max_length=30||Código do produto|
    |version|Varchar|max_length=30||Versão do produto|
    |description|Varchar|max_length=128||Descrição do produto|
    |expected_time|Varchar|max_length=128||Tempo esperado do produto|
    |box_conversion|Varchar|max_length=128||Conversão de caixa do produto|
    |external_id|Varchar|max_length=128||ID externo do produto|
    |status_imp|Varchar|max_length=1|'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|

    <summary>Nome da Tabela = IMPORTPRODUCTIONORDER</summary>
    <h4>Tabela responsável pelas ordens de produção.</h4>

    | Coluna| Tipo de dado| Tamanho| Obs| Descrição|
    | -------------- | ------------- | ----------------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    |**company**|Integer||default=1|Código da empresa|
    |**origin**|Varchar|max_length=30|default='0'|Código da origem|
    |**code**|Varchar|max_length=30||Código da ordem|
    |description|Varchar|max_length=128|blank=True,<br> null=True| Descrição da ordem|
    |**product**|Varchar|max_length=30|blank=True,<br> null=True| Código do produto|
    |derivation|Varchar|max_length=30|blank=True,<br> null=True| Derivação do produto|
    |order|Integer||default=1,<br>blank=True,<br> null=True| Número do pedido|
    |measurement_unit |Varchar|max_length=128| default="PC",<br>blank=True,<br>null=True| Unidade de medida, ex: pc, metros|
    |customer_name|Varchar|max_length=128|default="", <br>blank=True, null=True|Nome do cliente|
    |quantity|DecimalField|max_digits=20,<br>decimal_places=10 |default=1|Quantidade prevista da ordem|
    |grouped_production_order|Varchar|max_length=30|null=True,<br> blank=True| A coluna grouped_production_order é usada para realizar agrupamento de ordens de produção. Esta necessidade é quando a máquina produz mais de um produto ao mesmo tempo.|
    |fraction|DecimalField|max_digits=10,<br>decimal_places=9|default=1| E a fracao_master irá determinar o percentual de produção que deve ser distribuído entre as OPs do agrupamento. Se por exemplo eu tenho um ciclo que sai 10 unidades, e eu queira distribuir 4 para uma ordem e 6 para outra, devo utilizar os valores: 0,4 e 0,6 respectivamente. |
    |deadline|DateTimeField ||null=True,<br> blank=True|Data limite|
    |external_id|Varchar|max_length=128||ID externo da ordem de produção|
    |priority|DecimalField|max_digits=20,<br>decimal_places=10|default=1|distribuição das ordens no modulo planejamento.|
    |status_imp|Varchar|max_length=1|'N'=new,<br> 'U'=update,<br> 'I'=integrated |Define status da linha, caso for importação por tabela.|

    <summary>Nome da Tabela = IMPORTPRODUCTIONSEQUENCE</summary>
    <h4>Tabela responsável por concentrar as sequencias de produção, também conhecidas como roteiros, atividades, entre outros.</h4>

    | Coluna| Tipo de dado| Tamanho| Obs| Descrição|
    | -------------------- | ------------- | ----------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------- |
    |**company**| Integer|| default=1| Código da empresa|
    |**origin**| Varchar| max_length=30| default='0'| Código da origem|
    |**code**| Varchar| max_length=30|| Código da Ordem Produção|
    |**sequence**| Integer||| Sequência do Roteiro|
    |**stage**| Integer||| Codigo do estagio|
    |resource| Varchar| max_length=30| blank=True,<br> null=True| Codigo da maquina|
    |tool| Varchar| max_length=30| blank=True,<br> null=True| Codigo da ferramenta|
    |operation_code| Varchar| max_length=30| blank=True,<br> null=True| Código da operacao|
    |operation_description| Varchar| max_length=30| blank=True,<br> null=True| Descrição da operacao|
    |quantity| DecimalField  | max_digits=20,<br>decimal_places=10 || Quantidade prevista|
    |quantity2| DecimalField  | max_digits=20,<br>decimal_places=10 || Quantidade2 prevista|
    |conversion_rate| Integer||| taxa de conversão usado para caso a unidade de medida seja M².|
    |measurement_unit| Varchar| max_digits=128,<br>default="PC"| blank=True, null=True| Unidade de medida da sequencia, Exemplo: PC(peça), M² (metro quadrado) |
    |expected_start_date | DateTimeField || blank=True,<br> null=True| Data prevista de inicio|
    |expected_end_date| DateTimeField || blank=True,<br> null=True| Data prevista de termino|
    |expected_setup| BigInteger|| default=0| Tempo de setup em segundos|
    |expected_time| BigInteger|| default=0| Tempo de produção em segundos|
    |external_id|Varchar|max_length=128||ID externo da sequencia de produção|
    |situation|Varchar|max_length=128||Situacao da sequencia de produção, L = liberado, F = finalizado|
    |status_imp| Varchar| max_length=1| 'N'=new,<br>'U'=update,<br>'I'=integrated | Define status da linha, caso for importação por tabela.|

    <summary>Nome da Tabela = IMPORTGROUPEDPRODUCTIONORDER</summary>
    <h4>Tabela responsável por concentrar o agrupamento de ordens produção.</h4>

    | Coluna| Tipo de dado| Tamanho| Obs| Descrição|
    | -------------------- | ------------- | ----------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------- |
    |**company**| Integer|| default=1| Código da empresa|
    |**origin**| Varchar| max_length=30| default='0'| Código da origem|
    |**code**| Varchar| max_length=30|| Código do Agrupamento das Ordens Produção|
    |**stage**| Integer||| Codigo do estagio|
    |**production_orders**| Integer||| ID's das ordens de produção|
    |**production_sequence**| Integer||| Sequência do agrupamento|
    |fraction| Integer||| Fração do agrupamento|
    |status_imp| Varchar| max_length=1| 'N'=new,<br>'U'=update,<br>'I'=integrated | Define status da linha, caso for importação por tabela.|
</details>
