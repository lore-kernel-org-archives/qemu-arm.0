Received: by 10.25.21.156 with SMTP id 28csp1429726lfv;
        Mon, 25 Jul 2016 17:13:38 -0700 (PDT)
X-Received: by 10.200.45.108 with SMTP id o41mr33376044qta.100.1469492018310;
        Mon, 25 Jul 2016 17:13:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si19378317qki.232.2016.07.25.17.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 17:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRq01-0005jt-BT
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 20:13:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzu-0005gF-1M
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRpzq-0005o2-16
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:13:21 -0400
Received: from mail-sn1nam02on0083.outbound.protection.outlook.com
	([104.47.36.83]:50263
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzp-0005nq-Mg; Mon, 25 Jul 2016 20:13:17 -0400
Received: from SN1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(10.152.72.51) by SN1NAM02HT082.eop-nam02.prod.protection.outlook.com
	(10.152.73.72) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 00:13:15 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT004.mail.protection.outlook.com (10.152.72.175) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 00:13:14 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:32977
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzm-0002Cz-8n; Mon, 25 Jul 2016 17:13:14 -0700
Received: from [127.0.0.1] (port=38264 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzm-0000ni-6M; Mon, 25 Jul 2016 17:13:14 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6Q06TuQ028711; Mon, 25 Jul 2016 17:06:29 -0700
Received: from [172.19.74.182] (port=60002 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzl-0000nf-BP; Mon, 25 Jul 2016 17:13:13 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 25 Jul 2016 17:12:44 -0700
Message-ID: <9f30f70e250f0b9e45b2bc225a7e76192f050358.1469491920.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469491920.git.alistair.francis@xilinx.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22472.005
X-TM-AS-Result: No--7.060-7.0-31-10
X-imss-scan-details: No--7.060-7.0-31-10
X-TMASE-MatchedRID: NqUYE3Jzbv8dsKV+lYHQBqOONuzwygtGmyqQJWNsukn/evmlVf9xZvp9
	YdWlfxDykKaVbA4S4D3c8+FPg1rJdhLmJd2F/yFu4pdq9sdj8LUSNRDlFTpYkvNhzIgXtFJVibw
	HCxoXFpesrpv7ZGx0TfmRngQJRUJwi9Om4SO4imTThGbP9qB93BPbyBtwZTa9RQ0dAChl/lwxBh
	Y3mcMkVIeOUtXkXvGMeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPCN5pDT386+O2Fyj
	pP3X3Dj89jYSgO++fLqY/KlPiJlCpIIgjxIplCF
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(4326007)(2906002)(118296001)(36756003)(50986999)(86362001)(76176999)(47776003)(5003940100001)(85426001)(105606002)(356003)(189998001)(87936001)(77096005)(33646002)(586003)(5001770100001)(8936002)(48376002)(2950100001)(50466002)(7846002)(19580395003)(8676002)(7696003)(9786002)(50226002)(229853001)(71366001)(81156014)(81166006)(64026002)(106466001)(5003600100003)(11100500001)(92566002)(19580405001)(305945005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT082; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT004;
	1:sUqVb6WyT/YurVqMmrlf2y7IID1uavL9nNm6zRP9lH/heBaHuoMVB53AyCxnG86AoGfAD1hb09s+vX0dO8FXJ0/wvijqkxISUyWSmtjkO4SR50RFuzIjKz+TWAwnbKOxfp0Uhxeo6RhjEQRyoVPD/NDHo+wx+1nQvl7g5N3YszD63ipwS5cF1UFdbX2N6K9Uorm9etw9FG73/2y8MVuzkeNd3r5w69fu+7ycE2rdlLBvnnIJvsuB+d70g6bptHFe5vRij/0NbmLp/4i9Vg4se44W39t/sixMWcD0NDxGJTttcQVefNphmOF3ZUAMCjcXuMT72MR+NkC/aSZqRE6Mt4AEyxZUqwdBJhOjTJoz6IMZKIc0/l6t4EX+wqfH14C5mYkfICV4PZUvCxgc8w9GbuUIsHyPivrOdSk8pY/ezj9s0pTnJcWUwmaXClg8vxY2BvAJrcj5Qd98IqSB95NcxApQDcWn45hESU6SV0P/3aVw0wYgz5WzLUyLOlDqSg5UCWaioi7sJdZKH9lna0nJaN/EQGsHXnDzhiFpsiQmoJ59PuXuoZj/HzSFPylBg9Hbh+zFATeVovoCiq3KbC8svhpCn45jiPOAZoa5AsLiicQ=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 78d47e11-ab9e-44ae-9b93-08d3b4e9a365
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT082;
	2:Pe8ox5FpsWwcR1D3QxxB/RKYCUDXlkU97MzLLwd1W2oHWJYoAFiA/7m2Q0fl8s5vIqBkwwYXgtL596F18/K5+qaStcxlzqwMI1OsyMXR9tY0PMcZnIoUkpprWd95hCGdgczJ5kqsorGwHe497gXaR4jS082CgmckJQiifqbng1PwJFNJJhr25xldbcwFURCG;
	3:AEl/894pIO6gQC9xGFI7t5eD02EyRpoIot1OhktvoHEhwqs0O8lIMTh+yvsp2oPHniPuYKQtBtmShQkhfBhhomXY6kC0pBH//vXwpey3ncU5QlkH2IzIdQPJIeSIP1elhJPyUF8Kve9ts3Y9G/55QgMhdz1VfctSvBkOy6I0+PuMYfzvzPFpvNbhQtAXHa01JoactyS4Iw9FFlFGFXbZjWfL+hPoaXdb1j3j/AH52SQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT082;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT082;
	25:FRse19PfaWdHCo+V9ZoCN2z/soEMCYQ+jPZ4xwfXypiv/ow4KZIkTFBfQo+dpC7yfWA+jQx2gQUvl7/nUzp9fJAItHffDLVy1/DAcXX4NWxuOLCqTha42c8vDTKOFY5IqxmvhvNABqcMc7uHFvTt6yvzzvNwWcux5qQvXkpH57/5Tld1zTFv1W0VVMU3RbFa/Ofy1KKxQWr6s//osYcf1zihf98BLOWLcXdGn4oNoWPrWo+optCL5hHhfoyoP4oBxh7c/hFTYH5BlT/oeiU6EfwEydJUNMrRB5HsmNdUwK5reZErr/+6D9xj6kHh0j3n0z70kbLy02zsdO8CmL0GlwnIdQMcN2te8jbsCHyg8BYDfieCOyPxF8NJAmLPNrohnLbK7GNp0VexDF15H2Rghy34gvSMoXRC+6q8m6jNfMJ2FpHH01GhBX4WyI7WdvEi9XSKTJZYInjAkAb4f63Fqamb7n9hrZ2/NzGaGeE12pNjwQHf6X2pAajbhFKaYBTsqopIsWcWEZW+tGA5EAHt5z7hlQS/hbewmipdpiryrTOZb1nIHGVwHUliNd54tqRSPKySubOEnDLLgXhn8Kpa9HOQUiF0nfurqTUFTywMwV/r3zKJlkyifj5LdkHGTj0Jgv8f2Q9yOrdkucrfNELY8N7zayabIqcFLbT1y1qQL6QtulmlZZiPP3T+Lqgznoe+SEBQWlwRA7oCk2R+ENiwPOfnjKxZL3/NTjqLGKefJWsb7n7mPuxRmRweAu+xtMFZnmbNPPbpCISSb8jlV7qp7z/SuIOV6/WBX5t0w44vTI4=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT082;
	31:J3Z8OjMCxk//YM8xKQrj/EvRpoKTsLsnzA7jpGGo1nExk//gzlNwQH86e+GU2ys5Hj41MbIa5sMMK1e/MtGgdwpYIV4DjkZu6oOvqF8eCjwt1DQuc0wiS2PXOfelBiAeXPYishggssz454WXHkefhPzSjR/s7X5Hyh79HSxkbsEJt7vLI02XiV7BJrZ6e31x4v4kFBmDEGeNfvcMyg+37Q==;
	20:H3uyys9OVCqzXUBK+kt15DYv41iW9vDkmbRke4J0pnhH2qrnlpYxu+FxYM7vPWoB66obTeqVE+cPIN3C1httVPyTz0QLpF5S0vUkhONQ8/zZ/PJZkCz3EN/Ti+eZg9/j92swzR5sMqD2cx68Oq/Utu+hWTW0x/b9Z7KITRQEkHgEXKdIxdLqngmagNGRC6kTy8QlwB/Ki4aCn9wFW0MUjeMdSRcHWD4XsdjM8S2IRoDS5HoVAhgIMuzTEtRqJ5J1ASAziPkaj5kZhAuOQBVWVKdeauDRyieK/1oTLjx1kRavpPTIwJ/C/K2+Uy/t/i7qtwF0OirklJMS+fi2fsGyadwY0b/DFy0y6qSJ1pAFVkDc7aEN5tODBPm9EOiaP/ZNm1aX/nSTCzBxFGIMTBIu2gYmMnpyEHAROQtJf3rkSS+7Z16FWma3JmxtD4BXnbkilXUBTWgTP6A79CnvywI7wDgg7Q1Z+1Itw5vXLEiErTWEgm8VX/GPlpn4nfSPkRJv
X-Microsoft-Antispam-PRVS: <fd6cae43a28448bc9a8fa871b59e32b9@SN1NAM02HT082.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13018025)(13023025)(13017025)(13024025)(13015025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:SN1NAM02HT082; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT082; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT082;
	4:enOKbTVcgDBbZe7G3vhHmPEEx+GrSIL31iaW6G962c/oDbY3MeyV2/AcgWmIJcXRa33he11g+W/n35VTncTIiVw4dTr6GPtpK31f8eacb3VduhkQwmXVmuQFVBvX8BqIlaHeBzerBO7qZ4qGMicZ3EzY5HxDk40wDct2Lis3ehW0LzAFkuu1KRwhvBjUqBmgorXLY9FGib05nRKVQ7BKWqdYqNS95BlUo8WbU32zlemWBgHAoRytCg7DSo3/o2oGFaFFf+6NzI5bSxMW/hgAHTZLnJdfbYTgm6lAQs7rdC5KmuVZ1SVs7+iAg1hw6oeNoO8qA375N2pd/ABf8p41cse6ST2HRlIJ05Cv/dm+PLFptjPXLJ9UAUag416G5bz5t7tqaG2Gbn54ZLBw9zwgaKxsh060k7v7CMkTpbwmJAeDtitaO0p5T/6PLjPWFCVs2fyo/26Yhxy70cr4K3UduLSWsQLgNYDMgektGXdwroaFLPIhtsZAS/Ov1fwp2p8gjcGMUXfEVi2HSNkI6DkXIj2dyxgT/cvaQ3w5Y3ua0FUXvRznoL5r8F4xY2kT7viBM0xMpZdjrRnN5sACZENK8g==
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT082;
	23:hysW/ywuc0og8/o9+oAZazmnN6oQkHCVexkv863P1?=
	=?us-ascii?Q?wsGi05Bdi0Ofm8xUmmMrGPYW/tjEsP4wRdA9WFY/TMNDxymlOr3M1FPRU+7o?=
	=?us-ascii?Q?ndH99xOcy8oeXwLxsbpih2BNfEntXqfHaDy3K40ldlmpLdYs/fahuPrA2fxp?=
	=?us-ascii?Q?ENQJ5OURw+snA/hTTPTcHCo7JGcg/0OQW5CwrP6pTluX8W27Ws6obMZapYgX?=
	=?us-ascii?Q?/Z0EC1zkbpIDC6xGztfbf9S2ipRFmQaeknkgXjPiqiCyCmvjUzv3mJVWbUBO?=
	=?us-ascii?Q?hY/fya0zKVILU4L2gjdv/E7ZcKFwTn8+jy823V4SeHrgj3LbQjE5EYMVI2Lm?=
	=?us-ascii?Q?G7fjg1PbMsjVlT4P+iExl4MmJMGbot08k3ar9QWyeKbywWl+PZEa+W7/TqVf?=
	=?us-ascii?Q?vKnwIwMDkdbbGR2spRUsA0a+nTdzTmBn+g1hN6PblNQfG5hMs9Fezjqa8bfc?=
	=?us-ascii?Q?wGU8FFF4DqhVIe/lCrG+ngaiGa7X/lEkg7OHUZiAL0BpSjpeIqDzVhTihMUS?=
	=?us-ascii?Q?MO1IeZTmrK72v0sYgqRN7xxay75dqXHEWhahp818fbTu8XDgbP6Ki9pL3hJC?=
	=?us-ascii?Q?wAEiIK/ULZE4XrqiU2YAJz6Rn4Fatt/kSs/pjEdCvHR2kLxqgMMTqJHDoLAG?=
	=?us-ascii?Q?u1weh18PqBYW5Xjx8WiBz1mc2Kh1kcRaPLJcNDDqsYxDIZwl41UyGqXltY9e?=
	=?us-ascii?Q?zs/rjM9ig6YnPhw8FvS8BGm7nV5mH/ue5kNkXrO2TZ3NUmIA7AoGb0195yXM?=
	=?us-ascii?Q?En84f7vnOQlFvIw2D/P8QsAFOfGl9IZWPzvACmBdD40sjURbZzwOEBZA0hdf?=
	=?us-ascii?Q?rp7AfMspwZu51PMwaZxbA3zDZdK9+2/GRLqbY9IaW1bNR+f7oQq/B0W+spKU?=
	=?us-ascii?Q?oHOQbB2L9d6qCStNakSYUpWaBBxA8qFMbNn0wi2c+WY9o3GpLKRI9c/jBAXg?=
	=?us-ascii?Q?vSAF0g7zp/80xpH+tpb2EGwXQzA5efqeLgJs0KZpYioUmTHwQvd1Yif+zoYo?=
	=?us-ascii?Q?z2r4fEYYt6sKA9hnX5B5eSf+zsqPUDnf2FotDBZjzLJiN/yWbiCajJUDfeDX?=
	=?us-ascii?Q?OnbqocFqD2Y3mhRhJykEdqqXiY3dQqbIzNw3YDYle9W7qxGP6mqsoy/vOCWc?=
	=?us-ascii?Q?7etxkqHVPRhjiGVHrgDG1ZLmE1wrJ+YYe7iVhZg4TBUTiu84IjF46UzIJUGt?=
	=?us-ascii?Q?n9Z9Aiy0T7cA7QPt5eOj3w+NGRXc261h9vD?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT082;
	6:4hIfZUgGdWTT3gRuwrGMrO53PXXFSzzJoK9bcBh0vF8rpxDm/h93F35ie/DbQEIBecPG/ibFNobeLPphkyIzsh+RerWnnpDQhMEVKqbzhNoJZzER0Ib4QauaibQoB0HsEwH3EtB+lzaiBMVbmfwr+/eQesZydhTRoEEu15Rt2WOpCrZShRNZe84xxGCQvEeyn3pQ6VlKaOG6R4LCQe4gx52rUK50ptw7KtbaFnYfvBA31KtinTL6WiJHMOzwjzt4w77juNwvEt+3V8WB8MQUv84pR3f+HSPUEIniU2nOnOQCq8eeNfs+PIFhYdFS6Ofc6z4ACIgSWixNF8klGlQpzA==;
	5:9KJDc9YjBVWFMbF/NRyw6xvdxclSk3fNXA+SLj4xRSdXfTP2bF34Htm8oc3S5ph4FR0COWpUm9cg+atnfj5WbN9DaDLdBbc1onHqWqlqr2hBk9XtRoM9o8nxiLq/jDMZo09rToEMTMkVf24Y8e+mFw==;
	24:OR5x9H17WG3GvN8Qwxi/dHqqcS19PcwwK0g0pohUJQeCaos4C8PW1KgOuISkaJk2gfu/QcYvksCT/Wr/7aksPM1HLLBKIk5p7r/yKuK5r4A=;
	7:cUjtz7aQRBWIeiPmaV7KHLZuFemTgq1aB22cT9ivZ7DodN/Xu2Zbgw0EIyAoukDhgsDFquIIEd1U88oE89Q2xjvNK1Bcqm6iyGvT+99GIMLI4bCc4WqHnlv4brcw5XuFW81quEe1+XeMfIsnRa8W8wMmez0F4Cwg0nXfa7I/vUdE5u/oWNOUucjkvPWCP9nxl//I2Jd9u/qubv0CCm9Q8JSIV5EwcBM5RCD/6QSaOd9me8HI5Q4dvsCMJp5lncHD
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 00:13:14.8440 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT082
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.83
Subject: [Qemu-arm] [PATCH v2 5/6] cadence_gem: Correct indentation
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
X-TUID: 9nnsWFPyM1Pq

Fix up the indentation inside the for loop that was introduced in the previous
patch. This commit is almost empty if viewed using 'git show -w', except for a
few changes that were required to avoid the 80 charecter line limit.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
V2:
 - Conform to 80 chareceter line limit
 - Improve commit message
 - Re-apply based on previous patches

 hw/net/cadence_gem.c | 196 ++++++++++++++++++++++++++-------------------------
 1 file changed, 100 insertions(+), 96 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 28c2ddb..452d072 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1048,117 +1048,121 @@ static void gem_transmit(CadenceGEMState *s)
     total_bytes = 0;
 
     for (q = s->num_priority_queues - 1; q >= 0; q--) {
-    /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr[q];
-
-    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-    cpu_physical_memory_read(packet_desc_addr,
-                             (uint8_t *)desc, sizeof(desc));
-    /* Handle all descriptors owned by hardware */
-    while (tx_desc_get_used(desc) == 0) {
+        /* read current descriptor */
+        packet_desc_addr = s->tx_desc_addr[q];
 
-        /* Do nothing if transmit is not enabled. */
-        if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
-            return;
-        }
-        print_gem_tx_desc(desc, q);
-
-        /* The real hardware would eat this (and possibly crash).
-         * For QEMU let's lend a helping hand.
-         */
-        if ((tx_desc_get_buffer(desc) == 0) ||
-            (tx_desc_get_length(desc) == 0)) {
-            DB_PRINT("Invalid TX descriptor @ 0x%x\n",
-                     (unsigned)packet_desc_addr);
-            break;
-        }
-
-        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_packet)) {
-            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0x%x\n",
-                     (unsigned)packet_desc_addr,
-                     (unsigned)tx_desc_get_length(desc),
-                     sizeof(tx_packet) - (p - tx_packet));
-            break;
-        }
-
-        /* Gather this fragment of the packet from "dma memory" to our contig.
-         * buffer.
-         */
-        cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
-                                 tx_desc_get_length(desc));
-        p += tx_desc_get_length(desc);
-        total_bytes += tx_desc_get_length(desc);
+        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
+        cpu_physical_memory_read(packet_desc_addr,
+                                 (uint8_t *)desc, sizeof(desc));
+        /* Handle all descriptors owned by hardware */
+        while (tx_desc_get_used(desc) == 0) {
 
-        /* Last descriptor for this packet; hand the whole thing off */
-        if (tx_desc_get_last(desc)) {
-            unsigned    desc_first[2];
+            /* Do nothing if transmit is not enabled. */
+            if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
+                return;
+            }
+            print_gem_tx_desc(desc, q);
 
-            /* Modify the 1st descriptor of this packet to be owned by
-             * the processor.
+            /* The real hardware would eat this (and possibly crash).
+             * For QEMU let's lend a helping hand.
              */
-            cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
-                                     sizeof(desc_first));
-            tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
-                                      sizeof(desc_first));
-            /* Advance the hardware current descriptor past this packet */
-            if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
-            } else {
-                s->tx_desc_addr[q] = packet_desc_addr + 8;
+            if ((tx_desc_get_buffer(desc) == 0) ||
+                (tx_desc_get_length(desc) == 0)) {
+                DB_PRINT("Invalid TX descriptor @ 0x%x\n",
+                         (unsigned)packet_desc_addr);
+                break;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
-
-            s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
-            s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
 
-            /* Update queue interrupt status */
-            if (s->num_priority_queues) {
-                s->regs[GEM_INT_Q1_STATUS + q] |=
-                        GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
+            if (tx_desc_get_length(desc) > sizeof(tx_packet) -
+                                               (p - tx_packet)) {
+                DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
+                         "0x%x\n", (unsigned)packet_desc_addr,
+                         (unsigned)tx_desc_get_length(desc),
+                         sizeof(tx_packet) - (p - tx_packet));
+                break;
             }
 
-            /* Handle interrupt consequences */
-            gem_update_int_status(s);
-
-            /* Is checksum offload enabled? */
-            if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
-                net_checksum_calculate(tx_packet, total_bytes);
+            /* Gather this fragment of the packet from "dma memory" to our
+             * contig buffer.
+             */
+            cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
+                                     tx_desc_get_length(desc));
+            p += tx_desc_get_length(desc);
+            total_bytes += tx_desc_get_length(desc);
+
+            /* Last descriptor for this packet; hand the whole thing off */
+            if (tx_desc_get_last(desc)) {
+                unsigned    desc_first[2];
+
+                /* Modify the 1st descriptor of this packet to be owned by
+                 * the processor.
+                 */
+                cpu_physical_memory_read(s->tx_desc_addr[q],
+                                         (uint8_t *)desc_first,
+                                         sizeof(desc_first));
+                tx_desc_set_used(desc_first);
+                cpu_physical_memory_write(s->tx_desc_addr[q],
+                                          (uint8_t *)desc_first,
+                                          sizeof(desc_first));
+                /* Advance the hardware current descriptor past this packet */
+                if (tx_desc_get_wrap(desc)) {
+                    s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
+                } else {
+                    s->tx_desc_addr[q] = packet_desc_addr + 8;
+                }
+                DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
+
+                s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
+                s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
+
+                /* Update queue interrupt status */
+                if (s->num_priority_queues) {
+                    s->regs[GEM_INT_Q1_STATUS + q] |=
+                            GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
+                }
+
+                /* Handle interrupt consequences */
+                gem_update_int_status(s);
+
+                /* Is checksum offload enabled? */
+                if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
+                    net_checksum_calculate(tx_packet, total_bytes);
+                }
+
+                /* Update MAC statistics */
+                gem_transmit_updatestats(s, tx_packet, total_bytes);
+
+                /* Send the packet somewhere */
+                if (s->phy_loop || (s->regs[GEM_NWCTRL] &
+                                    GEM_NWCTRL_LOCALLOOP)) {
+                    gem_receive(qemu_get_queue(s->nic), tx_packet, total_bytes);
+                } else {
+                    qemu_send_packet(qemu_get_queue(s->nic), tx_packet,
+                                     total_bytes);
+                }
+
+                /* Prepare for next packet */
+                p = tx_packet;
+                total_bytes = 0;
             }
 
