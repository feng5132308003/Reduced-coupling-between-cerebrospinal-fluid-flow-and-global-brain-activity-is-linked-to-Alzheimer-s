%% figure S4, test another ref region for deriving SUVR
%% note: please use the R code for the LMM adjustment and then update the p-values

clear
%pd_beh_tmp1=readtable('test_lmm_fig3_4_new.xlsx','Sheet','Sheet1');
pd_beh_tmp1=readtable('data_figs.xlsx','Sheet','figs3');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[2 3 5 12]))));

cp=pd_beh_tmp2(:,4);
dc=pd_beh_tmp2(:,3);

pd_beh_tmp3=(string(table2cell(pd_beh_tmp1(:,[2]))));
pd_beh_tmp4=(string(table2cell(pd_beh_tmp1(:,[3]))));
for li=1:length(cp)
    subj158{li}=[pd_beh_tmp3{li},'/',pd_beh_tmp4{li}];
end
%%
%pd_beh_tmp11=readtable('test_lmm_figureS.xlsx','Sheet','figure_s4');
pd_beh_tmp11=readtable('data_figs.xlsx','Sheet','figs4');

pd_beh_tmp22=double(string(table2cell(pd_beh_tmp11(:,[5 6]))));

pd_beh_tmp33=(string(table2cell(pd_beh_tmp11(:,[1]))));
pd_beh_tmp44=(string(table2cell(pd_beh_tmp11(:,[2]))));

for li=1:length(pd_beh_tmp33)
    subj159{li}=[pd_beh_tmp33{li},'/',pd_beh_tmp44{li}];
end
%%

for li=1:length(subj158)
    idx_all_158(li)=(find(ismember(subj159,subj158(li)))); 
end
suvr=pd_beh_tmp22(idx_all_158,1);
suvr_l=pd_beh_tmp22(idx_all_158,2);

%% fig S4-A, the association between coupling and new SUVR 
figure,
subplot(121),
[r,p]=corr(cp,suvr,'rows','pairwise','Type','Spearman'),%
plot(cp,suvr,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),

plot(cp(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3]),
ylim([.5 1]),yticks([0.6 0.8 1]),
%% fig S4-B, the association between coupling and 2-yaer changes of new SUVR 
subplot(122),
[r,p]=corr(cp,suvr_l,'rows','pairwise','Type','Spearman'),%
plot(cp,suvr_l,'.'),lsline,title(['r=',num2str(r)]),hold on,

hold on, 
plot(cp(dc==2),suvr_l(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(cp(dc==3),suvr_l(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),

plot(cp(dc==4),suvr_l(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(cp(dc==1),suvr_l(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
xlim([-.8 .5]),xticks([-0.6 -0.3 0 0.3]),
ylim([-.05 .1]),yticks([-0.05 -0 0.05 0.1]),
