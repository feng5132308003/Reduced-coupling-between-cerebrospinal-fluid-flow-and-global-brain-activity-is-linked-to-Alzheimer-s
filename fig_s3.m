%% figure S3: test the main results on the MCI and SMC only

%% note: please use the R code for the LMM adjustment and then update the p-values

clear
%pd_beh_tmp1=readtable('test_lmm_fig3_4_new.xlsx','Sheet','Sheet1');
pd_beh_tmp1=readtable('data_figs.xlsx','Sheet','figs3');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[5 6 7 10 11 12]))));
cp=pd_beh_tmp2(:,end);% the coupling adjsuted with age and gender
dc=pd_beh_tmp2(:,1);
suvr=pd_beh_tmp2(:,2);
suvr_l=pd_beh_tmp2(:,3);
mmse=pd_beh_tmp2(:,4);
mmse_l=pd_beh_tmp2(:,5);
%%
idx_mci_smc=find(dc==2|dc==3);
idx_mci=find(dc==2);
idx_smc=find(dc==3);


%% fig S3-C, the association between the MMSE and coupling
figure,
[r,p]=corr(cp(idx_mci_smc),mmse(idx_mci_smc),'rows','pairwise','Type','Spearman')%
subplot(223),plot(cp(idx_mci_smc),mmse(idx_mci_smc),'.'),
lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),mmse(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),mmse(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),

xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3]),
ylim([18 32]),yticks([20 25 30]),

%% fig S3-D, the association between the 2-year MMSE changes and coupling
[r,p]=corr(cp(idx_mci_smc),mmse_l(idx_mci_smc),'rows','pairwise','Type','Spearman')%
subplot(224),plot(cp(idx_mci_smc),mmse_l(idx_mci_smc),'.'),
lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),mmse_l(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),mmse_l(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3]),
ylim([-13 7]),yticks([-10 -5 0 5]),

%% fig S3-A, the association between the SUVR and coupling
[r,p]=corr(cp(idx_mci_smc),suvr(idx_mci_smc),'rows','pairwise','Type','Spearman')%
subplot(221),plot(cp(idx_mci_smc),suvr(idx_mci_smc),'.'),
lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),suvr(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),suvr(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])
ylim([0.6 1.4]),yticks([0.6 0.8 1.0 1.2 1.4]),
%% fig S3-B, the association between the 2-year SUVR changes and coupling
[r,p]=corr(cp(idx_mci_smc),suvr_l(idx_mci_smc),'rows','pairwise','Type','Spearman')%
subplot(222),plot(cp(idx_mci_smc),suvr_l(idx_mci_smc),'.'),
lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),suvr_l(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),suvr_l(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),

xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])
ylim([-0.12 0.11]),yticks([-0.1 0 0.1]),
