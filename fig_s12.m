%% fig S12, The global BOLD signal in percentage changes and cross-session variation of 
%the BOLD-CSF cross-correlation function.
clear


%% figS12-A, test new pct changes for BOLD
load('mats/gsl_prep5_base2_2022.mat')
load('mats/bold_csf_tmp.mat','csf_tmp')

figure('color','w','position',[100 200 2000 500]),
yyaxis left,
plot(1:130,gsl_prep5_base2,'o-','MarkerFaceColor','b','MarkerSize',3,'LineWidth',2),
ylim([-0.03 0.07]);
yyaxis right,
plot(1:130,csf_tmp-1,'o-','MarkerFaceColor','r','MarkerSize',3,'LineWidth',2),
ylim([-1 0.5]),legend('gsl','csf')


%% fig S12-B
clear

load('mats/figure1_curve.mat','cro_r_csf_gsl2_FT_test_pet','cro_r_csf_gsl3_FT_test_pet');
load('mats/interval.mat');
cro_r_csf_gsl2_FT_test_pet(:,18)=[];
% discard the 18th session out of the 159 sessions, due to this session has no longitudinal MMSE 
cro_r_csf_gsl3_FT_test_pet(:,18)=[];

%pd_beh_tmp1=readtable('test_lmm_fig3_4_new.xlsx','Sheet','Sheet1');
pd_beh_tmp1=readtable('data_figs.xlsx','Sheet','figs5');% some info used in that sheet

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1(:,[5]))));
dc=pd_beh_tmp2(:,1);
%% BOLD vs CSF
SEM_bold_csf = std(cro_r_csf_gsl2_FT_test_pet(2:10,:)');
figure,
  subplot(121),

plot([-12:3:12],flip(nanmean(cro_r_csf_gsl2_FT_test_pet(2:10,:)')),'-o'),
hold on,
plot([-12:3:12],flip((cro_r_csf_gsl2_FT_test_pet(2:10,:))),'-','linewidth',.5,'Color',[.8 .8 .8]),
plot([-12:3:12],flip((cro_r_csf_gsl2_FT_test_pet(2:10,dc==2))),'-','linewidth',.5,'Color',[0.6350 0.6350 0.6350]),
plot([-12:3:12],flip((cro_r_csf_gsl2_FT_test_pet(2:10,dc==3))),'-','linewidth',.5,'Color',[0.350 0.350 0.350]),
plot([-12:3:12],flip((cro_r_csf_gsl2_FT_test_pet(2:10,dc==4))),'-','linewidth',.5,'Color',[0.8500 0.3250 0.0980]), 
plot([-12:3:12],flip((cro_r_csf_gsl2_FT_test_pet(2:10,dc==1))),'-','linewidth',.5,'Color',[0 0.4470 0.7410]),
%

e=errorbar([-12:3:12],flip(mean(cro_r_csf_gsl2_FT_test_pet(2:10,:)')),SEM_bold_csf,'linewidth',2,'MarkerSize',10, ...
    'MarkerEdgeColor','black','MarkerFaceColor','black'),
 e.Color=[0 0 0];
 e.MarkerFaceColor=[0 0 0];
xlim([-12,12]);


%% -dt/dt BOLD vs CSF


SEM_TD_bold_csf = std(cro_r_csf_gsl3_FT_test_pet(2:10,:)');

subplot(122),
plot([-12:3:12],flip(-nanmean(cro_r_csf_gsl3_FT_test_pet(2:10,:)')),'-o'),hold on,
hold on,
plot([-12:3:12],flip(-(cro_r_csf_gsl3_FT_test_pet(2:10,:))),'-','linewidth',.5,'Color',[.8 .8 .8]),

hold on,

plot([-12:3:12],flip(-(cro_r_csf_gsl3_FT_test_pet(2:10,dc==2))),'-','linewidth',.5,'Color',[0.6350 0.6350 0.6350]),
plot([-12:3:12],flip(-(cro_r_csf_gsl3_FT_test_pet(2:10,dc==3))),'-','linewidth',.5,'Color',[0.350 0.350 0.350]),
plot([-12:3:12],flip(-(cro_r_csf_gsl3_FT_test_pet(2:10,dc==4))),'-','linewidth',.5,'Color',[0.8500 0.3250 0.0980]), 
plot([-12:3:12],flip(-(cro_r_csf_gsl3_FT_test_pet(2:10,dc==1))),'-','linewidth',.5,'Color',[0 0.4470 0.7410]),
%
e=errorbar([-12:3:12],flip(mean(-cro_r_csf_gsl3_FT_test_pet(2:10,:)')),SEM_TD_bold_csf,'linewidth',2,'MarkerSize',10, ...
    'MarkerEdgeColor','red','MarkerFaceColor','red'),
e.Color=[0 0 0];
e.MarkerFaceColor=[0 0 0];

xlim([-12,12]);