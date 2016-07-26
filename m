Received: by 10.25.21.156 with SMTP id 28csp1861414lfv;
        Tue, 26 Jul 2016 11:26:33 -0700 (PDT)
X-Received: by 10.55.11.20 with SMTP id 20mr31895268qkl.160.1469557593281;
        Tue, 26 Jul 2016 11:26:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c50si1256001qtc.1.2016.07.26.11.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 11:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS73o-0001CV-Ki
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 14:26:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73i-0001C4-OO
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73e-0006K0-Nh
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:26 -0400
Received: from mail-bl2nam02on0043.outbound.protection.outlook.com
	([104.47.38.43]:19328
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73e-0006Jc-IC; Tue, 26 Jul 2016 14:26:22 -0400
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(10.152.72.51) by SN1NAM02HT160.eop-nam02.prod.protection.outlook.com
	(10.152.73.125) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 18:26:20 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 18:26:20 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52058
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73b-0003qi-Rd; Tue, 26 Jul 2016 11:26:19 -0700
Received: from [127.0.0.1] (port=57345 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73b-0006Ng-OH; Tue, 26 Jul 2016 11:26:19 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6QIJYVw016348; Tue, 26 Jul 2016 11:19:35 -0700
Received: from [172.19.74.182] (port=41252 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73b-0006Nd-1y; Tue, 26 Jul 2016 11:26:19 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Tue, 26 Jul 2016 11:25:49 -0700
Message-ID: <55bd323ec1302757c47bfa3b8c03d2f15b815eda.1469556788.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469556788.git.alistair.francis@xilinx.com>
References: <cover.1469556788.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22474.005
X-TM-AS-Result: No--5.572-7.0-31-10
X-imss-scan-details: No--5.572-7.0-31-10
X-TMASE-MatchedRID: ZF1pLboQoELFvZkHJO4cD1VN8laWo90M6SXuwUgGH0hYYjdv4zyROx4u
	a24ul9odkKaVbA4S4D3c8+FPg1rJdhLmJd2F/yFu4pdq9sdj8LVYN1akkye0qFmc19Us2m2y/BL
	THkvHKMtLbMLc3nVqMuZG+4fcCFvZe4t+BIGa1PR05zsoB1UKTov8pidhVYOUmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1+y21Qho7kEn/s5lbYbm2BHLDX1KbEEztyxUCp0+nITLbP2vs+/AhQQ==
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(81156014)(64026002)(48376002)(8676002)(4326007)(105606002)(81166006)(50466002)(5001770100001)(2906002)(50226002)(33646002)(36756003)(229853001)(19580405001)(19580395003)(5003940100001)(86362001)(586003)(9786002)(11100500001)(92566002)(8936002)(85426001)(189998001)(47776003)(77096005)(87936001)(305945005)(2950100001)(118296001)(106466001)(5003600100003)(356003)(71366001)(76176999)(7696003)(50986999)(7846002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT160; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT012;
	1:xx9uetZMvGe6HPNxPbw38gu+R0mqaCbpH10gk54iieZKx5KXiQtER2slcdkWz/+3kwaC+8u32AUVa/p8WqS8HrYP7vglGJGWBNGuFX3lpUVibhDudE6WMbiO2vxYD7XFGVg0TL28pnApz+SBCigRWwZwWEMBE2fkIqW/slpdBBsAlIbosZZr1DmClngnjTRlzqApwXSjLEL+P0iUzNWKHMl3pPwTKO+c3zzpWvHR2e3yoFeHEnqQYJB+LGhrjKLKq/BPr2i+jemNvHLBogXvgVAKFfZ3BlhPi52wQcycITaD1vvmi9Emhm3nE26pt0Od+66U99EG5/mIWU7Gzy+o0uJTOE+8j/FtVIWGoQXIXgwthkweME6xse3FEL1X6tD5hItTI3lArJeMuOtB2ZFF7D4ITs97+uoagjT3zphH/lyGqmVfBQ+0PsrVrmRds9wqQIq+OtPpjnBFjaKNPtyygQYaz6Vpp1eNmA/apxnd/3d6vNZEBd8ILgoXW8DxzHlkrioE7COvPKBBrDxfTI5BuLYZ1oFtTo9w0T2YTc0LvXxc3A28BVmn7NzJsEL9S8zUs0IIQ5A7gnLiGtp6bcsKBB2y55IRhvkEiL9vwO5NKZo=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eacfebac-9270-48b8-57b1-08d3b582577e
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT160;
	2:lZWo+UBi7kWU97qDERemrKLM/ZutiYd+BH5hUDLhl2HP14SNqppC9qR6wK9HTSz7LQ6izWGbHQqiGPdiw2soIZ7Z4WvAOooe+yhhDloiVeadasTM2+GJN6/OGXuCs/FoOPOdNYZN46/sZCWkjSP1gV0NKzK5RBZJoh7kOVjlP3XahDjE9b7PKmbzIMRVaGy+;
	3:+V3grxY9r1oAsv0EzGEn2+AZnuK1gzJgUWPUQvU4r7PFzOxZjAypvNxy9eboCNgu0rch8Jnus7x9HHcdUxvx7s8SOxFt6ZRMjQs+B3VoAO7EP6OJ7+1tr/WZHONgVaeAiC1pHx2u30Gp7SPXd5nwj9farDjhAbkG7RDbzNjM61pXOdvyCPfwUypCXHIT2LpJLTTJZYhLl5H6nNtP0i1Y8dWhZCRgm/pBjQI7fb8zkRs=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT160;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT160;
	25:utPxrkac/CVp5wV9BKnRQnSAczJFEBbfO1xOYNrSU5+SiMReeqyy7lQl98GJeY6ZmnFPWisMOWRqmNBXURFM93I/v3UX79W+DM3qTqiWrxG/1+ZCRzB9cvwvXBWCwkEQx3N17+yK6WeBTxLe/f8bh6btG5vxrmem7mZ6Tc8mOPHYw57Xq2ClN4JDbpeavuzL2C7iGQGckusa4aKk7Pld7BaQ0jOFc6d6NrAVIM2a8TcuH+UV3zlhDh3BHZ3Hz8deGZ7//o6r2pcJO54PSN3py5IoOruAvPCzyf1ClOhaj6a/D+p2PLYOa0ovV4WvQeoKUzMtpHEPnGcyYixiEPFT4JweIekRQHfO8aSlXAQ/urhty/tpTR65oH4llt7aF6v2lDIBd0iCmYODqsH6kk2aOySdxGgEMC10+4o+R2/Qc9vxCILsIdZDa3W0aHYDQh8GbPa0mM8PQ8SsjANYV4JEUCMlke82Izg+VuhsDkaeV6p4s6VdZfFzQnH7J8T80O9pR4akMFwhXYmmVNxg5c7b1oPZ4y8zCRp0j3haC1ryKEsl7mVJ/EA9S/4uZxt3esprSdFuk7gr35fAzPaYj6DZEslAYxYvphboQbhci+3AqenlIRxs3ogBTFgh98IhLAHnz9lPyqh7p6twEbnrahEOiNO52nQvcw2nEgf5a5r07jYCT0vE/9NIEiUG1mXmB+Amk0OWti6uTzOOD0j7TDYDPwSJ0hFNqymmmM1rXBX5XSNMpIrDvkpl6R4fVKoa8FHJRyb9biBy2VUTd8NcqKWIkw==
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT160;
	31:DDr2JD/YDYsAYYjcqiytAD/a1mJ5CNKw4Uy87sf4ZGSJk331gjccblfzM/Q198aSQGQK4w/IE98yWPkwmgf3g1+PAmWGT6AMpu9pSXtdTbYvhivcoCoMGwl5tX5888fIB3+qJTsyOpXX4VxN0YJRE7FeZ3bU1oASh04PdeoNi0/lDvoP7ktPWCl9xchXkdjCbEb4knqhkxGQZxfpL8PtwCbkqs0H0nzRkV1LeFCmQpQ=;
	20:MfNUcwmTT6iihMyM90fmrt1llJ1XV2/vILgAthXI+jfj3EjQgXbS2yEaD+CUWvzWr+sVPo0u/nDwQelZW9zFogc8SgtQXfvI2G1VpHZSyAB7diNIqLnsaqq/xXlC2WpUIs7YpJVl99X7tjy6wES5duj8ClR/a5Lk5Xv7avXQSyYG7BWLpWGwZJcw7sNpwcgnga07J/UxmKF31znbxlm6CecoDDSGd0Bdnxlh8lL4ZSBcIlZfeL2YgeLdF7EZ/OMYvebjzArQ6IV4tZTBv3efS8/x36RhQKGYxuGtnIwz4uBZ5aPSe/5xOJwv5ptP7yJrPvBTUhPXi3Qrbd9ZF3wBu756CMlRG8T+2HcJ/DsF6iPTdDUp2UW+/XAPjHeKwatq0ZXgcQ4/sVM0GNeyiMU02/KiuZXZmK8fKiOkVG+5M8FEaEM2E02bleRy5fMy/fCYH1DDRcSyMyCbW7kqrg5op5h74XIcyf7vsdgzrCQcbGC+lOAJNVppDu/LIBGjsDff
X-Microsoft-Antispam-PRVS: <aa71229153ec4742b22cc40bb0c071c6@SN1NAM02HT160.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13017025)(13015025)(13024025)(13018025)(13023025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT160; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT160; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT160;
	4:fWU81QMC0/WfuDNre7JALLI2FET9dCMS3QKQQlbMxG0UEQ6Qf5by0pzSf0WqC/OBfnOfZ0P7UCIYskgLaMWhEEvhkHTLfPKgrtmXhtCT2gzyfJarEh4EONAFRmk+5mAGOnGve+fPopw4Q14faRdj1t6ZLFo8XN4MdMXnN0b2NIUvSqnnEzjWeQROvBZhQsEMpHbyxkjWPfZic3SYZ1WsIGT6qLUYF2EBlUgxIKQhQK6w5DFz3dUxg8iEyF9zCb+T8xH2C6kYhPrdYTES3y5/k1uXfrRXVhYbqWRvV9IMlZZH0tVq+qcYpyn23XmqazJcjUr+pyFAKxg5AvS1NE0oHkPG6aV4oJ7bpOdw6K82Trx1D+TinZsvhu2SQQXLNV1XQ3pBFw3mZoQt9YLZAWTA8vB9EUf3DGrerRNBFOf6tj2G7MNYOCBYXah+dPx0GwtGgxT2muRHDlVYPN46+Ne6XWLTzMSxuN63OWLu9AMTFoyoudX6EB2nIJm/NSmUTQCEQvEVFaUHp6gyVdN9BP6TQC6BGNegt5OfA0I87MXM72Q=
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT160;
	23:N/g6r6e/pnIRCmcW0tK/YygAl20gVGMqlOgkq1tof?=
	=?us-ascii?Q?JUFxSmEVtDBHs+tD8D9l2HdCC99X+DhwxWLANMrGKSqUbA/JkklWSiClMK1k?=
	=?us-ascii?Q?zWsGngA542Bs9Fx81ALny9ynHD+fUi29ItnpZQDxQfPEC9ROBJDo3R6/PxvF?=
	=?us-ascii?Q?yCnPCkTXPp7HnwQgsf1t5Kt+ggMyv5dLxDft4fUhpjvBzmAZOapuwraey+vd?=
	=?us-ascii?Q?vV4InKtXq6yW/f859+LPGr7FZDzxxvxevliGC9N94/lwQiyK33k8nukRdoi4?=
	=?us-ascii?Q?SyXG0PK64hK85CQibq0ET4Rj0ATB8ufmxfg9QBfTiWIF4JI8dxu0+6CszahO?=
	=?us-ascii?Q?C1xLRZcgYacWq9fLsCK5B2taUAYE1lbtfVsdSBOVNCQCEgR8SPOMG28jBTTk?=
	=?us-ascii?Q?Pixd4e9On8ih20oSjulGlW8Qiit1uKxexrQrWLCsjqcT/+pK9WB9O1T3f3EP?=
	=?us-ascii?Q?8dThzuHIKF6oz06DjHwWybndYe1OJZ10HjK7MmXeHIxQ1weFBRSYaNHO8RLG?=
	=?us-ascii?Q?UNH+oqmZEiyDaZKeenpqYdjs31s+lqn7/qt4n1zy3bpUx1CvFRg2jbIyeENZ?=
	=?us-ascii?Q?25BEnh8AY1fROyP1K5er3mEKFiBPEuKSE5agPvCWdqtq4/k8W1rn66m08irQ?=
	=?us-ascii?Q?YtyV1Xl/loEcZ+FwlRKMam9dPArVJgjR0euiuzDQmhVuB5PXDtKo1yZMrC+o?=
	=?us-ascii?Q?zJiB4XBKaCcnsb6GWNd0IyVeT7rrDTM6GvkFYx3iEJOW76aGcuDL5nvpcW4V?=
	=?us-ascii?Q?6hm6npIG1o2QLVkTmOKMeNJq1fL6LM/TUqWNfZ0P3MeCfDIjApV9BkJ3qaa5?=
	=?us-ascii?Q?myB7OJ61mNv3UGDj4/HGwEKbE8ln2pjJaE8V5GEeiM8KDqvrV6zu3tgHih8M?=
	=?us-ascii?Q?dI06v2k7bFxnKtlnn33Z0ToAzUlEtFswTix6yqmx7hBz8Tci1FKhUmsHQFnt?=
	=?us-ascii?Q?fXGYyq8c3tPOSWg+T/o7KkynXDuST3MdywP4bcUc1Ti2fJm51pTaQQKu3Iqg?=
	=?us-ascii?Q?UUoW4bEkT4sMNsxoostSZmwXLj+rohn+P3Pyqm2EdO9HTSNgIsclpWpUGJBG?=
	=?us-ascii?Q?VkQ0wzvOWwcCXurIfOSDrFB9Yijz3wvx6aS8UfS4kHUWXmxdl46LgnU4NExt?=
	=?us-ascii?Q?VqBsKeoLOv9uo8Blp27UaxDbqH8kxiRDhLtailOsNd7BEoXl/W+bzCmLUaHF?=
	=?us-ascii?Q?wCTESAIHat8pLfmqwueErYzlXbtnom3zufz?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT160;
	6:rKxaEtDYFaKpRd2Me3J0DVd0xe+6t4ca1iHnnJZrOZINhz/Z83hLqTZISGZ8Gq/4OytLF/5ey4oKoOwB7/dH2u20nZ0ZpiFW8s3Zn/X+xkqj4Uqw6Sx6F+jmXZe876KFgZswmwP0Vu6zvkMTiXfAK+yEkkPxewVq1AKQE3hnIhf8zdAEnzB3fpbHEIyq33fgGjXMlV9mx7zZSgwr05ldXQHdStR65WGr34E6pQS/ROCydjLAYDKXTFQxMUiACIL1MVWx/duC7qU73sMOHAvx2CU0VONGr0/3dp3qD8CGWmOFbcZ+B+Z0o5LXi4HpWcO72Qh5RpX9WTDOXsrRyh+vCg==;
	5:/rt0688kodQE3NVijdeC5NyASy4WuEC16BOOGr+hc+TvDUwLx7l5SJ2Kxa0rBMbzDRnPcI0kF5+6GlfIb1/fH/7Yy/R/urNZrCdXT7waEP7Z5YMN6MP/YaHQtkwr78OG2urxSzx1zp2rgzZZaKMd2w==;
	24:UWdNwtPv1gDExGnA/5tRdRJmZ9aOY8aLWq9Te5+ZHetyzsHW6d5EqsLqNXkJeiI5PulFjte2Y1csRdaeLKDXlE6NXfQI41gjwfpjYQ5T2pc=;
	7:d278bhovJSnz4SBT0AU3qomqgAq7R3wgqEVlaLBtI0cfnFJIdCHWiN5SpRatSSL6Zq7b5icgff4jP4jwdvCMiTB1GzunMKBBE/IYZLjIhToW2T4NQfSmeeUafcc/PEY8YcyIt0kFJ9OhSLEHGAhFWfgiUlaHMz35fs2awnIBOCr0fN4FVdcq7AbOfanDKVFD4fxbjFQO3/5bn2JBS5MF84ZRATdgcegKhxMNp8nhyazSUc91TeZkFjRl3nAs5mpN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 18:26:20.5145 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT160
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.43
Subject: [Qemu-arm] [PATCH v3 1/6] cadence_gem: QOMify Cadence GEM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3AAV1N9M6uy/

The sysbus_init_irq() call will eventually depend on a property so it needs to
be in the realize function.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
V2:
 - Update commit message

 hw/net/cadence_gem.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index db1b301..7adc2a8 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1214,24 +1214,30 @@ static NetClientInfo net_gem_info = {
     .link_status_changed = gem_set_link,
 };
 
-static int gem_init(SysBusDevice *sbd)
+static void gem_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(sbd);
     CadenceGEMState *s = CADENCE_GEM(dev);
 
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    qemu_macaddr_default_if_unset(&s->conf.macaddr);
+
+    s->nic = qemu_new_nic(&net_gem_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), dev->id, s);
+}
+
+static void gem_init(Object *obj)
+{
+    CadenceGEMState *s = CADENCE_GEM(obj);
+    DeviceState *dev = DEVICE(obj);
+
     DB_PRINT("\n");
 
     gem_init_register_masks(s);
     memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
                           "enet", sizeof(s->regs));
-    sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq);
-    qemu_macaddr_default_if_unset(&s->conf.macaddr);
-
-    s->nic = qemu_new_nic(&net_gem_info, &s->conf,
-            object_get_typename(OBJECT(dev)), dev->id, s);
 
-    return 0;
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 }
 
 static const VMStateDescription vmstate_cadence_gem = {
@@ -1257,9 +1263,8 @@ static Property gem_properties[] = {
 static void gem_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
 
-    sdc->init = gem_init;
+    dc->realize = gem_realize;
     dc->props = gem_properties;
     dc->vmsd = &vmstate_cadence_gem;
     dc->reset = gem_reset;
@@ -1269,6 +1274,7 @@ static const TypeInfo gem_info = {
     .name  = TYPE_CADENCE_GEM,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size  = sizeof(CadenceGEMState),
+    .instance_init = gem_init,
     .class_init = gem_class_init,
 };
 
-- 
2.7.4

