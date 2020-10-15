clc;
clear all;

%% Data Import

Data = xlsread('C:\Users\dillstrd\Desktop\Microbiome\CoreBiome\Females Phylum Taxonomy.xlsx','Summary','B3:AQ54');
[~,Phylum] = xlsread('C:\Users\dillstrd\Desktop\Microbiome\CoreBiome\Females Phylum Taxonomy.xlsx','Summary','A3:A54');

%% Graphs
i = 1;

while i < 11
    
    y = [Data(i,1) Data(i,2) Data(i,3);...
        Data(i,7) Data(i,8) Data(i,9);...
        Data(i,13) Data(i,14) Data(i,15);...
        Data(i,19) Data(i,20) Data(i,21);...
        Data(i,25) Data(i,26) Data(i,27);...
        Data(i,31) Data(i,32) Data(i,33);...
        Data(i,37) Data(i,38) Data(i,39)];
    
    figure(i)
    name = {'ACI';'BN';'DA';'F344';'LEW';'WF';'WKY'};
    x = [1:7];
    bar(x,y)
    set(gca,'xticklabel',name)
    title(Phylum(i,1),'interpreter','none');
    i = i+1;
end

%% Percentages
i = 1;

while i < 11
    
    y = [Data(i,4) Data(i,5) Data(i,6);...
        Data(i,10) Data(i,11) Data(i,12);...
        Data(i,16) Data(i,17) Data(i,18);...
        Data(i,22) Data(i,23) Data(i,24);...
        Data(i,28) Data(i,29) Data(i,30);...
        Data(i,34) Data(i,35) Data(i,36);...
        Data(i,40) Data(i,41) Data(i,42)];
    
    figure(i)
    name = {'ACI';'BN';'DA';'F344';'LEW';'WF';'WKY'};
    x = [1:7];
    bar(x,y)
    set(gca,'xticklabel',name)
    title(Phylum(i,1),'interpreter','none');
    i = i+1;
    labels = {'6 Months - 12 Months','12 Months - 18 Months','6 Months - 18 Months'};
    legend(labels)
end

%% Percentages 6 - 18 Months Only
i = 1;

while i < 11
    
    y = [Data(i,6);...
        Data(i,12);...
        Data(i,18);...
        Data(i,24);...
        Data(i,30);...
        Data(i,36);...
        Data(i,42)];
    
    figure(i)
    name = {'ACI';'BN';'DA';'F344';'LEW';'WF';'WKY'};
    x = [1:7];
    bar(x,y)
    set(gca,'xticklabel',name)
    title(Phylum(i,1),'interpreter','none');
    i = i+1;
    labels = {'6 Months - 18 Months'};
    legend(labels)
end