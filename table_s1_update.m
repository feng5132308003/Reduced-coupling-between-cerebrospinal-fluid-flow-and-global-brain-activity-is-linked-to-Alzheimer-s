%%
clear

load('mats/age_table_s1.mat','age*')


[mean(age_ad) std(age_ad)]
[mean(age_mci) std(age_mci)]
[mean(age_smc) std(age_smc)]
[mean(age_cn) std(age_cn)]

[~,~,p0,~]=crosstab([ones(1,length(age_ad)) 2*ones(1,length(age_mci)) ...
    3*ones(1,length(age_smc)) 4*ones(1,length(age_cn))],[age_ad' age_mci' age_smc' age_cn'])


[~,p1,~,~]=ttest2(age_ad,age_mci)
[~,p2,~,~]=ttest2(age_ad,age_smc)
[~,p3,~,~]=ttest2(age_ad,age_cn)

[~,p4,~,~]=ttest2(age_mci,age_smc)
[~,p5,~,~]=ttest2(age_mci,age_cn)
[~,p6,~,~]=ttest2(age_smc,age_cn)

[p1 p2 p3 p4 p5 p6]
%%
load('mats/sex_table_s1.mat','sex*')




[h,p1,stats] = fishertest([sum(sex_ad) sum(sex_mci); ...
    length(sex_ad)-sum(sex_ad) length(sex_mci)-sum(sex_mci)]','Alpha',0.05)

[h,p2,stats] = fishertest([sum(sex_ad) sum(sex_smc); ...
    length(sex_ad)-sum(sex_ad) length(sex_smc)-sum(sex_smc)]','Alpha',0.05)

[h,p3,stats] = fishertest([sum(sex_ad) sum(sex_cn); ...
    length(sex_ad)-sum(sex_ad) length(sex_cn)-sum(sex_cn)]','Alpha',0.05)

[h,p4,stats] = fishertest([sum(sex_mci) sum(sex_smc); ...
    length(sex_mci)-sum(sex_mci) length(sex_smc)-sum(sex_smc)]','Alpha',0.05)

[h,p5,stats] = fishertest([sum(sex_mci) sum(sex_cn); ...
    length(sex_mci)-sum(sex_mci) length(sex_cn)-sum(sex_cn)]','Alpha',0.05)

[h,p6,stats] = fishertest([sum(sex_smc) sum(sex_cn); ...
    length(sex_smc)-sum(sex_smc) length(sex_cn)-sum(sex_cn)]','Alpha',0.05)
[p1 p2 p3 p4 p5 p6]
%% mmse base
load('mats/mmse_bl_table_s1.mat','mmse_ad','mmse_mci','mmse_smc','mmse_cn')

[mean(mmse_ad) std(mmse_ad)]
[mean(mmse_mci) std(mmse_mci)]
[mean(mmse_smc) std(mmse_smc)]
[mean(mmse_cn) std(mmse_cn)]

[~,~,p0,~]=crosstab([ones(1,length(mmse_ad)) 2*ones(1,length(mmse_mci)) ...
    3*ones(1,length(mmse_smc)) 4*ones(1,length(mmse_cn))],[mmse_ad' mmse_mci' mmse_smc' mmse_cn'])

[~,p1,~,~]=ttest2(mmse_ad,mmse_mci)
[~,p2,~,~]=ttest2(mmse_ad,mmse_smc)
[~,p3,~,~]=ttest2(mmse_ad,mmse_cn)
 
[~,p4,~,~]=ttest2(mmse_mci,mmse_smc)
[~,p5,~,~]=ttest2(mmse_mci,mmse_cn)
[~,p6,~,~]=ttest2(mmse_smc,mmse_cn)

[p1 p2 p3 p4 p5 p6]
%% mmse 24m
load('mats/mmse_24m_table_s1.mat','mmse_ad','mmse_mci','mmse_smc','mmse_cn')

[mean(mmse_ad) std(mmse_ad)]
[mean(mmse_mci) std(mmse_mci)]
[mean(mmse_smc) std(mmse_smc)]
[mean(mmse_cn) std(mmse_cn)]

[~,~,p0,~]=crosstab([ones(1,length(mmse_ad)) 2*ones(1,length(mmse_mci)) ...
    3*ones(1,length(mmse_smc)) 4*ones(1,length(mmse_cn))],[mmse_ad' mmse_mci' mmse_smc' mmse_cn'])

[~,p1,~,~]=ttest2(mmse_ad,mmse_mci)
[~,p2,~,~]=ttest2(mmse_ad,mmse_smc)
[~,p3,~,~]=ttest2(mmse_ad,mmse_cn)
 
[~,p4,~,~]=ttest2(mmse_mci,mmse_smc)
[~,p5,~,~]=ttest2(mmse_mci,mmse_cn)
[~,p6,~,~]=ttest2(mmse_smc,mmse_cn)
[p1 p2 p3 p4 p5 p6]

%%
load('mats/pet_bl_table_s1.mat','pet_ad','pet_mci','pet_smc','pet_cn')

[mean(pet_ad) std(pet_ad)]
[mean(pet_mci) std(pet_mci)]
[mean(pet_smc) std(pet_smc)]
[mean(pet_cn) std(pet_cn)]
 
 
 
[~,~,p0,~]=crosstab([1*ones(1,length(pet_ad)) 2*ones(1,length(pet_mci)) ...
    3*ones(1,length(pet_smc)) 4*ones(1,length(pet_cn))],[pet_ad' pet_mci' pet_smc' pet_cn'])



[~,p1,~,~]=ttest2(pet_ad,pet_mci)
[~,p2,~,~]=ttest2(pet_ad,pet_smc)
[~,p3,~,~]=ttest2(pet_ad,pet_cn)
 
[~,p4,~,~]=ttest2(pet_mci,pet_smc)
[~,p5,~,~]=ttest2(pet_mci,pet_cn)
[~,p6,~,~]=ttest2(pet_smc,pet_cn)

[p1 p2 p3 p4 p5 p6]

%%
load('mats/pet_24m_table_s1.mat','pet_ad','pet_mci','pet_smc','pet_cn')

[mean(pet_ad) std(pet_ad)]
[mean(pet_mci) std(pet_mci)]
[mean(pet_smc) std(pet_smc)]
[mean(pet_cn) std(pet_cn)]
 
 
[~,p1,~,~]=ttest2(pet_ad,pet_mci)
[~,p2,~,~]=ttest2(pet_ad,pet_smc)
[~,p3,~,~]=ttest2(pet_ad,pet_cn)
 
[~,p4,~,~]=ttest2(pet_mci,pet_smc)
[~,p5,~,~]=ttest2(pet_mci,pet_cn)
[~,p6,~,~]=ttest2(pet_smc,pet_cn)

[p1 p2 p3 p4 p5 p6]

%%
load('mats/apoe_table_s1.mat','apoe_ad','apoe_mci','apoe_smc','apoe_cn')




[h,p1,stats] = fishertest([sum(apoe_ad>0) sum(apoe_mci>0); ...
    length(apoe_ad)-sum(apoe_ad>0) length(apoe_mci)-sum(apoe_mci>0)]','Alpha',0.05)

[h,p2,stats] = fishertest([sum(apoe_ad>0) sum(apoe_smc>0); ...
    length(apoe_ad)-sum(apoe_ad>0) length(apoe_smc)-sum(apoe_smc>0)]','Alpha',0.05)

[h,p3,stats] = fishertest([sum(apoe_ad>0) sum(apoe_cn>0); ...
    length(apoe_ad)-sum(apoe_ad>0) length(apoe_cn)-sum(apoe_cn>0)]','Alpha',0.05)

[h,p4,stats] = fishertest([sum(apoe_mci>0) sum(apoe_smc>0); ...
    length(apoe_mci)-sum(apoe_mci>0) length(apoe_smc)-sum(apoe_smc>0)]','Alpha',0.05)


[h,p5,stats] = fishertest([sum(apoe_mci>0) sum(apoe_cn>0); ...
    length(apoe_mci)-sum(apoe_mci>0) length(apoe_cn)-sum(apoe_cn>0)]','Alpha',0.05)


[h,p6,stats] = fishertest([sum(apoe_smc>0) sum(apoe_cn>0); ...
    length(apoe_smc)-sum(apoe_smc>0) length(apoe_cn)-sum(apoe_cn>0)]','Alpha',0.05)


[p1 p2 p3 p4 p5 p6]