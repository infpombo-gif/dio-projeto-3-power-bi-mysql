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

## 7. Análise das regras de negócio e qualidade dos dados

### Valores nulos

O campo `Super_ssn` pode ser nulo para um funcionário que não possui supervisor direto. Esse caso deve ser analisado conforme a hierarquia organizacional, sem remoção automática do registro.

O campo `Mgr_ssn` da tabela `departament` é definido como obrigatório no esquema original. Ainda assim, é importante verificar a integridade dos relacionamentos.

### Tipos de dados

- `Salary`: valor monetário que deve ser tratado como número decimal.
- `Hours`: quantidade de horas que deve permanecer numérica.
- Datas de nascimento, criação de departamentos e início de gerência devem ser reconhecidas como datas.
- Identificadores e códigos devem preservar seu significado e formato.

### Relacionamentos

As tabelas são relacionadas pelos seguintes campos:

- `employee.Dno` → `departament.Dnumber`
- `employee.Super_ssn` → `employee.Ssn`
- `departament.Mgr_ssn` → `employee.Ssn`
- `dept_locations.Dnumber` → `departament.Dnumber`
- `project.Dnum` → `departament.Dnumber`
- `works_on.Essn` → `employee.Ssn`
- `works_on.Pno` → `project.Pnumber`
- `dependent.Essn` → `employee.Ssn`

### Mesclagem de informações

A mesclagem permite acrescentar informações relacionadas de outra tabela, como nome do departamento ou nome do gerente. A escolha entre `INNER JOIN` e `LEFT JOIN` deve considerar quais registros precisam ser preservados.

### Agregações

A contagem de funcionários por departamento e a soma de horas por projeto permitem criar indicadores úteis para análise gerencial.

### Limitações atuais

As consultas e regras foram preparadas com base na estrutura e nos dados presentes nos scripts. A execução real, a validação dos resultados e a implementação das transformações no Power BI permanecem pendentes.
