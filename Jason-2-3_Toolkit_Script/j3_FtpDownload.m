dInfo = inputdlg({'Pass Number','Start Cycle','End Cycle',...
     }, 'Download', [1 40; 1 40; 1 40]); 

ngdc = ftp('avisoftp.cnes.fr');
cd(ngdc,'AVISO/pub/jason-3/gdr_d/');
PassN=dInfo{1};
if length(PassN)==1
   PassN=['00',PassN];
elseif length(PassN)==2
   PassN=['0',PassN];
end
startPass=str2num(dInfo{2});
lastPass=str2num(dInfo{3});
bar=waitbar(0,'Downloading Cycles...');
count=0;
NoCycles=lastPass-startPass+1;
for cycle=startPass: lastPass;
    count=count+1;
    FolderName=strcat('j3/gdr_d/cycle_',sprintf('%03d',cycle));
    directory= strcat('./cycle_',sprintf('%03d',cycle));    
    cd(ngdc,directory);
    PassQ= strcat('*_',PassN,'_*'); 
    FoldeXist = exist(FolderName,'dir'); % check if fiolder exist
    Fraction= floor((count/NoCycles)*100);
    formatSpec = 'Downloading Cycles...%d%% complete';
    str=sprintf(formatSpec,Fraction);
    if FoldeXist==7
        cd(strcat('./',FolderName,'/'))        
        mget(ngdc,PassQ);        
        FileName=dir('*.zip');
        try
           unzip(FileName.name);
        catch
           cd(ngdc,'..');
           cd('../../../')
           waitbar(Fraction/100,bar, str);
           pause(0.05)            
           continue
        end        
        delete(FileName.name);
        cd(ngdc,'..');
        cd('../../../')
        waitbar(Fraction/100,bar, str);
        pause(0.05)
    else
        mkdir(FolderName)
        cd(strcat('./',FolderName,'/'))
        mget(ngdc,PassQ);
        FileName=dir('*.zip');
        try
           unzip(FileName.name);
        catch
           cd(ngdc,'..');
           cd('../../../')
           waitbar(Fraction/100,bar, str);
           pause(0.05)            
           continue
        end 
        delete(FileName.name);
        cd(ngdc,'..');
        cd('../../../')
        waitbar(Fraction/100,bar,str);
        pause(0.05)
    end


end
close(bar)
close(ngdc);
h = msgbox('Download Completed!','Status');