import pandas as pd
import numpy as np 


# Create dictionary for data types - to feed into read_csv()
# All dtypes should be String for SQL Inserts
data_types = {
  "Fide id": "string",
  "Name": "string",
  "Federation": "string",
  "Gender": "string",
  "Year_of_birth": "string",
  "Title": "string",
  "Standard_Rating": "string",
  "Rapid_rating": "string",
  "Blitz_rating": "string",
  "Inactive_flag" : "string"
}

## Get the dataset
df = pd.read_csv('top_chess_players_aug_2020.csv', dtype= data_types)

## Grab Grandmasters only
gm_df = df.loc[df.Title == "GM"]

## Format the data for SQL
gm_df['Name'] = gm_df['Name'].str.replace(',', '') #Remove commas from Name column
gm_df['Name'] = gm_df['Name'].str.replace("'", "") #Remove apostraphes from Name column


## Create INSERT statements
inserts = [] 
for index, row in gm_df.iterrows():
    #Build INSERT statement
    insert_statement = "INSERT INTO Grandmasters VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');".format(
        row['Fide id'],
        row['Name'],
        row['Federation'],
        row['Gender'],
        row['Year_of_birth'],
        row['Title'],
        row['Standard_Rating'],
        row['Rapid_rating'],
        row['Blitz_rating'],
        row['Inactive_flag'])

    #Replace '<NA>' with NULL
    insert_statement = insert_statement.replace("'<NA>'", "NULL")

    #Add to list of INSERTs
    inserts.append(insert_statement)

## Write the INSERT statements to a file ##
f = open("inserts.txt", "w")
for statement in inserts:
    f.write(statement + "\n")
f.close()

