clc;
y = 0;

fid = fopen('data_30.txt');
tline = fgetl(fid);
tline = fgetl(fid);

%find index with first feature value
temp=0;
for ii=1:size(tline,2)
    if(eq(temp,0))
        if(isspace(tline(1,ii)))
            temp=1;
            while(isspace(tline(1,ii)))
                ii=ii+1;
                break;
            end
        end
    end
    if(eq(temp,1))
        break;
    end
end

fclose(fid);

%write all features to output file
fid=fopen('happy_output_30sec.txt','at');
for i=ii:size(tline,2)
    fprintf(fid,tline(1,i));
end
fclose(fid);

v=[0    0   0   1]
fid=fopen('happy_output_30sec.txt','at');
fprintf(fid,'%d %d %d %d\n',v);
fclose(fid);