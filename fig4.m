%% figure 4 main
%% note: please use the R code for the LMM adjustment and then update the p-values

clear
%pd_beh_tmp1=readtable('test_lmm_fig3_4_new.xlsx','Sheet','Sheet1');
pd_beh_tmp1=readtable('data_figs.xlsx','Sheet','fig4');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[5 6 7 10 11 12 15 16]))));
cp=pd_beh_tmp2(:,6);% the couling adjusted with age and gender
cp_regr=pd_beh_tmp2(:,7); % the coupling adjusted with age, gender, and global BOLD amplitude
gs=pd_beh_tmp2(:,8); % global BOLD amplitude, age and gender adjusted

dc=pd_beh_tmp2(:,1);
suvr=pd_beh_tmp2(:,2);
suvr_l=pd_beh_tmp2(:,3);
mmse=pd_beh_tmp2(:,4);
mmse_l=pd_beh_tmp2(:,5);

%% fig 4-A, the association between BOLD amplitude and the coupling
figure,

subplot(231),
[r,p]=corr(cp,gs,'rows','pairwise','Type','Spearman'),%
plot(cp,gs,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),gs(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),gs(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(cp(dc==4),gs(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),gs(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])
%% fig 4-B, the association between BOLD amplitude and SUVR
subplot(232),
[r,p]=corr(gs,suvr,'rows','pairwise','Type','Spearman'),%
plot(gs,suvr,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(gs(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(gs(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(gs(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(gs(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([0 .6]),xticks([0 .2 .4 .6])
%% fig 4-C, the association between BOLD amplitude and 2-year MMSE changes

subplot(235),

[r,p]=corr(gs,mmse_l,'rows','pairwise','Type','Spearman'),%
plot(gs,mmse_l,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(gs(dc==2),mmse_l(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(gs(dc==3),mmse_l(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(gs(dc==4),mmse_l(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(gs(dc==1),mmse_l(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([0 .6]),xticks([0 .2 .4 .6])
%% fig 4-D, the association between the coupling (GS amplitude adjusted) and SUVR
subplot(233),
[r,p]=corr(cp_regr,suvr,'rows','pairwise','Type','Spearman'),%
plot(cp_regr,suvr,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp_regr(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp_regr(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(cp_regr(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp_regr(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])
%% fig 4-E, the association between the coupling (GS amplitude adjusted) and 2-year MMSE changes
subplot(236),

[r,p]=corr(cp_regr,mmse_l,'rows','pairwise','Type','Spearman'),%
plot(cp_regr,mmse_l,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp_regr(dc==2),mmse_l(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp_regr(dc==3),mmse_l(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(cp_regr(dc==4),mmse_l(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp_regr(dc==1),mmse_l(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])