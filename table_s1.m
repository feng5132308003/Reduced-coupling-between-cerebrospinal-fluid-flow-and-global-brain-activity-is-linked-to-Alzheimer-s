%%  table S1
clear
load('mats/ad_cn_add_202.mat','SEM_ad','SEM_cn','ad_202','cn_202','C_ad','C_cn')

load('mats/csf_prep_all5_bottom1_update2.mat')

 load('mats/all_fmri_list_full_name.mat','list_fmri_tmp1')

for li=1:length(list_fmri_tmp1)
    subj_list_all1{li}=list_fmri_tmp1{li}(7:10);
end

%%
load('mats/test_overlap.mat','test*')

list_new_ad_cn=union(C_ad,C_cn);
test_overlap2=union(test_overlap,list_new_ad_cn);


for li=1:length(test_overlap2)
    subj_list_all_159{li}=test_overlap2{li}(1:4);%(7:10);
end

C=intersect(subj_list_all1,subj_list_all_159);


for li=1:length(C)
    idx_subj_bl_all(li)=min(find(ismember(subj_list_all1,C{li}))); 
end


%%
tmp1=readtable('check_list_Aaron_2.xlsx');
tmp1_session=(table2cell(tmp1(idx_subj_bl_all,4)));

idx_cn=find(strcmp(tmp1_session,'CN'));
idx_smc=find(strcmp(tmp1_session,'SMC'));

idx_emci=find(strcmp(tmp1_session,'EMCI'));
idx_mci=find(strcmp(tmp1_session,'MCI'));
idx_lmci=find(strcmp(tmp1_session,'LMCI'));

idx_all_mci=cat(1,idx_emci,idx_mci,idx_lmci);
idx_ad=find(strcmp(tmp1_session,'AD'));

max([idx_cn' idx_all_mci' idx_ad' idx_smc'])


%% compare the age for the 4 groups

load('mats/all_fmri_sex_age.mat','all*');% male as 1


all_fmri_age2=all_fmri_age(idx_subj_bl_all);

age_ad=all_fmri_age2(idx_ad);[mean(age_ad) std(age_ad)]
age_mci=all_fmri_age2(idx_all_mci);[mean(age_mci) std(age_mci)]
age_smc=all_fmri_age2(idx_smc);[mean(age_smc) std(age_smc)]
age_cn=all_fmri_age2(idx_cn);[mean(age_cn) std(age_cn)]

[~,~,p0,~]=crosstab([ones(1,length(age_ad)) 2*ones(1,length(age_mci)) ...
    3*ones(1,length(age_smc)) 4*ones(1,length(age_cn))],[age_ad' age_mci' age_smc' age_cn'])


[~,p1,~,~]=ttest2(age_ad,age_mci)
[~,p2,~,~]=ttest2(age_ad,age_smc)
[~,p3,~,~]=ttest2(age_ad,age_cn)

[~,p4,~,~]=ttest2(age_mci,age_smc)
[~,p5,~,~]=ttest2(age_mci,age_cn)
[~,p6,~,~]=ttest2(age_smc,age_cn)

[p1 p2 p3 p4 p5 p6]

%% compare the gender for the 4 groups
all_fmri_sex2=all_fmri_sex(idx_subj_bl_all);

sex_ad=all_fmri_sex2(idx_ad);[1-mean(sex_ad) std(sex_ad) sum(sex_ad) length(idx_ad)-sum(sex_ad)]
sex_mci=all_fmri_sex2(idx_all_mci);[1-mean(sex_mci) std(sex_mci) sum(sex_mci) length(idx_all_mci)-sum(sex_mci)]
sex_smc=all_fmri_sex2(idx_smc);[1-mean(sex_smc) std(sex_smc) sum(sex_smc) length(idx_smc)-sum(sex_smc)]
sex_cn=all_fmri_sex2(idx_cn);[1-mean(sex_cn) std(sex_cn) sum(sex_cn) length(idx_cn)-sum(sex_cn)]

[~,p,~] = fishertest([sum(sex_ad) length(idx_ad);length(sex_ad)-sum(sex_ad) 155-length(idx_ad)])

