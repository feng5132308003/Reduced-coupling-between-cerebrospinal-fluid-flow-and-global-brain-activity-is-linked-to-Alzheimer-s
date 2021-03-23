%% figure s11: The relationships between the BOLD-CSF coupling and AD-related markers are not 
% affected by the inter-subject variability in arousal


%% note: please use the R code for the LMM adjustment and then update the p-values

clear
%pd_beh_tmp1=readtable('test_lmm_figS8_new.xlsx','Sheet','Sheet1');
pd_beh_tmp1=readtable('data_figs.xlsx','Sheet','figs11');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[5 6 7 10 11 12 16 17]))));
cp=pd_beh_tmp2(:,6);
cp_regr=pd_beh_tmp2(:,7);
ai=pd_beh_tmp2(:,8);

dc=pd_beh_tmp2(:,1);
suvr=pd_beh_tmp2(:,2);
suvr_l=pd_beh_tmp2(:,3);
mmse=pd_beh_tmp2(:,4);
mmse_l=pd_beh_tmp2(:,5);

%% fig S11-A, the association between the arousal index and coupling
figure,
subplot(231),
[r,p]=corr(cp,ai,'rows','pairwise','Type','Spearman'),%
plot(cp,ai,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),ai(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),ai(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(cp(dc==4),ai(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),ai(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])
%% fig S11-B, the association between the SUVR and arousal index
subplot(232),
[r,p]=corr(ai,suvr,'rows','pairwise','Type','Spearman'),%
plot(ai,suvr,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(ai(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(ai(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(ai(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(ai(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([.05 .15]),xticks([.05 .1 .15])
%% fig S11-C, the association between the 2-year MMSE changes and arousal index
subplot(235),
[r,p]=corr(ai,mmse_l,'rows','pairwise','Type','Spearman'),%
plot(ai,mmse_l,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(ai(dc==2),mmse_l(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(ai(dc==3),mmse_l(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(ai(dc==4),mmse_l(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(ai(dc==1),mmse_l(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([.05 .15]),xticks([.05 .1 .15])
%% fig S11-D, the association between the SUVR  and coupling

subplot(233),
[r,p]=corr(cp_regr,suvr,'rows','pairwise','Type','Spearman'),%
plot(cp_regr,suvr,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp_regr(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp_regr(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(cp_regr(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp_regr(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])
%% fig S11-E, the association between the 2-year MMSE changes and coupling
subplot(236),
[r,p]=corr(cp_regr,mmse_l,'rows','pairwise','Type','Spearman'),%
plot(cp_regr,mmse_l,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp_regr(dc==2),mmse_l(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp_regr(dc==3),mmse_l(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(cp_regr(dc==4),mmse_l(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp_regr(dc==1),mmse_l(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])