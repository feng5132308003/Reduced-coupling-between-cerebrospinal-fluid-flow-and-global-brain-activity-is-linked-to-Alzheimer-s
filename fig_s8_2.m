%% figure S8-lower row, test the main results with regressing the cohort info
clear
%pd_beh_tmp1=readtable('test_lmm_fig3_4_new.xlsx','Sheet','Sheet1');
pd_beh_tmp1=readtable('data_figs.xlsx','Sheet','figs5');% some info used in that sheet

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[5 6 7 10 11 12]))));
cp=pd_beh_tmp2(:,end);
dc=pd_beh_tmp2(:,1);
suvr=pd_beh_tmp2(:,2);
suvr_l=pd_beh_tmp2(:,3);
mmse=pd_beh_tmp2(:,4);
mmse_l=pd_beh_tmp2(:,5);

load('mats/adni_cohort.mat','adni*')
adni_all=zeros(length(cp),1);
adni_all(adni_go)=1;
adni_all(adni_2)=2;
adni_all(adni_3)=3;

cate_test1 = categorical(adni_all);
group=dummyvar(cate_test1);
% sum(group)
test_1st=fitlm(group,cp,'CategoricalVars',[1,2,3]);
test_2nd=double(cell2mat(table2cell(test_1st.Residuals(:,1))));
cp_cohort=test_2nd+nanmean(cp);
cp=cp_cohort;

%%
id=(string(table2cell(pd_beh_tmp1(:,[2]))));
id_tmp=unique(id);

    for lm=1:length(id)
        test_id(lm)=find(strcmp(id_tmp,id(lm)));
    end
test_id2=findgroups(test_id)';

%pd_beh_tmp11=readtable('test_lmm_new.xlsx','Sheet','Sheet1');
pd_beh_tmp11=readtable('data_figs.xlsx','Sheet','fig2');% some info used in that sheet

pd_beh_tmp22=double(string(table2cell(pd_beh_tmp11(:,[5 6]))));
age2=pd_beh_tmp22(:,1);
gender2=findgroups(pd_beh_tmp22(:,2));
% 
%%
test_id2=test_id2(~isnan(cp));
age2=age2(~isnan(cp));
gender2=gender2(~isnan(cp));
suvr=suvr(~isnan(cp));
suvr_l=suvr_l(~isnan(cp));
mmse=mmse(~isnan(cp));
mmse_l=mmse_l(~isnan(cp));
dc=dc(~isnan(cp));
cp=cp(~isnan(cp));

test_id3=unique(test_id2);

    for lm=1:length(test_id2)
        test_id4(lm)=find(ismember(test_id3,test_id2(lm)));
    end
test_id2=findgroups(test_id4)';



%% figS8-E, the association between the coupling and SUVR
tbl = table(cp,test_id2,age2,gender2, ...
    'VariableNames',{'cp','test_id2','age2','gender2'});

lme = fitlme(tbl,'cp~age2+gender2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')

clear B2 B
B = randomEffects(lme)
for li=1:length(B)
    B2(test_id2==li)=B(li);
end

cp_new=([ones(length(cp),1) age2 gender2])...
    *lme.Coefficients.Estimate+B2'+residuals(lme);
res_new=B2'+residuals(lme)+nanmean(cp_new);