-            /* Update MAC statistics */
-            gem_transmit_updatestats(s, tx_packet, total_bytes);
-
-            /* Send the packet somewhere */
-            if (s->phy_loop || (s->regs[GEM_NWCTRL] & GEM_NWCTRL_LOCALLOOP)) {
-                gem_receive(qemu_get_queue(s->nic), tx_packet, total_bytes);
+            /* read next descriptor */
+            if (tx_desc_get_wrap(desc)) {
+                tx_desc_set_last(desc);
+                packet_desc_addr = s->regs[GEM_TXQBASE];
             } else {
-                qemu_send_packet(qemu_get_queue(s->nic), tx_packet,
-                                 total_bytes);
+                packet_desc_addr += 8;
             }
-
-            /* Prepare for next packet */
-            p = tx_packet;
-            total_bytes = 0;
+            DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
+            cpu_physical_memory_read(packet_desc_addr,
+                                     (uint8_t *)desc, sizeof(desc));
         }
 
-        /* read next descriptor */
-        if (tx_desc_get_wrap(desc)) {
-            tx_desc_set_last(desc);
-            packet_desc_addr = s->regs[GEM_TXQBASE];
-        } else {
-            packet_desc_addr += 8;
+        if (tx_desc_get_used(desc)) {
+            s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_USED;
+            s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
+            gem_update_int_status(s);
         }
-        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-        cpu_physical_memory_read(packet_desc_addr,
-                                 (uint8_t *)desc, sizeof(desc));
-    }
-
-    if (tx_desc_get_used(desc)) {
-        s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_USED;
-        s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
-        gem_update_int_status(s);
-    }
     }
 }
 
-- 
2.7.4

