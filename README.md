![Vedois Produção Tecnologia](http://vedois.com.br/site/wp-content/uploads/2018/04/logovedoispreto3.png)

## Introdução sobre Integração

A integração com o sistema da Vedois Produção pode ser feito com N tecnologias, por exemplo:
Webservice, Tabela, View, CSV. A Vedois Produção recomenda o uso de webservice ou tabela, pois possuem melhor performance/segurança.

A integração deve ser separada em duas etapas.

- 1 - Importação ( Vedois Produção <-- ERP )
- 2 - Exportação ( Vedois Produção --> ERP ) em breve.

Abaixo segue os layouts necessários, basta expandir.
Além de ser possível baixar os scripts prontos com os creates tanto de import quanto export.

## 1 - Importação

<details>
<summary>Ver Tabelas</summary>

**Sistema: Vedois-Produção** <br>
**Atualizado em: 28/03/2024** <br>
**OS CAMPOS EM NEGRITO SÃO OBRIGATÓRIOS.**

<summary>Nome da Tabela = IMPORTRESOURCE </summary>
<h4>Tabela responsável pelo cadastro dos centros de recurso.</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| **company** | Integer |  | default=1 | Código da Empresa |
| **code** |	Varchar | max_length=30 |  | Código da máquina |
| description | Varchar | max_length=128 |  | Descrição da máquina |
| resource_group | Varchar | max_length=32 |  | Codigo do grupo de máquinas, associando com a ImportResourceGroup |	
| active |	BooleanField |		|default=False|Define se a máquina está ativa/inativa|
| status_imp | Varchar | max_length=1 | 'N'=new, 'U'=update, 'I'=integrated | Define status da linha, caso for importação por tabela. |

<summary>Nome da Tabela = IMPORTRESOURCEGROUP </summary>
<h4>Tabela responsável por criar grupos de máquinas, para facilitar a consulta de duas ou mais máquinas em relatórios, índices, entre outros.</h4>

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| **code** | Varchar | max_length=32 |  | Codigo do grupo de máquinas |
| description | Varchar | max_length=128 |  | Descrição completa do grupo |
| status_imp | Varchar | max_length=1 | 'N'=new, 'U'=update, 'I'=integrated | Define status da linha, caso for importação por tabela. |

<summary>Nome da Tabela = IMPORTOPERATOR</summary>
<h4>Tabela responsável por cadastrar os operadores que irão utilizar os coletores.</h4>

|Coluna        |Tipo de dado   |Tamanho         |Obs		                     |Descrição    |
|--------------|---------------|----------------|-----------------------------------|-------------|
| **company**	| Integer 	| default=1 	 |  					| Código da empresa |
| **code**	| Varchar 	| max_length=30	 |  				| Código do operador |
| **name** 	| Varchar 	| max_length=128 |  				| Nome do operador |
| active 	| BooleanField 	|  		 | default=True 		| Define ativo/inativo |
| status_imp 	| Varchar	| max_length=1 	 | 'N'=new,<br>'U'=update,<br>'I'=integrated | Define status da linha, caso for importação por tabela.|


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
| status_imp	|Varchar	|max_length=1    |'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|

<summary>Nome da Tabela = IMPORTWASTEREASON</summary>
<h4>Tabela responsável por cadastrar os motivos de refugo que acontecem durante o processo produtivo.</h4>

|Coluna         |Tipo de dado  |Tamanho         |Obs		                     |Descrição    |
|---------------|--------------|----------------|------------------------------------|-------------|
|**company**        |Integer       |		|default=1			     |Código da empresa|
|**code**		|Varchar       |max_length=30	|				     |Código do refugo|
|**description**	|Varchar       |max_length=128	|				     |Descrição do refugo|
|status_imp	|Varchar       |max_length=1	|'N'=new,<br>'U'=update,<br>'I'=integrated  |Define status da linha, caso for importação por tabela.|


<summary>Nome da Tabela = IMPORTTOOL</summary>
<h4>Ferramentas utilizadas para produzir.</h4>

|Coluna                   |Tipo de dado |Tamanho           		|Obs		                    |Descrição    |
|-------------------------|-------------|-------------------------------|-----------------------------------|-------------|
|**company**|Integer|||Código da empresa|
|**code**|Varchar|max_length=30||Código da ferramenta|
|**description**|Varchar|max_length=128||Descrição da ferramenta|


<summary>Nome da Tabela = IMPORTTOOLSETTINGS</summary>
<h4>Essa tabela é associada a IMPORTTOOL logo pode conter 1 ou N configurações da ferramenta. EX:
em QUAIS maquinas ela pode ser usada e em QUAL produto, o tempo de ciclo dela, limite de ciclo para entrar
em parada, assim como o coeficiente de multiplicação, exemplo se tenho um coeficiente 0,5, logo a cada 2 ciclos é produzido 1 peça.</h4>


|Coluna                   |Tipo de dado |Tamanho           		|Obs		                    |Descrição    |
|-------------------------|-------------|-------------------------------|-----------------------------------|-------------|
|tool_code|DecimalField	|max_digits=20,<br>decimal_places=10| |Codigo da ferramenta usado na tabela IMPORTTOOL|
|resource_code|DecimalField|max_digits=20,<br>decimal_places=10| |Codigo do recurso usado na tabela IMPORTRESOURCE.|
|product_code|DecimalField	|max_digits=20,<br>decimal_places=10| |Codigo do produto usado na tabela IMPORTPRODUCT.|
|multiplication_coefficient|DecimalField|max_digits=20,<br>decimal_places=10| |Número de peças incrementadas à cada ciclo de máquina. Por exemplo número de cavidades quando for injetora.|
|depreciation|DecimalField |max_digits=20,<br>decimal_places=10| |O valor padrão é 0. Quando se tem um molde que uma cavidade está danificada, deve-se enviar a quantidade danificada nesta coluna.|
|**cycle_time**|Integer| |Valor em milisegundos|Define tempo padrão da ferramenta, ou seja, ciclo padrão ex: 10.000. O valor é salvo em milisegundos na base do Vedois, contudo caso for outra unidade de tempo, o mesmo deve ser informado para efetuar a conversão correta.|
|cycle_limit		  |Integer	||Valor em milisegundos|Este limite da uma “tolerância” ao tempo normal de ciclo, como no exemplo acima usei o valor 10.000. Se eu quiser dar 30 segundos de tolerância, utilizo o valor 40.000.|
|stop_limit		  |Integer	||Valor em milisegundos|Este campo substitui o tempo_ciclo quando usado um modo exclusivo para usinagem, geralmente Tornos CNC.|
|status_imp		  |Varchar	|max_length=1			|'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|
 
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
|resource| Varchar| max_length=30| blank=True,<br> null=True| Codigo do resource usado em IMPORTRESOURCE|
|tool| Varchar| max_length=30| blank=True,<br> null=True| Codigo da ferramenta usado em IMPORTTOOL|
|operation_code| Varchar| max_length=30| blank=True,<br> null=True| Código da operacao|
|operation_description| Varchar| max_length=30| blank=True,<br> null=True| Descrição da operacao|
|quantity| DecimalField  | max_digits=20,<br>decimal_places=10 || Quantidade prevista|
|quantity2| DecimalField  | max_digits=20,<br>decimal_places=10 || Quantidade2 prevista|
|conversion_rate| Integer||| taxa de conversão usado para caso a unidade de medida seja M².|
|measurement_unit| Varchar| max_digits=128,<br>default="PC"| blank=True, null=True| Unidade de medida da sequencia, Exemplo: PC(peça), M² (metro quadrado) |
|expected_start_date | DateTimeField || blank=True,<br> null=True| Data prevista de inicio|
|expected_end_date| DateTimeField || blank=True,<br> null=True| Data prevista de termino|
|**expected_setup**| BigInteger|| default=0| Tempo de setup em milisegundos, caso não tiver mandar 1. O valor é salvo em milisegundos na base do Vedois, contudo caso for outra unidade de tempo, o mesmo deve ser informado para efetuar a conversão correta.|
|**expected_time**| BigInteger|| default=0| Tempo de produção em milisegundos, caso nao tiver mandar 1. O valor é salvo em milisegundos na base do Vedois, contudo caso for outra unidade de tempo, o mesmo deve ser informado para efetuar a conversão correta.|
|external_id|Varchar|max_length=128||Armazenamos o id do ERP, caso o mesmo deseja que informamos o id na devolução do dado.|
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
