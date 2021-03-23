%% figure S9, Relationships between AD-related markers and the BOLD-CSF correlations at different time lags. 
clear
%pd_beh_tmp1=readtable('test_lmm_figS7_new.xlsx','Sheet','Sheet1');
pd_beh_tmp1=readtable('data_figs.xlsx','Sheet','figs9');

pd_beh_tmp2=double(string(table2cell(pd_beh_tmp1)));

lag=pd_beh_tmp2(:,1);
r_all=pd_beh_tmp2(:,2:5);
%
%test=atanh(0.156)*(sqrt(158-3))

%% fig S9-A, the association between SUVR and cross-correlation of BOLD-CSF (spearman correlation)
figure,

subplot(121),
plot(-5:1:5,flip(r_all(:,2)),'-o','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
hold on, plot(flip(6-(find(abs(r_all(:,2))>.16))),flip(r_all((abs(r_all(:,2))>.16),2)),'o','MarkerEdgeColor',[1 0 0]),
xlim([-4,4]) % *3s

%% fig S9-B, the association between 2-year changes of MMSE and cross-correlation of BOLD-CSF (spearman correlation)
subplot(122),
plot(-5:1:5,flip(r_all(:,4)),'-o','MarkerEdgeColor',[0.6350 0.6350 0.6350]),
hold on, plot(flip(6-(find(abs(r_all(:,4))>.16))),flip(r_all((abs(r_all(:,4))>.16),4)),'o','MarkerEdgeColor',[1 0 0]),
xlim([-4,4]) % *3s