% mfcc(13),rms,tempo,mode,roughness,zcr,attack,fluctuation,inharmonicity,rolloff=22
%chromagram(12)(23-34),lowenergy(35),eventdensity(36),pitch(37),key(38),centroid(39)
%tonalcentroid(6)(40-45)=23

%Used:
%mfcc(13),rms,tempo,mode,roughness,zcr,attack,fluctuation,inharmonicity,rolloff
%lowenergy(35),eventdensity(36),centroid(39)

clear
clc

load 'Indiv_Data_tr_val_ts'

%tmp = train_dat(:,[1:18 20:22])';
tr_in = train_dat(:,[1:22 35:36 39:39]);
tr_t = train_dat(:,46:49);

val_in = val(:,[1:22 35:36 39:39]);
val_t = val(:,46:49);

ts_in = test(:,[1:22 35:36 39:39]);
ts_t = test(:,46:49);


%tr_in = train_dat(:,1:22);
%tr_t = train_dat(:,46:49);

%val_in = val(:,1:22);
%val_t = val(:,46:49);

%ts_in = test(:,1:22);
%ts_t = test(:,46:49);

tr_in = tr_in';
tr_t = tr_t';

val_in = val_in';
val_t = val_t';

ts_in = ts_in';
ts_t = ts_t';


NET{1,1}='Network';
NET{2,1}='Total Samples';

NET{3,1} = 'True Positive';
NET{4,1} = 'True Negetive';

NET{5,1} = 'False Positive';

NET{6,1} = 'False Negetive';

NET{7,1} = 'Accuracy';
NET{8,1} = 'Precision';
NET{9,1} = 'Recall';
NET{10,1} = 'f-measure';
NET{11,1} = 'Algorithm';
NET{12,1}  ='Train Index';
NET{13,1}  ='Val Index';
NET{14,1}  ='Test Index';
NET{15,1}  ='Ts_t Index';
accuracy=-1;
iterations=30;

for index=(2):(iterations+1)

net = feedforwardnet(10,'trainlm');
net.trainParam.epochs = 1000;
net.trainParam.lr = 0.3;

% Train the Network
tr.trainInd=tr_in;
tr.valInd=val_in;
tr.testInd=ts_in;

net = train(net,tr_in,tr_t);

% Training Confusion Plot Variables

trainX=tr_in;
tTrn = tr_t;
yTrn = net(trainX);

% Validation Confusion Plot Variables
yVal = net(val_in);
tVal = val_t;

% Test Confusion Plot Variables
testX=ts_in;
tTst = ts_t;
yTst = net(testX);

%testIndices = vec2ind(yTst);
[c,cm] = confusion(ts_t,yTst);
cm;
size(cm);

%plotconfusion(testT,testY)
%[c,cm] = confusion(tTst,yTst);
%cm;
%size(cm);

%Calculating accuracy
dig_sum=0;
for i=1:size(cm,1)
    dig_sum=dig_sum+cm(i,i);
end

false_p=sum(cm(:))-dig_sum;
false_n=sum(cm(:))-dig_sum;
true_p=dig_sum;
true_n=dig_sum;

total=sum(cm(:));
acc=(true_p + true_n)/(true_p+false_p+true_n+false_n);
pre=(true_p)/(true_p+false_p);
recall=(true_p)/(true_p+false_n);
fmeasure=((2*pre*recall)/(pre+recall));

%yAll = net();

%tAll = tn;

NET{1,index} = net;
NET{2,index} = total;
NET{3,index} = true_p;
NET{4,index} = true_n;
NET{5,index} = false_p;
NET{6,index} = false_n;
NET{7,index} = acc;
NET{8,index} = pre;
NET{9,index} = recall;
NET{10,index} = fmeasure;
NET{11,index} = 'trainlm';
NET{12,index}  =tr.trainInd;
NET{13,index}  =tr.valInd;
NET{14,index}  =tr.testInd;
NET{15,index}  =ts_t;
% Plot Confusion

plotconfusion(tTrn, yTrn, 'Training', tVal, yVal, 'Validation', tTst, yTst, 'Test');% tAll, yAll, 'Overall');

end
%end
ABC={NET};

str = sprintf('AllNetworks');
save(str,'ABC');