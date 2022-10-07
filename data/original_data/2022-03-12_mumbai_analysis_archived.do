**Mumbai RCT analysis
**2022-03-12 marcus.alexander@yale.edu

use "2022-03-12_mumbai_data_archived.dta"


prtest ironsalt if treat=="random" || treat=="friend", by(treat)
prtest ironsalt if treat=="random" || treat=="pair", by(treat)
prtest ironsalt if treat=="pair" || treat=="friend", by(treat)

collapse (mean) ironsalt coupon1 tnum, by(chawlno)

tabulate treat coupon1, chi2 row
tab treat ironsalt, chi2 row

tabulate treat coupon1_treated, chi2 row

tab treat coupon1_untreat, chi2 row

tab treat ironsalt_treated, chi2 row

tab treat ironsalt_untreat, chi2 row

/* Archived 
. tabulate treat coupon1, chi2 row

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |        coupon1
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       443         70 |       513 
           |     86.35      13.65 |    100.00 
-----------+----------------------+----------
      pair |       438         55 |       493 
           |     88.84      11.16 |    100.00 
-----------+----------------------+----------
    random |       458         46 |       504 
           |     90.87       9.13 |    100.00 
-----------+----------------------+----------
     Total |     2,320        171 |     2,491 
           |     93.14       6.86 |    100.00 

          Pearson chi2(3) = 127.4318   Pr = 0.000

. tab treat ironsalt, chi2 row

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |       ironsalt
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       915         66 |       981 
           |     93.27       6.73 |    100.00 
-----------+----------------------+----------
    friend |       405        108 |       513 
           |     78.95      21.05 |    100.00 
-----------+----------------------+----------
      pair |       386        107 |       493 
           |     78.30      21.70 |    100.00 
-----------+----------------------+----------
    random |       440         64 |       504 
           |     87.30      12.70 |    100.00 
-----------+----------------------+----------
     Total |     2,146        345 |     2,491 
           |     86.15      13.85 |    100.00 

          Pearson chi2(3) =  90.0570   Pr = 0.000



. tabulate treat coupon1_treated, chi2 row

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |    coupon1_treated
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       452         61 |       513 
           |     88.11      11.89 |    100.00 
-----------+----------------------+----------
      pair |       466         27 |       493 
           |     94.52       5.48 |    100.00 
-----------+----------------------+----------
    random |       460         44 |       504 
           |     91.27       8.73 |    100.00 
-----------+----------------------+----------
     Total |     2,359        132 |     2,491 
           |     94.70       5.30 |    100.00 

          Pearson chi2(3) = 111.1657   Pr = 0.000

. 


. tab treat coupon1_untreat, chi2 row

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |    coupon1_untreat
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       504          9 |       513 
           |     98.25       1.75 |    100.00 
-----------+----------------------+----------
      pair |       465         28 |       493 
           |     94.32       5.68 |    100.00 
-----------+----------------------+----------
    random |       502          2 |       504 
           |     99.60       0.40 |    100.00 
-----------+----------------------+----------
     Total |     2,452         39 |     2,491 
           |     98.43       1.57 |    100.00 

          Pearson chi2(3) =  74.3287   Pr = 0.000

. 


. tab treat ironsalt_treated, chi2 row

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |   ironsalt_treated
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       448         65 |       513 
           |     87.33      12.67 |    100.00 
-----------+----------------------+----------
      pair |       458         35 |       493 
           |     92.90       7.10 |    100.00 
-----------+----------------------+----------
    random |       456         48 |       504 
           |     90.48       9.52 |    100.00 
-----------+----------------------+----------
     Total |     2,343        148 |     2,491 
           |     94.06       5.94 |    100.00 

          Pearson chi2(3) = 116.2916   Pr = 0.000

. 

. tab treat ironsalt_untreat, chi2 row

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |   ironsalt_untreat
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       915         66 |       981 
           |     93.27       6.73 |    100.00 
-----------+----------------------+----------
    friend |       470         43 |       513 
           |     91.62       8.38 |    100.00 
-----------+----------------------+----------
      pair |       421         72 |       493 
           |     85.40      14.60 |    100.00 
-----------+----------------------+----------
    random |       488         16 |       504 
           |     96.83       3.17 |    100.00 
-----------+----------------------+----------
     Total |     2,294        197 |     2,491 
           |     92.09       7.91 |    100.00 

          Pearson chi2(3) =  47.8938   Pr = 0.000

*/

/* Old version
+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |        coupon1
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       443         70 |       513 
           |     86.35      13.65 |    100.00 
-----------+----------------------+----------
      pair |       438         55 |       493 
           |     88.84      11.16 |    100.00 
-----------+----------------------+----------
    random |       458         46 |       504 
           |     90.87       9.13 |    100.00 
-----------+----------------------+----------
     Total |     2,320        171 |     2,491 
           |     93.14       6.86 |    100.00 

          Pearson chi2(3) = 127.4318   Pr = 0.000
		  
		  
		  
		  

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |       ironsalt
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       915         66 |       981 
           |     93.27       6.73 |    100.00 
-----------+----------------------+----------
    friend |       405        108 |       513 
           |     78.95      21.05 |    100.00 
-----------+----------------------+----------
      pair |       386        107 |       493 
           |     78.30      21.70 |    100.00 
-----------+----------------------+----------
    random |       440         64 |       504 
           |     87.30      12.70 |    100.00 
-----------+----------------------+----------
     Total |     2,146        345 |     2,491 
           |     86.15      13.85 |    100.00 

          Pearson chi2(3) =  90.0570   Pr = 0.000
		  
		  

		  
For treated, as a percent of total:
+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |    coupon1_treated
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       452         61 |       513 
           |     88.11      11.89 |    100.00 
-----------+----------------------+----------
      pair |       466         27 |       493 
           |     94.52       5.48 |    100.00 
-----------+----------------------+----------
    random |       460         44 |       504 
           |     91.27       8.73 |    100.00 
-----------+----------------------+----------
     Total |     2,359        132 |     2,491 
           |     94.70       5.30 |    100.00 

          Pearson chi2(3) = 111.1657   Pr = 0.000
		  
+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |       ironsalt
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       915         66 |       981 
           |     93.27       6.73 |    100.00 
-----------+----------------------+----------
    friend |       405        108 |       513 
           |     78.95      21.05 |    100.00 
-----------+----------------------+----------
      pair |       386        107 |       493 
           |     78.30      21.70 |    100.00 
-----------+----------------------+----------
    random |       440         64 |       504 
           |     87.30      12.70 |    100.00 
-----------+----------------------+----------
     Total |     2,146        345 |     2,491 
           |     86.15      13.85 |    100.00 

          Pearson chi2(3) =  90.0570   Pr = 0.000

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |   ironsalt_treated
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       448         65 |       513 
           |     87.33      12.67 |    100.00 
-----------+----------------------+----------
      pair |       458         35 |       493 
           |     92.90       7.10 |    100.00 
-----------+----------------------+----------
    random |       456         48 |       504 
           |     90.48       9.52 |    100.00 
-----------+----------------------+----------
     Total |     2,343        148 |     2,491 
           |     94.06       5.94 |    100.00 

          Pearson chi2(3) = 116.2916   Pr = 0.000

		  
For untreated:


		  
+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |    coupon1_untreat
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       981          0 |       981 
           |    100.00       0.00 |    100.00 
-----------+----------------------+----------
    friend |       504          9 |       513 
           |     98.25       1.75 |    100.00 
-----------+----------------------+----------
      pair |       465         28 |       493 
           |     94.32       5.68 |    100.00 
-----------+----------------------+----------
    random |       502          2 |       504 
           |     99.60       0.40 |    100.00 
-----------+----------------------+----------
     Total |     2,452         39 |     2,491 
           |     98.43       1.57 |    100.00 

          Pearson chi2(3) =  74.3287   Pr = 0.000


		  +----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

           |   ironsalt_untreat
     treat |         0          1 |     Total
-----------+----------------------+----------
   control |       915         66 |       981 
           |     93.27       6.73 |    100.00 
-----------+----------------------+----------
    friend |       470         43 |       513 
           |     91.62       8.38 |    100.00 
-----------+----------------------+----------
      pair |       421         72 |       493 
           |     85.40      14.60 |    100.00 
-----------+----------------------+----------
    random |       488         16 |       504 
           |     96.83       3.17 |    100.00 
-----------+----------------------+----------
     Total |     2,294        197 |     2,491 
           |     92.09       7.91 |    100.00 

          Pearson chi2(3) =  47.8938   Pr = 0.000

		  */



table sum_lang

/*
----------------------
 sum_lang |      Freq.
----------+-----------
    Hindi |        260
  Marathi |      1,792
     Urdu |        146
    other |        293
----------------------

. table sum_relig

----------------------
sum_relig |      Freq.
----------+-----------
 Buddhist |        292
    Hindu |      1,862
   Muslim |        262
    other |         75
----------------------

*/




xtset chawlno

xtprobit coupon1 friend pair if treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_ame1

/*
. xtprobit coupon1 friend pair if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -530.81019  
Iteration 2:   log pseudolikelihood =  -530.8061  
Iteration 3:   log pseudolikelihood =  -530.8061  

Fitting full model:

rho =  0.0     log pseudolikelihood =  -530.8061
rho =  0.1     log pseudolikelihood = -536.41156

Iteration 0:   log pseudolikelihood = -536.40286  
Iteration 1:   log pseudolikelihood = -531.77969  
Iteration 2:   log pseudolikelihood = -530.93902  
Iteration 3:   log pseudolikelihood =  -530.8136  
Iteration 4:   log pseudolikelihood = -530.79882  
Iteration 5:   log pseudolikelihood = -530.79717  
Iteration 6:   log pseudolikelihood = -530.79711  
Iteration 7:   log pseudolikelihood = -530.79711  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =       8.05
Log pseudolikelihood  = -530.79711              Prob > chi2       =     0.0179

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .2360702   .0857765     2.75   0.006     .0679515     .404189
        pair |   .1133504   .1332091     0.85   0.395    -.1477347    .3744356
       _cons |  -1.333939   .0755754   -17.65   0.000    -1.482064   -1.185813
-------------+----------------------------------------------------------------
    /lnsig2u |  -6.220372   7.260338                     -20.45037    8.009628
-------------+----------------------------------------------------------------
     sigma_u |   .0445927   .1618789                      .0000362    54.86163
         rho |   .0019846     .01438                      1.31e-09    .9996679
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .0450447    .015837     2.84   0.004     .0140048    .0760846
        pair |   .0216285   .0258802     0.84   0.403    -.0290958    .0723528
------------------------------------------------------------------------------

*/

xtprobit coupon1 friend pair mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if  treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_ame2