[r,p]=corr(res_new,suvr,'rows','pairwise','type','Spearman')
figure('color','w'),
subplot(221),
plot(res_new,suvr,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline
hold on,

plot(res_new(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(res_new(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(res_new(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(res_new(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%

tbl = table(res_new,suvr,test_id2,'VariableNames',{'res_new','suvr','test_id2'});

lme0 = fitlme(tbl,'res_new~suvr+(1|test_id2)','FitMethod','REML')
stats=anova(lme0,'DFMethod','satterthwaite')
,title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),
%% figS8-F, the association between the coupling and 2-year changes of SUVR
suvr=suvr_l;
tbl = table(cp,test_id2,age2,gender2, ...
    'VariableNames',{'cp','test_id2','age2','gender2'});

lme = fitlme(tbl,'cp~age2+gender2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')

clear B2 B
B = randomEffects(lme)
for li=1:length(B)
    B2(test_id2==li)=B(li);
end

cp_new=([ones(length(cp),1) age2 gender2])...
    *lme.Coefficients.Estimate+B2'+residuals(lme);
res_new=B2'+residuals(lme)+nanmean(cp_new);

[r,p]=corr(res_new,suvr,'rows','pairwise','type','Spearman')
subplot(222),
plot(res_new,suvr,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline,
hold on,

plot(res_new(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(res_new(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(res_new(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(res_new(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%

tbl = table(res_new,suvr,test_id2,'VariableNames',{'res_new','suvr','test_id2'});

lme0 = fitlme(tbl,'res_new~suvr+(1|test_id2)','FitMethod','REML')
stats=anova(lme0,'DFMethod','satterthwaite')

title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),

%% figS8-G, the association between the coupling and MMSE
suvr=mmse;
tbl = table(cp,test_id2,age2,gender2, ...
    'VariableNames',{'cp','test_id2','age2','gender2'});

lme = fitlme(tbl,'cp~age2+gender2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')

clear B2 B
B = randomEffects(lme)
for li=1:length(B)
    B2(test_id2==li)=B(li);
end

cp_new=([ones(length(cp),1) age2 gender2])...
    *lme.Coefficients.Estimate+B2'+residuals(lme);
res_new=B2'+residuals(lme)+nanmean(cp_new);

[r,p]=corr(res_new,suvr,'rows','pairwise','type','Spearman')
subplot(223),
plot(res_new,suvr,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline,
hold on,

plot(res_new(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(res_new(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(res_new(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(res_new(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%

tbl = table(res_new,suvr,test_id2,'VariableNames',{'res_new','suvr','test_id2'});

lme0 = fitlme(tbl,'res_new~suvr+(1|test_id2)','FitMethod','REML')
stats=anova(lme0,'DFMethod','satterthwaite')

title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),

%% figS8-H, the association between the coupling and 2-year changes of MMSE
suvr=mmse_l;
tbl = table(cp,test_id2,age2,gender2, ...
    'VariableNames',{'cp','test_id2','age2','gender2'});

lme = fitlme(tbl,'cp~age2+gender2+(1|test_id2)','FitMethod','REML')
stats=anova(lme,'DFMethod','satterthwaite')

clear B2 B
B = randomEffects(lme)
for li=1:length(B)
    B2(test_id2==li)=B(li);
end

cp_new=([ones(length(cp),1) age2 gender2])...
    *lme.Coefficients.Estimate+B2'+residuals(lme);
res_new=B2'+residuals(lme)+nanmean(cp_new);

[r,p]=corr(res_new,suvr,'rows','pairwise','type','Spearman')
subplot(224),
plot(res_new,suvr,'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
lsline,
hold on,

plot(res_new(dc==2),suvr(dc==2),'.','MarkerSize',10,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
plot(res_new(dc==3),suvr(dc==3),'.','MarkerSize',10,'MarkerEdgeColor',[0.350 0.350 0.350]),
plot(res_new(dc==4),suvr(dc==4),'.','MarkerSize',10,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
plot(res_new(dc==1),suvr(dc==1),'.','MarkerSize',10,'MarkerEdgeColor',[0 0.4470 0.7410]),
%

tbl = table(res_new,suvr,test_id2,'VariableNames',{'res_new','suvr','test_id2'});

lme0 = fitlme(tbl,'res_new~suvr+(1|test_id2)','FitMethod','REML')
stats=anova(lme0,'DFMethod','satterthwaite')

title(['p=',num2str(stats.pValue(2)),'  r=',num2str(r)]),
