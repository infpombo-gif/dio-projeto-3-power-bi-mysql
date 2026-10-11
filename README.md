# Projeto DIO — Integração MySQL e Power BI

## Sobre o projeto

Este projeto faz parte do desafio de projeto da DIO, com foco na integração de dados de um banco de dados MySQL com o Power BI e na preparação dos dados para análise.

O trabalho utiliza o banco de dados Company, composto por tabelas de funcionários, departamentos, localidades, projetos, horas trabalhadas e dependentes.

## Objetivos

- Compreender a estrutura do banco de dados relacional.
- Identificar relacionamentos entre tabelas.
- Preparar consultas SQL para validação dos dados.
- Planejar transformações para utilização no Power BI.
- Documentar decisões sobre valores nulos, tipos de dados, mesclagens e agregações.

## Estrutura do banco de dados

| Tabela | Descrição |
|---|---|
| `employee` | Funcionários, salários e supervisores |
| `departament` | Departamentos e gerentes responsáveis |
| `dept_locations` | Localidades dos departamentos |
| `project` | Projetos e departamentos associados |
| `works_on` | Funcionários, projetos e horas trabalhadas |
| `dependent` | Dependentes dos funcionários |

## Estrutura do repositório

```text
dio-projeto-3-power-bi-mysql/
├── README.md
├── sql/
│   ├── 01_criacao_banco.sql
│   ├── 02_insercao_dados.sql
│   └── consultas_validacao.sql
├── documentacao/
│   └── transformacoes.md
└── evidencias/
    └── README.md
```

## Validações e transformações planejadas

- Verificação de funcionários sem supervisor.
- Análise de departamentos e respectivos gerentes.
- Contagem de funcionários por departamento.
- Totalização das horas trabalhadas por projeto.
- Verificação de projetos sem funcionários alocados.
- Análise das localidades dos departamentos.
- Avaliação de valores nulos e tipos de dados.
- Preparação das tabelas para análise no Power BI.

## Mesclagem versus acréscimo

A mesclagem (*Merge*) relaciona tabelas por colunas em comum, como o código do departamento. O acréscimo (*Append*) combina linhas de tabelas com estruturas compatíveis.

A mesclagem é apropriada para enriquecer os registros dos funcionários com informações dos departamentos e gerentes.

## Status do projeto

- [x] Organização inicial do repositório.
- [x] Inclusão dos scripts SQL de criação e inserção de dados.
- [x] Preparação das consultas de validação.
- [x] Documentação inicial das transformações planejadas.
- [ ] Execução das consultas em um ambiente MySQL.
- [ ] Execução das transformações no Power BI.
- [ ] Criação e validação do relatório final.
- [ ] Inclusão de evidências de execução.

**Observação:** as consultas e transformações ainda precisam ser executadas e verificadas em um ambiente compatível. Os itens pendentes serão atualizados conforme o desenvolvimento do projeto.

## Tecnologias e ferramentas

- MySQL
- SQL
- Microsoft Power BI
- GitHub

## Referência

Base de estudos disponibilizada no repositório [Power BI Analyst](https://github.com/julianazanelatto/power_bi_analyst).

---

Projeto desenvolvido para fins de estudo no desafio de projeto da DIO.