[~,~,p0,~]=crosstab([ones(1,length(sex_ad)) 2*ones(1,length(sex_mci)) ...
    3*ones(1,length(sex_smc)) 4*ones(1,length(sex_cn))],[sex_ad' sex_mci' sex_smc' sex_cn'])

%  
[~,p1,~,~]=ttest2(sex_ad,sex_mci)
[~,p2,~,~]=ttest2(sex_ad,sex_smc)
[~,p3,~,~]=ttest2(sex_ad,sex_cn)
 
[~,p4,~,~]=ttest2(sex_mci,sex_smc)
[~,p5,~,~]=ttest2(sex_mci,sex_cn)
[~,p6,~,~]=ttest2(sex_smc,sex_cn)

[p1 p2 p3 p4 p5 p6]



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
%% compare the mmse for the 4 groups
load('mats/group_diff_mmse.mat');

for li=1:length(C_bl)
    subj_list_all2{li}=C_bl{li}(1:4);
end
C_bl_mmse=unique(subj_list_all2);

for li=1:length(C_bl_mmse)

        idx_mmse1(li)=min(find(ismember(subj_list_all2,C_bl_mmse(li))));
    
end


 [C_inter,~,~]=intersect(C,C_bl_mmse);
 
for li=1:length(C_inter)
    if sum(ismember(C,C_inter(li)))==0
        ;
    else
        idx_subj_mmse1(li)=min(find(ismember(C,C_inter(li))));
    end
end
%%%
for li=1:length(C_inter)
    if sum(ismember(C_bl_mmse,C_inter(li)))==0
        ;
    else
        idx_subj_mmse2(li)=min(find(ismember(C_bl_mmse,C_inter(li))));
    end
end



tmp1=readtable('check_list_Aaron_2.xlsx');
tmp1_session=(table2cell(tmp1(idx_subj_bl_all(idx_subj_mmse1),4)));

idx_cn2=find(strcmp(tmp1_session,'CN'));
idx_smc2=find(strcmp(tmp1_session,'SMC'));

idx_emci2=find(strcmp(tmp1_session,'EMCI'));
idx_mci2=find(strcmp(tmp1_session,'MCI'));
idx_lmci2=find(strcmp(tmp1_session,'LMCI'));

idx_all_mci2=cat(1,idx_emci2,idx_mci2,idx_lmci2);
idx_ad2=find(strcmp(tmp1_session,'AD'));

max([idx_cn2' idx_all_mci2' idx_ad2' idx_smc2'])




all_fmri_mmse2=mmse_test(idx_mmse1(idx_subj_mmse2));
 

mmse_ad=all_fmri_mmse2(idx_ad2);[mean(mmse_ad) std(mmse_ad)]
mmse_mci=all_fmri_mmse2(idx_all_mci2);[mean(mmse_mci) std(mmse_mci)]
mmse_smc=all_fmri_mmse2(idx_smc2);[mean(mmse_smc) std(mmse_smc)]
mmse_cn=all_fmri_mmse2(idx_cn2);[mean(mmse_cn) std(mmse_cn)]
 
 
[~,~,p0,~]=crosstab([ones(1,length(mmse_ad)) 2*ones(1,length(mmse_mci)) ...
    3*ones(1,length(mmse_smc)) 4*ones(1,length(mmse_cn))],[mmse_ad' mmse_mci' mmse_smc' mmse_cn'])

[~,p,~,~]=ttest2(mmse_ad,mmse_mci)
[~,p,~,~]=ttest2(mmse_ad,mmse_smc)
[~,p,~,~]=ttest2(mmse_ad,mmse_cn)
 
[~,p,~,~]=ttest2(mmse_mci,mmse_smc)
[~,p,~,~]=ttest2(mmse_mci,mmse_cn)
[~,p,~,~]=ttest2(mmse_smc,mmse_cn)
%%%%
all_fmri_mmse3=mmse_test2(idx_mmse1(idx_subj_mmse2));
 
