![Teep Tecnologia](https://teep.com.br/wp-content/uploads/2023/11/cropped-cropped-teep-logo-menor-113x33.png)

## Introdução sobre Integração

A integração com o sistema teepOEE pode ser feito com N tecnologias, por exemplo:
Webservice, Tabela, View, CSV. A Teep recomenda o uso de webservice ou tabela, pois possuem melhor performance/segurança.

A integração deve ser separada em duas etapas.

- 1 - Importação ( TEEP <-- ERP )
- 2 - Exportação ( TEEP --> ERP ).

Abaixo segue os layouts necessários, basta expandir.
Além de ser possível baixar os scripts prontos com os creates tanto de import quanto export.

## 1 - Importação

<details>
<summary>Ver Tabelas</summary>

**Sistema: teepOEE** <br>
**Atualizado em: 28/03/2024** <br>
**OS CAMPOS EM NEGRITO SÃO OBRIGATÓRIOS.**

<summary>Nome da Tabela = IMPORTRESOURCE </summary>
<h4>Tabela responsável pelo cadastro dos centros de recurso.</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| **company** | Integer |  | default=1 | Código da Empresa |
| **code** |	Varchar | max_length=30 |  | Código da máquina |
| description | Varchar | max_length=128 |  | Descrição da máquina |
| resource_group_code | Varchar | max_length=32 |  | Codigo do grupo de máquinas, associando com a ImportResourceGroup |	
| active |	BooleanField |		|default=False|Define se a máquina está ativa/inativa|
| status_imp | Varchar | max_length=1 | 'N'=new, 'U'=update, 'I'=integrated | Define status da linha, caso for importação por tabela|

<details>
  <summary>Exemplo JSON IMPORTRESOURCE</summary>
 
```json
{
  "table_name": "IMPORTRESOURCE",
  "description": "Tabela responsável pelo cadastro dos centros de recurso",
  "columns": [
    {
      "name": "company",
      "type": "Integer",
      "default": 1,
      "description": "Código da Empresa"
    },
    {
      "name": "code",
      "type": "Varchar",
      "max_length": 30,
      "description": "Código da máquina"
    },
    {
      "name": "description",
      "type": "Varchar",
      "max_length": 128,
      "description": "Descrição da máquina"
    },
    {
      "name": "resource_group_code",
      "type": "Varchar",
      "max_length": 32,
      "description": "Código do grupo de máquinas, associando com a ImportResourceGroup"
    },
    {
      "name": "active",
      "type": "BooleanField",
      "default": false,
      "description": "Define se a máquina está ativa/inativa"
    },
    {
      "name": "status_imp",
      "type": "Varchar",
      "max_length": 1,
      "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)"
    }
  ]
}
```
</details>

<summary>Nome da Tabela = IMPORTRESOURCEGROUP </summary>
<h4>Tabela responsável por criar grupos de máquinas, para facilitar a consulta de duas ou mais máquinas em relatórios, índices, entre outros.</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| **code** | Varchar | max_length=32 |  | Codigo do grupo de máquinas |
| description | Varchar | max_length=128 |  | Descrição completa do grupo |
| status_imp | Varchar | max_length=1 | 'N'=new, 'U'=update, 'I'=integrated | Define status da linha, caso for importação por tabela. |

<details>
  <summary>Exemplo JSON IMPORTRESOURCE</summary>
 
```json
{
    "table_name": "IMPORTRESOURCEGROUP",
    "description": "Tabela responsável por criar grupos de máquinas, para facilitar a consulta de duas ou mais máquinas em relatórios, índices, entre outros.",
    "columns": [
        {
            "name": "code",
            "type": "Varchar",
            "max_length": 32,
            "description": "Código do grupo de máquinas"
        },
        {
            "name": "description",
            "type": "Varchar",
            "max_length": 128,
            "description": "Descrição completa do grupo"
        },
        {
            "name": "status_imp",
            "type": "Varchar",
            "max_length": 1,
            "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)"
          }
  ]
}
```
</details>

<summary>Nome da Tabela = IMPORTOPERATOR</summary>
<h4>Tabela responsável por cadastrar os operadores que irão utilizar os coletores.</h4>

|Coluna        |Tipo de dado   |Tamanho         |Obs		                     |Descrição    |
|--------------|---------------|----------------|-----------------------------------|-------------|
| **company**	| Integer 	| default=1 	 |  					| Código da empresa |
| **code**	| Varchar 	| max_length=30	 |  				| Código do operador |
| **name** 	| Varchar 	| max_length=128 |  				| Nome do operador |
| active 	| BooleanField 	|  		 | default=True 		| Define ativo/inativo |
| status_imp 	| Varchar	| max_length=1 	 | 'N'=new,<br>'U'=update,<br>'I'=integrated | Define status da linha, caso for importação por tabela.|

<details>
  <summary>Exemplo JSON IMPORTOPERATOR</summary>
 
```json
{
    "table_name": "IMPORTOPERATOR",
    "description": "Tabela responsável por cadastrar os operadores que irão utilizar os coletores.",
    "columns": [
        {
            "name": "company",
            "type": "Integer",
            "default": 1,
            "description": "Código da empresa"
        },
        {
            "name": "code",
            "type": "Varchar",
            "max_length": 30,
            "description": "Código do operador"
        },
        {
            "name": "name",
            "type": "Varchar",
            "max_length": 128,
            "description": "Nome do operador"
        },
        {
            "name": "active",
            "type": "BooleanField",
            "default": true,
            "description": "Define ativo/inativo"
        },
        {
            "name": "status_imp",
            "type": "Varchar",
            "max_length": 1,
            "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)"
       }
  ]
}
```
</details>

<summary>Nome da Tabela = IMPORTSTOPREASON </summary>
<h4>Tabela responsável por cadastrar os motivos de parada de máquina, como por exemplo manutenção mecânica, elétrica, entre outros.</h4>

|Coluna        |Tipo de dado   |Tamanho         |Obs		                     |Descrição    |
|--------------|---------------|----------------|-----------------------------------|-------------|
| **company**|Integer|default=1||Código da empresa|
| **code**	|Varchar        |max_length=30	 |                                   |Código da parada|
| **description**	|Varchar	|max_length=128  |                                   |Descrição da parada|
| abbreviation	|Varchar	|max_length=16   |blank=True                         |Abreviação da parada|
| password        |Varchar	|max_length=32   |blank=True                         |Se não tiver senha, manter vazio. Se usar algum valor, ele será solicitado para confirmar a parada. Muito usado para mecânicos/eletricistas, onde apenas estes profissionais podem inserir determinadas paradas.|
| color	        |RGBColorField	|		 |blank=True,<br> null=True              |Exemplo: ‘#ffffff’ = branco|
| **active**	|BooleanField	|		 |default=True                       |Define ativo/inativo|
| setup	|BooleanField	|		 |default=False                       |Define se o motivo é setup|
| scheduled	|BooleanField	|		 |default=False                       |Define se o motivo é programado|
| status_imp	|Varchar	|max_length=1    |'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|

<details>
  <summary>Exemplo JSON IMPORTSTOPREASON</summary>

  ```json
  {
    "table_name": "IMPORTSTOPREASON",
    "description": "Tabela responsável por cadastrar os motivos de parada de máquina, como por exemplo manutenção mecânica, elétrica, entre outros.",
    "columns": [
      {
        "name": "company",
        "type": "Integer",
        "description": "Código da empresa"
      },
      {
        "name": "code",
        "type": "Varchar",
        "max_length": 30,
        "description": "Código da parada"
      },
      {
        "name": "description",
        "type": "Varchar",
        "max_length": 128,
        "description": "Descrição da parada"
      },
      {
        "name": "abbreviation",
        "type": "Varchar",
        "max_length": 16,
        "description": "Abreviação da parada"
      },
      {
        "name": "password",
        "type": "Varchar",
        "max_length": 32,
        "description": "Se não tiver senha, manter vazio. Se usar algum valor, ele será solicitado para confirmar a parada. Muito usado para mecânicos/eletricistas, onde apenas estes profissionais podem inserir determinadas paradas."
      },
      {
        "name": "color",
        "type": "RGBColorField",
        "description": "Exemplo: ‘#ffffff’ = branco"
      },
      {
        "name": "active",
        "type": "BooleanField",
        "description": "Define ativo/inativo"
      },
      {
        "name": "setup",
        "type": "BooleanField",
        "description": "Define se o motivo é setup"
      },
      {
        "name": "scheduled",
        "type": "BooleanField",
        "description": "Define se o motivo é programado"
      },
      {
        "name": "status_imp",
        "type": "Varchar",
        "max_length": 1,
        "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)"
  }
  ]
}
```
</details>
<summary>Nome da Tabela = IMPORTWASTEREASON</summary>
<h4>Tabela responsável por cadastrar os motivos de refugo que acontecem durante o processo produtivo.</h4>

|Coluna         |Tipo de dado  |Tamanho         |Obs		                     |Descrição    |
|---------------|--------------|----------------|------------------------------------|-------------|
|**company**        |Integer       |		|default=1			     |Código da empresa|
|**code**		|Varchar       |max_length=30	|				     |Código do refugo|
|**description**	|Varchar       |max_length=128	|				     |Descrição do refugo|
|status_imp	|Varchar       |max_length=1	|'N'=new,<br>'U'=update,<br>'I'=integrated  |Define status da linha, caso for importação por tabela.|

<details>
  <summary>Exemplo JSON IMPORTWASTEREASON</summary>

  ```json
  {
    "table_name": "IMPORTWASTEREASON",
    "description": "Tabela responsável por cadastrar os motivos de refugo que acontecem durante o processo produtivo.",
    "columns": [
      {
        "name": "company",
        "type": "Integer",
        "default": 1,
        "description": "Código da empresa"
      },
      {
        "name": "code",
        "type": "Varchar",
        "max_length": 30,
        "description": "Código do refugo"
      },
      {
        "name": "description",
        "type": "Varchar",
        "max_length": 128,
        "description": "Descrição do refugo"
      },
      {
        "name": "status_imp",
        "type": "Varchar",
        "max_length": 1,
        "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)"
      }
  ]
}
```
</details>


<summary>Nome da Tabela = IMPORTTOOL</summary>
<h4>Ferramentas utilizadas para produzir.</h4>

|Coluna                   |Tipo de dado |Tamanho           		|Obs		                    |Descrição    |
|-------------------------|-------------|-------------------------------|-----------------------------------|-------------|
|**company**|Integer|||Código da empresa|
|**code**|Varchar|max_length=30||Código da ferramenta|
|**description**|Varchar|max_length=128||Descrição da ferramenta|
<details>
  <summary>Exemplo JSON IMPORTTOOL</summary>

  ```json
{
  "table_name": "IMPORTTOOL",
  "description": "Ferramentas utilizadas para produzir.",
  "columns": [
    {
      "name": "company",
      "type": "Integer",
      "description": "Código da empresa"
    },
    {
      "name": "code",
      "type": "Varchar",
      "max_length": 30,
      "description": "Código da ferramenta"
    },
    {
      "name": "description",
      "type": "Varchar",
      "max_length": 128,
      "description": "Descrição da ferramenta"
   }
  ]
}
```
</details>


<summary>Nome da Tabela = IMPORTTOOLSETTINGS</summary>
<h4>Essa tabela é associada a IMPORTTOOL logo pode conter 1 ou N configurações da ferramenta. EX:
em QUAIS maquinas ela pode ser usada e em QUAL produto, o tempo de ciclo dela, limite de ciclo para entrar
em parada, assim como o coeficiente de multiplicação, exemplo se tenho um coeficiente 0,5, logo a cada 2 ciclos é produzido 1 peça.</h4>


|Coluna                   |Tipo de dado |Tamanho           		|Obs		                    |Descrição    |
|-------------------------|-------------|-------------------------------|-----------------------------------|-------------|
|**tool_code**|Varchar|max_digits=30| |Codigo da ferramenta usado na tabela IMPORTTOOL|
|**resource_code**|Varchar|max_digits=30| |Codigo do recurso usado na tabela IMPORTRESOURCE.|
|product_code|Varchar|max_digits=30| |Codigo do produto usado na tabela IMPORTPRODUCT.|
|multiplication_coefficient|DecimalField|max_digits=20,<br>decimal_places=10| |Número de peças incrementadas à cada ciclo de máquina. Por exemplo número de cavidades quando for injetora.|
|depreciation|DecimalField |max_digits=20,<br>decimal_places=10| |O valor padrão é 0. Quando se tem um molde que uma cavidade está danificada, deve-se enviar a quantidade danificada nesta coluna.|
|**cycle_time**|Integer| |Valor em milisegundos|Define tempo padrão da ferramenta, ou seja, ciclo padrão ex: 10.000. O valor é salvo em milisegundos na base da Teep, contudo caso for outra unidade de tempo, o mesmo deve ser informado para efetuar a conversão correta.|
|cycle_limit		  |Integer	||Valor em milisegundos|Este limite da uma “tolerância” ao tempo normal de ciclo, como no exemplo acima usei o valor 10.000. Se eu quiser dar 30 segundos de tolerância, utilizo o valor 40.000.|
|stop_limit		  |Integer	||Valor em milisegundos|Este campo substitui o tempo_ciclo quando usado um modo exclusivo para usinagem, geralmente Tornos CNC.|
|status_imp		  |Varchar	|max_length=1			|'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|

<details>
  <summary>Exemplo JSON IMPORTTOOLSETTINGS</summary>
 
  ```json
{
  "table_name": "IMPORTTOOLSETTINGS",
  "description": "Essa tabela é associada a IMPORTTOOL e pode conter 1 ou N configurações da ferramenta, como em quais máquinas ela pode ser usada e em qual produto, o tempo de ciclo dela, limite de ciclo para entrar em parada, assim como o coeficiente de multiplicação.",
  "columns": [
    {
      "name": "tool_code",
      "type": "Varchar",
      "max_digits": 30,
      "description": "Código da ferramenta usado na tabela IMPORTTOOL"
    },
    {
      "name": "resource_code",
      "type": "Varchar",
      "max_digits": 30,
      "description": "Código do recurso usado na tabela IMPORTRESOURCE."
    },
    {
      "name": "product_code",
      "type": "Varchar",
      "max_digits": 30,
      "description": "Código do produto usado na tabela IMPORTPRODUCT."
    },
    {
      "name": "multiplication_coefficient",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "description": "Número de peças incrementadas a cada ciclo de máquina. Por exemplo, número de cavidades quando for injetora."
    },
    {
      "name": "depreciation",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "description": "O valor padrão é 0. Quando se tem um molde que uma cavidade está danificada, deve-se enviar a quantidade danificada nesta coluna."
    },
    {
      "name": "cycle_time",
      "type": "Integer",
      "description": "Valor em milissegundos. Define o tempo padrão da ferramenta, ou seja, ciclo padrão ex: 10.000."
    },
    {
      "name": "cycle_limit",
      "type": "Integer",
      "description": "Valor em milissegundos. Este limite dá uma tolerância ao tempo normal de ciclo, como no exemplo acima usei o valor 10.000. Se eu quiser dar 30 segundos de tolerância, utilizo o valor 40.000."
    },
    {
      "name": "stop_limit",
      "type": "Integer",
      "description": "Valor em milissegundos. Este campo substitui o tempo_ciclo quando usado um modo exclusivo para usinagem, geralmente Tornos CNC."
    },
    {
      "name": "status_imp",
      "type": "Varchar",
      "max_length": 1,
      "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)."
  }
  ]
}
```
</details>

 
<summary>Nome da Tabela = IMPORTPRODUCT</summary>
<h4>São cadastrados os produtos, para posterior associar às ordens de produção.</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|---------------|--------------|----------------|------------------------------------|-------------|
|**company**|Integer||default=1|Código da empresa|
|**code**|Varchar|max_length=30||Código do produto|
|version|Varchar|max_length=30||Versão do produto|
|description|Varchar|max_length=128||Descrição do produto|
|expected_time|Integer||default = 0|Tempo esperado do produto|
|box_conversion|Varchar|max_length=128||Conversão de caixa do produto|
|external_id|Varchar|max_length=128||ID externo do produto|
|status_imp|Varchar|max_length=1|'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|

<details>
  <summary>Exemplo JSON IMPORTPRODUCT</summary>
 
  ```json
{
  "table_name": "IMPORTPRODUCT",
  "description": "São cadastrados os produtos, para posterior associar às ordens de produção.",
  "columns": [
    {
      "name": "company",
      "type": "Integer",
      "default": 1,
      "description": "Código da empresa"
    },
    {
      "name": "code",
      "type": "Varchar",
      "max_length": 30,
      "description": "Código do produto"
    },
    {
      "name": "version",
      "type": "Varchar",
      "max_length": 30,
      "description": "Versão do produto"
    },
    {
      "name": "description",
      "type": "Varchar",
      "max_length": 128,
      "description": "Descrição do produto"
    },
    {
      "name": "expected_time",
      "type": "Integer",
      "default": 0,
      "description": "Tempo esperado do produto"
    },
    {
      "name": "box_conversion",
      "type": "Varchar",
      "max_length": 128,
      "description": "Conversão de caixa do produto"
    },
    {
      "name": "external_id",
      "type": "Varchar",
      "max_length": 128,
      "description": "ID externo do produto"
    },
    {
      "name": "status_imp",
      "type": "Varchar",
      "max_length": 1,
      "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)."
  }
  ]
}
```
</details>

<summary>Nome da Tabela = IMPORTPRODUCTIONORDER</summary>
<h4>Tabela responsável pelas ordens de produção.</h4>

| Coluna| Tipo de dado| Tamanho| Obs| Descrição|
| -------------- | ------------- | ----------------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|**company**|Integer||default=1|Código da empresa|
|**origin**|Varchar|max_length=30|default='0'|Código da origem|
|**code**|Varchar|max_length=30||Código da ordem|
|description|Varchar|max_length=128|blank=True,<br> null=True| Descrição da ordem|
|**product_code**|Varchar|max_length=30|blank=True,<br> null=True| Código do produto|
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

<details>
  <summary>Exemplo JSON IMPORTPRODUCTIONORDER</summary>
 
  ```json
{
  "table_name": "IMPORTPRODUCTIONORDER",
  "description": "Tabela responsável pelas ordens de produção.",
  "columns": [
    {
      "name": "company",
      "type": "Integer",
      "default": 1,
      "description": "Código da empresa"
    },
    {
      "name": "origin",
      "type": "Varchar",
      "max_length": 30,
      "default": "0",
      "description": "Código da origem"
    },
    {
      "name": "code",
      "type": "Varchar",
      "max_length": 30,
      "description": "Código da ordem"
    },
    {
      "name": "description",
      "type": "Varchar",
      "max_length": 128,
      "blank": true,
      "null": true,
      "description": "Descrição da ordem"
    },
    {
      "name": "product_code",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": "Código do produto"
    },
    {
      "name": "derivation",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": "Derivação do produto"
    },
    {
      "name": "order",
      "type": "Integer",
      "default": 1,
      "blank": true,
      "null": true,
      "description": "Número do pedido"
    },
    {
      "name": "measurement_unit",
      "type": "Varchar",
      "max_length": 128,
      "default": "PC",
      "blank": true,
      "null": true,
      "description": "Unidade de medida, ex: pc, metros"
    },
    {
      "name": "customer_name",
      "type": "Varchar",
      "max_length": 128,
      "default": "",
      "blank": true,
      "null": true,
      "description": "Nome do cliente"
    },
    {
      "name": "quantity",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 1,
      "description": "Quantidade prevista da ordem"
    },
    {
      "name": "grouped_production_order",
      "type": "Varchar",
      "max_length": 30,
      "null": true,
      "blank": true,
      "description": "A coluna grouped_production_order é usada para realizar agrupamento de ordens de produção."
    },
    {
      "name": "fraction",
      "type": "DecimalField",
      "max_digits": 10,
      "decimal_places": 9,
      "default": 1,
      "description": "O percentual de produção que deve ser distribuído entre as OPs do agrupamento."
    },
    {
      "name": "deadline",
      "type": "DateTimeField",
      "null": true,
      "blank": true,
      "description": "Data limite"
    },
    {
      "name": "external_id",
      "type": "Varchar",
      "max_length": 128,
      "description": "ID externo da ordem de produção"
    },
    {
      "name": "priority",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 1,
      "description": "Distribuição das ordens no modulo planejamento."
    },
    {
      "name": "status_imp",
      "type": "Varchar",
      "max_length": 1,
      "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)."
  }
  ]
}
```
</details>


<summary>Nome da Tabela = IMPORTPRODUCTIONSEQUENCE</summary>
<h4>Tabela responsável por concentrar as sequencias de produção, também conhecidas como roteiros, atividades, entre outros.</h4>

| Coluna| Tipo de dado| Tamanho| Obs| Descrição|
| -------------------- | ------------- | ----------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------- |
|**company**| Integer|| default=1| Código da empresa|
|**origin**| Varchar| max_length=30| default='0'| Código da origem|
|**production_order_code**| Varchar| max_length=30|| Código da Ordem Produção|
|**sequence**| Integer||| Sequência do Roteiro|
|**stage**| Integer||| Codigo do estagio|
|resource_code| Varchar| max_length=30| blank=True,<br> null=True| Codigo do resource usado em IMPORTRESOURCE|
|tool_code| Varchar| max_length=30| blank=True,<br> null=True| Codigo da ferramenta usado em IMPORTTOOL|
|operation_code| Varchar| max_length=30| blank=True,<br> null=True| Código da operacao|
|operation_description| Varchar| max_length=30| blank=True,<br> null=True| Descrição da operacao|
|quantity| DecimalField  | max_digits=20,<br>decimal_places=10 || Quantidade prevista|
|quantity2| DecimalField  | max_digits=20,<br>decimal_places=10 || Quantidade2 prevista|
|conversion_rate| Integer||| taxa de conversão usado para caso a unidade de medida seja M².|
|measurement_unit| Varchar| max_digits=128,<br>default="PC"| blank=True, null=True| Unidade de medida da sequencia, Exemplo: PC(peça), M² (metro quadrado) |
|expected_start_date | DateTimeField || blank=True,<br> null=True| Data prevista de inicio|
|expected_end_date| DateTimeField || blank=True,<br> null=True| Data prevista de termino|
|**expected_setup**| BigInteger|| default=0| Tempo de setup em milisegundos, caso não tiver mandar 1. O valor é salvo em milisegundos na base da Teep, contudo caso for outra unidade de tempo, o mesmo deve ser informado para efetuar a conversão correta.|
|**expected_time**| BigInteger|| default=0| Tempo de produção em milisegundos, caso nao tiver mandar 1. O valor é salvo em milisegundos na base da Teep, contudo caso for outra unidade de tempo, o mesmo deve ser informado para efetuar a conversão correta.|
|external_id|Varchar|max_length=128||Armazenamos o id do ERP, caso o mesmo deseja que informamos o id na devolução do dado.|
|situation|Varchar|max_length=128||Situacao da sequencia de produção, L = liberado, F = finalizado|
|status_imp| Varchar| max_length=1| 'N'=new,<br>'U'=update,<br>'I'=integrated | Define status da linha, caso for importação por tabela.|

<details>
  <summary>Exemplo JSON IMPORTPRODUCTIONSEQUENCE</summary>
 
  ```json
{
  "table_name": "IMPORTPRODUCTIONSEQUENCE",
  "description": "Tabela responsável por concentrar as sequências de produção, também conhecidas como roteiros, atividades, entre outros.",
  "columns": [
    {
      "name": "company",
      "type": "Integer",
      "default": 1,
      "description": "Código da empresa"
    },
    {
      "name": "origin",
      "type": "Varchar",
      "max_length": 30,
      "default": "0",
      "description": "Código da origem"
    },
    {
      "name": "production_order_code",
      "type": "Varchar",
      "max_length": 30,
      "description": "Código da Ordem Produção"
    },
    {
      "name": "sequence",
      "type": "Integer",
      "description": "Sequência do Roteiro"
    },
    {
      "name": "stage",
      "type": "Integer",
      "description": "Código do estágio"
    },
    {
      "name": "resource_code",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": "Código do resource usado em IMPORTRESOURCE"
    },
    {
      "name": "tool_code",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": "Código da ferramenta usado em IMPORTTOOL"
    },
    {
      "name": "operation_code",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": "Código da operação"
    },
    {
      "name": "operation_description",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": "Descrição da operação"
    },
    {
      "name": "quantity",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "description": "Quantidade prevista"
    },
    {
      "name": "quantity2",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "description": "Quantidade2 prevista"
    },
    {
      "name": "conversion_rate",
      "type": "Integer",
      "description": "Taxa de conversão usado para caso a unidade de medida seja M²."
    },
    {
      "name": "measurement_unit",
      "type": "Varchar",
      "max_length": 128,
      "default": "PC",
      "blank": true,
      "null": true,
      "description": "Unidade de medida da sequência, Exemplo: PC(peça), M² (metro quadrado)"
    },
    {
      "name": "expected_start_date",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "Data prevista de início"
    },
    {
      "name": "expected_end_date",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "Data prevista de término"
    },
    {
      "name": "expected_setup",
      "type": "BigInteger",
      "default": 0,
      "description": "Tempo de setup em milissegundos, caso não tiver mandar 1."
    },
    {
      "name": "expected_time",
      "type": "BigInteger",
      "default": 0,
      "description": "Tempo de produção em milissegundos, caso não tiver mandar 1."
    },
    {
      "name": "external_id",
      "type": "Varchar",
      "max_length": 128,
      "description": "Armazenamos o ID do ERP."
    },
    {
      "name": "situation",
      "type": "Varchar",
      "max_length": 128,
      "description": "Situação da sequência de produção, L = liberado, F = finalizado"
    },
    {
      "name": "status_imp",
      "type": "Varchar",
      "max_length": 1,
      "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)."
  }
  ]
}
```
</details>

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

<details>
  <summary>Exemplo JSON IMPORTGROUPEDPRODUCTIONORDER</summary>
 
  ```json
{
  "table_name": "IMPORTGROUPEDPRODUCTIONORDER",
  "description": "Tabela responsável por concentrar o agrupamento de ordens de produção.",
  "columns": [
    {
      "name": "company",
      "type": "Integer",
      "default": 1,
      "description": "Código da empresa"
    },
    {
      "name": "origin",
      "type": "Varchar",
      "max_length": 30,
      "default": "0",
      "description": "Código da origem"
    },
    {
      "name": "code",
      "type": "Varchar",
      "max_length": 30,
      "description": "Código do Agrupamento das Ordens Produção"
    },
    {
      "name": "stage",
      "type": "Integer",
      "description": "Código do estagio"
    },
    {
      "name": "production_orders",
      "type": "Integer",
      "description": "IDs das ordens de produção"
    },
    {
      "name": "production_sequence",
      "type": "Integer",
      "description": "Sequência do agrupamento"
    },
    {
      "name": "fraction",
      "type": "Integer",
      "description": "Fração do agrupamento"
    },
    {
      "name": "status_imp",
      "type": "Varchar",
      "max_length": 1,
      "description": "Define status da linha, caso for importação por tabela. Valores possíveis: 'N' (new), 'U' (update), 'I' (integrated)"
 }
  ]
}
```
</details>
<summary>Nome da Tabela = IMPORTCOMPONENTS</summary>
<h4>Tabela responsável por concentrar os componentes.</h4>

| Coluna| Tipo de dado| Tamanho| Obs| Descrição|
| -------------------- | ------------- | ----------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------- |
|**barcode**|Varchar|max_length=128||Código de barras que identifica o item|
|**code**|Varchar|max_length=128||Código do componente que diz que aquele componente é, por exemplo, o “PAPEL LAMINADO 40g”|
|description|Varchar|max_length=128||descricao do item, onde esse valor é relacionado ao código|
|**total_quantity**|DecimalField|max_digits=20,<br>decimal_places=10||Quantidade total que o item tem em sua originalidade. Por exemplo, em caso de uma bobina, entenda como o valor total da bobina, sem ter valor consumido|
|**total_weight**|DecimalField|max_digits=20,<br>decimal_places=10||Peso total que o item tem em sua originalidade. Por exemplo, em caso de uma bobina, entenda como o valor total da bobina, sem ter valor consumido|
|**current_quantity**|DecimalField|max_digits=20,<br>decimal_places=10||Quantidade atual que a bobina tem, onde esse valor é diferente da quantidade_total quando essa bobina já tiver sido consumida no processo|
|**current_weight**|DecimalField|max_digits=20,<br>decimal_places=10||Peso atual que a bobina tem, onde esse valor é diferente da peso_total quando essa bobina já tiver sido consumida no processo|
|conversion_rate|Integer||default=1|taxa de conversão|
|**type**|Varchar|max_length=30||Alguma identificação do item, como: Bobina;Tinta;Massa;Pacote|
|**status**|Varchar|max_length=1|'L'=liberado,<br>'F'=finalizado,<br>'C'=em consumo|Situação do componente, onde identifica se o componente está disponível para produção ou não|
|extras|Varchar|max_length=500||Dados adicionais de identificação, ações, etc|

<summary>Nome da Tabela = IMPORTCOMPONENTSPRODUCTIONORDER</summary>
<h4>Tabela responsável por concentrar os componentes vinculado a ordem de produção.</h4>

| Coluna| Tipo de dado| Tamanho| Obs| Descrição|
| -------------------- | ------------- | ----------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------- |
|**code**|Varchar|max_length=128||Valor deve corresponder para algum valor presente na tabela componente: codigo do componente que diz que aquele componente é, por exemplo, o “PAPEL LAMINADO 40g”|
|**code_production_order**|Varchar|max_length=30||Código da ordem de producao que vai receber esse componente|
|**origin_production_order**|Varchar|max_length=30||Origem da ordem de producao que vai receber esse componente|
|**stage_production_sequence**|Integer|||Estágio da sequencia de producao que vai receber esse componente|
|**production_sequence**|Integer|||Sequencia da ordem de producao que vai receber esse componente|
|**reserved_quantity**|DecimalField|max_digits=20,<br>decimal_places=10||Quantidade do componente reservada para produção na ordem de produção|
|**reserved_weight**|DecimalField|max_digits=20,<br>decimal_places=10||Peso do componente reservada para produção ordem de produção|
|**current_quantity**|DecimalField|max_digits=20,<br>decimal_places=10||Quantidade atual da reserva de componente, após descontar os consumos|
|**current_weight**|DecimalField|max_digits=20,<br>decimal_places=10||Peso atual da reserva de componente, após descontar os consumos|
|**status**|Varchar|max_length=1|'L'=liberado,<br>'F'=finalizado,<br>'C'=em consumo|Situação do componente, onde identifica se o componente está disponível para produção ou não|
|extras|Varchar|max_length=500|| Dados adicionais de identificação, ações, etc|
</details>

## 2 - Exportação

<details>
 <summary>Ver Tabelas</summary>
 
 **Sistema: teepOEE** <br>
 **Atualizado em: 03/04/2024**<br>


<summary>Nome da Tabela = EXPORTPRODUCTION </summary><br>
<h4>Tabela responsável por gravar os eventos de produção</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| id | IntegerField |  | primary_key=True | id criado sequencial|
| generation_date | DateTimeField |  | blank=True, null=True | Data/hora do envio do evento.|
| company | IntegerField |  | blank=True, null=True ||
| origin | Varchar | max_length=30 | blank=True, null=True ||
| production_order | Varchar | max_length=30 | blank=True, null=True ||
| stage | IntegerField |  | blank=True, null=True ||
| production_sequence | IntegerField |  | blank=True, null=True ||
| product | Varchar | max_length=30 | blank=True, null=True ||
| resource | Varchar | max_length=30 | blank=True, null=True ||
| resource_group | Varchar | max_length=30 | blank=True, null=True ||
| tool | Varchar | max_length=30 | blank=True, null=True ||
| operator | Varchar | max_length=30 | blank=True, null=True ||
| shift | Varchar | max_length=30 | blank=True, null=True ||
| control | Varchar | max_length=30 | blank=True, null=True ||
| start | DateTimeField |  | blank=True, null=True | inicio do evento|
| end |  | DateTimeField | blank=True, null=True | fim do evento|
| duration | IntegerField |  |  | duracao do evento fim - inicio|
| batch_code | Varchar | max_length=32 | default="", blank=True, null=True | Codigo do lote, em caso onde o cliente tenha essa informação o campo é alimentado|
| quantity | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| quantity2 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| quantity3 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| conversion_rate | DecimalField | max_digits=20, decimal_places=10 | default=1 ||


<details>
  <summary>Exemplo JSON EXPORTPRODUCTION</summary>
 
  ```json
{
  "table_name": "EXPORTPRODUCTION",
  "description": "Tabela responsável por gravar os eventos de produção.",
  "columns": [
    {
      "name": "id",
      "type": "IntegerField",
      "primary_key": true,
      "description": "id criado sequencial"
    },
    {
      "name": "generation_date",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "Data/hora do envio do evento."
    },
    {
      "name": "company",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "origin",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "production_order",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "stage",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "production_sequence",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "product",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "resource",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "resource_group",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "tool",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "operator",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "shift",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "control",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "start",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "início do evento"
    },
    {
      "name": "end",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "fim do evento"
    },
    {
      "name": "duration",
      "type": "IntegerField",
      "description": "duração do evento fim - início"
    },
    {
      "name": "batch_code",
      "type": "Varchar",
      "max_length": 32,
      "default": "",
      "blank": true,
      "null": true,
      "description": "Código do lote, em caso onde o cliente tenha essa informação o campo é alimentado"
    },
    {
      "name": "quantity",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 0,
      "description": ""
    },
    {
      "name": "quantity2",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 0,
      "description": ""
    },
    {
      "name": "quantity3",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 0,
      "description": ""
    },
    {
      "name": "conversion_rate",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 1,
      "description": ""
 }
  ]
}
```
</details>

<summary>Nome da Tabela = EXPORTWASTE </summary><br>
<h4>Tabela responsável por gravar os eventos de refugo</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| id | IntegerField |  | primary_key=True | id criado sequencial|
| generation_date | DateTimeField |  | blank=True, null=True | Data/hora do envio do evento.|
| company | IntegerField |  | blank=True, null=True ||
| origin | Varchar | max_length=30 | blank=True, null=True ||
| production_order | Varchar | max_length=30 | blank=True, null=True ||
| stage | IntegerField |  | blank=True, null=True ||
| production_sequence | IntegerField |  | blank=True, null=True ||
| product | Varchar | max_length=30 | blank=True, null=True ||
| resource | Varchar | max_length=30 | blank=True, null=True ||
| resource_group | Varchar | max_length=30 | blank=True, null=True ||
| tool | Varchar | max_length=30 | blank=True, null=True ||
| operator | Varchar | max_length=30 | blank=True, null=True ||
| shift | Varchar | max_length=30 | blank=True, null=True ||
| time | DateTimeField |  | blank=True, null=True | Horario do apontamento de refugo.|
| reason | Varchar | max_length=30 | blank=True, null=True ||
| batch_code | Varchar | max_length=32 | default="", blank=True | Codigo do lote, Caso o cliente tenha essa informação o campo é alimentado|
| quantity | DecimalField | max_digits=20, decimal_places=10 |  ||
| quantity2 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| quantity3 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| conversion_rate | DecimalField | max_digits=20, decimal_places=10 | default=1 ||
| classification | Varchar | max_length=30 | blank=True, null=True ||
| cause_step | Varchar | max_length=30 | blank=True, null=True ||
| cause_resource | Varchar | max_length=30 | blank=True, null=True ||

<details>
  <summary>Exemplo JSON EXPORTWASTE</summary>
 
  ```json

{
  "table_name": "EXPORTWASTE",
  "description": "Tabela responsável por gravar os eventos de refugo.",
  "columns": [
    {
      "name": "id",
      "type": "IntegerField",
      "primary_key": true,
      "description": "id criado sequencial"
    },
    {
      "name": "generation_date",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "Data/hora do envio do evento."
    },
    {
      "name": "company",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "origin",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "production_order",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "stage",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "production_sequence",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "product",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "resource",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "resource_group",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "tool",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "operator",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "shift",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "time",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "Horário do apontamento de refugo."
    },
    {
      "name": "reason",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "batch_code",
      "type": "Varchar",
      "max_length": 32,
      "default": "",
      "blank": true,
      "null": true,
      "description": "Código do lote. Caso o cliente tenha essa informação, o campo é alimentado."
    },
    {
      "name": "quantity",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "description": ""
    },
    {
      "name": "quantity2",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 0,
      "description": ""
    },
    {
      "name": "quantity3",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 0,
      "description": ""
    },
    {
      "name": "conversion_rate",
      "type": "DecimalField",
      "max_digits": 20,
      "decimal_places": 10,
      "default": 1,
      "description": ""
    },
    {
      "name": "classification",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "cause_step",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "cause_resource",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
 }
  ]
}
```
</details>

<summary>Nome da Tabela = EXPORTSTOP</summary><br>
<h4>Tabela responsável por gravar os eventos de parada</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| id | IntegerField |  | primary_key=True | id criado sequencial|
| generation_date | DateTimeField |  | blank=True, null=True | Data/hora do envio do evento.|
| company | IntegerField |  | blank=True, null=True ||
| origin | Varchar | max_length=30 | blank=True, null=True ||
| production_order | Varchar | max_length=30 | blank=True, null=True ||
| stage | IntegerField |  | blank=True, null=True ||
| production_sequence | IntegerField |  | blank=True, null=True ||
| product | Varchar | max_length=30 | blank=True, null=True ||
| resource | Varchar | max_length=30 | blank=True, null=True ||
| resource_group | Varchar | max_length=30 | blank=True, null=True ||
| tool | Varchar | max_length=30 | blank=True, null=True ||
| operator | Varchar | max_length=30 | blank=True, null=True ||
| shift | Varchar | max_length=30 | blank=True, null=True ||
| start | DateTimeField |  | blank=True, null=True | inicio do evento|
| end |  | DateTimeField | blank=True, null=True | fim do evento|
| duration | IntegerField |  |  | duracao do evento fim - inicio|
| reason | Varchar | max_length=30 | blank=True, null=True ||
| setup | BooleanField | BooleanField | default=False ||

<details>
  <summary>Exemplo JSON EXPORTSTOP</summary>
 
  ```json
{
  "table_name": "EXPORTSTOP",
  "description": "Tabela responsável por gravar os eventos de parada.",
  "columns": [
    {
      "name": "id",
      "type": "IntegerField",
      "primary_key": true,
      "description": "id criado sequencial"
    },
    {
      "name": "generation_date",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "Data/hora do envio do evento."
    },
    {
      "name": "company",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "origin",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "production_order",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "stage",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "production_sequence",
      "type": "IntegerField",
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "product",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "resource",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "resource_group",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "tool",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "operator",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "shift",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "start",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "início do evento"
    },
    {
      "name": "end",
      "type": "DateTimeField",
      "blank": true,
      "null": true,
      "description": "fim do evento"
    },
    {
      "name": "duration",
      "type": "IntegerField",
      "description": "duração do evento fim - início"
    },
    {
      "name": "reason",
      "type": "Varchar",
      "max_length": 30,
      "blank": true,
      "null": true,
      "description": ""
    },
    {
      "name": "setup",
      "type": "BooleanField",
      "default": false,
      "description": ""
 }
  ]
}
```
</details>
</details>
