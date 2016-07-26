Received: by 10.25.21.156 with SMTP id 28csp1863456lfv;
        Tue, 26 Jul 2016 11:31:21 -0700 (PDT)
X-Received: by 10.55.12.1 with SMTP id 1mr30206734qkm.136.1469557880971;
        Tue, 26 Jul 2016 11:31:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p41si1244797qtc.147.2016.07.26.11.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 11:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS78S-0005bS-6P
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 14:31:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73t-0001J1-1U
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73o-0006N0-KM
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:36 -0400
Received: from mail-sn1nam02on0075.outbound.protection.outlook.com
	([104.47.36.75]:18365
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73o-0006Mn-8k; Tue, 26 Jul 2016 14:26:32 -0400
Received: from CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
	(10.152.74.51) by CY1NAM02HT216.eop-nam02.prod.protection.outlook.com
	(10.152.74.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 18:26:30 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT016.mail.protection.outlook.com (10.152.75.164) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 18:26:30 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52084
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73l-0003qu-DP; Tue, 26 Jul 2016 11:26:29 -0700
Received: from [127.0.0.1] (port=57371 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73l-0006OE-BA; Tue, 26 Jul 2016 11:26:29 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6QIJiFd016376; Tue, 26 Jul 2016 11:19:44 -0700
Received: from [172.19.74.182] (port=41282 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73k-0006OB-HE; Tue, 26 Jul 2016 11:26:28 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Tue, 26 Jul 2016 11:25:58 -0700
Message-ID: <3c9804d1c3d4c0a420b9314f0636991b35a76987.1469556788.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469556788.git.alistair.francis@xilinx.com>
References: <cover.1469556788.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22474.005
X-TM-AS-Result: No--7.060-7.0-31-10
X-imss-scan-details: No--7.060-7.0-31-10
X-TMASE-MatchedRID: NqUYE3Jzbv8dsKV+lYHQBqOONuzwygtGmyqQJWNsukn/evmlVf9xZvp9
	YdWlfxDykKaVbA4S4D3c8+FPg1rJdhLmJd2F/yFu4pdq9sdj8LUSNRDlFTpYkvNhzIgXtFJVibw
	HCxoXFpesrpv7ZGx0TfmRngQJRUJwi9Om4SO4imTThGbP9qB93BPbyBtwZTa9RQ0dAChl/lwxBh
	Y3mcMkVIeOUtXkXvGMeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPBVxYUwfvqMpx67g
	4dLRmRnjb9Nq/BX8Ch617D4o5aohsdLFNEgDIsW
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(85426001)(4326007)(50986999)(92566002)(64026002)(19580405001)(19580395003)(586003)(50466002)(76176999)(11100500001)(71366001)(33646002)(50226002)(2906002)(48376002)(47776003)(36756003)(8936002)(87936001)(81156014)(5003600100003)(2950100001)(5001770100001)(106466001)(105606002)(189998001)(356003)(7696003)(9786002)(8676002)(77096005)(7846002)(81166006)(86362001)(118296001)(5003940100001)(305945005)(229853001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT216; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT016;
	1:JQGNKL4j3FbbbLZuw96QpyMr34AkFgzw+WtOHM33O1r34vgKKh9qXYHvneVaulPXOWifXsMnM6Cz29/pUZzk56JeoJWdGZNJrOanExpW3aTklmWKGNdEpzuFXDtJmrbsv5dRVuyIkDGiEn7HGWXpJnTmUbt0YrEyRWuFDGaIxVjFXqhQQwUQvXuzH3fbY3lXKcb+eXPQTdnc9Aq2caBHeyqY9Q2yn4jBCgTmGdMRtkU94tKBR6vq4syzM/8PWF3Io6Zp80WZsUDEiT5vwUNhT1MVIx9qEeIezHk3+/tYHf/mXEbqibskqsQl5z58b62kLFxqI38jYZa9BAux3nR365o2OF6+VtfnWOTzkhWhXcggySYDc0YP+gnHnFHpMsFseTJ5tR9yUHTKYm2cuDwg0ih0BYl6fr8AvRJv3rUQ9qSCrUo1EKJTbdi/Jh0gWcZ7l4oN5pbYrku9V6AAj0tgrJrBdYwKVZETaJuXuAstnfML3GWb9r/XGIvZYhWA81qdwsQNY+W65TbO1YGCqvO7yhdWrGNo7EOZmOouuVGdQUqEqj+nwYKNQaZCSi7DaUJYeY8G7x3uqC5l4twPTknoU1fhKcH0B8pUweWzdpUFaZk=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c3a283b4-6dc1-4e76-74f5-08d3b5825d52
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT216;
	2:IWkip1kO3sn/KzWtnoUQIGr4VO3o1mLJb7gPcDTMZ/UDqU2QcEv4drboi8X6SB6nslz0L4nmyAW5Mhw5/EiB5OSMyKluv+mrnC2cUrC+7HTsF2xm/WikXoSMB32Updq8S/HsbrpkbQ9uC+yrGrma4Uw+MZuUVPDOKPSpL8+9sn8zBBCLvxM4n2f9QtNsHF2W;
	3:+9fWV76uqED1G+SGO51W3OrCibHDMiU3gl3SFniS/75FSh8AbkObgpJb5MtrlP2d1MrjLuY9nozVMgnZcZOhOKdzWuTTVXanJBhdzVCvWEe3jJOFWL4vE+Pyx5V2uOg8ZJdh33GtnohcrDLrrokF06Ilfqh37m30BVJmh5pPG4TxgEKaHCAMet8m0A9EdVlAx04HAbKPL3HsxP7gWp795cMUPhbllpFZnZbrQzo8F4M=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT216;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT216;
	25:WRaNY0w2mvcguc8uWYmCAeXNPtuqHEx2Xn4P0WJNu0dQny0DzfkM70cTT3xJaABywmzy7FlqdPzfbrjmfcit8Cx3SZ0jjiTFf/IVAVpltuPQAZ/5za6t6cg1eqY0xHPPRSVsXKKUIBAAr3F04+B3GvhX3TX1xIiyzHnmFJ1bkdMB4a3097A2FLWX3p9smdQV/svOdHWorND5UaKSsUu6am0L8d1D4p6IqMODxYMQ2fahqaq6roRu+DuzRVad7A4j0/2f9X24bYELbWCMsGOs0kbCVYINGShZophqGVWNLWRGO6NnTtQevL4JJTOdWTfgmxN2j3qLpWuPoQ6PWmVRxNUkl12rZKDO4gtDcZuh1OHXQWa00piOd75RZke9S5nvTV5Jn8l1KnihxyR0L20MadL1L2bUbDJAHI/EuEpHX5KV0vGmqXNn+idJfS7PIR9z4PRmiUAqvcDgBd4iNCWMvo2WosQ9DF9L5UzsUs85rH4+sCJIwvdUBlbxR1WkPtWV1QZJk/+ZSB1OD48UcnmiN2ZnqmJ2KM49qrAJoyvGZDoYUjw1FsuthsnWSfycjQXlGk3RERoie5NI3Ehn4IPgiw88SCypFEeYNZDDQVXiEWPDuhj8qZWvxpApo+kssYQ4Y2qwy/8rWR74R5PF0FbQwZhXUFcIA2VHAK836Ivoz/1zSuA23TubT7LjZGHeijHnEVxngcpU3Fl9ofq0KvfETlBY4WxtP+pBdxX2rMrj1wQR6xbVTxBzJgNhe8fvcZf7gI8rea7NuIjUYEb1Ee2KeKP26OHwsTURM4Q74c25GzkFHt6TP1wou9OgHPG0O/rW
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT216;
	31:0zDtr6ZVNFtM0tNgjddMf89oDyYQeovr+L84fd/jWr/wwdxQRM7Feg+HLnbT0Exmv5rL0TUte8j1pENBfVZHdd2mHD/99VyMFwMyIM0HglnjEsNlSRPoXdr4eeQtVwubw535f6jbFFS2GC4SpWxvuLwiq89VNZNQDTTor5mUi/5ey+JJozsLpwiMWRHp1YqkpDKawad5Nh/vCMUgvdctj3VHNoi+MaKY7k9eSKecNtc=;
	20:QzJN/ONM6PzROODLuBQ1iBXLLF4XnQYP33l4MaVrxA6QAP40JdO+Xfs50N3jch3VVQgV1e07+k4P3MZbxC88g/7cIWZNQI2xv4GT05xpfzyAGTa264/vp84/NycwnYP9yipBa4VG4z6TLa8tM6Hwm06Ef542+TvQodobhhqQt4srTzbkd6DbaEhoNIBPukiPMKvAnlbuqkB8IqoBX32W9dTB9+AfM6mefvMZMWjTg6RRJL6F9wRJrh2bCwI8XzJgER+STUt7KLNkQ1XmzAt3wYtT3zsrrAhF7U30Xu7nXkAg4gk5sn8S/BbJNNnmAdUFsFWA8f5LWJiDO1hb8ceRGv+UDVQoiw1LQUfqcbwtb7Cdpol4LEBCHmtGpAXmRJd0zehCCunA+MrgZ68zlFxkZzYN6ChArnyYZcujIZqgeg+rKwnmaQSyteDpIfkqDpFTdVMmnGoTnvpYKrcUMDOncc41Ev0dACZwJ2n/XBAski6OZR5MB1f14Bmk+7j6XerT
X-Microsoft-Antispam-PRVS: <171b300b07ec4dd6a5565ab730676ea1@CY1NAM02HT216.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(5005006)(13017025)(13023025)(13015025)(13018025)(13024025)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT216; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT216; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT216;
	4:2Jvmj97qm6YJ4GvL5c8a5tnR/lRXfqZdL6NCkCBEHPrS42wohOZWfuxxc3sHaLjKDzqrzXeFTFTob7N0UOdlM4VPHZ6UF+k0ckpR2x2EP1CJ08sDncP08a4lPddD6iC5DQeGUDu8nz6ygfeZtyfgFjUS97ruqPbWRcDq/p+0ImnpjQmNOwnPronHtHZlXIZCnn1I/SVcbUum3zUedI5rHsexWG2KMBI8J6XCxZ09NnAspz0ie3AqM55vz9prvfl1+yQUNNqK+Rxk3QrG64EHpA+hNzY/EIkGNHrL8ClY67GjE2ev7P8aZrlN4s+/5POC6J2TX7SiOD0pn6uGrYjKhkqDMOIaU7uXsUUObyBw6Si1Ba4iRM/f+QUODQWa81SYvCAXElw33Amn4kBM3zXoaQbVYPZc2AP57B2eew6G6ESd14TSPFYUgky41FwHc6p+VHf7wVcXs73xRUyCFZAjKexUA8vNWBbTKFx2BiryZmYNSw4Rbdrk8JG2ACcYm2yOuy0X+F9em+GO7Xoqx0toKg0ZxM6Ftq0coQ0gowSpQMG+m/N7T9w1Z7+rez2z9kEVwax9WCvaoloExOsuV154lA==
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT216;
	23:3q22qjNBFMHbAnuzxct3cKUqB2IPZ2OOdEXtMcsK7?=
	=?us-ascii?Q?UX591CHRocr4vQSkseVQNxwkuA+TIBCA2rDab75uUBPu3AD2SIg8Adu8Y+7X?=
	=?us-ascii?Q?OZNuMIha1yz1eDeeCr2KdrMcL1t8IHQogws8IW3ZrAicWZDv+ujXED0TSPkO?=
	=?us-ascii?Q?OVstsBTl3wKh5/0SPNIoo/c05hdK4bqrONEi10qZZa3maJuai5OHvs3mAO0O?=
	=?us-ascii?Q?IS0poJc2svgNCXL9IIrR+5/knudhnVzo/ujUHEx8CxtnOBdke2tbO4AuXWaE?=
	=?us-ascii?Q?ueuRXCRtzQ+ZNG5n4cfni46kabNkUd8K0x5t3gKTLcLlfb8YOljiFZtZ7BTA?=
	=?us-ascii?Q?ln2XxpL/tkyK740WoatzyLuR+AbfUnaKt+v5ke5xSDSwRFl+6/lhvCUhL6Q2?=
	=?us-ascii?Q?B7DXiKzFEieIOfKSGWIk8NR3r0i44Bz07akYy7dlRc9BJKc3B4ZAsygPjWG7?=
	=?us-ascii?Q?rrI0mm0xq/ubRmvPmasU6xsEsvDwIXxhimM2Q6UDz7d+mHEyoCEDz5FGT6ap?=
	=?us-ascii?Q?5d+J+Rhm+wtrmIQ+9aKIUxMEP3fX1hTwxQ7K359vPFQDnfPTlPpcSuHySW3Q?=
	=?us-ascii?Q?/caLb+8ELT6SLBKB+blY69wo76wlwtqZx9FpMcj4p0aO6dKbXqDQ34qonHhL?=
	=?us-ascii?Q?BxEvTQnLMXPWOzNGM4okUEHrIGRufUPcJz/OeVc2Fn1o0lHvsrjqhpOdVyts?=
	=?us-ascii?Q?esB0P8KjhQFUdbYKRwKKJB5q9Kk+MbV7bTpm5F2c9cFvMMYuxxgUpuh8OZdP?=
	=?us-ascii?Q?Syj9ULuISjadaYCkcbsOXmALgHQ7qyqPhKmcX1oypKiRnwldJI4+ZWGYTNup?=
	=?us-ascii?Q?qbzZaYOuGehi7uSNKWGlTSbQXK+1g2/gy6RrjHiv8RAyazcAeWQNh/hZrJSq?=
	=?us-ascii?Q?5TLz9TaFnSM2Z2MRhdZ1wCUw+QSk1LKBuehapqBYFp/Xr456uMo8BapIkNPp?=
	=?us-ascii?Q?0wB/alT2bANqVEExFZhfDZHbZZXaowP1zZhD3Xqsa6gWQTM0ic9uA+Zjp14c?=
	=?us-ascii?Q?LZCJYwo7IeBxqVab/J7Qw/y09axWHOG3FhHSZCuQpdhLYxY8bIOnKriG47uN?=
	=?us-ascii?Q?vCDzx7/FMSBr1zMNm040VC/bpifPy15cugwEEzX+NQm+kbAuSMxu4+MwaSt6?=
	=?us-ascii?Q?AbZS08cE1avPdG4evRux63zGzz/QLUn9OS7cXTATcVbxfKBdOED79HlFbrnD?=
	=?us-ascii?Q?1r9AI4Ocbi8kWwwZT3lasUdcNwtwkofMjme?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT216;
	6:dKY8YPw7WK+biEp/E2jDiytaBnu/IThQUK3KYFFMwNGJ5FTz4cNJnrZtjO6y0URPSb4QwsUuNgLW9v1xmaQAnbnHVOAb/74zlJGI2gZzmC/U4ET1sgQCLm3PSrxozwG0anzMvkvpvmO4n0vj9HXPnYpmc3ho6mZtBVNYpUzbL8McdRXmokVMSPJoyK+jOkYtoXfrD7sjZoBAUpA1axCgdxI1KC+ip+bSY4IViqyLNdYHyUee7lPNoQCaHLnuekSHjZGxx+C2Wu15YW5DRFvmAUxlUYuZklSC00ZO2vroAPxAobNFna01Cl49OddU4CTWA8saueZZJ7yxjW0tWGxiYg==;
	5:glduwbfr6kRbATeamlYniy5OJrDdJ1RPM74pDFNjqpatAHbrhreOLJcyGSSxepjcgPEOnsC6ZNW46plYqLwWjilIoGsBaRlrB+DfoZCjIn8mxxyvXWrkd13CEYV3ydN1MLHXxF/ImHot6FJZHtQnRw==;
	24:nBJGYt5FcZmLue3sqKFAC3hNtnPJmGX6+lfLADYGusJAprNaTondEhbMdpyjOLcNCxklhjx+w7yEAt90RcazYQREBkmnQj2iGR7ffWrmAb4=;
	7:bHBOf8eI/ongo7+PnVd5Et15rtwp2I6JJMfybnd1IEA0nMgxNaXKK3FzXgOD2lFJ6peJKaHeMb7CsLym5ZTW7NvphF1M5fPworlQQ+J5AmyqzbKeWA/sl/Ltd7Ezoj5hsd//hQNAH6D+tkAjOslsmwjoh9Kx3AXedtfjTvTuhKPWnO6pL/58qGge9AAEN8KF9dAi89dJDBud1PMdwbWqwKP5LBg6Jx9Rx6XdI5UhusORLumLj0r5yvbe2aom+T7G
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 18:26:30.1213 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT216
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.75
Subject: [Qemu-arm] [PATCH v3 5/6] cadence_gem: Correct indentation
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
X-TUID: ITZlqKOhV/dT

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

 hw/net/cadence_gem.c | 197 ++++++++++++++++++++++++++-------------------------
 1 file changed, 101 insertions(+), 96 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index c46fff4..8618e7a 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1054,117 +1054,122 @@ static void gem_transmit(CadenceGEMState *s)
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
-
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
+        /* read current descriptor */
+        packet_desc_addr = s->tx_desc_addr[q];
 
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
-            if (s->num_priority_queues > 1) {
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
+                if (s->num_priority_queues > 1) {
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
+                    gem_receive(qemu_get_queue(s->nic), tx_packet,
+                                total_bytes);
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

