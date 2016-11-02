Received: by 10.80.166.35 with SMTP id d32csp224823edc;
        Wed, 2 Nov 2016 09:46:20 -0700 (PDT)
X-Received: by 10.31.10.137 with SMTP id 131mr3128035vkk.5.1478105180185;
        Wed, 02 Nov 2016 09:46:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w75si991842vkh.78.2016.11.02.09.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Nov 2016 09:46:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1yg6-0001Kp-NB
	for alex.bennee@linaro.org; Wed, 02 Nov 2016 12:46:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1ycx-0007ao-AQ
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1yct-0003qi-D0
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:43:03 -0400
Received: from mail-sn1nam01on0049.outbound.protection.outlook.com
	([104.47.32.49]:34807
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1c1yct-0003qP-5T
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PDjjyRN454Qx7VVR3q1wG69y4sDCvLZmQFtNL5C+sOc=;
	b=ZSvoQt7qUmf11kiux0leqkY0810O61KDYLCcuyC6jKSldy9dfwnSkvz7Mo92Ln/AC9XraDBTmQ0Nj7coaP897eYXMTp0c0mKQNYrECfgWzxfaNvUEsPQVRuoUG4GuPNcWmz0wHH8ursJZ5k+BvS7ikH292ENyS0ZdEmuw8FLEW0=
Received: from CY1PR0201CA0030.namprd02.prod.outlook.com (10.163.30.168) by
	BLUPR02MB1233.namprd02.prod.outlook.com (10.163.80.150) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Wed, 2 Nov 2016 16:42:56 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by CY1PR0201CA0030.outlook.office365.com
	(2a01:111:e400:58b9::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.679.12 via
	Frontend Transport; Wed, 2 Nov 2016 16:42:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Wed, 2 Nov 2016 16:42:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycn-000386-B3; Wed, 02 Nov 2016 09:42:53 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycn-00039h-6X; Wed, 02 Nov 2016 09:42:53 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA2GgesK027307; Wed, 2 Nov 2016 09:42:40 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1yca-00037C-JR; Wed, 02 Nov 2016 09:42:40 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 2 Nov 2016 09:41:13 -0700
Message-ID: <1c6a5bd69673d24c8809e7afea401a0b6327d1a9.1477599721.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477599721.git.alistair.francis@xilinx.com>
References: <cover.1477599721.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(48376002)(50226002)(33646002)(356003)(36756003)(2906002)(2950100002)(8936002)(575784001)(5003940100001)(2201001)(5660300001)(50986999)(76176999)(19580395003)(19580405001)(47776003)(626004)(6666003)(586003)(305945005)(7846002)(8676002)(77096005)(189998001)(63266004)(92566002)(106466001)(81166006)(81156014)(229853001)(9786002)(4326007)(50466002)(5001770100001)(87936001)(36386004)(11100500001)(118296001)(41533002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1233; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT004;
	1:qQpoCp5qsf2wq2hIuSS/5qctPphoUMnhZH+0uao0UsYm4spsorDSv8s3c+h/37B75eIqugNb9jMMjqAd4Fgs2wt2z/e/iNxmwUuVTBV0VXDlt+IsXm1LDylh/WRuWTMMQcgYakt+wiE3F6yUbsdHfKoWK1ShWtlcwpsbKNoUl+jEAieXCTrnHFOgdmqNtv1sQ+oxMErApxxNRQgde39H3GvlM8XQoakBZqzNbYCX06TmtMxI9ImwSvOy0u3lT+4dpOH27FsRTNhTA4dwspm4e5CYzBdNqio66BWhpGbiOvsE//IFRbW7XNHYg2ARBNTruAfdzbzpZ/DqrZEEvLUt/E79FtjEOu0TzzgpvXESK1Er+QeiBjh/CE1HDVSAhmWPVf4CVT4a1UO+XkyotiN+W0CLq6BypKz/cs+9zE430iqjkxYzlU7EvvpHrkuiX43vIpl2XMILmpymf2zzg0RO1f+Ed9b3/H6nhCpylc9zIu/jd49693A0bal3/0pUZ+TIz31jhQsLvvS9DCqLhU66aC25G/+0G1ts6qvxbVUCzpmM5HMbzKj5+ba211GtVNvDGeRwCvrRFqRn7MlivnCqhzlMuqBZ241mWP807P+edNM=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 398a7d1d-9277-48d3-cc24-08d4033f4bf2
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1233;
	2:QGn7Nc2T5FhdYYGSaHcpmV5NHzDgdorReLUOijDS6MGCQr1Pz7ru0gwplpWBdmS/QtYRB9UtE/W5Xa9bsfE/sZVW5SDNoTQH/2/RjqHCrovnSdN6DhatQH7sjdwU+We1XOGe08mQNXWVVfURoHC/iyPRVxBpRK4rxyNPe9iCrTOz7aL/Ym5zrqstVYfB04tyCZv42LEcgsh5bxQGHRayTg==;
	3:7A+w+TscZoFdqra9O7hls6PcQ63BBPyL2vDdUre9BU1o+3vmTP04gmIWtQrOLfFPt9Y9RU/h3LfFyRhfgB16WTXyQM/+SpLPYLJXcnBVD2l5CWvY5bvtzP6YW7svOpurfMEKCT008weorvLQWZiTsDu+6cLUsMItAg3zXNgAlln0Pmtmwjze9s6Yj5bMHPxGOW/+WwxwgpFReer1DqXykGVqGmZFWM0DLKGL/jAkRbSxyK2H/lS2oV4QhYbyaNXbMPYhDiLznUHT8XJut95xfwhfIbc7d38v70jO9BikJgs=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BLUPR02MB1233; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1233;
	25:Idf1ElpIzEcr2Gl5r2iHMnLsU5hr7SOFmKYOIDWks/dVf2vIX5ED5VLUNFbisDsfbm5jKeq11qFGdjo9gcbhFfFdbVnycvfn61EH1j0kuUGITbAIvUazL6oYzkCkOIc/TZwqEEdlfsC7v8jVzcm0mA5zY0LxvrdSD0jW8GzSpzPcjM7IjhiGFHCrT+gPwEqfw11Gj5OvuihFJOG3PGAuJhJa000blP3UB5Xfbw1z+khvGrW679yHSftBc48/64lZmobni2nmOGwyVdduLxM6rzDLW1ZVbpRRF0ZXWEBY/VelQwxieBp+7ErdVMBK20dn1R6pHy1uVlHlyGy8p7oIrNBMg0vsBsjjzx2NR6jjAZimKv/sE1F5zlG5VO+d8N9DcveXy7ijWqjFrxy9zBgY6UGlHxV2C8YAplw8PrmlYt2U0Ppojmsh27O2M4RmJuQwPEl6D4oXFqENRKudaDniLkc1V675Pi7wc+nzrD+YkLB+bktEzABKXeB+Q/yimO3lwPAJh7yvfhUP2e70GEp+LFrNuE3UxWvWQ1VniLURXtyJutUgxsWWxL1xT7Fr+wBH1WgScIjiE5obru06wgniIs+AyY5oTFIdpigZPbCxrIGN0HFqYqkOULEzMeohudY3J2fniyisW4UpojhmFeq/nd1FGU/Z1TECDnMju1R6890gf4uTRVA/yu76dhqWLg+exhy/ilZprPe9n66lk8ko957KUSuUfx99PVCYz5MB081svirjoYMgMuAJ4hk0IoQ8UBD5aPj7noO8FclRzvRFx4mOmxOFlZY3OhdJUlZr/DzA2gNOSL4rLVzWD5GNccOQ
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1233;
	31:7/jMa37a++8qosCm79OY0x0dxs/tBnE0P9wZtgYMMALSP78D++A9060GodNGTsq9L+OcyWg+3mYs5lqF2+aDtggsoaxfCVyHQUux6ge9H1ESJpGWTVvP1EviSwZTIPyQr8o/Avq0GeNT61Jz9zYdC6Bbu1K7Q6CR8gTT2M8u+UrFFaP+BE19LTL8bNQV2LSl5TV1phCU/0LVcIG8OYeW0khSdiAWKE1DJ0Iz0ABo91z1B19l38ck2MrNOXVBQHiI;
	20:RH0hm/aS5JpJbU8hZXA7Eynj7h/hpRftmWRouNS9Wof2lUxG+Oj1fTIh9yYKAnYiKJQbvtOOfuBG5TnsAJBriTB0najl+XUdQyUCDQNaDnuZ41YMlHRnPT8tQAw4YLS1wNu9WlL5mfZpgOhVeG+bNuoLGw0qpFspUW88YslUZZqDGDIdFQTRYI6fKAa+FHc958n7dWY8wv88PfefLBY8FFAnpHxmdLfr4b9U5FUV/APgBLvdm7gNE27Z6acBRKe92d9yAVZfPGm/6nVfBLsE3yzmrsmKvJUVO6cg6KkLmqfT1frl5n9CUkab291RVSEutoYx7E2zi6SiKxUocCWtF6bbI6IWUQ3A9XoWtndC880fj++trT+id0be7OL7MecjTxyjJE1mALLTArjEB5akyHGpRHymu5RUpqLcUYjwBCONBs3lzF1xVO682H+8IiscGU8doiYCG3imOah83tJg6iBgt3+OLTr8DNRVfp1JqedNV4vc4d0RRowVil5xgeqC
X-Microsoft-Antispam-PRVS: <BLUPR02MB12333D4EEE782B9D9BECA4F3DCA00@BLUPR02MB1233.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13015025)(13024025)(13023025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BLUPR02MB1233; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB1233; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1233;
	4:2+cDDBCOIiI+gN/WaaW4TRNIMDLV3w5x0bwWHDs2K16XSqti/AUh6/BYDBtvmCIm5Iau9DsGuVIPrwQCTvU2zzM6BqzfpC6n/KmuxIPKuyVUBcc9HNjIgUS7+08Ui8r6zUmN3kpjP/Oag8Z0lTi35fX+N8t4vphg5f54z/XEqwEyCAwGYtg8KvXlERAHnIrWMuLwlsamQFVKlhVIzR9xM+76CZj9Yc+AdQFT5paPxKdTX2EC3Quko62PB2FOkrGXjzDpg0eV0/hS2ov+gz+K6vp+L0CGZMYGXrfK2yT/tuUB51qfpR0qsWdmVYwnEv6pdK5ODutkUTrqo8H5QDpkgc7YsofGeGop/7BhSI8qkj2Pu76+yDXaLuct4ToVtxbblzluyqdxVa/hb/xB9bdGyLPWM2P1UOzDY6OYP/JopTauTtIv+9wSyt4LPa9LPqlxkTX18p8g7aJISe6t7aVlm5ZvY8si5DFDAh+l+eB9rehD3nDL24Dw39ssanw0HsD588aKFRWdHaf5i0+2gkXTYCM662reie7GGUoJORdeUohiltAV3ZwgIXfB4MHR4ydIow+OZMnXF1vpR6l44nMMSw==
X-Forefront-PRVS: 0114FF88F6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1233;
	23:FlVi4Fauqapasv9Uq464zZGrKZNiFH8TO3mD9WT2W?=
	=?us-ascii?Q?3mktIkVFisTroAgXI3e/RE7XoT7YQPu7nUa3BwzcEWI4tzO5mG4XTLcJ0c6X?=
	=?us-ascii?Q?uEXdJqoH8AVC4NJn7B95hIrEuM6wTbInktmdl+tIlr1Up4iCiBeFnmIFi3BI?=
	=?us-ascii?Q?1eEqlG1VQuWpOL4sl/+7fFcjhYs3l/bXFpq146oog0GURo6lLCB1dnw0ZVu+?=
	=?us-ascii?Q?NCjbyFo8JOFlrowcBpvkHq/KSGSmpCnstTWf/lzF63H9PgK/t907CprfzmD9?=
	=?us-ascii?Q?fZz5oxEpFCgircyVIhElVg30eHbBHYjM0nzuNl15mb2XNoRSjTCxkZqzZYfZ?=
	=?us-ascii?Q?4K3QaMdGLClwzJdZt5GGtO3cuKT1RhAWBqDt7ZdUAsSNmnfiI1Ab11M0YVYP?=
	=?us-ascii?Q?oYvVuUngzTs1q2uwoYBQYQV+plrwznUIV4YjyQqp0R30lxDmxkJVRLcPsRa7?=
	=?us-ascii?Q?3vD0KRdWkVu3Xyez5668PGcR4+akeJFHfyZD3PeYelZAqLgozdPWbPaOaq5d?=
	=?us-ascii?Q?ivHdQZspDBHjmDSi3GqyMfoj1qORA4uWonCSPHomS6YQhMo+UTtnp2nXH9Yq?=
	=?us-ascii?Q?NjzFBfVlxbPxqCP93+RMYNa6a99NUuXiFqzrxI/dyMCL2XZ5R2px+Hoelk0j?=
	=?us-ascii?Q?rhVkqhEIEXVgsBWkV5H9xy1ud/skibFGH99CNDGU3NHCoecLmpoiMP5qkCbH?=
	=?us-ascii?Q?SQqGY/939opneUD545AuemH1fA7/QG3hRuZYx3tjQJyUNhLIXH+WIsReEmlt?=
	=?us-ascii?Q?4WVc/V1v6mnykySxGjQgdakemfaB4O0YjWJiG1GbRqMSdKuWpI1JqzVXeVH3?=
	=?us-ascii?Q?CrS34p8su804lARy4mJ181sMD24INhAelgZkcgn3cBLJqFE6UJ3pxqWiAhuK?=
	=?us-ascii?Q?qZBbffuZI5bgYFQmZYlvff+/9ueOhna8tuS1WmFXr1Mrlnd50BY/emgS6SJ0?=
	=?us-ascii?Q?nz0kPeNjwr9GIBAaK1PA7i2I/czsb6Fsj7ZgsCcJAyVgnSy0IHoQWoUt5RD8?=
	=?us-ascii?Q?BPPlSsS2tEUfQ22baNkryu6KIP5QhHqvyW1/12o4JOzpSeuf7lxkiihawyhY?=
	=?us-ascii?Q?QqPrgOlhQCvRV+/EiKbSZEtXbpztvE2Ncg2ZQyVSg9yjm94+FLZwxyaWkBfZ?=
	=?us-ascii?Q?DnLRmtpAESUL0mYyDVK0he0WQ2kQIYO?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1233;
	6:5jQ/cVHlSlufoWnAciSWXXa5T+ol9/hNidhsq9h44Xd6xmt+ztgkjfzlU5PoXm9emxxbU9d2Gb5ZoUq+DnRM75KXPPAoPtUYZJgvyPcOnwuvC8NpF21l/kmHYnELSkkA019gCeb3Y8CuuI8g/jIHc2DC5CwMsu8L9pCaAfEjBimYGIpgIb84UlmYaVdzLXZPuarzOVLvehpJ5ZuhyRLYHBKbg+T264MKxOBlHODxfn/tvqM1yNHOuzOosKPQXLrVGtdfrCIBS0Tm8VZsb9JkkmVjY2QpEZOLtL4Yhnt54mb4mn1bajT8/lfVkF52UibxHCXaR67UkSKGFE2DN7Q01cVkswvJlGD+wAKKuw98h3k=;
	5:P3DWXMLpGGw2Ou7aQ22fOG/qMN9wZPvnTPWAPCRhtvm5pqAqL/0WMdCxL0JnSAyIOQKZXLosXZotRTe8psOYxd/lgOks64ugSQJNhsGHsBKsWXXtLpJK4qiTwgiTAXEt1wpC3Zv4MmIE9yrKpX85Rg==;
	24:ta9QJObLmP5inwV9+nxRIalpq+hz73VPgY9tu6GjnEwaybSBE41lP0zLJMM7s+JSF3oXpIyybAbR6bd/vIYBlnRGsXNOpFJOl+iAm4M2IC8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1233;
	7:ibS44fi8PQcGF+DouGMZXYvQL3GMKxPxxCW3D0rK3qJSS5EPfsKLW7TKi3SGLNyXIWwE4DvQkKMefUeNFik176Lwm8Xnrh2Ucwi5BuM2H6H4p9Hk93w1St+WH6TM5hOW20lr3vPHu6IN2937DFxTagakWfrCtsI6ORFQJMi7mONULL/FaS9C7ve3xLBLsTJig0ReUZqwv/TBbT+XorDBipIQuv9Tre5h4y3yXj2nfNcTnycnHvfI6Fp/vxrVyIju99ZSA7QVM16Qp2NsAtJnaypgSfj95I7F0h7dYzWorNZDFcYuk3dC7kKCZA7rCMmC+uVmDl1Gq4XXsB0sAJ+Wrpqo+mJWzuH6Ozla3162OyI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2016 16:42:54.1858 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1233
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.49
Subject: [Qemu-devel] [PATCH v1 2/2] xlnx-zynqmp: Connect the ARM Generic
 Timer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pNiEcKjEwYyS

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zynqmp.c         | 13 +++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 0d86ba3..43c68c5 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -38,6 +38,8 @@
 #define SATA_ADDR           0xFD0C0000
 #define SATA_NUM_PORTS      2
 
+#define ARM_GEN_TIMER_ADDR  0xFF260000
+
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
 
@@ -172,6 +174,10 @@ static void xlnx_zynqmp_init(Object *obj)
         qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
     }
 
+    object_initialize(&s->arm_gen_timer, sizeof(s->arm_gen_timer),
+                      TYPE_ARM_GEN_TIMER);
+    qdev_set_parent_bus(DEVICE(&s->arm_gen_timer), sysbus_get_default());
+
     object_initialize(&s->dp, sizeof(s->dp), TYPE_XLNX_DP);
     qdev_set_parent_bus(DEVICE(&s->dp), sysbus_get_default());
 
@@ -405,6 +411,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         g_free(bus_name);
     }
 
+    object_property_set_bool(OBJECT(&s->arm_gen_timer), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->arm_gen_timer), 0, ARM_GEN_TIMER_ADDR);
+
     object_property_set_bool(OBJECT(&s->dp), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c2931bf..8deabb4 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -26,6 +26,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/xilinx_spips.h"
+#include "hw/timer/arm_generic_timer.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "hw/display/xlnx_dp.h"
 
@@ -83,6 +84,7 @@ typedef struct XlnxZynqMPState {
     SysbusAHCIState sata;
     SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
+    ARMGenTimer arm_gen_timer;
     XlnxDPState dp;
     XlnxDPDMAState dpdma;
 
-- 
2.7.4

