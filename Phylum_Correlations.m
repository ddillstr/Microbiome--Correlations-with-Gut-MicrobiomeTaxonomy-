clc;
clear all;

%% Male Data Import
cd 'C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males\Phylum'

males = detectImportOptions('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx');
males.SelectedVariableNames = [4:72]; 
males.DataRange = '2:106';
M = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
headers = males.VariableNames;
m_phylumnames = headers(5:14);

%% Are certain male phylum correlated with each other regardless of age and strain?

Mphylum = M(:,2:11);
m_phylum_corr = corr(Mphylum);
m_phylum_criteria = 2/(sqrt(length(Mphylum)))

imagesc(m_phylum_corr); % plot the matrix
set(gca, 'XTick', 1:length(Mphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(Mphylum)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames'); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_phylumnames); % set y-axis labels
title('Phylum * Phylum in Males Regardless of Age and Strain', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,963])
colormap('jet'); % set the colorscheme
colorbar
print('MPhylum_MPhylum','-dpng')

m_phylum_corr = array2table(m_phylum_corr, 'RowNames', m_phylumnames', 'VariableNames', m_phylumnames);
writetable(m_phylum_corr,'Mphylum_Mphylum.csv','WriteRowNames',true);

%% What phylum is correlated with age regardless of strain?

Mtimepoint = M(:,1);
m_t_corr = corr(Mtimepoint ,Mphylum);

rownames = {'All Strains'; 'ACI'; 'BN'; 'DA'; 'F344'; 'LEW'; 'WF'; 'WKY'};

% What bacteria is correlated with age within each strain?
% ACI Data
males.DataRange = '2:16';
mACI = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mACIphylum = mACI(:,2:11);
mACItimepoint = mACI(:,1);
m_t_aci_corr = corr(mACItimepoint ,mACIphylum);

% BN Data 
males.DataRange = '17:31';
mBN = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mBNphylum = mBN(:,2:11);
mBNtimepoint = mBN(:,1);
m_t_bn_corr = corr(mBNtimepoint ,mBNphylum);

%DA Data
males.DataRange = '32:46';
mDA = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mDAphylum = mDA(:,2:11);
mDAtimepoint = mDA(:,1);
m_t_da_corr = corr(mDAtimepoint ,mDAphylum);

% F344 Data
males.DataRange = '47:61';
mF344 = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mF344phylum = mF344(:,2:11);
mF344timepoint = mF344(:,1);
m_t_f344_corr = corr(mF344timepoint ,mF344phylum);

% LEW Data
males.DataRange = '62:76';
mLEW = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mLEWphylum = mLEW(:,2:11);
mLEWtimepoint = mLEW(:,1);
m_t_lew_corr = corr(mLEWtimepoint ,mLEWphylum);

%WF Data
males.DataRange = '77:91';
mWF = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mWFphylum = mWF(:,2:11);
mWFtimepoint = mWF(:,1);
m_t_wf_corr = corr(mWFtimepoint ,mWFphylum);

% WKY Data
males.DataRange = '92:106';
mWKY = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mWKYphylum = mWKY(:,2:11);
mWKYtimepoint = mWKY(:,1);
m_t_wky_corr = corr(mWKYtimepoint ,mWKYphylum);

m_phylum_strain_criteria = 2/(sqrt(length(mACIphylum)))
m_corr = [m_t_corr; m_t_aci_corr; m_t_bn_corr; m_t_da_corr; m_t_f344_corr; m_t_lew_corr; m_t_wf_corr; m_t_wky_corr];

imagesc(m_corr); % plot the matrix
set(gca, 'XTick', 1:length(mACIphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mACItimepoint)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', rownames); % set y-axis labels
title('Correlation of Aging and Phylum in Males', 'FontSize', 30); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('MTimepoint_MPhylum','-dpng')

% Convert arrays to table and print as a csv
m_corr = array2table(m_corr, 'RowNames', rownames, 'VariableNames', m_phylumnames);
writetable(m_corr,'Male Correlations Phylum.csv','WriteRowNames',true) ;

%% Are certain male phylum correlated with MicroCT properties regardless of age and strain?

males.SelectedVariableNames = [4:51]; 
males.DataRange = '2:106';
mmicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mheaders = males.VariableNames;
m_phylumnames = mheaders(5:14);
m_microCTnames = mheaders(15:51);
mphylum = mmicroct (:, 2:11);
mMicroCT = mmicroct(:,12:48);

m_phylum_microct_corr = corr(mMicroCT ,mphylum);

imagesc(m_phylum_microct_corr); % plot the matrix
set(gca, 'XTick', 1:length(mphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mMicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in Males Regardless of Age and Strain', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('MMicroCT_MPhylum','-dpng')

% Convert arrays to table and print as a csv
m_phylum_microct_corr = array2table(m_phylum_microct_corr, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_microct_corr,'MMicroCT and MPhylum.csv','WriteRowNames',true) ;

%% Which phylum is correlated with MicroCT properties within each strain regardless of age?

males = detectImportOptions('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx');
males.SelectedVariableNames = [4:51]; 
males.DataRange = '2:16';
macimicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mheaders = males.VariableNames;
m_phylumnames = mheaders(5:14);
m_microCTnames = mheaders(15:51);

% ACI DATA
mACIphylum = macimicroct (:, 2:11);
mACIMicroCT = macimicroct(:,12:48);

m_phylum_microct_aci = corr( mACIMicroCT,mACIphylum);
imagesc(m_phylum_microct_aci); % plot the matrix
set(gca, 'XTick', 1:length(mACIphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mACIMicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in ACI Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('ACI MMicroCT_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_microct_aci = array2table(m_phylum_microct_aci, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_microct_aci,' ACI MMicroCT and MPhylum.csv','WriteRowNames',true) ;

% BN DATA
males.DataRange = '17:31';
mbnmicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mBNphylum = mbnmicroct (:, 2:11);
mBNMicroCT = mbnmicroct(:,12:48);
m_phylum_microct_bn = corr( mBNMicroCT,mBNphylum);
imagesc(m_phylum_microct_bn); % plot the matrix
set(gca, 'XTick', 1:length(mBNphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mBNMicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in BN Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('BN MMicroCT_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_microct_bn = array2table(m_phylum_microct_bn, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_microct_bn,' BN MMicroCT and MPhylum.csv','WriteRowNames',true) ;

%DA DATA
males.DataRange = '32:46';
mdamicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mDAphylum = mdamicroct (:, 2:11);
mDAMicroCT = mdamicroct(:,12:48);
m_phylum_microct_da = corr( mDAMicroCT,mDAphylum);
imagesc(m_phylum_microct_da); % plot the matrix
set(gca, 'XTick', 1:length(mDAphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mDAMicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in DA Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('DA MMicroCT_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_microct_da = array2table(m_phylum_microct_da, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_microct_da,' DA MMicroCT and MPhylum.csv','WriteRowNames',true) ;

%F344 DATA
males.DataRange = '47:61';
mf344microct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mF344phylum = mf344microct (:, 2:11);
mF344MicroCT = mf344microct(:,12:48);
m_bac_microct_f344 = corr( mF344MicroCT,mF344phylum);
imagesc(m_bac_microct_f344); % plot the matrix
set(gca, 'XTick', 1:length(mF344phylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mF344MicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in F344 Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('F344 MMicroCT_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_bac_microct_f344 = array2table(m_bac_microct_f344, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_bac_microct_f344,' F344 MMicroCT and MPhylum.csv','WriteRowNames',true) ;

% LEW DATA
males.DataRange = '62:76';
mlewmicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mLEWphylum = mlewmicroct (:, 2:11);
mLEWMicroCT = mlewmicroct(:,12:48);
m_phylum_microct_lew = corr( mLEWMicroCT,mLEWphylum);
imagesc(m_phylum_microct_lew); % plot the matrix
set(gca, 'XTick', 1:length(mLEWphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mLEWMicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in LEW Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('LEW MMicroCT_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_microct_lew = array2table(m_phylum_microct_lew, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_microct_lew,' LEW MMicroCT and MPhylum.csv','WriteRowNames',true) ;

% WF DATA
males.DataRange = '77:91';
mwfmicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mWFphylum = mwfmicroct (:, 2:11);
mWFMicroCT = mwfmicroct(:,12:48);
m_phylum_microct_wf = corr( mWFMicroCT,mWFphylum);
imagesc(m_phylum_microct_wf); % plot the matrix
set(gca, 'XTick', 1:length(mWFphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mWFMicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in WF Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('WF MMicroCT_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_microct_wf = array2table(m_phylum_microct_wf, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_microct_wf,' WF MMicroCT and MPhylum.csv','WriteRowNames',true) ;

% WKY DATA
males.DataRange = '92:106';
mwkymicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mWKYphylum = mwkymicroct (:, 2:11);
mWKYMicroCT = mwkymicroct(:,12:48);
m_phylum_microct_wky = corr( mWKYMicroCT,mWKYphylum);
imagesc(m_phylum_microct_wky); % plot the matrix
set(gca, 'XTick', 1:length(mWKYphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mWKYMicroCT)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_microCTnames); % set y-axis labels
title('MicroCT * Phylum in WKY Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('WKY MMicroCT_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_microct_wky = array2table(m_phylum_microct_wky, 'RowNames', m_microCTnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_microct_wky,' WKY MMicroCT and MPhylum.csv','WriteRowNames',true) ;

%% Is aging correlated with MicroCT properties reagrdless of strain?

males = detectImportOptions('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx');
males.SelectedVariableNames = [4:51]; 
males.DataRange = '2:106';
mmicroct = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum.xlsx', males);
mheaders = males.VariableNames;
rownames = {'Timepoint All Strains'; 'ACI'; 'BN'; 'DA'; 'F344'; 'LEW'; 'WF'; 'WKY'};
m_phylumnames = mheaders(5:14);
m_microCTnames = mheaders(15:51);
mtimepoint = mmicroct(:,1);
mphylum = mmicroct (:, 2:11);
mMicroCT = mmicroct(:,12:48);
m_timepoint_microct_corr = corr(mtimepoint ,mMicroCT);

% Is aging correlated with MicroCT properties within each strain?
% ACI DATA
m_time_microct_aci = corr( mACItimepoint,mACIMicroCT);

% BN DATA
m_time_microct_bn = corr( mBNtimepoint,mBNMicroCT);

%DA DATA
m_time_microct_da = corr( mDAtimepoint,mDAMicroCT);

%F344 DATA
m_time_microct_f344 = corr( mF344timepoint,mF344MicroCT);

% LEW DATA
m_time_microct_lew = corr( mLEWtimepoint,mLEWMicroCT);

% WF DATA
m_time_microct_wf = corr( mWFtimepoint,mWFMicroCT);

% WKY DATA
m_time_microct_wky = corr( mWKYtimepoint,mWKYMicroCT);

m_time_microct_corr = [m_timepoint_microct_corr; m_time_microct_aci; m_time_microct_bn; m_time_microct_da; m_time_microct_f344; m_time_microct_lew; m_time_microct_wf; m_time_microct_wky];

imagesc(m_time_microct_corr); % plot the matrix
set(gca, 'XTick', 1:length(mACIMicroCT)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mtimepoint)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_microCTnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', rownames); % set y-axis labels
title('Timepoint * MicroCT in Males', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('MTimepoint_MMicroCT','-dpng')

% Convert arrays to table and print as a csv
m_time_microct_corr = array2table(m_time_microct_corr, 'RowNames', rownames, 'VariableNames', m_microCTnames);
writetable(m_time_microct_corr,'MTimepoint _MMicroCT Correlations.csv','WriteRowNames',true) ;

%% What is the correlation between phylum and mechanical properties?

males = detectImportOptions('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx');
males.SelectedVariableNames = [4:72]; 
males.DataRange = '2:104';
mMech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);

mheaders = males.VariableNames;
m_phylumnames = mheaders(5:14);
m_mechnames = mheaders(61:72);
mtimepoint = mMech(:,1);
mphylum = mMech (:, 2:11);
mmech = mMech(:,58:69);
m_mech_phylum_corr = corr(mmech ,mphylum);

imagesc(m_mech_phylum_corr); % plot the matrix
set(gca, 'XTick', 1:length(mphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mmech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in Males', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('MMech_MPhylum','-dpng')

% Convert arrays to table and print as a csv
m_mech_phylum_corr = array2table(m_mech_phylum_corr, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_mech_phylum_corr,'MMech _MPhylum Correlations.csv','WriteRowNames',true) ;

%% Correlation between Mech properties and phylum for each strain

males = detectImportOptions('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx');
males.SelectedVariableNames = [4:72]; 
males.DataRange = '2:16';
macimech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
mheaders = males.VariableNames;
m_phylumnames = mheaders(5:14);
m_mechnames = mheaders(61:72);

% ACI DATA
mACItimepoint = macimech(:,1);
mACIphylum = macimech (:, 2:11);
mACIMech = macimech(:,58:69);

m_phylum_mech_aci = corr( mACIMech,mACIphylum);
imagesc(m_phylum_mech_aci); % plot the matrix
set(gca, 'XTick', 1:length(mACIphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mACIMech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in ACI Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('ACI MMech_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_mech_aci = array2table(m_phylum_mech_aci, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_mech_aci,' ACI MMech and MPhylum.csv','WriteRowNames',true) ;

% BN DATA
males.DataRange = '17:30';
mbnmech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
mBNtimepoint = mbnmech(:,1);
mBNphylum = mbnmech (:, 2:11);
mBNMech = mbnmech(:,58:69);
m_phylum_mech_bn = corr( mBNMech,mBNphylum);
imagesc(m_phylum_mech_bn); % plot the matrix
set(gca, 'XTick', 1:length(mBNphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mBNMech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in BN Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('BN MMech_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_mech_bn = array2table(m_phylum_mech_bn, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_mech_bn,' BN MMech and MPhylum.csv','WriteRowNames',true) ;

%DA DATA
males.DataRange = '31:45';
mdamech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
mDAtimepoint = mdamech(:,1);
mDAphylum = mdamech (:, 2:11);
mDAMech = mdamech(:,58:69);
m_phylum_mech_da = corr( mDAMech,mDAphylum);
imagesc(m_phylum_mech_da); % plot the matrix
set(gca, 'XTick', 1:length(mDAphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mDAMech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in DA Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('DA MMech_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_mech_da = array2table(m_phylum_mech_da, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_mech_da,' DA MMech and MPhylum.csv','WriteRowNames',true) ;

%F344 DATA
males.DataRange = '46:60';
mf344mech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
mF344timepoint = mf344mech(:,1);
mF344phylum = mf344mech (:, 2:11);
mF344Mech = mf344mech(:,58:69);
m_phylum_mech_f344 = corr( mF344Mech,mF344phylum);
imagesc(m_phylum_mech_f344); % plot the matrix
set(gca, 'XTick', 1:length(mF344phylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mF344Mech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in F344 Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('F344 MMech_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_mech_f344 = array2table(m_phylum_mech_f344, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_mech_f344,' F344 MMech and MPhylum.csv','WriteRowNames',true);

% LEW DATA
males.DataRange = '61:74';
mlewmech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
mLEWtimepoint = mlewmech(:,1);
mLEWphylum = mlewmech (:, 2:11);
mLEWMech = mlewmech(:,58:69);
m_phylum_mech_lew = corr( mLEWMech,mLEWphylum);
imagesc(m_phylum_mech_lew); % plot the matrix
set(gca, 'XTick', 1:length(mLEWphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mLEWMech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in LEW Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('LEW MMech_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_mech_lew = array2table(m_phylum_mech_lew, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_mech_lew,' LEW MMech and MPhylum.csv','WriteRowNames',true);

% WF DATA
males.DataRange = '75:89';
mwfmech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
mWFtimepoint = mwfmech(:,1);
mWFphylum = mwfmech (:, 2:11);
mWFMech = mwfmech(:,58:69);
m_phylum_mech_wf = corr( mWFMech,mWFphylum);
imagesc(m_phylum_mech_wf); % plot the matrix
set(gca, 'XTick', 1:length(mWFphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mWFMech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in WF Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('WF MMech_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_mech_wf = array2table(m_phylum_mech_wf, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_mech_wf,' WF MMech and MPhylum.csv','WriteRowNames',true);

% WKY DATA
males.DataRange = '90:104';
mwkymech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
mWKYtimepoint = mwkymech(:,1);
mWKYphylum = mwkymech (:, 2:11);
mWKYMech = mwkymech(:,58:69);
m_phylum_mech_wky = corr( mWKYMech,mWKYphylum);
imagesc(m_phylum_mech_wky); % plot the matrix
set(gca, 'XTick', 1:length(mWKYphylum)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mWKYMech)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_phylumnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', m_mechnames); % set y-axis labels
title('Mech Properties * Phylum in WKY Males Regardless of Age', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('WKY MMech_MPhylum','-dpng')
% Convert arrays to table and print as a csv
m_phylum_mech_wky = array2table(m_phylum_mech_wky, 'RowNames', m_mechnames, 'VariableNames', m_phylumnames);
writetable(m_phylum_mech_wky,' WKY MMech and MPhylum.csv','WriteRowNames',true);


%% Is aging correlated with Mech properties regardless of strain?

males = detectImportOptions('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx');
males.SelectedVariableNames = [4:72]; 
males.DataRange = '2:104';
mMech = readmatrix('C:\Users\dillstrd\Desktop\Microbiome\Correlations\Analysis\Males_Data for Correlations_Phylum_Mech.xlsx', males);
rownames = {'Timepoint All Strains'; 'ACI'; 'BN'; 'DA'; 'F344'; 'LEW'; 'WF'; 'WKY'};
mheaders = males.VariableNames;
m_phylumnames = mheaders(5:14);
m_mechnames = mheaders(61:72);
mtimepoint = mMech(:,1);
mphylum = mMech (:, 2:53);
mmech = mMech(:,58:69);
m_time_mech_corr = corr(mtimepoint ,mmech);

% Is aging correlated with Mech Properties properties within each strain?
% ACI DATA
m_time_mech_aci = corr( mACItimepoint,mACIMech);

% BN DATA
m_time_mech_bn = corr( mBNtimepoint,mBNMech);

%DA DATA
m_time_mech_da = corr( mDAtimepoint,mDAMech);

%F344 DATA
m_time_mech_f344 = corr( mF344timepoint,mF344Mech);

% LEW DATA
m_time_mech_lew = corr( mLEWtimepoint,mLEWMech);

% WF DATA
m_time_mech_wf = corr( mWFtimepoint,mWFMech);

% WKY DATA
m_time_mech_wky = corr( mWKYtimepoint,mWKYMech);

m_time_mech_corr = [m_time_mech_corr; m_time_mech_aci; m_time_mech_bn; m_time_mech_da; m_time_mech_f344; m_time_mech_lew; m_time_mech_wf; m_time_mech_wky];

imagesc(m_time_mech_corr); % plot the matrix
set(gca, 'XTick', 1:length(mACIMech)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(mtimepoint)); % center y-axis ticks on bins
set(gca, 'XTickLabel', m_mechnames); % set x-axis labels
xtickangle(90)
set(gca, 'YTickLabel', rownames); % set y-axis labels
title('Timepoint * Mech in Males', 'FontSize', 14); % set title
set(gcf,'position',[1,41,1100,800])
colormap('jet'); % set the colorscheme
colorbar % print colorbar on figure
print('MTimepoint_MMech','-dpng')

% Convert arrays to table and print as a csv
m_time_mech_corr = array2table(m_time_mech_corr, 'RowNames', rownames, 'VariableNames', m_mechnames);
writetable(m_time_mech_corr,'MTimepoint _MMech Correlations.csv','WriteRowNames',true) ;