/*
. xtprobit coupon1 friend pair mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if  treat != "control",
>  re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -527.05324  
Iteration 2:   log pseudolikelihood = -527.03263  
Iteration 3:   log pseudolikelihood = -527.03263  

Fitting full model:

rho =  0.0     log pseudolikelihood = -527.03263
rho =  0.1     log pseudolikelihood = -532.84918

Iteration 0:   log pseudolikelihood = -532.83663  
Iteration 1:   log pseudolikelihood = -528.03599  
Iteration 2:   log pseudolikelihood = -527.20731  
Iteration 3:   log pseudolikelihood = -527.05788  
Iteration 4:   log pseudolikelihood = -527.03018  
Iteration 5:   log pseudolikelihood = -527.02658  
Iteration 6:   log pseudolikelihood = -527.02638  
Iteration 7:   log pseudolikelihood = -527.02638  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(12)     =      27.58
Log pseudolikelihood  = -527.02638              Prob > chi2       =     0.0064

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .2407527   .0887357     2.71   0.007     .0668338    .4146715
        pair |   .1011429   .1370469     0.74   0.461    -.1674641      .36975
 mean_degree |   -.020829   .0503598    -0.41   0.679    -.1195325    .0778744
         age |   .0039655   .0036433     1.09   0.276    -.0031753    .0111062
        edu2 |   .0288172   .0402776     0.72   0.474    -.0501255    .1077599
wealth_index |  -.0582426   .0359281    -1.62   0.105    -.1286604    .0121752
      hindu1 |   .0304326   .2824231     0.11   0.914    -.5231064    .5839717
   buddhist1 |   .0786632   .2738212     0.29   0.774    -.4580164    .6153428
     muslim1 |   .2610866   .3684495     0.71   0.479    -.4610612    .9832344
    marathi1 |   .0641171   .1479836     0.43   0.665    -.2259255    .3541597
      hindi1 |   .1011489   .1902456     0.53   0.595    -.2717255    .4740234
       urdu1 |  -.2727188   .2634275    -1.04   0.301    -.7890272    .2435897
       _cons |  -1.479483   .3913297    -3.78   0.000    -2.246475   -.7124913
-------------+----------------------------------------------------------------
    /lnsig2u |  -6.384755    8.66774                     -23.37321     10.6037
-------------+----------------------------------------------------------------
     sigma_u |   .0410741   .1780098                      8.41e-06    200.7081
         rho |   .0016842    .014574                      7.07e-11    .9999752
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |    .045624   .0161413     2.83   0.005     .0139877    .0772603
        pair |   .0191672   .0263537     0.73   0.467    -.0324851    .0708194
 mean_degree |  -.0039472   .0095724    -0.41   0.680    -.0227087    .0148143
         age |   .0007515   .0006918     1.09   0.277    -.0006044    .0021073
        edu2 |    .005461   .0076099     0.72   0.473    -.0094541    .0203761
wealth_index |  -.0110373   .0066641    -1.66   0.098    -.0240987    .0020241
      hindu1 |   .0057672   .0534527     0.11   0.914    -.0989982    .1105325
   buddhist1 |   .0149071   .0516816     0.29   0.773    -.0863869    .1162011
     muslim1 |   .0494774   .0691532     0.72   0.474    -.0860604    .1850151
    marathi1 |   .0121506   .0280502     0.43   0.665    -.0428269     .067128
      hindi1 |   .0191683   .0361298     0.53   0.596    -.0516448    .0899814
       urdu1 |  -.0516817    .050426    -1.02   0.305    -.1505149    .0471515
------------------------------------------------------------------------------

*/

xtprobit coupon1 friend pair indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_ame3

/*
. xtprobit coupon1 friend pair indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -353.86041  
Iteration 2:   log pseudolikelihood = -344.64302  
Iteration 3:   log pseudolikelihood = -344.35988  
Iteration 4:   log pseudolikelihood =   -344.358  
Iteration 5:   log pseudolikelihood =   -344.358  

Fitting full model:

rho =  0.0     log pseudolikelihood =   -344.358
rho =  0.1     log pseudolikelihood = -344.21313
rho =  0.2     log pseudolikelihood = -347.89518

Iteration 0:   log pseudolikelihood = -344.21097  
Iteration 1:   log pseudolikelihood = -342.89397  
Iteration 2:   log pseudolikelihood = -342.80565  
Iteration 3:   log pseudolikelihood = -342.80493  
Iteration 4:   log pseudolikelihood = -342.80493  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(5)      =     439.66
Log pseudolikelihood  = -342.80493              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
        coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .5620303   .2613509     2.15   0.032      .049792    1.074269
           pair |   1.084697   .2685373     4.04   0.000     .5583739    1.611021
       indtreat |   2.471164   .2967983     8.33   0.000      1.88945    3.052878
friend_indtreat |  -.0822416   .3191428    -0.26   0.797      -.70775    .5432667
  pair_indtreat |   -1.44121    .315878    -4.56   0.000     -2.06032   -.8221007
          _cons |  -2.622611   .2372652   -11.05   0.000    -3.087643    -2.15758
----------------+----------------------------------------------------------------
       /lnsig2u |  -3.129692   .6169506                     -4.338893   -1.920491
----------------+----------------------------------------------------------------
        sigma_u |   .2091202   .0645084                      .1142408    .3827988
            rho |    .041899   .0247665                      .0128828    .1278068
---------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair indtreat friend_indtreat pair_indtreat

---------------------------------------------------------------------------------
                |            Delta-method
                |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |    .068029   .0316749     2.15   0.032     .0059474    .1301106
           pair |   .1312934    .036046     3.64   0.000     .0606445    .2019423
       indtreat |   .2991135    .037738     7.93   0.000     .2251484    .3730786
friend_indtreat |  -.0099547   .0385792    -0.26   0.796    -.0855684    .0656591
  pair_indtreat |  -.1744463   .0394006    -4.43   0.000      -.25167   -.0972225
---------------------------------------------------------------------------------

*/

xtprobit coupon1 friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_ame4

/*
. xtprobit coupon1 friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marath
> i1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -350.50392  
Iteration 2:   log pseudolikelihood = -339.98227  
Iteration 3:   log pseudolikelihood = -339.65531  
Iteration 4:   log pseudolikelihood = -339.65307  
Iteration 5:   log pseudolikelihood = -339.65307  

Fitting full model:

rho =  0.0     log pseudolikelihood = -339.65307
rho =  0.1     log pseudolikelihood = -340.06718

Iteration 0:   log pseudolikelihood = -340.06384  
Iteration 1:   log pseudolikelihood = -338.48304  
Iteration 2:   log pseudolikelihood = -338.37761  
Iteration 3:   log pseudolikelihood = -338.37653  
Iteration 4:   log pseudolikelihood = -338.37653  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(15)     =     875.68
Log pseudolikelihood  = -338.37653              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
        coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .6148396   .2576197     2.39   0.017     .1099142    1.119765
           pair |   1.113715   .2638067     4.22   0.000     .5966634    1.630767
       indtreat |   2.520329   .2847091     8.85   0.000      1.96231    3.078349
friend_indtreat |  -.1055977   .3095692    -0.34   0.733    -.7123421    .5011468
  pair_indtreat |  -1.486254   .3026158    -4.91   0.000     -2.07937   -.8931379
    mean_degree |  -.0696654   .0852128    -0.82   0.414    -.2366795    .0973486
            age |   .0014224   .0038369     0.37   0.711    -.0060977    .0089426
           edu2 |   .0375564   .0536827     0.70   0.484    -.0676599    .1427726
   wealth_index |  -.0500245   .0424595    -1.18   0.239    -.1332436    .0331946
         hindu1 |    .353629   .3108005     1.14   0.255    -.2555288    .9627868
      buddhist1 |   .4662442   .2746607     1.70   0.090    -.0720809    1.004569
        muslim1 |   .8379399   .4120918     2.03   0.042     .0302548    1.645625
       marathi1 |   .1063664    .178629     0.60   0.552      -.24374    .4564728
         hindi1 |   .0708904   .2246416     0.32   0.752    -.3693991    .5111799
          urdu1 |  -.4929953   .2459782    -2.00   0.045    -.9751037    -.010887
          _cons |  -2.986577   .5179564    -5.77   0.000    -4.001752   -1.971401
----------------+----------------------------------------------------------------
       /lnsig2u |   -3.18608   .6801148                      -4.51908   -1.853079
----------------+----------------------------------------------------------------
        sigma_u |   .2033066   .0691359                      .1043985    .3959214
            rho |   .0396929   .0259242                      .0107815    .1355118
---------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1
               hindi1 urdu1

---------------------------------------------------------------------------------
                |            Delta-method
                |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .0733815   .0308369     2.38   0.017     .0129423    .1338208
           pair |   .1329226   .0348244     3.82   0.000     .0646681    .2011772
       indtreat |    .300803   .0356253     8.44   0.000     .2309786    .3706274
friend_indtreat |  -.0126032   .0369026    -0.34   0.733    -.0849309    .0597246
  pair_indtreat |  -.1773854   .0369646    -4.80   0.000    -.2498347   -.1049361
    mean_degree |  -.0083146    .010268    -0.81   0.418    -.0284395    .0118103
            age |   .0001698   .0004588     0.37   0.711    -.0007294    .0010689
           edu2 |   .0044824   .0064421     0.70   0.487    -.0081439    .0171087
   wealth_index |  -.0059705   .0050018    -1.19   0.233    -.0157739     .003833
         hindu1 |   .0422059   .0363218     1.16   0.245    -.0289835    .1133953
      buddhist1 |   .0556466   .0313885     1.77   0.076    -.0058738    .1171669
        muslim1 |   .1000087   .0474385     2.11   0.035     .0070309    .1929864
       marathi1 |   .0126949   .0213633     0.59   0.552    -.0291765    .0545663
         hindi1 |   .0084608   .0267615     0.32   0.752    -.0439908    .0609124
          urdu1 |  -.0588393   .0301685    -1.95   0.051    -.1179684    .0002898
---------------------------------------------------------------------------------

*/

esttab coup_ame1 coup_ame2 coup_ame3 coup_ame4 using 2020-11-18_coup.tex, se label replace

*Estimation of predicted values for the text

xtprobit coupon1 friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)

/*
. xtprobit coupon1 friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marath
> i1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -350.50392  
Iteration 2:   log pseudolikelihood = -339.98227  
Iteration 3:   log pseudolikelihood = -339.65531  
Iteration 4:   log pseudolikelihood = -339.65307  
Iteration 5:   log pseudolikelihood = -339.65307  

Fitting full model:

rho =  0.0     log pseudolikelihood = -339.65307
rho =  0.1     log pseudolikelihood = -340.06718

Iteration 0:   log pseudolikelihood = -340.06384  
Iteration 1:   log pseudolikelihood = -338.48304  
Iteration 2:   log pseudolikelihood = -338.37761  
Iteration 3:   log pseudolikelihood = -338.37653  
Iteration 4:   log pseudolikelihood = -338.37653  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(15)     =     875.68
Log pseudolikelihood  = -338.37653              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
        coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .6148396   .2576197     2.39   0.017     .1099142    1.119765
           pair |   1.113715   .2638067     4.22   0.000     .5966634    1.630767
       indtreat |   2.520329   .2847091     8.85   0.000      1.96231    3.078349
friend_indtreat |  -.1055977   .3095692    -0.34   0.733    -.7123421    .5011468
  pair_indtreat |  -1.486254   .3026158    -4.91   0.000     -2.07937   -.8931379
    mean_degree |  -.0696654   .0852128    -0.82   0.414    -.2366795    .0973486
            age |   .0014224   .0038369     0.37   0.711    -.0060977    .0089426
           edu2 |   .0375564   .0536827     0.70   0.484    -.0676599    .1427726
   wealth_index |  -.0500245   .0424595    -1.18   0.239    -.1332436    .0331946
         hindu1 |    .353629   .3108005     1.14   0.255    -.2555288    .9627868
      buddhist1 |   .4662442   .2746607     1.70   0.090    -.0720809    1.004569
        muslim1 |   .8379399   .4120918     2.03   0.042     .0302548    1.645625
       marathi1 |   .1063664    .178629     0.60   0.552      -.24374    .4564728
         hindi1 |   .0708904   .2246416     0.32   0.752    -.3693991    .5111799
          urdu1 |  -.4929953   .2459782    -2.00   0.045    -.9751037    -.010887
          _cons |  -2.986577   .5179564    -5.77   0.000    -4.001752   -1.971401
----------------+----------------------------------------------------------------
       /lnsig2u |   -3.18608   .6801148                      -4.51908   -1.853079
----------------+----------------------------------------------------------------
        sigma_u |   .2033066   .0691359                      .1043985    .3959214
            rho |   .0396929   .0259242                      .0107815    .1355118
---------------------------------------------------------------------------------

*/

predict couponhat, pu0



*Purchased in the past 4 months.

xtset chawlno

xtprobit ironsalt friend pair if treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_ame1

