clear
clc

load Final_dataset_994_samples.txt;

x=Final_dataset_994_samples;

x = x';

[train_dat,val,test] = dividerand(x,80,0,20);

train_dat = train_dat';
val = val';
test = test';

save('Indiv_Data_tr_val_ts','train_dat','val','test');