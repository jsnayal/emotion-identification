Steps of the experiment

(1) A list of songs tagged into 4 emotions (happy, angry, sad, peaceful) by people
    is obtained from https://last.fm.
(2) The 30 second excerpt of the list of songs are downloaded from https://shazam.com.
(3) 22 features including 13 coefficients of mfcc are extracted using "audio.m"
    and the extracted features are appended to (emotionname)_output_(duration).txt type file
    for e.g. "happy_output_5sec.txt".
(4) all emotion files are combined to form the dataset in "all_emotions_output_(duration).txt"
    for e.g. "all_emotions_output_5sec.txt".
(5) The mean values of features are taken from extracted features and saved into
    "mean_all_emotions_output_(duration).txt" for e.g. "mean_all_emotions_output_5sec.txt".
(6) The file containing mean values are now shuffled uniformaly using "shuffle.m" and normalised using
    "normalise.m". "do_shuffle_normalise_program" run files "shuffle.m" and "normalise.m".
    The shuffled and normalised data is obtained in file "Final_dataset_1000_samples".
(7) Now the dataset is trained and tested using file "train_network.m".
    Best tested network is selected as model for our experiment.