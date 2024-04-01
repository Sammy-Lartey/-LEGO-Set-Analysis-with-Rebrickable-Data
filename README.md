# -LEGO-Set-Analysis-with-Rebrickable-Data

##Overview
The LEGO Set Analytics project aims to provide insights into LEGO sets stored in the REBRICKABLE database. Utilizing data sourced from the Rebrickable website, this project involves analyzing various aspects of LEGO sets, including themes, release years, part distribution, and popular themes by year. By leveraging SQL queries and database views, the project facilitates data-driven decision-making for LEGO enthusiasts, collectors, and businesses.

## Data Source

The data for the LEGO Set Analytics project was sourced from the [Rebrickable Downloads Page](https://rebrickable.com/downloads/).

###SQL Scripts

####REBRICKABLE 01.sql
Contains SQL queries to analyze LEGO sets data, including total number of parts per theme, total number of parts per year, number of sets created in each century, percentage of sets released in the 21st century that are themed as Trains, popular theme by year in the 21st century, and the most produced LEGO color in terms of quantity of parts.

####REBRICKABLE 02.sql
Creates the analytics_main view in the REBRICKABLE database, which serves as the primary source for data analysis.

## REBRICKABLE DATA Folder

The `REBRICKABLE DATA` folder contains 12 CSV files providing additional data for the LEGO Set Analytics project. The contents of these files include information such as set details, part inventory, theme classification, and color information. These CSV files complement the data stored in the `REBRICKABLE` database and can be used for further analysis and validation.
