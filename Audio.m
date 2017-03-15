clc
clear

jpegFiles = dir('*.m4a'); 
numfiles = length(jpegFiles);

% 5 seconds

for k = 1:numfiles  
audio = miraudio(jpegFiles(k).name,'Extract',5,10);

rms = mirrms(audio);
tempo=mirtempo(audio);
mode=mirmode(audio);
mfcc = mirmfcc(audio);
roughness = mirroughness(audio);
zcr=mirzerocross(audio);
attack=mirattacktime(audio);
fluctuation=mirfluctuation(audio);
inharmonicity=mirinharmonicity(audio);
rolloff = mirrolloff(audio);

mirexport('data_5.txt',mfcc,rms,tempo,mode,roughness,zcr,attack,fluctuation,inharmonicity,rolloff);

run('read_data_5.m');
end

% 10 seconds
for k = 1:numfiles  
audio = miraudio(jpegFiles(k).name,'Extract',5,15);

rms = mirrms(audio);
tempo=mirtempo(audio);
mode=mirmode(audio);
mfcc = mirmfcc(audio);
roughness = mirroughness(audio);
zcr=mirzerocross(audio);
attack=mirattacktime(audio);
fluctuation=mirfluctuation(audio);
inharmonicity=mirinharmonicity(audio);
rolloff = mirrolloff(audio);

mirexport('data_10.txt',mfcc,rms,tempo,mode,roughness,zcr,attack,fluctuation,inharmonicity,rolloff);

run('read_data_10.m');
end

% 15 seconds
for k = 1:numfiles  
audio = miraudio(jpegFiles(k).name,'Extract',5,20);

rms = mirrms(audio);
tempo=mirtempo(audio);
mode=mirmode(audio);
mfcc = mirmfcc(audio);
roughness = mirroughness(audio);
zcr=mirzerocross(audio);
attack=mirattacktime(audio);
fluctuation=mirfluctuation(audio);
inharmonicity=mirinharmonicity(audio);
rolloff = mirrolloff(audio);

mirexport('data_15.txt',mfcc,rms,tempo,mode,roughness,zcr,attack,fluctuation,inharmonicity,rolloff);

run('read_data_15.m');
end

% 20 seconds

for k = 1:numfiles  
audio = miraudio(jpegFiles(k).name,'Extract',5,25);

rms = mirrms(audio);
tempo=mirtempo(audio);
mode=mirmode(audio);
mfcc = mirmfcc(audio);
roughness = mirroughness(audio);
zcr=mirzerocross(audio);
attack=mirattacktime(audio);
fluctuation=mirfluctuation(audio);
inharmonicity=mirinharmonicity(audio);
rolloff = mirrolloff(audio);

mirexport('data_20.txt',mfcc,rms,tempo,mode,roughness,zcr,attack,fluctuation,inharmonicity,rolloff);

run('read_data_20.m');
end


% 30 seconds
for k = 1:numfiles  
audio = miraudio(jpegFiles(k).name);

rms = mirrms(audio);
tempo=mirtempo(audio);
mode=mirmode(audio);
mfcc = mirmfcc(audio);
roughness = mirroughness(audio);
zcr=mirzerocross(audio);
attack=mirattacktime(audio);
fluctuation=mirfluctuation(audio);
inharmonicity=mirinharmonicity(audio);
rolloff = mirrolloff(audio);

mirexport('data_30.txt',mfcc,rms,tempo,mode,roughness,zcr,attack,fluctuation,inharmonicity,rolloff);

run('read_data_30.m');
end