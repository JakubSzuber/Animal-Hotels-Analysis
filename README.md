# Animal-Hotels-Analysis

## About project
This is a project which contains a bunch of SQL queries to analyze several tables in the PostgreSQL database which imitates the tiny animal hotels database. My goal while creating the project was to use my knowledge to type as many PostgreSQL queries and their features as it's possible for a created database. Two main tables were based on datasets from https://data.world/datasets/animals and https://catalog.data.gov/dataset/animal-shelter-animals but they required a lot of editing in excel to be enough expanded to use many queries on them. Other tables I completely made in Excel. The database, which I worked with, has 5 tables, 2 of them have the main amount of database's data, they are different from each other (a form of storing data is different and a little bit different information is stored in tables). The other 3 tables are much smaller, they supplement information for the main tables. 2 main tables and one smaller one were created by importing the CSV file into Postgres. 
**I attach to project CREATE TABLE statements for each table and the most important file (main_queries.sql) which contains all select queries.**

### What I learned

- How to finding datasets in intnernet and modify them with Exel to the form which is ready to import into postgres
- How to import csv files into postgres as whole new tables

## Tables

| Table name | Description |
| ----------- | ----------- |
| hotel_1 | Most significant information about aniamals and their owners |
| hotel_2 | Most significant information about aniamals and their owners |
| breeds | Detailed information about each breed |
| rooms | Detailed indormation about rooms located in first hotel |
| species | Rules and information about each species in hotels |

---

# Diagram of the database (made with DBeaver)
![diagram_hotels](https://user-images.githubusercontent.com/90647840/160720214-4d9f5709-5657-40c2-880e-ea58685088d7.png)

## CVS files from which I created tables
1. [hotel_1.csv](https://github.com/JakubSzuber/Animal-Hotels-Analysis/files/8651153/hotel_1.csv)
2. [hotel_2.csv](https://github.com/JakubSzuber/Animal-Hotels-Analysis/files/8651166/hotel_2.csv)
3. [breeds.csv](https://github.com/JakubSzuber/Animal-Hotels-Analysis/files/8651168/breeds.csv)
