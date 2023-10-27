# Between Pixels and Data: An Analysis of Videogame Metrics

This project focuses on the analysis of a vast dataset related to players, games, and applications on Steam. A detailed description of the dataset will be provided, followed by a discussion on conducted studies and obtained results.

### Details on Files and Folders

- **src**: This folder contains the notebooks used in the project and SQL scripts.
  - `project.ipynb`: Jupyter notebook used on AWS for data processing.
  - `analyze_data.ipynb`: A Python notebook used locally dedicated to data analysis and visualization.
  - **sql**: Folder containing the SQL script used for data extraction on the MARIADB instance in Docker.

- **docs**: Folder containing various supporting documents for the project.
  - **dag**: Inside, there are three sub-folders (query1, query2, query3) each containing the DAGs for individual jobs and their stages.
  - **schemes**: Contains all the data refinement schemes. These schemes are made in PUML.
  - **report**: Here, you'll find the final project report detailing the entire data processing and analysis procedure.