/*
. xtprobit ironsalt friend pair if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood = -713.77785  
Iteration 2:   log pseudolikelihood = -713.75123  
Iteration 3:   log pseudolikelihood = -713.75123  

Fitting full model:

rho =  0.0     log pseudolikelihood = -713.75123
rho =  0.1     log pseudolikelihood = -699.28512
rho =  0.2     log pseudolikelihood = -702.66806

Iteration 0:   log pseudolikelihood = -699.30066  
Iteration 1:   log pseudolikelihood = -698.83307  
Iteration 2:   log pseudolikelihood = -698.81217  
Iteration 3:   log pseudolikelihood = -698.81215  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =       6.16
Log pseudolikelihood  = -698.81215              Prob > chi2       =     0.0460

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .2908402   .1604505     1.81   0.070    -.0236371    .6053174
        pair |   .3462513   .1554056     2.23   0.026     .0416618    .6508407
       _cons |  -1.170889   .0936441   -12.50   0.000    -1.354428     -.98735
-------------+----------------------------------------------------------------
    /lnsig2u |  -2.429086    .530692                     -3.469224   -1.388949
-------------+----------------------------------------------------------------
     sigma_u |   .2968456   .0787668                      .1764687    .4993368
         rho |   .0809814   .0394959                      .0302007    .1995756
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)
dy/dx w.r.t. : friend pair

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .0728167    .041095     1.77   0.076     -.007728    .1533614
        pair |   .0866898   .0403735     2.15   0.032     .0075592    .1658204
------------------------------------------------------------------------------

. eststo salt_ame1

*/

xtprobit ironsalt friend pair mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_ame2

/*
. xtprobit ironsalt friend pair mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control",
>  re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood =  -704.7464  
Iteration 2:   log pseudolikelihood = -704.67657  
Iteration 3:   log pseudolikelihood = -704.67656  

Fitting full model:

rho =  0.0     log pseudolikelihood = -704.67656
rho =  0.1     log pseudolikelihood = -698.58756
rho =  0.2     log pseudolikelihood = -703.03751

Iteration 0:   log pseudolikelihood =   -698.568  
Iteration 1:   log pseudolikelihood = -695.31283  
Iteration 2:   log pseudolikelihood = -695.20844  
Iteration 3:   log pseudolikelihood = -695.20813  
Iteration 4:   log pseudolikelihood = -695.20813  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(12)     =      57.72
Log pseudolikelihood  = -695.20813              Prob > chi2       =     0.0000

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .2666664     .14663     1.82   0.069    -.0207231     .554056
        pair |   .3255795   .1623495     2.01   0.045     .0073803    .6437788
 mean_degree |   .0389521   .0700671     0.56   0.578    -.0983769    .1762811
         age |   .0031456   .0030224     1.04   0.298    -.0027781    .0090694
        edu2 |  -.0143386   .0338847    -0.42   0.672    -.0807515    .0520743
wealth_index |  -.0113385   .0337313    -0.34   0.737    -.0774506    .0547736
      hindu1 |   .0101625   .1714891     0.06   0.953    -.3259499    .3462749
   buddhist1 |   .0929797   .1788887     0.52   0.603    -.2576356    .4435951
     muslim1 |   .0720068   .2236807     0.32   0.748    -.3663994    .5104129
    marathi1 |  -.1327457     .14353    -0.92   0.355    -.4140593     .148568
      hindi1 |   .0907654   .1495358     0.61   0.544    -.2023193    .3838501
       urdu1 |  -.3647846   .1723788    -2.12   0.034    -.7026409   -.0269284
       _cons |  -1.258177   .3662662    -3.44   0.001    -1.976045   -.5403082
-------------+----------------------------------------------------------------
    /lnsig2u |  -2.568266   .5116797                     -3.571139   -1.565392
-------------+----------------------------------------------------------------
     sigma_u |   .2768906   .0708397                      .1677015    .4571719
         rho |   .0712089   .0338416                      .0273545    .1728743
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)
dy/dx w.r.t. : friend pair mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .0667434   .0376045     1.77   0.076    -.0069601    .1404468
        pair |   .0814886   .0423642     1.92   0.054    -.0015438     .164521
 mean_degree |   .0097492   .0172899     0.56   0.573    -.0241384    .0436369
         age |   .0007873   .0007615     1.03   0.301    -.0007052    .0022798
        edu2 |  -.0035888   .0084378    -0.43   0.671    -.0201266    .0129491
wealth_index |  -.0028379   .0083974    -0.34   0.735    -.0192965    .0136207
      hindu1 |   .0025436    .042887     0.06   0.953    -.0815133    .0866004
   buddhist1 |   .0232717   .0444608     0.52   0.601    -.0638699    .1104133
     muslim1 |   .0180224   .0556664     0.32   0.746    -.0910817    .1271265
    marathi1 |  -.0332246   .0364895    -0.91   0.363    -.1047428    .0382935
      hindi1 |   .0227175   .0373887     0.61   0.543     -.050563     .095998
       urdu1 |  -.0913011    .043552    -2.10   0.036    -.1766614   -.0059408
------------------------------------------------------------------------------

*/

xtprobit ironsalt friend pair indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_ame3

/*
. xtprobit ironsalt friend pair indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood =  -587.4382  
Iteration 2:   log pseudolikelihood = -584.74182  
Iteration 3:   log pseudolikelihood = -584.73825  
Iteration 4:   log pseudolikelihood = -584.73825  

Fitting full model:

rho =  0.0     log pseudolikelihood = -584.73825
rho =  0.1     log pseudolikelihood = -560.65642
rho =  0.2     log pseudolikelihood = -561.23315

Iteration 0:   log pseudolikelihood = -560.63421  
Iteration 1:   log pseudolikelihood = -558.76437  
Iteration 2:   log pseudolikelihood =  -558.7412  
Iteration 3:   log pseudolikelihood = -558.74119  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(5)      =     395.19
Log pseudolikelihood  = -558.74119              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
       ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .4072046   .2792525     1.46   0.145    -.1401203    .9545294
           pair |   .8634784   .2279512     3.79   0.000     .4167022    1.310255
       indtreat |   1.823236   .2085226     8.74   0.000     1.414539    2.231933
friend_indtreat |   .0757451   .2462435     0.31   0.758    -.4068833    .5583734
  pair_indtreat |  -1.073562   .2386855    -4.50   0.000    -1.541377   -.6057467
          _cons |  -1.868859   .1844696   -10.13   0.000    -2.230412   -1.507305
----------------+----------------------------------------------------------------
       /lnsig2u |  -1.784514   .4485916                     -2.663738   -.9052907
----------------+----------------------------------------------------------------
        sigma_u |   .4097299   .0919007                      .2639835    .6359436
            rho |   .1437466   .0552142                      .0651473    .2879645
---------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)
dy/dx w.r.t. : friend pair indtreat friend_indtreat pair_indtreat

---------------------------------------------------------------------------------
                |            Delta-method
                |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .0790942   .0553713     1.43   0.153    -.0294315    .1876199
           pair |   .1677195   .0460233     3.64   0.000     .0775155    .2579234
       indtreat |   .3541398   .0407064     8.70   0.000     .2743569    .4339228
friend_indtreat |   .0147125   .0478722     0.31   0.759    -.0791153    .1085403
  pair_indtreat |  -.2085254   .0444687    -4.69   0.000    -.2956825   -.1213683
---------------------------------------------------------------------------------

*/

xtprobit ironsalt friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_ame4

/*
xtprobit ironsalt friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marat
> hi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood = -576.28532  
Iteration 2:   log pseudolikelihood = -573.14473  
Iteration 3:   log pseudolikelihood = -573.12985  
Iteration 4:   log pseudolikelihood = -573.12985  

Fitting full model:

rho =  0.0     log pseudolikelihood = -573.12985
rho =  0.1     log pseudolikelihood =  -558.8885
rho =  0.2     log pseudolikelihood = -560.86974

Iteration 0:   log pseudolikelihood = -558.89783  
Iteration 1:   log pseudolikelihood = -554.62864  
Iteration 2:   log pseudolikelihood = -554.60492  
Iteration 3:   log pseudolikelihood =  -554.6049  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(15)     =     516.23
Log pseudolikelihood  =  -554.6049              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
       ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .3954985   .2744806     1.44   0.150    -.1424736    .9334707
           pair |   .8608765   .2322494     3.71   0.000     .4056761    1.316077
       indtreat |   1.856481   .2160747     8.59   0.000     1.432983     2.27998
friend_indtreat |   .0455564   .2582798     0.18   0.860    -.4606627    .5517755
  pair_indtreat |  -1.109402   .2449357    -4.53   0.000    -1.589467   -.6293367
    mean_degree |   .0500685   .0965932     0.52   0.604    -.1392507    .2393876
            age |   .0014733   .0031786     0.46   0.643    -.0047566    .0077032
           edu2 |  -.0192513   .0407733    -0.47   0.637    -.0991656     .060663
   wealth_index |     .01356   .0326966     0.41   0.678    -.0505242    .0776441
         hindu1 |   .0798545   .1935337     0.41   0.680    -.2994645    .4591735
      buddhist1 |   .1972487   .2182661     0.90   0.366    -.2305449    .6250423
        muslim1 |   .1720526   .2239817     0.77   0.442    -.2669434    .6110487
       marathi1 |  -.2013669    .141684    -1.42   0.155    -.4790625    .0763286
         hindi1 |     .02729   .1642457     0.17   0.868    -.2946257    .3492056
          urdu1 |  -.5707603   .1722102    -3.31   0.001    -.9082862   -.2332345
          _cons |  -1.994494   .5184837    -3.85   0.000    -3.010704   -.9782849
----------------+----------------------------------------------------------------
       /lnsig2u |  -1.862069   .4459202                     -2.736057   -.9880819
----------------+----------------------------------------------------------------
        sigma_u |   .3941457   .0878788                      .2546084    .6101558
            rho |    .134462   .0518971                       .060879    .2712911
---------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)
dy/dx w.r.t. : friend pair indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1
               hindi1 urdu1

---------------------------------------------------------------------------------
                |            Delta-method
                |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
         friend |   .0765344   .0541558     1.41   0.158     -.029609    .1826777
           pair |   .1665914   .0479558     3.47   0.001     .0725998     .260583
       indtreat |   .3592545   .0414523     8.67   0.000     .2780094    .4404996
friend_indtreat |   .0088158   .0500174     0.18   0.860    -.0892166    .1068482
  pair_indtreat |  -.2146844   .0456822    -4.70   0.000      -.30422   -.1251489
    mean_degree |   .0096889   .0183183     0.53   0.597    -.0262143    .0455922
            age |   .0002851   .0006181     0.46   0.645    -.0009264    .0014966
           edu2 |  -.0037254   .0078317    -0.48   0.634    -.0190753    .0116245
   wealth_index |    .002624   .0063487     0.41   0.679    -.0098192    .0150672
         hindu1 |   .0154529   .0373847     0.41   0.679    -.0578198    .0887257
      buddhist1 |   .0381703   .0421028     0.91   0.365    -.0443497    .1206903
        muslim1 |   .0332945   .0429838     0.77   0.439    -.0509522    .1175413
       marathi1 |  -.0389673    .028095    -1.39   0.165    -.0940323    .0160978
         hindi1 |    .005281   .0317357     0.17   0.868    -.0569199    .0674819
          urdu1 |  -.1104499   .0335562    -3.29   0.001    -.1762188    -.044681
---------------------------------------------------------------------------------

*/

esttab salt_ame1 salt_ame2 salt_ame3 salt_ame4 using 2020-11-18_salt.tex, se label replace

esttab coup_ame1 coup_ame2 coup_ame3 coup_ame4 salt_ame1 salt_ame2 salt_ame3 salt_ame4 using 2020-11-18_long.tex, se label replace


*Contrasts for friend vs. pair for the 8 models above:
*drop if treat == 1
*Estimating pairwise comparison of marginal effects between friend and pair:
*encode treat_character, gen(factor_treat)


xtprobit coupon1 b4.tfactor if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*
xtprobit coupon1 b4.tfactor if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -530.81019  
Iteration 2:   log pseudolikelihood =  -530.8061  
Iteration 3:   log pseudolikelihood =  -530.8061  

Fitting full model:

rho =  0.0     log pseudolikelihood =  -530.8061
rho =  0.1     log pseudolikelihood = -536.41156

