%% figure 1B
clear
load('mats/bold_csf_tmp.mat','bold_tmp','csf_tmp');%csf_tmp=csf_tmp';
figure('color','w','position',[100 200 2000 500]),
yyaxis left,
plot(1:130,bold_tmp,'o-','MarkerFaceColor','b','MarkerSize',3,'LineWidth',2),
ylim([-1.2 2.2]);
yyaxis right,
plot(1:130,csf_tmp-1,'o-','MarkerFaceColor','r','MarkerSize',3,'LineWidth',2),
ylim([-1 0.5]),legend('gsl','csf')
%% figure 1C
%Note: please download the "jbfill" function forShade area between two curves，from：
%https://www.mathworks.com/matlabcentral/fileexchange/13188-shade-area-between-two-curves

clear
idx_158=setdiff(1:159,18);% discard the 18th session out of the 159 sessions, due to this session has no longitudinal MMSE 

load('mats/figure1_curve.mat');% the BOLD-CSF cross-correlation fucntion at each lags
load('mats/interval_lmm_2.mat','high_thr*','low_thr*','cro_test_permu_all*','idx_per*')% load the permutation test outcome
cp_dt_118=cro_r_csf_gsl3_FT_test_pet(2:10,idx_158)';



SEM_bold_csf = std(cro_r_csf_gsl2_FT_test_pet(2:10,idx_158)')/sqrt(size(cro_r_csf_gsl2_FT_test_pet(2:10,idx_158),2));

figure('color','w'),
subplot(211),
plot([-12:3:12],flip(low_thr));hold on,
plot([-12:3:12],flip(high_thr));
[ph,msg]=jbfill([-12:3:12],flip(high_thr),flip(low_thr),[0.7 .7 .7],[.3 .3 .3],0,0.4)
plot([-12:3:12],flip(nanmean(cro_test_permu_all')));

plot([-12:3:12],flip(nanmean(cro_r_csf_gsl2_FT_test_pet(2:10,idx_158)')),'-o'),

e=errorbar([-12:3:12],flip(mean(cro_r_csf_gsl2_FT_test_pet(2:10,idx_158)')),SEM_bold_csf,'MarkerSize',10, ...
    'MarkerEdgeColor','red','MarkerFaceColor','red'),
e.Color=[0.6350 0.6350 0.6350];
e.MarkerFaceColor=[0.6350 0.6350 0.6350];
xlim([-12,12]);

%
SEM_TD_bold_csf = std(cro_r_csf_gsl3_FT_test_pet(2:10,idx_158)')/sqrt(size(cro_r_csf_gsl3_FT_test_pet(2:10,idx_158),2));

subplot(212),
plot([-12:3:12],low_thr_TD);hold on,
plot([-12:3:12],high_thr_TD);
plot([-12:3:12],flip(-nanmean(cro_test_permu_all_TD')));
[ph,msg]=jbfill([-12:3:12],high_thr_TD,low_thr_TD,[0.7 .7 .7],[.3 .3 .3],0,0.4)
plot([-12:3:12],flip(-nanmean(cro_r_csf_gsl3_FT_test_pet(2:10,idx_158)')),'-o'),


e=errorbar([-12:3:12],flip(mean(-cro_r_csf_gsl3_FT_test_pet(2:10,idx_158)')),SEM_TD_bold_csf,'MarkerSize',10, ...
    'MarkerEdgeColor','red','MarkerFaceColor','red'),
e.Color=[0.6350 0.6350 0.6350];
e.MarkerFaceColor=[0.6350 0.6350 0.6350];
xlim([-12,12]);
