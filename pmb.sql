#! /bin/sh -xv
yDATE=`date +%Y`;
wDATE=`date +%V`;
jabilDATE=`expr $wDATE + 1`;

#Date=`date +%Y-%m-%d`;
OriDate=`grep "PMB DANA AL-AIMAN" pmb.txt | awk '{print $7, $8, $9}'`;
Date=`date -d "$OriDate" +'%Y-%m-%d'`;
PMBDAA=`grep "PMB DANA AL-AIMAN" pmb.txt | awk '{print $4}'`;
PMBIDX=`grep "PMB SHARIAH INDEX" pmb.txt | awk '{print $4}'`;
PMBCASH=`grep "PMB SHARIAH CASH" pmb.txt | awk '{print $4}'`;
PMBDM=`grep "PMB DANA MUTIARA" pmb.txt | awk '{print $4}'`;
PMBAGG=`grep "PMB SHARIAH AGGRESSIVE" pmb.txt | awk '{print $4}'`;
PMBDB=`grep "PMB DANA BESTARI" pmb.txt | awk '{print $4}'`;
PMBSUKUK=`grep "PMB SUKUK FUND" pmb.txt | awk '{print $4}'`;
PMBTAC=`grep "PMB SHARIAH TACTICAL" pmb.txt | awk '{print $4}'`;
PMBGRW=`grep "PMB SHARIAH GROWTH" pmb.txt | awk '{print $4}'`;
PMBMCAP=`grep "PMB SHARIAH MID-CAP" pmb.txt | awk '{print $4}'`;
PMBPRE=`grep "PMB SHARIAH PREMIER" pmb.txt | awk '{print $4}'`;
PMBSCAP=`grep "PMB SHARIAH SMALL-CAP" pmb.txt | awk '{print $4}'`;
PMBDVD=`grep "PMB SHARIAH DIVIDEND" pmb.txt | awk '{print $4}'`;

mysql -u<user> -p<password> share << EOF
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB DANA AL-AIMAN', '$PMBDAA', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH INDEX', '$PMBIDX', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH CASH', '$PMBCASH', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB DANA MUTIARA', '$PMBDM', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH AGGRESSIVE', '$PMBAGG', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB DANA BESTARI', '$PMBDB', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SUKUK FUND', '$PMBSUKUK', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH TACTICAL', '$PMBTAC', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH GROWTH', '$PMBGRW', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH MID-CAP', '$PMBMCAP', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH PREMIER', '$PMBPRE', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH SMALL-CAP', '$PMBSCAP', '$Date');
	INSERT INTO pmb(id, ut_name, price, date) VALUES (NULL, 'PMB SHARIAH DIVIDEND', '$PMBDVD', '$Date');
EOF