Iteration 0:   log pseudolikelihood = -536.40286  
Iteration 1:   log pseudolikelihood = -531.77969  
Iteration 2:   log pseudolikelihood = -530.93902  
Iteration 3:   log pseudolikelihood =  -530.8136  
Iteration 4:   log pseudolikelihood = -530.79882  
Iteration 5:   log pseudolikelihood = -530.79717  
Iteration 6:   log pseudolikelihood = -530.79711  
Iteration 7:   log pseudolikelihood = -530.79711  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =       8.05
Log pseudolikelihood  = -530.79711              Prob > chi2       =     0.0179

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |   .2360702   .0857765     2.75   0.006     .0679515     .404189
       pair  |   .1133504   .1332091     0.85   0.395    -.1477347    .3744356
             |
       _cons |  -1.333939   .0755754   -17.65   0.000    -1.482064   -1.185813
-------------+----------------------------------------------------------------
    /lnsig2u |  -6.220372   7.260338                     -20.45037    8.009628
-------------+----------------------------------------------------------------
     sigma_u |   .0445927   .1618789                      .0000362    54.86163
         rho |   .0019846     .01438                      1.31e-09    .9996679
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of adjusted predictions    Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |  -.0250184   .0221198    -1.13   0.258
random vs friend  |  -.0450399   .0152548    -2.95   0.003
  random vs pair  |  -.0200215   .0242039    -0.83   0.408
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |  -.0250184   .0221198     -.0683725    .0183356
random vs friend  |  -.0450399   .0152548     -.0749389    -.015141
  random vs pair  |  -.0200215   .0242039     -.0674602    .0274173
-------------------------------------------------------------------

*/


xtprobit coupon1 b4.tfactor mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*
xtprobit coupon1 b4.tfactor mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -527.05324  
Iteration 2:   log pseudolikelihood = -527.03263  
Iteration 3:   log pseudolikelihood = -527.03263  

Fitting full model:

rho =  0.0     log pseudolikelihood = -527.03263
rho =  0.1     log pseudolikelihood = -532.84918

Iteration 0:   log pseudolikelihood = -532.83663  
Iteration 1:   log pseudolikelihood = -528.03599  
Iteration 2:   log pseudolikelihood = -527.20731  
Iteration 3:   log pseudolikelihood = -527.05788  
Iteration 4:   log pseudolikelihood = -527.03018  
Iteration 5:   log pseudolikelihood = -527.02658  
Iteration 6:   log pseudolikelihood = -527.02638  
Iteration 7:   log pseudolikelihood = -527.02638  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(12)     =      27.58
Log pseudolikelihood  = -527.02638              Prob > chi2       =     0.0064

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |   .2407527   .0887357     2.71   0.007     .0668338    .4146715
       pair  |   .1011429   .1370469     0.74   0.461    -.1674641      .36975
             |
 mean_degree |   -.020829   .0503598    -0.41   0.679    -.1195325    .0778744
         age |   .0039655   .0036433     1.09   0.276    -.0031753    .0111062
        edu2 |   .0288172   .0402776     0.72   0.474    -.0501255    .1077599
wealth_index |  -.0582426   .0359281    -1.62   0.105    -.1286604    .0121752
      hindu1 |   .0304326   .2824231     0.11   0.914    -.5231064    .5839717
   buddhist1 |   .0786632   .2738212     0.29   0.774    -.4580164    .6153428
     muslim1 |   .2610866   .3684495     0.71   0.479    -.4610612    .9832344
    marathi1 |   .0641171   .1479836     0.43   0.665    -.2259255    .3541597
      hindi1 |   .1011489   .1902456     0.53   0.595    -.2717255    .4740234
       urdu1 |  -.2727188   .2634275    -1.04   0.301    -.7890272    .2435897
       _cons |  -1.479483   .3913297    -3.78   0.000    -2.246475   -.7124913
-------------+----------------------------------------------------------------
    /lnsig2u |  -6.384755    8.66774                     -23.37321     10.6037
-------------+----------------------------------------------------------------
     sigma_u |   .0410741   .1780098                      8.41e-06    200.7081
         rho |   .0016842    .014574                      7.07e-11    .9999752
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |  -.0282095   .0226272    -1.25   0.213
random vs friend  |  -.0458758   .0156694    -2.93   0.003
  random vs pair  |  -.0176663   .0245123    -0.72   0.471
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |  -.0282095   .0226272      -.072558    .0161389
random vs friend  |  -.0458758   .0156694     -.0765873   -.0151643
  random vs pair  |  -.0176663   .0245123     -.0657095     .030377
-------------------------------------------------------------------

*/


xtprobit coupon1 b4.tfactor indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*

xtprobit coupon1 b4.tfactor indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -353.86041  
Iteration 2:   log pseudolikelihood = -344.64302  
Iteration 3:   log pseudolikelihood = -344.35988  
Iteration 4:   log pseudolikelihood =   -344.358  
Iteration 5:   log pseudolikelihood =   -344.358  

Fitting full model:

rho =  0.0     log pseudolikelihood =   -344.358
rho =  0.1     log pseudolikelihood = -344.21313
rho =  0.2     log pseudolikelihood = -347.89518

Iteration 0:   log pseudolikelihood = -344.21097  
Iteration 1:   log pseudolikelihood = -342.89397  
Iteration 2:   log pseudolikelihood = -342.80565  
Iteration 3:   log pseudolikelihood = -342.80493  
Iteration 4:   log pseudolikelihood = -342.80493  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(5)      =     439.66
Log pseudolikelihood  = -342.80493              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
        coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
        tfactor |
        friend  |   .5620303   .2613509     2.15   0.032      .049792    1.074269
          pair  |   1.084697   .2685373     4.04   0.000     .5583739    1.611021
                |
       indtreat |   2.471164   .2967983     8.33   0.000      1.88945    3.052878
friend_indtreat |  -.0822416   .3191428    -0.26   0.797      -.70775    .5432667
  pair_indtreat |   -1.44121    .315878    -4.56   0.000     -2.06032   -.8221007
          _cons |  -2.622611   .2372652   -11.05   0.000    -3.087643    -2.15758
----------------+----------------------------------------------------------------
       /lnsig2u |  -3.129692   .6169506                     -4.338893   -1.920491
----------------+----------------------------------------------------------------
        sigma_u |   .2091202   .0645084                      .1142408    .3827988
            rho |    .041899   .0247665                      .0128828    .1278068
---------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |    .066595   .0248765     2.68   0.007
random vs friend  |  -.0473168   .0199045    -2.38   0.017
  random vs pair  |  -.1139119   .0252992    -4.50   0.000
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |    .066595   .0248765      .0178381     .115352
random vs friend  |  -.0473168   .0199045      -.086329   -.0083046
  random vs pair  |  -.1139119   .0252992     -.1634974   -.0643263
-------------------------------------------------------------------


*/

xtprobit coupon1 b4.tfactor indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*
xtprobit coupon1 b4.tfactor indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi
> 1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -533.40227  
Iteration 1:   log pseudolikelihood = -350.50392  
Iteration 2:   log pseudolikelihood = -339.98227  
Iteration 3:   log pseudolikelihood = -339.65531  
Iteration 4:   log pseudolikelihood = -339.65307  
Iteration 5:   log pseudolikelihood = -339.65307  

Fitting full model:

rho =  0.0     log pseudolikelihood = -339.65307
rho =  0.1     log pseudolikelihood = -340.06718

Iteration 0:   log pseudolikelihood = -340.06384  
Iteration 1:   log pseudolikelihood = -338.48304  
Iteration 2:   log pseudolikelihood = -338.37761  
Iteration 3:   log pseudolikelihood = -338.37653  
Iteration 4:   log pseudolikelihood = -338.37653  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(15)     =     875.68
Log pseudolikelihood  = -338.37653              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
        coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
        tfactor |
        friend  |   .6148396   .2576197     2.39   0.017     .1099142    1.119765
          pair  |   1.113715   .2638067     4.22   0.000     .5966634    1.630767
                |
       indtreat |   2.520329   .2847091     8.85   0.000      1.96231    3.078349
friend_indtreat |  -.1055977   .3095692    -0.34   0.733    -.7123421    .5011468
  pair_indtreat |  -1.486254   .3026158    -4.91   0.000     -2.07937   -.8931379
    mean_degree |  -.0696654   .0852128    -0.82   0.414    -.2366795    .0973486
            age |   .0014224   .0038369     0.37   0.711    -.0060977    .0089426
           edu2 |   .0375564   .0536827     0.70   0.484    -.0676599    .1427726
   wealth_index |  -.0500245   .0424595    -1.18   0.239    -.1332436    .0331946
         hindu1 |    .353629   .3108005     1.14   0.255    -.2555288    .9627868
      buddhist1 |   .4662442   .2746607     1.70   0.090    -.0720809    1.004569
        muslim1 |   .8379399   .4120918     2.03   0.042     .0302548    1.645625
       marathi1 |   .1063664    .178629     0.60   0.552      -.24374    .4564728
         hindi1 |   .0708904   .2246416     0.32   0.752    -.3693991    .5111799
          urdu1 |  -.4929953   .2459782    -2.00   0.045    -.9751037    -.010887
          _cons |  -2.986577   .5179564    -5.77   0.000    -4.001752   -1.971401
----------------+----------------------------------------------------------------
       /lnsig2u |   -3.18608   .6801148                      -4.51908   -1.853079
----------------+----------------------------------------------------------------
        sigma_u |   .2033066   .0691359                      .1043985    .3959214
            rho |   .0396929   .0259242                      .0107815    .1355118
---------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0629871   .0241541     2.61   0.009
random vs friend  |  -.0511523   .0193096    -2.65   0.008
  random vs pair  |  -.1141394   .0242327    -4.71   0.000
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0629871   .0241541      .0156459    .1103283
random vs friend  |  -.0511523   .0193096     -.0889983   -.0133062
  random vs pair  |  -.1141394   .0242327     -.1616346   -.0666441
-------------------------------------------------------------------

*/


xtprobit ironsalt b4.tfactor if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*

xtprobit ironsalt b4.tfactor if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood = -713.77785  
Iteration 2:   log pseudolikelihood = -713.75123  
Iteration 3:   log pseudolikelihood = -713.75123  

Fitting full model:

rho =  0.0     log pseudolikelihood = -713.75123
rho =  0.1     log pseudolikelihood = -699.28512
rho =  0.2     log pseudolikelihood = -702.66806

Iteration 0:   log pseudolikelihood = -699.30066  
Iteration 1:   log pseudolikelihood = -698.83307  
Iteration 2:   log pseudolikelihood = -698.81217  
Iteration 3:   log pseudolikelihood = -698.81215  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =       6.16
Log pseudolikelihood  = -698.81215              Prob > chi2       =     0.0460

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |   .2908402   .1604505     1.81   0.070    -.0236371    .6053174
       pair  |   .3462513   .1554056     2.23   0.026     .0416618    .6508407
             |
       _cons |  -1.170889   .0936441   -12.50   0.000    -1.354428     -.98735
-------------+----------------------------------------------------------------
    /lnsig2u |  -2.429086    .530692                     -3.469224   -1.388949
-------------+----------------------------------------------------------------
     sigma_u |   .2968456   .0787668                      .1764687    .4993368
         rho |   .0809814   .0394959                      .0302007    .1995756
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of adjusted predictions    Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0151765   .0492245     0.31   0.758
random vs friend  |  -.0685993    .039453    -1.74   0.082
  random vs pair  |  -.0837758   .0398061    -2.10   0.035
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0151765   .0492245     -.0813018    .1116548
random vs friend  |  -.0685993    .039453     -.1459258    .0087271
  random vs pair  |  -.0837758   .0398061     -.1617943   -.0057574
-------------------------------------------------------------------


*/


xtprobit ironsalt b4.tfactor mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*

xtprobit ironsalt b4.tfactor mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", 
> re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood =  -704.7464  
Iteration 2:   log pseudolikelihood = -704.67657  
Iteration 3:   log pseudolikelihood = -704.67656  

Fitting full model:

rho =  0.0     log pseudolikelihood = -704.67656
rho =  0.1     log pseudolikelihood = -698.58756
rho =  0.2     log pseudolikelihood = -703.03751

