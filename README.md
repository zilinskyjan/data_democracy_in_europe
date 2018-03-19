## Information

* Bi-annual ESS datasets (waves 1-8) are compressed in the [full_datasets](https://github.com/zilinskyjan/data_democracy_in_europe/tree/master/full_datasets) folder.
* The relevant variables (satisfaction with democracy and individual-level covariates) are extracted when the cumulative 8-wave dataset is generated.

## Replication instructions

Download or clone this entire project repository.

### Generate the cumulative dataset

* Unzip the files ESS1.zip through ESS8.zip.
* Keep the folders the with wave-specific dta and do files.
* Open [generate_cumulative_ESS_dataset.do](https://github.com/zilinskyjan/data_democracy_in_europe/blob/master/generate_cumulative_ESS_dataset.do) in STATA.
* Change the working directory as needed.
* Run the code.

### Replicate regressions

Run the code in [sentiment_code.do](https://github.com/zilinskyjan/data_democracy_in_europe/blob/master/sentiment_code.do).

### Show evaluation of democracy over time

Run the code in [prepare_figure1.R](https://github.com/zilinskyjan/data_democracy_in_europe/blob/master/prepare_figure1.R).



