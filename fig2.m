%% figure 2
%% note: please use the R code for the LMM adjustment and then update the p-values
clear

%%% load the table including the coupling, age, gender,diease condition, apoe data
pd_beh_tmp1=readtable('test_lmm_new.xlsx','Sheet','Sheet1');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[7 8 10]))));
cp=pd_beh_tmp2(:,3);
dc=pd_beh_tmp2(:,2);
apoe_test=pd_beh_tmp2(:,1);

%% for figure 2-C: the relationship between the coupling and the diease condition
[~,p,~,tstat]=ttest2(cp(dc==1),cp(dc==2))
[~,p,~,tstat]=ttest2(cp(dc==1),cp(dc==3))
[~,p,~,tstat]=ttest2(cp(dc==1),cp(dc==4))
%%%
[~,p,~,tstat]=ttest2(cp(dc==2),cp(dc==3))
[~,p,~,tstat]=ttest2(cp(dc==2),cp(dc==4))
%%%
[~,p,~,tstat]=ttest2(cp(dc==3),cp(dc==4))

SEM_ad = std(cp(dc==1))/sqrt(size(cp(dc==1),1));
SEM_mci = std(cp(dc==2))/sqrt(size(cp(dc==2),1));
SEM_smc = std(cp(dc==3))/sqrt(size(cp(dc==3),1));
SEM_cn = std(cp(dc==4))/sqrt(size(cp(dc==4),1));



[B,dev,stats] = mnrfit(cp,dc,'model','ordinal')
stats.p

figure,
subplot(121)
bar(1,mean(cp(dc==1)));
hold on,
bar(2,mean(cp(dc==2))),
bar(3,mean(cp(dc==3)));
bar(4,mean(cp(dc==4)));

errorbar(1,mean(cp(dc==1)),SEM_ad),
errorbar(2,mean(cp(dc==2)),SEM_mci),
errorbar(3,mean(cp(dc==3)),SEM_smc),
errorbar(4,mean(cp(dc==4)),SEM_cn),
legend('ad','mci','smc','cn');xticks([1 2 3 4]),
%% figure 2-D, the relationship between the coupling and the apoe gene
subplot(122),
idx_ap00=find(apoe_test==0);
idx_ap01=find(apoe_test==1);
idx_ap11=find(apoe_test==2);

 [~,p,~,tstat]=ttest2(cp(idx_ap00),cp(idx_ap11))
 [~,p,~,tstat]=ttest2(cp(idx_ap00),cp(idx_ap01))
 [~,p,~,tstat]=ttest2(cp(idx_ap11),cp(idx_ap01))

 [r,p]=corr(apoe_test,cp,'rows','pairwise','Type','Spearman'),%

SEM_ap00 = std(cp(idx_ap00))/sqrt(length(idx_ap00));
SEM_ap01 = std(cp(idx_ap01))/sqrt(length(idx_ap01));
SEM_ap11 = std(cp(idx_ap11))/sqrt(length(idx_ap11));
 


bar(1,mean(cp(idx_ap00)));
hold on, 
bar(2,mean(cp(idx_ap01))),
bar(3,mean(cp(idx_ap11))),
 
errorbar(1,mean(cp(idx_ap00)),SEM_ap00),
errorbar(2,mean(cp(idx_ap01)),SEM_ap01),
errorbar(3,mean(cp(idx_ap11)),SEM_ap11),
xticks([1 2 3])

%%

clear
pd_beh_tmp1=readtable('test_lmm_new.xlsx','Sheet','Sheet1');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[4 5 6 8]))));

age=pd_beh_tmp2(:,2);
gender=pd_beh_tmp2(:,3);
dc=pd_beh_tmp2(:,4);

cp=pd_beh_tmp2(:,1);
%% for figure 2-A, test the association between the coupling and age
[r,p]=corr(age,cp,'rows','pairwise','Type','Spearman');%

figure('color','w','position',[100 100 2000 500]),
subplot(121),
plot(age,cp,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),lsline;
hold on,

plot(age(dc==2),cp(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]), 
plot(age(dc==3),cp(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(age(dc==4),cp(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(age(dc==1),cp(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),%legend('ad','cn','others'),
xlim([40 100]),xticks([50 70 90]),ylim([-.8 .5]),yticks([-.6 -.3 0 .3])
%% for figure 2-B, test the association between the coupling and gender

subplot(122),

SEM_male = std(cp(gender==1))/sqrt(size(cp(gender==1),1));
SEM_female = std(cp(gender==0))/sqrt(size(cp(gender==0),1));

[~,p,~,tstat]=ttest2(cp(gender==1),cp(gender==0))

bar(1,mean(cp(gender==1)));
hold on,
bar(2,mean(cp(gender==0))),
errorbar(1,mean(cp(gender==1)),SEM_male),
errorbar(2,mean(cp(gender==0)),SEM_female),
xticks([1 2]),