Iteration 0:   log pseudolikelihood =   -698.568  
Iteration 1:   log pseudolikelihood = -695.31283  
Iteration 2:   log pseudolikelihood = -695.20844  
Iteration 3:   log pseudolikelihood = -695.20813  
Iteration 4:   log pseudolikelihood = -695.20813  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(12)     =      57.72
Log pseudolikelihood  = -695.20813              Prob > chi2       =     0.0000

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |   .2666664     .14663     1.82   0.069    -.0207231     .554056
       pair  |   .3255795   .1623495     2.01   0.045     .0073803    .6437788
             |
 mean_degree |   .0389521   .0700671     0.56   0.578    -.0983769    .1762811
         age |   .0031456   .0030224     1.04   0.298    -.0027781    .0090694
        edu2 |  -.0143386   .0338847    -0.42   0.672    -.0807515    .0520743
wealth_index |  -.0113385   .0337313    -0.34   0.737    -.0774506    .0547736
      hindu1 |   .0101625   .1714891     0.06   0.953    -.3259499    .3462749
   buddhist1 |   .0929797   .1788887     0.52   0.603    -.2576356    .4435951
     muslim1 |   .0720068   .2236807     0.32   0.748    -.3663994    .5104129
    marathi1 |  -.1327457     .14353    -0.92   0.355    -.4140593     .148568
      hindi1 |   .0907654   .1495358     0.61   0.544    -.2023193    .3838501
       urdu1 |  -.3647846   .1723788    -2.12   0.034    -.7026409   -.0269284
       _cons |  -1.258177   .3662662    -3.44   0.001    -1.976045   -.5403082
-------------+----------------------------------------------------------------
    /lnsig2u |  -2.568266   .5116797                     -3.571139   -1.565392
-------------+----------------------------------------------------------------
     sigma_u |   .2768906   .0708397                      .1677015    .4571719
         rho |   .0712089   .0338416                      .0273545    .1728743
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0160352   .0484139     0.33   0.740
random vs friend  |   -.063052   .0360098    -1.75   0.080
  random vs pair  |  -.0790872     .04206    -1.88   0.060
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0160352   .0484139     -.0788543    .1109247
random vs friend  |   -.063052   .0360098     -.1336299     .007526
  random vs pair  |  -.0790872     .04206     -.1615232    .0033488
-------------------------------------------------------------------



*/

xtprobit ironsalt b4.tfactor indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*

xtprobit ironsalt b4.tfactor indtreat friend_indtreat pair_indtreat if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood =  -587.4382  
Iteration 2:   log pseudolikelihood = -584.74182  
Iteration 3:   log pseudolikelihood = -584.73825  
Iteration 4:   log pseudolikelihood = -584.73825  

Fitting full model:

rho =  0.0     log pseudolikelihood = -584.73825
rho =  0.1     log pseudolikelihood = -560.65642
rho =  0.2     log pseudolikelihood = -561.23315

Iteration 0:   log pseudolikelihood = -560.63421  
Iteration 1:   log pseudolikelihood = -558.76437  
Iteration 2:   log pseudolikelihood =  -558.7412  
Iteration 3:   log pseudolikelihood = -558.74119  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(5)      =     395.19
Log pseudolikelihood  = -558.74119              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
       ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
        tfactor |
        friend  |   .4072046   .2792525     1.46   0.145    -.1401203    .9545294
          pair  |   .8634784   .2279512     3.79   0.000     .4167022    1.310255
                |
       indtreat |   1.823236   .2085226     8.74   0.000     1.414539    2.231933
friend_indtreat |   .0757451   .2462435     0.31   0.758    -.4068833    .5583734
  pair_indtreat |  -1.073562   .2386855    -4.50   0.000    -1.541377   -.6057467
          _cons |  -1.868859   .1844696   -10.13   0.000    -2.230412   -1.507305
----------------+----------------------------------------------------------------
       /lnsig2u |  -1.784514   .4485916                     -2.663738   -.9052907
----------------+----------------------------------------------------------------
        sigma_u |   .4097299   .0919007                      .2639835    .6359436
            rho |   .1437466   .0552142                      .0651473    .2879645
---------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |    .098648   .0504977     1.95   0.051
random vs friend  |  -.0627458   .0448153    -1.40   0.161
  random vs pair  |  -.1613938   .0410283    -3.93   0.000
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |    .098648   .0504977     -.0003257    .1976217
random vs friend  |  -.0627458   .0448153     -.1505822    .0250906
  random vs pair  |  -.1613938   .0410283     -.2418078   -.0809798
-------------------------------------------------------------------


*/


xtprobit ironsalt b4.tfactor indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*

xtprobit ironsalt b4.tfactor indtreat friend_indtreat pair_indtreat mean_degree age edu2 wealth_index hindu1 buddhist1 muslim1 marathi1 hindi1 urdu1 if treat != "control", re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -722.60636  
Iteration 1:   log pseudolikelihood = -576.28532  
Iteration 2:   log pseudolikelihood = -573.14473  
Iteration 3:   log pseudolikelihood = -573.12985  
Iteration 4:   log pseudolikelihood = -573.12985  

Fitting full model:

rho =  0.0     log pseudolikelihood = -573.12985
rho =  0.1     log pseudolikelihood =  -558.8885
rho =  0.2     log pseudolikelihood = -560.86974

Iteration 0:   log pseudolikelihood = -558.89783  
Iteration 1:   log pseudolikelihood = -554.62864  
Iteration 2:   log pseudolikelihood = -554.60492  
Iteration 3:   log pseudolikelihood =  -554.6049  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,510
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         16
                                                              avg =       50.3
                                                              max =         68

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(15)     =     516.23
Log pseudolikelihood  =  -554.6049              Prob > chi2       =     0.0000

                                  (Std. Err. adjusted for 30 clusters in chawlno)
---------------------------------------------------------------------------------
                |               Robust
       ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------+----------------------------------------------------------------
        tfactor |
        friend  |   .3954985   .2744806     1.44   0.150    -.1424736    .9334707
          pair  |   .8608765   .2322494     3.71   0.000     .4056761    1.316077
                |
       indtreat |   1.856481   .2160747     8.59   0.000     1.432983     2.27998
friend_indtreat |   .0455564   .2582798     0.18   0.860    -.4606627    .5517755
  pair_indtreat |  -1.109402   .2449357    -4.53   0.000    -1.589467   -.6293367
    mean_degree |   .0500685   .0965932     0.52   0.604    -.1392507    .2393876
            age |   .0014733   .0031786     0.46   0.643    -.0047566    .0077032
           edu2 |  -.0192513   .0407733    -0.47   0.637    -.0991656     .060663
   wealth_index |     .01356   .0326966     0.41   0.678    -.0505242    .0776441
         hindu1 |   .0798545   .1935337     0.41   0.680    -.2994645    .4591735
      buddhist1 |   .1972487   .2182661     0.90   0.366    -.2305449    .6250423
        muslim1 |   .1720526   .2239817     0.77   0.442    -.2669434    .6110487
       marathi1 |  -.2013669    .141684    -1.42   0.155    -.4790625    .0763286
         hindi1 |     .02729   .1642457     0.17   0.868    -.2946257    .3492056
          urdu1 |  -.5707603   .1722102    -3.31   0.001    -.9082862   -.2332345
          _cons |  -1.994494   .5184837    -3.85   0.000    -3.010704   -.9782849
----------------+----------------------------------------------------------------
       /lnsig2u |  -1.862069   .4459202                     -2.736057   -.9880819
----------------+----------------------------------------------------------------
        sigma_u |   .3941457   .0878788                      .2546084    .6101558
            rho |    .134462   .0518971                       .060879    .2712911
---------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,510
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0999807   .0515341     1.94   0.052
random vs friend  |   -.060654   .0435837    -1.39   0.164
  random vs pair  |  -.1606346   .0434583    -3.70   0.000
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0999807   .0515341     -.0010243    .2009857
random vs friend  |   -.060654   .0435837     -.1460765    .0247686
  random vs pair  |  -.1606346   .0434583     -.2458113    -.075458
-------------------------------------------------------------------


*/


**Effect on treated and untreated (ATT, ATU)

*ATT

*One or more coupon redeemed

xtset chawlno

xtprobit coupon1 friend pair if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_atu1

/*
xtprobit coupon1 friend pair if treat != "control" & indtreat == 0, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -172.84307  
Iteration 1:   log pseudolikelihood = -159.14523  
Iteration 2:   log pseudolikelihood = -157.91897  
Iteration 3:   log pseudolikelihood = -157.90233  
Iteration 4:   log pseudolikelihood = -157.90231  
Iteration 5:   log pseudolikelihood = -157.90231  

Fitting full model:

rho =  0.0     log pseudolikelihood = -157.90231
rho =  0.1     log pseudolikelihood = -157.87629
rho =  0.2     log pseudolikelihood = -159.71974

Iteration 0:   log pseudolikelihood = -157.87503  
Iteration 1:   log pseudolikelihood = -157.21041  
Iteration 2:   log pseudolikelihood = -157.17556  
Iteration 3:   log pseudolikelihood = -157.17533  
Iteration 4:   log pseudolikelihood = -157.17533  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =      18.30
Log pseudolikelihood  = -157.17533              Prob > chi2       =     0.0001

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .5768917   .2637535     2.19   0.029     .0599443    1.093839
        pair |   1.104186   .2710101     4.07   0.000     .5730163    1.635356
       _cons |   -2.63962    .244743   -10.79   0.000    -3.119308   -2.159933
-------------+----------------------------------------------------------------
    /lnsig2u |  -2.955733    .868861                     -4.658669   -1.252797
-------------+----------------------------------------------------------------
     sigma_u |   .2281239    .099104                      .0973605    .5345135
         rho |   .0494663   .0408533                      .0093901    .2222164
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |    .037007   .0175239     2.11   0.035     .0026609    .0713532
        pair |   .0708324   .0228931     3.09   0.002     .0259628     .115702
------------------------------------------------------------------------------

*/

xtprobit coupon1 friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_atu2

/*
xtprobit coupon1 friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 0, 
> re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -172.84307  
Iteration 1:   log pseudolikelihood = -154.56771  
Iteration 2:   log pseudolikelihood = -152.60156  
Iteration 3:   log pseudolikelihood = -152.55654  
Iteration 4:   log pseudolikelihood = -152.55653  

Fitting full model:

rho =  0.0     log pseudolikelihood = -152.55653
rho =  0.1     log pseudolikelihood = -153.98415

Iteration 0:   log pseudolikelihood = -153.98308  
Iteration 1:   log pseudolikelihood = -152.76391  
Iteration 2:   log pseudolikelihood = -152.55602  
Iteration 3:   log pseudolikelihood = -152.52152  
Iteration 4:   log pseudolikelihood = -152.51847  
Iteration 5:   log pseudolikelihood = -152.51845  
Iteration 6:   log pseudolikelihood = -152.51845  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(10)     =      92.25
Log pseudolikelihood  = -152.51845              Prob > chi2       =     0.0000

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .6798689   .2569656     2.65   0.008     .1762255    1.183512
        pair |   1.185597   .2593661     4.57   0.000     .6772487    1.693945
 mean_degree |  -.1148896   .1273774    -0.90   0.367    -.3645447    .1347655
         age |  -.0052012   .0063154    -0.82   0.410    -.0175792    .0071767
        edu2 |   .0899533   .0590071     1.52   0.127    -.0256984     .205605
wealth_index |  -.0394583   .0556222    -0.71   0.478    -.1484758    .0695591
      hindu1 |  -.1389006   .1382915    -1.00   0.315    -.4099469    .1321458
     muslim1 |   .3818184   .1895611     2.01   0.044     .0102855    .7533514
    marathi1 |   .2982261   .1770473     1.68   0.092    -.0487803    .6452324
      hindi1 |   .3480608   .2089763     1.67   0.096    -.0615253    .7576468
       _cons |  -2.510297   .5438822    -4.62   0.000    -3.576287   -1.444308
-------------+----------------------------------------------------------------
    /lnsig2u |  -4.499923   2.975948                     -10.33267    1.332828
-------------+----------------------------------------------------------------
     sigma_u |   .1054033   .1568374                      .0057054    1.947242
         rho |   .0109878   .0323398                      .0000326     .791308
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .0432092   .0170379     2.54   0.011     .0098155     .076603
        pair |   .0753509    .021409     3.52   0.000     .0333901    .1173117
 mean_degree |  -.0073018   .0081612    -0.89   0.371    -.0232974    .0086938
         age |  -.0003306   .0004069    -0.81   0.417     -.001128    .0004669
        edu2 |    .005717   .0038085     1.50   0.133    -.0017476    .0131816
wealth_index |  -.0025078   .0034444    -0.73   0.467    -.0092586    .0042431
      hindu1 |  -.0088279   .0083285    -1.06   0.289    -.0251514    .0074957
     muslim1 |   .0242666   .0117287     2.07   0.039     .0012788    .0472544
    marathi1 |   .0189538     .01197     1.58   0.113    -.0045069    .0424146
      hindi1 |   .0221211   .0143194     1.54   0.122    -.0059445    .0501867
------------------------------------------------------------------------------

*/

