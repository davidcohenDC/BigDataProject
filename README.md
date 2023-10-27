# Tra Pixel e Dati: Un’Analisi delle Metriche dei Videogiochi

Il progetto si basa sull'analisi di un ampio dataset relativo a giocatori, giochi e applicazioni su Steam. Una descrizione dettagliata del dataset sarà fornita, seguita da una discussione su studi e risultati svolti.

### Dettagli sui File e Cartelle

- **src**: Questa cartella contiene i notebook utilizzati nel progetto e gli script SQL.
  - `project.ipynb`: Notebook Jupyter utilizzato su AWS per l'elaborazione dei dati.
  - `analyze_data.ipynb`: Un notebook Python utilizzato in locale dedicato all'analisi e visualizzazione dei dati.
  - **sql**: Cartella che contiene lo script SQL utilizzato per l'estrazione dei dati nell'istanza di MARIADB in docker.


- **docs**: Cartella che contiene vari documenti di supporto per il progetto.
    - **dag**: All'interno ci sono tre sottocartelle (query1, query2, query3) che contengono rispettivamente i DAG dei singoli job e dei loro stages.
    - **schemes**: Contiene tutti gli schemi di raffinamento dei dati. Questi schemi sono realizzati in PUML.
    - **report**: Qui è presente il report finale del progetto, che dettaglia l'intero processo di elaborazione e analisi dei dati.