mmse_ad=all_fmri_mmse3(idx_ad2);[mean(mmse_ad) std(mmse_ad)]
mmse_mci=all_fmri_mmse3(idx_all_mci2);[mean(mmse_mci) std(mmse_mci)]
mmse_smc=all_fmri_mmse3(idx_smc2);[mean(mmse_smc) std(mmse_smc)]
mmse_cn=all_fmri_mmse3(idx_cn2);[mean(mmse_cn) std(mmse_cn)]
 
 
[~,p,~,~]=ttest2(mmse_ad,mmse_mci)
[~,p,~,~]=ttest2(mmse_ad,mmse_smc)
[~,p,~,~]=ttest2(mmse_ad,mmse_cn)
 
[~,p,~,~]=ttest2(mmse_mci,mmse_smc)
[~,p,~,~]=ttest2(mmse_mci,mmse_cn)
[~,p,~,~]=ttest2(mmse_smc,mmse_cn)
%% compare the PET-SUVR for the 4 groups

pet=load('mats/group_diff_pet_comp.mat');

 C_bl=pet.C;
for li=1:length(C_bl)
    subj_list_all2{li}=C_bl{li}(1:4);
end
C_bl_pet=unique(subj_list_all2);
 
for li=1:length(C_bl_pet)
 
        idx_pet1(li)=min(find(ismember(subj_list_all2,C_bl_pet(li))));
    
end
 
 
 [C_inter,~,~]=intersect(C,C_bl_pet);
 
for li=1:length(C_inter)
    if sum(ismember(C,C_inter(li)))==0
        ;
    else
        idx_subj_pet1(li)=min(find(ismember(C,C_inter(li))));
    end
end
%%%
for li=1:length(C_inter)
    if sum(ismember(C_bl_pet,C_inter(li)))==0
        ;
    else
        idx_subj_pet2(li)=min(find(ismember(C_bl_pet,C_inter(li))));
    end
end
 
 
 
tmp1=readtable('check_list_Aaron_2.xlsx');
tmp1_session=(table2cell(tmp1(idx_subj_bl_all(idx_subj_pet1),4)));
 
idx_cn2=find(strcmp(tmp1_session,'CN'));
idx_smc2=find(strcmp(tmp1_session,'SMC'));
 
idx_emci2=find(strcmp(tmp1_session,'EMCI'));
idx_mci2=find(strcmp(tmp1_session,'MCI'));
idx_lmci2=find(strcmp(tmp1_session,'LMCI'));
 
idx_all_mci2=cat(1,idx_emci2,idx_mci2,idx_lmci2);
idx_ad2=find(strcmp(tmp1_session,'AD'));
 
max([idx_cn2' idx_all_mci2' idx_ad2' idx_smc2'])
 
 
 
 
all_fmri_pet2=pet.SUVR_whole_cortical_all_base(idx_pet1(idx_subj_pet2));
 
pet_ad=all_fmri_pet2(idx_ad2);[mean(pet_ad) std(pet_ad)]
pet_mci=all_fmri_pet2(idx_all_mci2);[mean(pet_mci) std(pet_mci)]
pet_smc=all_fmri_pet2(idx_smc2);[mean(pet_smc) std(pet_smc)]
pet_cn=all_fmri_pet2(idx_cn2);[mean(pet_cn) std(pet_cn)]
 
 
 
[~,~,p0,~]=crosstab([1*ones(1,length(pet_ad)) 2*ones(1,length(pet_mci)) ...
    3*ones(1,length(pet_smc)) 4*ones(1,length(pet_cn))],[pet_ad' pet_mci' pet_smc' pet_cn'])



[~,p,~,~]=ttest2(pet_ad,pet_mci)
[~,p,~,~]=ttest2(pet_ad,pet_smc)
[~,p,~,~]=ttest2(pet_ad,pet_cn)
 
[~,p,~,~]=ttest2(pet_mci,pet_smc)
[~,p,~,~]=ttest2(pet_mci,pet_cn)
[~,p,~,~]=ttest2(pet_smc,pet_cn)

%% 
all_fmri_pet3=pet.SUVR_whole_cortical_all_24m(idx_pet1(idx_subj_pet2));
 
pet_ad=all_fmri_pet3(idx_ad2);[mean(pet_ad) std(pet_ad)]
pet_mci=all_fmri_pet3(idx_all_mci2);[mean(pet_mci) std(pet_mci)]
pet_smc=all_fmri_pet3(idx_smc2);[mean(pet_smc) std(pet_smc)]
pet_cn=all_fmri_pet3(idx_cn2);[mean(pet_cn) std(pet_cn)]
 
 
[~,p,~,~]=ttest2(pet_ad,pet_mci)
[~,p,~,~]=ttest2(pet_ad,pet_smc)
[~,p,~,~]=ttest2(pet_ad,pet_cn)
 