esttab coup_atu1 coup_atu2 using 2020-11-18_coup_atu.tex, se label replace


*Purchased in the past 4 months.

xtset chawlno

xtprobit ironsalt friend pair if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_atu1

/*
xtprobit ironsalt friend pair if treat != "control" & indtreat == 0, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -416.69495  
Iteration 1:   log pseudolikelihood = -395.89492  
Iteration 2:   log pseudolikelihood = -395.36453  
Iteration 3:   log pseudolikelihood = -395.36316  
Iteration 4:   log pseudolikelihood = -395.36316  

Fitting full model:

rho =  0.0     log pseudolikelihood = -395.36316
rho =  0.1     log pseudolikelihood = -376.29892
rho =  0.2     log pseudolikelihood = -375.80826
rho =  0.3     log pseudolikelihood = -376.96117

Iteration 0:   log pseudolikelihood = -375.63315  
Iteration 1:   log pseudolikelihood = -374.52188  
Iteration 2:   log pseudolikelihood = -374.23879  
Iteration 3:   log pseudolikelihood = -374.23785  
Iteration 4:   log pseudolikelihood = -374.23785  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =      15.59
Log pseudolikelihood  = -374.23785              Prob > chi2       =     0.0004

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |    .439654   .2991831     1.47   0.142    -.1467341    1.026042
        pair |   .9147102   .2428158     3.77   0.000     .4387999     1.39062
       _cons |  -1.919155   .2108189    -9.10   0.000    -2.332352   -1.505957
-------------+----------------------------------------------------------------
    /lnsig2u |  -1.590361   .4757758                     -2.522865   -.6578578
-------------+----------------------------------------------------------------
     sigma_u |   .4514997   .1074063                       .283248    .7196942
         rho |   .1693331   .0669223                      .0742708     .341221
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)
dy/dx w.r.t. : friend pair

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .0680789   .0481171     1.41   0.157    -.0262288    .1623866
        pair |   .1416397   .0395121     3.58   0.000     .0641974    .2190819
------------------------------------------------------------------------------

*/

xtprobit ironsalt friend pair mean_degree age edu2 wealth_index hindu1  muslim1 marathi1 hindi1  if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_atu2

/*
xtprobit ironsalt friend pair mean_degree age edu2 wealth_index hindu1  muslim1 marathi1 hindi1  if treat != "control" & indtreat ==  0, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -416.69495  
Iteration 1:   log pseudolikelihood = -386.31887  
Iteration 2:   log pseudolikelihood = -385.41449  
Iteration 3:   log pseudolikelihood = -385.41138  
Iteration 4:   log pseudolikelihood = -385.41138  

Fitting full model:

rho =  0.0     log pseudolikelihood = -385.41138
rho =  0.1     log pseudolikelihood = -373.73702
rho =  0.2     log pseudolikelihood = -374.52941

Iteration 0:   log pseudolikelihood = -373.74045  
Iteration 1:   log pseudolikelihood = -371.10723  
Iteration 2:   log pseudolikelihood = -371.06844  
Iteration 3:   log pseudolikelihood = -371.06836  
Iteration 4:   log pseudolikelihood = -371.06836  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(10)     =      36.44
Log pseudolikelihood  = -371.06836              Prob > chi2       =     0.0001

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .3989782   .2912537     1.37   0.171    -.1718686     .969825
        pair |   .8816286   .2416866     3.65   0.000     .4079315    1.355326
 mean_degree |   .0846843   .1322301     0.64   0.522    -.1744819    .3438505
         age |   .0006984   .0038257     0.18   0.855    -.0067998    .0081967
        edu2 |   .0017102   .0469516     0.04   0.971    -.0903133    .0937337
wealth_index |   .0171532   .0315782     0.54   0.587    -.0447389    .0790452
      hindu1 |  -.1639708    .125893    -1.30   0.193    -.4107165    .0827749
     muslim1 |  -.3827464   .2791143    -1.37   0.170    -.9298004    .1643077
    marathi1 |   -.253821   .1297969    -1.96   0.051    -.5082182    .0005762
      hindi1 |   .1755642   .1471083     1.19   0.233    -.1127629    .4638913
       _cons |  -1.888383   .5344261    -3.53   0.000    -2.935839   -.8409266
-------------+----------------------------------------------------------------
    /lnsig2u |  -1.732313   .4714215                     -2.656282    -.808344
-------------+----------------------------------------------------------------
     sigma_u |   .4205648   .0991317                      .2649693    .6675293
         rho |   .1502919   .0602025                      .0656028    .3082435
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)
dy/dx w.r.t. : friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .0617498   .0463883     1.33   0.183    -.0291696    .1526692
        pair |   .1364495   .0403172     3.38   0.001     .0574293    .2154697
 mean_degree |   .0131066   .0198962     0.66   0.510    -.0258892    .0521023
         age |   .0001081   .0005937     0.18   0.856    -.0010555    .0012717
        edu2 |   .0002647   .0072686     0.04   0.971    -.0139816    .0145109
wealth_index |   .0026548   .0049153     0.54   0.589    -.0069791    .0122887
      hindu1 |  -.0253777   .0190394    -1.33   0.183    -.0626943    .0119388
     muslim1 |  -.0592376   .0439028    -1.35   0.177    -.1452855    .0268103
    marathi1 |  -.0392838   .0202501    -1.94   0.052    -.0789732    .0004056
      hindi1 |    .027172   .0233677     1.16   0.245    -.0186277    .0729718
------------------------------------------------------------------------------

*/



esttab coup_atu1 coup_atu2 salt_atu1 salt_atu2 using 2020-11-18_atu.tex, se label replace

*Pairwise, ATU

xtset chawlno

xtprobit coupon1 b4.tfactor if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*
xtprobit coupon1 b4.tfactor if treat != "control" & indtreat == 0, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -172.84307  
Iteration 1:   log pseudolikelihood = -159.14523  
Iteration 2:   log pseudolikelihood = -157.91897  
Iteration 3:   log pseudolikelihood = -157.90233  
Iteration 4:   log pseudolikelihood = -157.90231  
Iteration 5:   log pseudolikelihood = -157.90231  

Fitting full model:

rho =  0.0     log pseudolikelihood = -157.90231
rho =  0.1     log pseudolikelihood = -157.87629
rho =  0.2     log pseudolikelihood = -159.71974

Iteration 0:   log pseudolikelihood = -157.87503  
Iteration 1:   log pseudolikelihood = -157.21041  
Iteration 2:   log pseudolikelihood = -157.17556  
Iteration 3:   log pseudolikelihood = -157.17533  
Iteration 4:   log pseudolikelihood = -157.17533  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =      18.30
Log pseudolikelihood  = -157.17533              Prob > chi2       =     0.0001

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |   .5768917   .2637535     2.19   0.029     .0599443    1.093839
       pair  |   1.104186   .2710101     4.07   0.000     .5730163    1.635356
             |
       _cons |   -2.63962    .244743   -10.79   0.000    -3.119308   -2.159933
-------------+----------------------------------------------------------------
    /lnsig2u |  -2.955733    .868861                     -4.658669   -1.252797
-------------+----------------------------------------------------------------
     sigma_u |   .2281239    .099104                      .0973605    .5345135
         rho |   .0494663   .0408533                      .0093901    .2222164
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of adjusted predictions    Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0450403   .0196483     2.29   0.022
random vs friend  |  -.0171257   .0070626    -2.42   0.015
  random vs pair  |   -.062166   .0186642    -3.33   0.001
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0450403   .0196483      .0065305    .0835502
random vs friend  |  -.0171257   .0070626     -.0309682   -.0032831
  random vs pair  |   -.062166   .0186642     -.0987471   -.0255849
-------------------------------------------------------------------

*/


xtprobit coupon1 b4.tfactor mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*
xtprobit coupon1 b4.tfactor mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 0, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -172.84307  
Iteration 1:   log pseudolikelihood = -154.56771  
Iteration 2:   log pseudolikelihood = -152.60156  
Iteration 3:   log pseudolikelihood = -152.55654  
Iteration 4:   log pseudolikelihood = -152.55653  

Fitting full model:

rho =  0.0     log pseudolikelihood = -152.55653
rho =  0.1     log pseudolikelihood = -153.98415

Iteration 0:   log pseudolikelihood = -153.98308  
Iteration 1:   log pseudolikelihood = -152.76391  
Iteration 2:   log pseudolikelihood = -152.55602  
Iteration 3:   log pseudolikelihood = -152.52152  
Iteration 4:   log pseudolikelihood = -152.51847  
Iteration 5:   log pseudolikelihood = -152.51845  
Iteration 6:   log pseudolikelihood = -152.51845  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(10)     =      92.25
Log pseudolikelihood  = -152.51845              Prob > chi2       =     0.0000

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |   .6798689   .2569656     2.65   0.008     .1762255    1.183512
       pair  |   1.185597   .2593661     4.57   0.000     .6772487    1.693945
             |
 mean_degree |  -.1148896   .1273774    -0.90   0.367    -.3645447    .1347655
         age |  -.0052012   .0063154    -0.82   0.410    -.0175792    .0071767
        edu2 |   .0899533   .0590071     1.52   0.127    -.0256984     .205605
wealth_index |  -.0394583   .0556222    -0.71   0.478    -.1484758    .0695591
      hindu1 |  -.1389006   .1382915    -1.00   0.315    -.4099469    .1321458
     muslim1 |   .3818184   .1895611     2.01   0.044     .0102855    .7533514
    marathi1 |   .2982261   .1770473     1.68   0.092    -.0487803    .6452324
      hindi1 |   .3480608   .2089763     1.67   0.096    -.0615253    .7576468
       _cons |  -2.510297   .5438822    -4.62   0.000    -3.576287   -1.444308
-------------+----------------------------------------------------------------
    /lnsig2u |  -4.499923   2.975948                     -10.33267    1.332828
-------------+----------------------------------------------------------------
     sigma_u |   .1054033   .1568374                      .0057054    1.947242
         rho |   .0109878   .0323398                      .0000326     .791308
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0439097     .01779     2.47   0.014
random vs friend  |  -.0195992   .0068999    -2.84   0.005
  random vs pair  |   -.063509   .0168265    -3.77   0.000
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0439097     .01779       .009042    .0787775
random vs friend  |  -.0195992   .0068999     -.0331227   -.0060758
  random vs pair  |   -.063509   .0168265     -.0964884   -.0305296
-------------------------------------------------------------------

*/

xtprobit ironsalt b4.tfactor if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*
xtprobit ironsalt b4.tfactor if treat != "control" & indtreat == 0, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -416.69495  
Iteration 1:   log pseudolikelihood = -395.89492  
Iteration 2:   log pseudolikelihood = -395.36453  
Iteration 3:   log pseudolikelihood = -395.36316  
Iteration 4:   log pseudolikelihood = -395.36316  

Fitting full model:

rho =  0.0     log pseudolikelihood = -395.36316
rho =  0.1     log pseudolikelihood = -376.29892
rho =  0.2     log pseudolikelihood = -375.80826
rho =  0.3     log pseudolikelihood = -376.96117

Iteration 0:   log pseudolikelihood = -375.63315  
Iteration 1:   log pseudolikelihood = -374.52188  
Iteration 2:   log pseudolikelihood = -374.23879  
Iteration 3:   log pseudolikelihood = -374.23785  
Iteration 4:   log pseudolikelihood = -374.23785  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =      15.59
Log pseudolikelihood  = -374.23785              Prob > chi2       =     0.0004

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |    .439654   .2991831     1.47   0.142    -.1467341    1.026042
       pair  |   .9147102   .2428158     3.77   0.000     .4387999     1.39062
             |
       _cons |  -1.919155   .2108189    -9.10   0.000    -2.332352   -1.505957
