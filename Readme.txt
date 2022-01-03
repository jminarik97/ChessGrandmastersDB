This project is to explore a dataset from Kaggle containing the top chess players in the FIDE Chess Federation from August 2020. I created a Python script to read the data from CSV and create SQL INSERT statements. These INSERT statements can be run in Microsoft SQL Server Management Studio, Oracle SQL Developer, MYSQL, etc.
I did some exploration of the dataset in SQL to answer some questions and highlight interesting details.


Files:
- top_chess_players_aug_2020.csv	Dataset containing the top players from the FIDE chess federation in August 2020
- gm_create_table.txt				SQL CREATE TABLE statements
- gm_insert_generator				Python script that reads the CSV file and creates SQL INSERT statements
- SQL_analysis.txt					SQL script to explore the dataset


Source: https://www.kaggle.com/vikasojha98/world-top-chess-players-august-2020