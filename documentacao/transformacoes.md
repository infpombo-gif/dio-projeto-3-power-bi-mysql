# Análise e Transformação dos Dados

## 1. Objetivo

Preparar os dados do banco de dados Company para análise no Power BI, avaliando tipos de dados, valores nulos, relacionamentos e possibilidades de transformação.

## 2. Estrutura dos dados

O modelo de origem contém seis tabelas:

- `employee`: funcionários, salários e supervisores.
- `departament`: departamentos e seus responsáveis.
- `dept_locations`: localidades dos departamentos.
- `project`: projetos e departamentos responsáveis.
- `works_on`: funcionários, projetos e horas trabalhadas.
- `dependent`: dependentes dos funcionários.

## 3. Transformações planejadas

- Conferir nomes de colunas e tipos de dados.
- Garantir que valores monetários sejam tratados como números decimais.
- Identificar valores nulos e avaliar cada caso antes de removê-los.
- Preservar funcionários sem supervisor quando isso representar a hierarquia organizacional.
- Verificar departamentos e projetos sem correspondências.
- Analisar horas trabalhadas e dados duplicados.
- Combinar nome e sobrenome dos funcionários.
- Relacionar funcionários com departamentos e respectivos gerentes.
- Combinar nome do departamento e localidade para identificar cada combinação.
- Remover colunas desnecessárias para as análises.
- Agrupar funcionários por gerente para obter indicadores de equipe.

## 4. Mesclar ou acrescentar?

A mesclagem (*Merge*) combina tabelas por meio de uma coluna relacionada, como o código do departamento ou o identificador do funcionário.

O acréscimo (*Append*) empilha linhas de tabelas com estruturas compatíveis.

Neste projeto, a mesclagem é apropriada para enriquecer os registros de funcionários com nomes de departamentos e gerentes, pois as informações estão distribuídas em tabelas relacionadas.

## 5. Situação da execução

Os scripts SQL foram organizados no repositório. As transformações descritas são um plano de trabalho e precisam ser executadas e verificadas em um ambiente MySQL e Power BI antes de serem consideradas concluídas.

## 6. Conclusão

O objetivo é produzir uma base consistente, documentada e adequada à análise de dados, preservando a integridade dos relacionamentos e justificando as decisões de transformação.