-------------+----------------------------------------------------------------
    /lnsig2u |  -1.590361   .4757758                     -2.522865   -.6578578
-------------+----------------------------------------------------------------
     sigma_u |   .4514997   .1074063                       .283248    .7196942
         rho |   .1693331   .0669223                      .0742708     .341221
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of adjusted predictions    Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0912151    .043029     2.12   0.034
random vs friend  |  -.0486261   .0355513    -1.37   0.171
  random vs pair  |  -.1398412   .0353531    -3.96   0.000
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0912151    .043029      .0068798    .1755504
random vs friend  |  -.0486261   .0355513     -.1183054    .0210532
  random vs pair  |  -.1398412   .0353531     -.2091321   -.0705504
-------------------------------------------------------------------

*/

xtprobit ironsalt b4.tfactor mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 0, re vce(cluster chawlno)
estpost margins tfactor, pwcompare(ci pv)

/*
xtprobit ironsalt b4.tfactor mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 0, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -416.69495  
Iteration 1:   log pseudolikelihood = -386.31887  
Iteration 2:   log pseudolikelihood = -385.41449  
Iteration 3:   log pseudolikelihood = -385.41138  
Iteration 4:   log pseudolikelihood = -385.41138  

Fitting full model:

rho =  0.0     log pseudolikelihood = -385.41138
rho =  0.1     log pseudolikelihood = -373.73702
rho =  0.2     log pseudolikelihood = -374.52941

Iteration 0:   log pseudolikelihood = -373.74045  
Iteration 1:   log pseudolikelihood = -371.10723  
Iteration 2:   log pseudolikelihood = -371.06844  
Iteration 3:   log pseudolikelihood = -371.06836  
Iteration 4:   log pseudolikelihood = -371.06836  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =      1,226
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =         13
                                                              avg =       40.9
                                                              max =         55

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(10)     =      36.44
Log pseudolikelihood  = -371.06836              Prob > chi2       =     0.0001

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     tfactor |
     friend  |   .3989782   .2912537     1.37   0.171    -.1718686     .969825
       pair  |   .8816286   .2416866     3.65   0.000     .4079315    1.355326
             |
 mean_degree |   .0846843   .1322301     0.64   0.522    -.1744819    .3438505
         age |   .0006984   .0038257     0.18   0.855    -.0067998    .0081967
        edu2 |   .0017102   .0469516     0.04   0.971    -.0903133    .0937337
wealth_index |   .0171532   .0315782     0.54   0.587    -.0447389    .0790452
      hindu1 |  -.1639708    .125893    -1.30   0.193    -.4107165    .0827749
     muslim1 |  -.3827464   .2791143    -1.37   0.170    -.9298004    .1643077
    marathi1 |   -.253821   .1297969    -1.96   0.051    -.5082182    .0005762
      hindi1 |   .1755642   .1471083     1.19   0.233    -.1127629    .4638913
       _cons |  -1.888383   .5344261    -3.53   0.000    -2.935839   -.8409266
-------------+----------------------------------------------------------------
    /lnsig2u |  -1.732313   .4714215                     -2.656282    -.808344
-------------+----------------------------------------------------------------
     sigma_u |   .4205648   .0991317                      .2649693    .6675293
         rho |   .1502919   .0602025                      .0656028    .3082435
------------------------------------------------------------------------------

. estpost margins tfactor, pwcompare(ci pv)

Pairwise comparisons of predictive margins      Number of obs     =      1,226
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

----------------------------------------------------------
                  |            Delta-method    Unadjusted
                  |   Contrast   Std. Err.      z    P>|z|
------------------+---------------------------------------
          tfactor |
  pair vs friend  |   .0914641    .044024     2.08   0.038
random vs friend  |  -.0441997   .0338296    -1.31   0.191
  random vs pair  |  -.1356638   .0376521    -3.60   0.000
----------------------------------------------------------

-------------------------------------------------------------------
                  |            Delta-method         Unadjusted
                  |   Contrast   Std. Err.     [95% Conf. Interval]
------------------+------------------------------------------------
          tfactor |
  pair vs friend  |   .0914641    .044024      .0051786    .1777496
random vs friend  |  -.0441997   .0338296     -.1105045    .0221051
  random vs pair  |  -.1356638   .0376521     -.2094606   -.0618669
-------------------------------------------------------------------

*/

*ATT

*One or more coupon redeemed

xtset chawlno

xtprobit coupon1 friend pair if treat != "control" & indtreat == 1, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_att1

/*
xtprobit coupon1 friend pair if treat != "control" & indtreat == 1, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -196.14899  
Iteration 1:   log pseudolikelihood = -186.46289  
Iteration 2:   log pseudolikelihood = -186.45569  
Iteration 3:   log pseudolikelihood = -186.45569  

Fitting full model:

rho =  0.0     log pseudolikelihood = -186.45569
rho =  0.1     log pseudolikelihood = -188.00919

Iteration 0:   log pseudolikelihood = -188.00919  
Iteration 1:   log pseudolikelihood = -186.54542  
Iteration 2:   log pseudolikelihood = -186.47537  
Iteration 3:   log pseudolikelihood = -186.46017  
Iteration 4:   log pseudolikelihood = -186.45676  
Iteration 5:   log pseudolikelihood = -186.45595  
Iteration 6:   log pseudolikelihood = -186.45574  
Iteration 7:   log pseudolikelihood =  -186.4557  
Iteration 8:   log pseudolikelihood =  -186.4557  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =        284
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =          3
                                                              avg =        9.5
                                                              max =         14

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(2)      =      27.64
Log pseudolikelihood  =  -186.4557              Prob > chi2       =     0.0000

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .4797843   .1777485     2.70   0.007     .1314036     .828165
        pair |  -.3439925   .2098944    -1.64   0.101    -.7553781     .067393
       _cons |  -.1509822   .1514554    -1.00   0.319    -.4478294     .145865
-------------+----------------------------------------------------------------
    /lnsig2u |  -13.84179   58215.54                     -114114.2    114086.5
-------------+----------------------------------------------------------------
     sigma_u |   .0009869   28.72774                             0           .
         rho |   9.74e-07   .0567052                             0           .
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =        284
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |    .180442   .0673964     2.68   0.007     .0483476    .3125365
        pair |  -.1293721   .0771993    -1.68   0.094      -.28068    .0219358
------------------------------------------------------------------------------

. eststo coup_att1

*/

xtprobit coupon1 friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 1, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_att2

/*
xtprobit coupon1 friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1 if treat != "control" & indtreat == 1, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood = -196.14899  
Iteration 1:   log pseudolikelihood =  -184.4709  
Iteration 2:   log pseudolikelihood = -184.44233  
Iteration 3:   log pseudolikelihood = -184.44233  

Fitting full model:

rho =  0.0     log pseudolikelihood = -184.44233
rho =  0.1     log pseudolikelihood =  -186.0393

Iteration 0:   log pseudolikelihood =  -186.0393  
Iteration 1:   log pseudolikelihood = -184.67729  
Iteration 2:   log pseudolikelihood = -184.50321  
Iteration 3:   log pseudolikelihood = -184.45652  
Iteration 4:   log pseudolikelihood = -184.44592  
Iteration 5:   log pseudolikelihood =  -184.4432  
Iteration 6:   log pseudolikelihood =  -184.4425  
Iteration 7:   log pseudolikelihood = -184.44236  
Iteration 8:   log pseudolikelihood = -184.44235  

Calculating robust standard errors:

Random-effects probit regression                Number of obs     =        284
Group variable: chawlno                         Number of groups  =         30

Random effects u_i ~ Gaussian                   Obs per group:
                                                              min =          3
                                                              avg =        9.5
                                                              max =         14

Integration method: mvaghermite                 Integration pts.  =         12

                                                Wald chi2(10)     =      46.18
Log pseudolikelihood  = -184.44235              Prob > chi2       =     0.0000

                               (Std. Err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
     coupon1 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .4457096   .1830498     2.43   0.015     .0869385    .8044806
        pair |  -.3784256   .2165858    -1.75   0.081     -.802926    .0460748
 mean_degree |   .0087556   .1088558     0.08   0.936    -.2045978     .222109
         age |   .0083933   .0057179     1.47   0.142    -.0028137    .0196002
        edu2 |  -.0170083   .0822219    -0.21   0.836    -.1781603    .1441437
wealth_index |  -.0659448   .0690448    -0.96   0.340    -.2012702    .0693807
      hindu1 |   .0535935   .2024635     0.26   0.791    -.3432276    .4504146
     muslim1 |   .0239916   .3988725     0.06   0.952    -.7577843    .8057674
    marathi1 |   .1402167     .24105     0.58   0.561    -.3322325     .612666
      hindi1 |   .2168117   .3368429     0.64   0.520    -.4433883    .8770116
       _cons |  -.4742539   .5540234    -0.86   0.392     -1.56012     .611612
-------------+----------------------------------------------------------------
    /lnsig2u |  -12.74438   23608.44                     -46284.43    46258.94
-------------+----------------------------------------------------------------
     sigma_u |   .0017084    20.1665                             0           .
         rho |   2.92e-06   .0689051                             0           .
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                        Number of obs     =        284
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)
dy/dx w.r.t. : friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      friend |   .1655961    .068493     2.42   0.016     .0313522      .29984
        pair |  -.1405979   .0789467    -1.78   0.075    -.2953305    .0141348
 mean_degree |    .003253   .0404699     0.08   0.936    -.0760666    .0825726
         age |   .0031184   .0020926     1.49   0.136     -.000983    .0072197
        edu2 |  -.0063192    .030518    -0.21   0.836    -.0661334     .053495
wealth_index |  -.0245007   .0255574    -0.96   0.338    -.0745923    .0255909
      hindu1 |   .0199118    .074935     0.27   0.790    -.1269581    .1667817
     muslim1 |   .0089137   .1480571     0.06   0.952    -.2812729    .2991003
    marathi1 |   .0520952   .0889759     0.59   0.558    -.1222943    .2264848
      hindi1 |   .0805528   .1246956     0.65   0.518    -.1638461    .3249518
------------------------------------------------------------------------------

. eststo coup_att2

*/

*Purchased in the past 4 months.

xtset chawlno

xtprobit ironsalt friend pair if treat != "control" & indtreat == 1, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_att1

/*
. xtset chawlno

Panel variable: chawlno (unbalanced)

. 
. xtprobit ironsalt friend pair if treat != "control" & indtreat == 1, re vce(cluste
> r chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood =  -196.6002  
Iteration 1:   log pseudolikelihood = -189.37903  
Iteration 2:   log pseudolikelihood = -189.37509  
Iteration 3:   log pseudolikelihood = -189.37509  

Fitting full model:

rho =  0.0     log pseudolikelihood = -189.37509
rho =  0.1     log pseudolikelihood = -189.41207

Iteration 0:   log pseudolikelihood = -189.41208  
Iteration 1:   log pseudolikelihood = -189.01137  
Iteration 2:   log pseudolikelihood = -189.00831  
Iteration 3:   log pseudolikelihood = -189.00829  
Iteration 4:   log pseudolikelihood = -189.00829  

Calculating robust standard errors ...

Random-effects probit regression                     Number of obs    =    284
Group variable: chawlno                              Number of groups =     30

Random effects u_i ~ Gaussian                        Obs per group:
                                                                  min =      3
                                                                  avg =    9.5
                                                                  max =     14

Integration method: mvaghermite                      Integration pts. =     12

                                                     Wald chi2(2)     =  11.68
Log pseudolikelihood = -189.00829                    Prob > chi2      = 0.0029

                               (Std. err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
      friend |   .4882469   .2086745     2.34   0.019     .0792524    .8972413
        pair |  -.1945186   .2214143    -0.88   0.380    -.6284826    .2394454
       _cons |  -.0505704   .1558524    -0.32   0.746    -.3560355    .2548946
-------------+----------------------------------------------------------------
    /lnsig2u |   -3.11146   1.057906                     -5.184918   -1.038002
-------------+----------------------------------------------------------------
     sigma_u |   .2110353   .1116278                      .0748358    .5951148
         rho |    .042637   .0431828                      .0055692    .2615357
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                                   Number of obs = 284
Model VCE: Robust

Expression: Pr(ironsalt=1), predict(pr)
dy/dx wrt:  friend pair

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
      friend |   .1831443   .0761556     2.40   0.016     .0338821    .3324065
        pair |  -.0729651   .0822511    -0.89   0.375    -.2341743    .0882441
------------------------------------------------------------------------------

. eststo salt_att1



*/

