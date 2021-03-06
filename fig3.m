%% figure 3 
%% note: please use the R code for the LMM adjustment and then update the p-values
%%
clear
pd_beh_tmp1=readtable('test_lmm_fig3_4_new.xlsx','Sheet','Sheet1');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[5 6 7 10 11 12]))));

cp=pd_beh_tmp2(:,end);% the coupling, adjusted with age and gender
dc=pd_beh_tmp2(:,1); % diease condition
suvr=pd_beh_tmp2(:,2); % baseline cortical SUVR 
suvr_l=pd_beh_tmp2(:,3);% 2-year changes of SUVR
mmse=pd_beh_tmp2(:,4); % baseline MMSE scores
mmse_l=pd_beh_tmp2(:,5); % 2-year changes of MMSE
%% for the figure 3-C
figure,
[r,p]=corr(cp,mmse,'rows','pairwise','Type','Spearman')%
subplot(223),plot(cp,mmse,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),mmse(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),mmse(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),

plot(cp(dc==4),mmse(dc==4),'.','MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),mmse(dc==1),'.','MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])
%% for the figure 3-D

[r,p]=corr(cp,mmse_l,'rows','pairwise','Type','Spearman')%
subplot(224),plot(cp,mmse_l,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),mmse_l(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),mmse_l(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),

plot(cp(dc==4),mmse_l(dc==4),'.','MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),mmse_l(dc==1),'.','MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])

%% for the figure 3-A
[r,p]=corr(cp,suvr,'rows','pairwise','Type','Spearman')%
subplot(221),plot(cp,suvr,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),suvr(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),suvr(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),

plot(cp(dc==4),suvr(dc==4),'.','MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),suvr(dc==1),'.','MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])

%% for the figure 3-B
[r,p]=corr(cp,suvr_l,'rows','pairwise','Type','Spearman')%
subplot(222),plot(cp,suvr_l,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),suvr_l(dc==2),'.','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),suvr_l(dc==3),'.','MarkerEdgeColor',[0.350 0.350 0.350]),

plot(cp(dc==4),suvr_l(dc==4),'.','MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),suvr_l(dc==1),'.','MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3])

