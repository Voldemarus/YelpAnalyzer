YelpAnalyzer
============

Mac OSX parser for Yelp Dataset

The aim of project is to provide develeopers and researchers with comfortable shell to 
mashine learning/ data analysis tasks, based on Datasets provided by Yelp company.


To start project you need to download Yelp Dataset Challenge data, available on 
http://www.yelp.com/dataset_challenge

Files from tar archive should be placed into any directory.
Then you should supply full path to directory to the GMLJsonDao::dataPath  method.
This is a weird approach, used to save time on auxillary tasks on the early stage on development.

First task, which I am working now is to parse source JSON files and put all data into SQLite database 
with all relevant links established. 