xtprobit ironsalt friend pair mean_degree age edu2 wealth_index hindu1  muslim1 marathi1 hindi1  if treat != "control" & indtreat == 1, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo salt_att2

/*
. xtprobit ironsalt friend pair mean_degree age edu2 wealth_index hindu1  muslim1 ma
> rathi1 hindi1  if treat != "control" & indtreat == 1, re vce(cluster chawlno)

Fitting comparison model:

Iteration 0:   log pseudolikelihood =  -196.6002  
Iteration 1:   log pseudolikelihood = -186.63687  
Iteration 2:   log pseudolikelihood =  -186.6187  
Iteration 3:   log pseudolikelihood =  -186.6187  

Fitting full model:

rho =  0.0     log pseudolikelihood =  -186.6187
rho =  0.1     log pseudolikelihood = -187.18454

Iteration 0:   log pseudolikelihood = -187.18455  
Iteration 1:   log pseudolikelihood =  -186.5495  
Iteration 2:   log pseudolikelihood = -186.47928  
Iteration 3:   log pseudolikelihood = -186.47707  
Iteration 4:   log pseudolikelihood = -186.47706  

Calculating robust standard errors ...

Random-effects probit regression                     Number of obs    =    284
Group variable: chawlno                              Number of groups =     30

Random effects u_i ~ Gaussian                        Obs per group:
                                                                  min =      3
                                                                  avg =    9.5
                                                                  max =     14

Integration method: mvaghermite                      Integration pts. =     12

                                                     Wald chi2(10)    =  22.73
Log pseudolikelihood = -186.47706                    Prob > chi2      = 0.0118

                               (Std. err. adjusted for 30 clusters in chawlno)
------------------------------------------------------------------------------
             |               Robust
    ironsalt | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
      friend |   .4136256   .2081057     1.99   0.047     .0057459    .8215054
        pair |  -.2601543   .2276241    -1.14   0.253    -.7062893    .1859808
 mean_degree |   .0564013   .0923792     0.61   0.542    -.1246586    .2374612
         age |   .0062251   .0065955     0.94   0.345    -.0067019     .019152
        edu2 |    -.06346   .0799664    -0.79   0.427    -.2201912    .0932712
wealth_index |  -.0095536   .0741191    -0.13   0.897    -.1548244    .1357172
      hindu1 |  -.0215946   .2415969    -0.09   0.929    -.4951158    .4519267
     muslim1 |  -.0383466   .4682447    -0.08   0.935    -.9560893    .8793961
    marathi1 |   .0701434   .3374216     0.21   0.835    -.5911908    .7314777
      hindi1 |   .4832319   .4410985     1.10   0.273    -.3813053    1.347769
       _cons |  -.3269233   .7047965    -0.46   0.643    -1.708299    1.054452
-------------+----------------------------------------------------------------
    /lnsig2u |  -3.475628   1.619903                      -6.65058   -.3006756
-------------+----------------------------------------------------------------
     sigma_u |   .1759045   .1424742                      .0359621    .8604173
         rho |   .0300137   .0471601                      .0012916    .4253923
------------------------------------------------------------------------------

. estpost margins, dydx(*)

Average marginal effects                                   Number of obs = 284
Model VCE: Robust

Expression: Pr(ironsalt=1), predict(pr)
dy/dx wrt:  friend pair mean_degree age edu2 wealth_index hindu1 muslim1 marathi1
            hindi1

------------------------------------------------------------------------------
             |            Delta-method
             |      dy/dx   std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
      friend |   .1537406   .0769829     2.00   0.046     .0028569    .3046244
        pair |  -.0966968   .0835147    -1.16   0.247    -.2603826     .066989
 mean_degree |   .0209638   .0343348     0.61   0.541    -.0463312    .0882588
         age |   .0023138   .0024311     0.95   0.341     -.002451    .0070786
        edu2 |  -.0235875   .0294106    -0.80   0.423    -.0812312    .0340563
wealth_index |   -.003551   .0275655    -0.13   0.898    -.0575783    .0504763
      hindu1 |  -.0080265    .089792    -0.09   0.929    -.1840157    .1679627
     muslim1 |  -.0142531   .1740629    -0.08   0.935    -.3554101    .3269039
    marathi1 |   .0260716   .1252348     0.21   0.835     -.219384    .2715273
      hindi1 |   .1796126   .1615791     1.11   0.266    -.1370766    .4963018
------------------------------------------------------------------------------

. eststo salt_att2

*/

esttab coup_att1 coup_att2 salt_att1 salt_att2 using 2021-05-10_att.tex, se label replace

*coefplot (coup_atu1 \ salt_atu1)

coefplot (coup_atu1, label(untargeted)) (coup_att1, label(targeted)), bylabel("iron salt coupon redeemed" "(unadjusted)") || 
(coup_atu2) (coup_att2) , bylabel("iron salt coupon redeemed" "(adjusted)") || , drop(_cons mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1) xline(0) byopts(col(1) xrescale) scheme(s1color)  
(salt_atu1, label(targeted)) (salt_att1, label(nontargeted)), bylabel("iron salt purchased" "(unadjusted)") ||
(salt_atu2, label(targeted)) (salt_att2, label(untargeted)), bylabel("iron salt purchased" "(adjusted)") ||

, drop(_cons mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1) xline(0) byopts(col(1) xrescale) scheme(s1color)  


coefplot (coup_atu1, label(untargeted)) (coup_att1, label(targeted)), bylabel("iron salt coupon redeemed" "(unadjusted)") || (coup_atu2) (coup_att2) , bylabel("iron salt coupon redeemed" "(adjusted)") || (salt_atu1, label(targeted)) (salt_atu1, label(nontargeted)), bylabel("iron salt purchased" "(unadjusted)") || (salt_atu2, label(targeted)) (salt_atu2, label(untargeted)), bylabel("iron salt purchased" "(adjusted)") ||, drop(_cons mean_degree age edu2 wealth_index hindu1 muslim1 marathi1 hindi1) xline(0) byopts(col(1) xrescale) scheme(s1color)  



**Testing two neighbors treated versus one neighbour treated in random sample

use "mumbai_neighbour_treat_archived.dta"

xtset chawlno


xtset chawlno
xtprobit coupon1 one_neighbour_treat two_neighbour_treat if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_neighbour1


xtprobit coupon1 one_neighbour_treat two_neighbour_treat mean_degree age edu2 wealth_index marathi1 if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo coup_neighbour2

xtprobit ironsalt one_neighbour_treat two_neighbour_treat if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo ironsalt_neighbour1

xtprobit ironsalt one_neighbour_treat two_neighbour_treat mean_degree age edu2 wealth_index marathi1 if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins, dydx(*)
eststo ironsalt_neighbour2

esttab coup_neighbour1 coup_neighbour2 ironsalt_neighbour1 ironsalt_neighbour2 using 2020-11-18_neighbours.tex, se label replace


**Neighbour pairwise

xtprobit coupon1 i.factor_neighbour if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins factor_neighbour, pwcompare(ci pv) 


/*

Pairwise comparisons of adjusted predictions    Number of obs     =        424
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

---------------------------------------------------------
                 |            Delta-method    Unadjusted
                 |   Contrast   Std. Err.      z    P>|z|
-----------------+---------------------------------------
factor_neighbour |
    one vs none  |   .0125783   .0090797     1.39   0.166
    two vs none  |   .0361605    .047532     0.76   0.447
     two vs one  |   .0235822   .0402287     0.59   0.558
---------------------------------------------------------

------------------------------------------------------------------
                 |            Delta-method         Unadjusted
                 |   Contrast   Std. Err.     [95% Conf. Interval]
-----------------+------------------------------------------------
factor_neighbour |
    one vs none  |   .0125783   .0090797     -.0052176    .0303742
    two vs none  |   .0361605    .047532     -.0570004    .1293215
     two vs one  |   .0235822   .0402287     -.0552647    .1024291
------------------------------------------------------------------

*/

xtprobit coupon1 i.factor_neighbour mean_degree age edu2 wealth_index marathi1 if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins factor_neighbour, pwcompare(ci pv) 

/*


Pairwise comparisons of predictive margins      Number of obs     =        424
Model VCE    : Robust

Expression   : Pr(coupon1=1), predict(pr)

---------------------------------------------------------
                 |            Delta-method    Unadjusted
                 |   Contrast   Std. Err.      z    P>|z|
-----------------+---------------------------------------
factor_neighbour |
    one vs none  |   .0074652   .0046718     1.60   0.110
    two vs none  |   .0383542    .021304     1.80   0.072
     two vs one  |    .030889    .018648     1.66   0.098
---------------------------------------------------------

------------------------------------------------------------------
                 |            Delta-method         Unadjusted
                 |   Contrast   Std. Err.     [95% Conf. Interval]
-----------------+------------------------------------------------
factor_neighbour |
    one vs none  |   .0074652   .0046718     -.0016914    .0166219
    two vs none  |   .0383542    .021304     -.0034009    .0801094
     two vs one  |    .030889    .018648     -.0056604    .0674383
------------------------------------------------------------------

*/


xtprobit ironsalt i.factor_neighbour if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins factor_neighbour, pwcompare(ci pv) 

/*

. estpost margins factor_neighbour, pwcompare(ci pv) 

Pairwise comparisons of adjusted predictions    Number of obs     =        417
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

---------------------------------------------------------
                 |            Delta-method    Unadjusted
                 |   Contrast   Std. Err.      z    P>|z|
-----------------+---------------------------------------
factor_neighbour |
    one vs none  |   .0196498   .0181726     1.08   0.280
    two vs none  |   .0433374   .0536451     0.81   0.419
     two vs one  |   .0236876   .0525443     0.45   0.652
---------------------------------------------------------

------------------------------------------------------------------
                 |            Delta-method         Unadjusted
                 |   Contrast   Std. Err.     [95% Conf. Interval]
-----------------+------------------------------------------------
factor_neighbour |
    one vs none  |   .0196498   .0181726     -.0159678    .0552673
    two vs none  |   .0433374   .0536451     -.0618051    .1484799
     two vs one  |   .0236876   .0525443     -.0792974    .1266726
------------------------------------------------------------------


*/

xtprobit ironsalt i.factor_neighbour mean_degree age edu2 wealth_index marathi1 if treat == 4 & indtreat == 0, re vce(cluster chawlno)
estpost margins factor_neighbour, pwcompare(ci pv) 

/*
Pairwise comparisons of predictive margins      Number of obs     =        417
Model VCE    : Robust

Expression   : Pr(ironsalt=1), predict(pr)

---------------------------------------------------------
                 |            Delta-method    Unadjusted
                 |   Contrast   Std. Err.      z    P>|z|
-----------------+---------------------------------------
factor_neighbour |
    one vs none  |   .0164936   .0156784     1.05   0.293
    two vs none  |   .0387109    .043194     0.90   0.370
     two vs one  |   .0222173   .0451708     0.49   0.623
---------------------------------------------------------

------------------------------------------------------------------
                 |            Delta-method         Unadjusted
                 |   Contrast   Std. Err.     [95% Conf. Interval]
-----------------+------------------------------------------------
factor_neighbour |
    one vs none  |   .0164936   .0156784     -.0142355    .0472227
    two vs none  |   .0387109    .043194     -.0459478    .1233696
     two vs one  |   .0222173   .0451708     -.0663159    .1107504
------------------------------------------------------------------

*/





************END OF CODE
************END OF CODE
************END OF CODE
************END OF CODE
************END OF CODE
************END OF CODE
************END OF CODE
************END OF CODE
************END OF CODE
