%% figure S7, test the head motion's effect on the age, cortical SUVR, 2-year MMSE changes, BOLD-CSF coupling
clear
pd_beh_tmp1=readtable('test_lmm_fig3_4_new.xlsx','Sheet','Sheet1');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[5 6 7 10 11 12 4]))));
cp=pd_beh_tmp2(:,end);
dc=pd_beh_tmp2(:,1);
suvr=pd_beh_tmp2(:,2);
suvr_l=pd_beh_tmp2(:,3);
mmse=pd_beh_tmp2(:,4);
mmse_l=pd_beh_tmp2(:,5);

pd_beh_tmp1=readtable('test_lmm_new.xlsx','Sheet','Sheet1');

cp=double(string(table2cell(pd_beh_tmp1(:,[4]))));


%%
id=(string(table2cell(pd_beh_tmp1(:,[2]))));
id_tmp=unique(id);

    for lm=1:length(id)
        test_id(lm)=find(strcmp(id_tmp,id(lm)));
    end
test_id2=findgroups(test_id)';
    
pd_beh_tmp11=readtable('test_lmm_new.xlsx','Sheet','Sheet1');

pd_beh_tmp22=double(string(table2cell(pd_beh_tmp11(:,[5 6]))));
age2=pd_beh_tmp22(:,1);
gender2=findgroups(pd_beh_tmp22(:,2));


%%  fig S7-D, the association between the mean FD and the coupling 
load('mats/fd_test_158.mat','fd_tmp2_158_2','mean_fd_158_2')

tbl = table(cp,test_id2,mean_fd_158_2, ...
    'VariableNames',{'cp','test_id2','mean_fd_158_2'});

lme = fitlme(tbl,'cp~mean_fd_158_2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')


[r,p]=corr(cp,mean_fd_158_2,'rows','pairwise','type','Spearman')
figure('color','w'),
subplot(144),
plot(cp,mean_fd_158_2,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline,title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),xlim([-.8 .4]),xticks([-.6 -.3 0 .3]),yticks([0 .2 .4 .6 .8 1.0])

hold on,

plot(cp(dc==2),mean_fd_158_2(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),mean_fd_158_2(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(cp(dc==4),mean_fd_158_2(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),mean_fd_158_2(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%% fig S7-A, the association between the mean FD and the age 
 
tbl = table(age2,test_id2,mean_fd_158_2, ...
    'VariableNames',{'age2','test_id2','mean_fd_158_2'});
 
lme = fitlme(tbl,'age2~mean_fd_158_2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')
 
 
[r,p]=corr(age2,mean_fd_158_2,'rows','pairwise','type','Spearman')
subplot(141),
plot(age2,mean_fd_158_2,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline,title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),xlim([40 100]),xticks([50 70 90]),yticks([0 .2 .4 .6 .8 1.0])

hold on,
 
plot(age2(dc==2),mean_fd_158_2(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(age2(dc==3),mean_fd_158_2(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(age2(dc==4),mean_fd_158_2(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(age2(dc==1),mean_fd_158_2(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%
%% fig S7-C, the association between the mean FD and the 2-year changes of MMSE  
  
tbl = table(mmse_l,test_id2,mean_fd_158_2, ...
    'VariableNames',{'mmse_l','test_id2','mean_fd_158_2'});
 
lme = fitlme(tbl,'mmse_l~mean_fd_158_2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')
 
 
[r,p]=corr(mmse_l,mean_fd_158_2,'rows','pairwise','type','Spearman')
subplot(143),
plot(mmse_l,mean_fd_158_2,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline,title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),xlim([-13 8]),xticks([-10 -5 0 5]),yticks([0 .2 .4 .6 .8 1.0])

hold on,
 
plot(mmse_l(dc==2),mean_fd_158_2(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(mmse_l(dc==3),mean_fd_158_2(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(mmse_l(dc==4),mean_fd_158_2(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(mmse_l(dc==1),mean_fd_158_2(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%

%% fig S7-B, the association between the mean FD and the SUVR
  
tbl = table(suvr,test_id2,mean_fd_158_2, ...
    'VariableNames',{'suvr','test_id2','mean_fd_158_2'});
 
lme = fitlme(tbl,'suvr~mean_fd_158_2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')
 
 
[r,p]=corr(suvr,mean_fd_158_2,'rows','pairwise','type','Spearman')
subplot(142),
plot(suvr,mean_fd_158_2,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline,title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),xlim([0.6 1.4]),xticks([.6 .8 1.0 1.2 1.4]),yticks([0 .2 .4 .6 .8 1.0])

hold on,
 
plot(suvr(dc==2),mean_fd_158_2(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(suvr(dc==3),mean_fd_158_2(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(suvr(dc==4),mean_fd_158_2(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(suvr(dc==1),mean_fd_158_2(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%