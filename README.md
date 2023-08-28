# Family Health Analysis Project

This project involves analyzing health-related data of families, focusing on various conditions, diseases, and amenities.

## Table of Contents

- [Introduction](#introduction)
- [Database Structure](#database-structure)
- [Queries](#queries)
- [Results](#results)
- [Usage](#usage)
- [Contributing](#contributing)

## Introduction

This project aims to analyse health-related information about families, including their conditions, diseases, and access to amenities. The project uses a relational database to store and organize the data. SQL queries are utilized to retrieve meaningful insights from the database.

## Database Structure

The database consists of several tables:

- `family`: Contains information about families, their state, residence type, household members, etc.
- `facility`: Stores data about facilities available to families, such as electricity, toilets, and vehicles.
- `drug_abuse`: Contains information about drug abuse habits within families.
- `disease`: Stores information about diseases affecting family members.
- `birth`: Contains data related to childbirth within families.
- `district`: Stores data about districts, including population, literacy rate, etc.

## Queries

The project uses SQL queries to perform various analyses on the data. Some of the queries include:

- Calculating ratios between conditions and amenities.
- Retrieving unique state-wise percentages of households with certain amenities.
- Analyzing disease prevalence within states and residence types.

## Results

The results of the analyses provide insights into families' health and lifestyle patterns based on the data collected. The queries help answer questions about disease prevalence, access to amenities, and more.

## Usage

To use this project:

1. Set up a database using the provided schema.
2. Load data into the database tables.
3. Run the SQL queries provided to perform analyses.
4. Customize the queries or add new ones to explore the data further.

## Contributing

Contributions to this project are welcome! Feel free to submit pull requests if you have ideas for improvements, new queries, or additional analyses.