[~,p,~,~]=ttest2(pet_mci,pet_smc)
[~,p,~,~]=ttest2(pet_mci,pet_cn)
[~,p,~,~]=ttest2(pet_smc,pet_cn)
%% compare the apoe for the 4 groups
apoe=load('mats/group_diff_apoe.mat','C_bl','apoe_test');



C_bl=apoe.C_bl;
for li=1:length(C_bl)
    subj_list_all2{li}=C_bl{li}(1:4);
end
C_bl_apoe=unique(subj_list_all2);
 
for li=1:length(C_bl_apoe)
 
        idx_apoe1(li)=min(find(ismember(subj_list_all2,C_bl_apoe(li))));
    
end
 
 
 [C_inter,~,~]=intersect(C,C_bl_apoe);
 
for li=1:length(C_inter)
    if sum(ismember(C,C_inter(li)))==0
        ;
    else
        idx_subj_apoe1(li)=min(find(ismember(C,C_inter(li))));
    end
end
%%%
for li=1:length(C_inter)
    if sum(ismember(C_bl_apoe,C_inter(li)))==0
        ;
    else
        idx_subj_apoe2(li)=min(find(ismember(C_bl_apoe,C_inter(li))));
    end
end
 
 
 
tmp1=readtable('check_list_Aaron_2.xlsx');
tmp1_session=(table2cell(tmp1(idx_subj_bl_all(idx_subj_apoe1),4)));
 
idx_cn2=find(strcmp(tmp1_session,'CN'));
idx_smc2=find(strcmp(tmp1_session,'SMC'));
 
idx_emci2=find(strcmp(tmp1_session,'EMCI'));
idx_mci2=find(strcmp(tmp1_session,'MCI'));
idx_lmci2=find(strcmp(tmp1_session,'LMCI'));
 
idx_all_mci2=cat(1,idx_emci2,idx_mci2,idx_lmci2);
idx_ad2=find(strcmp(tmp1_session,'AD'));
 
max([idx_cn2' idx_all_mci2' idx_ad2' idx_smc2'])
 
 
 
 
all_fmri_apoe2=apoe.apoe_test(idx_apoe1(idx_subj_apoe2),1);
 
apoe_ad=all_fmri_apoe2(idx_ad2);[sum(apoe_ad==0) sum(apoe_ad==1) sum(apoe_ad==2)]
apoe_mci=all_fmri_apoe2(idx_all_mci2);[sum(apoe_mci==0) sum(apoe_mci==1) sum(apoe_mci==2)] 
apoe_smc=all_fmri_apoe2(idx_smc2);[sum(apoe_smc==0) sum(apoe_smc==1) sum(apoe_smc==2)] 
apoe_cn=all_fmri_apoe2(idx_cn2);[sum(apoe_cn==0) sum(apoe_cn==1) sum(apoe_cn==2)] 
 
 
[~,p,~,~]=ttest2(apoe_ad,apoe_mci)
[~,p,~,~]=ttest2(apoe_ad,apoe_smc)
[~,p,~,~]=ttest2(apoe_ad,apoe_cn)
 
[~,p,~,~]=ttest2(apoe_mci,apoe_smc)
[~,p,~,~]=ttest2(apoe_mci,apoe_cn)
[~,p,~,~]=ttest2(apoe_smc,apoe_cn)


[h,p1,stats] = fishertest([5 22; ...
    33 27]','Alpha',0.05)

[h,p2,stats] = fishertest([5 22; ...
    13 5]','Alpha',0.05)

[h,p3,stats] = fishertest([5 22; ...
    25 11]','Alpha',0.05)

[h,p4,stats] = fishertest([33 27; ...
    13 5]','Alpha',0.05)

[h,p5,stats] = fishertest([33 27; ...
    25 11]','Alpha',0.05)

[h,p6,stats] = fishertest([13 5; ...
    25 11]','Alpha',0.05)
[p1 p2 p3 p4 p5 p6]