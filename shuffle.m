function shuffle(input)
    edit=input;
    for i=1:250
        edit((i-1)*4 +1,:)=input(i,:);
        edit((i-1)*4 +2,:)=input(250+i,:);
        edit((i-1)*4 +3,:)=input(500+i,:);
        edit((i-1)*4 +4,:)=input(750+i,:);
    end
    
    fid = fopen('Shuffled.txt','wt');
    for ii = 1:size(edit,1)
        fprintf(fid,'%g\t',edit(ii,:));
        fprintf(fid,'\n');
    end
    fclose(fid);