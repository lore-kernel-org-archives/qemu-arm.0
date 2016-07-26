Received: by 10.25.21.156 with SMTP id 28csp1861493lfv;
        Tue, 26 Jul 2016 11:26:43 -0700 (PDT)
X-Received: by 10.55.152.135 with SMTP id a129mr30207782qke.199.1469557602970;
        Tue, 26 Jul 2016 11:26:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o72si1241510qko.183.2016.07.26.11.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 11:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS73y-0001Js-94
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 14:26:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73p-0001FL-UN
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bS73k-0006LQ-RK
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 14:26:32 -0400
Received: from mail-cys01nam02on0046.outbound.protection.outlook.com
	([104.47.37.46]:17052
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73k-0006L6-E2; Tue, 26 Jul 2016 14:26:28 -0400
Received: from SN1NAM02FT017.eop-nam02.prod.protection.outlook.com
	(10.152.72.56) by SN1NAM02HT093.eop-nam02.prod.protection.outlook.com
	(10.152.73.228) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 18:26:25 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT017.mail.protection.outlook.com (10.152.72.115) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 18:26:25 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52071
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73g-0003qo-H1; Tue, 26 Jul 2016 11:26:24 -0700
Received: from [127.0.0.1] (port=57358 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73g-0006Nx-Ei; Tue, 26 Jul 2016 11:26:24 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6QIJdI2016356; Tue, 26 Jul 2016 11:19:39 -0700
Received: from [172.19.74.182] (port=41262 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bS73f-0006Nu-KH; Tue, 26 Jul 2016 11:26:23 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Tue, 26 Jul 2016 11:25:53 -0700
Message-ID: <63be0e09e7c97bea2f93480bf3b6e8c2e8031ca9.1469556788.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469556788.git.alistair.francis@xilinx.com>
References: <cover.1469556788.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22474.005
X-TM-AS-Result: No--12.581-7.0-31-10
X-imss-scan-details: No--12.581-7.0-31-10
X-TMASE-MatchedRID: c4RrgQdZQCL3Zb7NlHCdGMnUT+eskUQP7h2RrsKOiu1cKZwALwMGs0Ge
	sM6GkoIPW9Qf37gKneG2hwqmyYJpC/ODF/uDniiDl1zsjZ1/6ayMQpgQPLQoYAZbeEWcL03VNuY
	EC38PioHuDHkp6eu+bNsIe/TXUbL1oRIL3xWcnX6RVQzJVQpFnl/KLhhqzeBNOdl/GMFVBFuXBZ
	/v/hLIO7UJIXSL2QBnKZ5A1yYCsKXp+5uxX4D6T0f49ONH0RaS3g3xD6V0LtQ3Z3efQH+wjz3sC
	PO/aaV2flPNzZKhLypo0/D0AFzofq5cUNmsH5nrHcQQBuf4ZFvoatYL/ATKmAv/nTOPQovsqr33
	S5c4Ygmw+s7Ws6WBadlYmtBNW3IbQyNrw2ay5cYMH4SsGvRsAxFT1oHuC4UPOT6W+XN+xadynC+
	RoYX/O+LzNWBegCW2wgn7iDBesS0gBwKKRHe+rxuKram7FZ8paaWhPT4jqsolx9O9z7GquAI7hS
	wirTEOx2sHjlTu3PA=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(50466002)(64026002)(47776003)(189998001)(2950100001)(105606002)(50986999)(76176999)(7846002)(2906002)(118296001)(106466001)(8676002)(9786002)(356003)(87936001)(5003600100003)(71366001)(7696003)(77096005)(305945005)(5003940100001)(85426001)(5001770100001)(229853001)(36756003)(86362001)(81156014)(81166006)(4326007)(11100500001)(92566002)(8936002)(48376002)(50226002)(586003)(19580395003)(19580405001)(33646002)(461764006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT093; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT017;
	1:eNGaSAwtw+Ce2LnDQRL23qHUpg7d3pM2xvz6fvgeEvaqV86Zt1zwxQFWEhsy2ZA4/KAkFvXopln9B5eZ419+Y3GWKgWQbmQyv8VnqTht0q97fKdWJ1Q41cd2MeRDD1yIc6hWZZlM8vpKckbCYK1lXbNLmGUKErvatt5uQ470uqq2P6A4piVi72sgvb+pXKcdg95QVlF3lwe/nIiPrdDjTQsF4928Q/slcryxtCMb2OPH3epiIJmFdqRFFylnldKdsCGEHnLFZRP4mkd1EPfUYIzyuQbPrup5VuprxNnPNGAkgoDcr/zvOx007Cw/FM0v1znKXRNGIFPg1nOgAFL8M94Jsz2HaZyDOU3mYhssUPcTboFx4Y7WTR2DpQ1xY9MpzWQ3BNr9zBTf+SCkENJxz58FDsancu5+QWe5z2eyyJ4Yoob4MDL9xOBy8u4iEwk5B7STvJjz9hCQ6TwrTN6Aha79f7ybGgJluMBKmBhYXM42yRJre8q1OgUrBjF61BGGMqdvqYYNcl+H+P/qYIIapoSpQXbsc2KvL8geE/NJon+floZdYwl5jvDy8YBC3R/ZQfSONmLm37uvHQ0P7ZTRXjk5GtL95bj+29FzGiTUjj0=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b54dcb79-acd5-4eb0-48a9-08d3b5825a36
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT093;
	2:O6fpi416uZIpW1pnlfT4Lk0jUZI3GTMM8Cclj5E4MbjBc5rc0m3r6UH5fejul/OOSxAAE3nHlJQDsp1nfGNx6yogx5CAkPCWBnysw0CfxQ5NiyVNdHiWOo9zBMxSEi5/vEYF/UM6AryG7qzTfLAiMAA1nMcI++Hk/J+aJ3Ocaw8ROspKlswZELf1WFcu7g1n;
	3:M++CE5o7ib21KUBWn7Qm9rzKSgT+vBiJQW59kSEx6fBkpYl5+FQgwRllGpj9miQKqk7R9r/BKDvkF9E8+2wd8Ce2PWH8Z4zS0FEOA2uYBPzgoR/AS1LwZhSo0fkrc4bRjdD5iYGF7PHnNZzclmdwEzBlQSyo9oXu9991NMwclU6X9XQwwYg1EpwhC/8qeKXDNCsE+KyLF6MaNHTA7rhPJ3HtbQvf6yD7kcp5ZSCWM1Y=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT093;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT093;
	25:5ZB4MivVnCoBtPaCAvDhugmiF62W264btovt1i5CQV7JOSj4mM51aQtfpbd+CNlGX9qoMrbAYnHWTOJ5CTaWxAdTGH+JyvzPNsejslzeo2XlIi5DOBLWWPag41rsBhc9aY19ARFoEACCNb/LbyrUgLFdorLdEbyZ1kTYMjURagjeWYXqLHmp9fEQzVOrpdaeoKRdZD2xYnJj3OIAj6tJB83UXmvhJto/IJueZWOytEfAroc1wtcC88axvs+YBbO57Kz5QLBCFIa6emsVEuRNTQP0WCC4/pZU3a/UTR8DLrYrZHxPW0YKSgYfXM+sPeqHtfK2AGVqAiKTsKHxCb2r1cvMuFC/7m9SSutOpUnqTN3HS0kw2N6DozTPYQZJcyq4sAMbYS4cllFCXNSEAHl64H/vm10MpEn1c9Y7iRKCDOhyKMM23bUWZoGSFGuBPkg9U+qx5p+b6dKsfIrfU8adj7Vzy1o+Ij+s7pizzYEq7zg0eXtvjmtT6LxwjKJsrUzrOzH4jCIBzsFNgZRcOWDoiHVVMmyE/eD7f20iSGCcSWpNkXWmGS6UowFcsrHyANJlhaPdhjGR7l7GykIlPmQkm41YCkZCJq+g9vZCgadtdaIGfl9JozWcSk7wq/sAbNG7RT0LgUe7enAhydpVbql4Zc/tv4u63g3H3qNl1K0aBbzF13/Jo8kwSj/f3F9I0Z+7+q5+Fc95pZMFFrMru0sFRwS7SJEg/x282Fv2U00mJRuOcqmdMtKkmaRsXLLaKsmRcchkpePPqslhLk//846mlA==
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT093;
	31:tJ1I5L8RLNSGPRyGUrr/A8gau2uOK9GjADRyl6RrgVMl9YcwZ+1lF3ZG3cMD7LvX3/c1r7DEn6iDwbbtouCWzpkC0d3JY+pjCuI6aB3VtgcJ2YGvX8unWqYxWBoDd9MjUXXQxtpm0tNp1hLpsMDRz/TS67+/dzdCVT92mCaHX8/br0MFXVJylx6/OUFqgaWt1dJrp3ZjOyl/V4bUUCAzR+zpb0F04hlkTln2Nf3VSV0=;
	20:WIEp/cLOpuEyHa+firPaaBX/fQula42QDQgWgFZRDDp8ZkdkiNlkgH0rNxtVjOIeivq4Vm7YDOmFxCRucB2X47e2nviZYxKeHnJqn8VnMI7mbjY3pFVtGLkbWy7M/RAvIDZ0vl0vXgHIEoiUml6sizWgqHKb3B8ayDa3Tsv8xK7Xb71bkpXjZ36mRPbMotn5DPaH2w0KuJ89Nw1qCEGtuYzWlldn8uYlc8qxCb7ussJ2MGryLIlCu/UeJ+x0Zr/mpePs3Y9LYtJ3CM9vYs9PJnc50Ty2xqc0wnuj1X1w7wM3DPoAreVXolYQP/XZ5cQ9SMgiLYOLyKC7HauCvGVqvvBIXTCxrKZY2MM6HJEqyeu/+OOZ1IPrvH+XdMbFgUWFpBGetp2UXQyEG94EtUMntcHdYCG6RifyFvBNy+c3q5MKAvRzdGqonnyYS3RgklTq7afsICPmxHG4IqHhHaBBKMiJHgC+tnpsKF1br/23znRKrSETGfVxgWaj2exnZlF/
X-Microsoft-Antispam-PRVS: <0d02c3db18d7414089008e10f9e1d03b@SN1NAM02HT093.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13015025)(13017025)(13023025)(13018025)(13024025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT093; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT093; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT093;
	4:qifxDj2v3S8JfAf/pYRnybPNISbRedAx/eSixJpJGcJzSnxdlNAB7VUsRxsunxoympj3ARdIRyPjqFaojDedHZ500KN0ymvpBkWU4D9SucA3Xd0jNqYAWIv8WAU4atuGFZz6UewtfftUlfNgu8yEXePFbeC7vhCjg9/2aY29LKVnzEGtRjPDoJd/NRxFXwTzyc99UDsIFRPq96rrjLmTabrrd9CwS0pNAEl5An162a1DBKoUJ5hz7UGfwahG0VtsQD5HpBk+i8LU/ByPTd0kAcFboDi4PIZBszw8VpZzDUSHpvIwCvB57FjKzEn78fa6NyrvtnwSQIsZRObFFG8DVrnphCA+L0qy9Q/wWgid+K15mdMODEFMXEGLMXqCN4M7MaWiM1F4da1eXpzezTfiNXOUitPbGHE+IREQOr+X9LctgYuulxUQN8ShUnQW3eRkt64bnOmiJHKU7bJNBE2SHmQucLOCQ7ftTbI1HsO0sIzeVybB1j/PkY9uEOTcgA05vVbIJAF5pyqWi4s193RZ9fdIE3u1jb8xt7f8Y9SphuM=
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT093;
	23:jGuAjWO9q67NS+1DlKZfq9JGYJjNYiv2J1buIFDv7?=
	=?us-ascii?Q?EpbnnDYhZLzs/53PVSusqqAIS+6Cg6GTV9mD3SoW3rln2KG8Jgb9XefVHM0K?=
	=?us-ascii?Q?/Hf3f2sYIuGBWGXnG5iuMwn6bWNElrwx3vYwgETqY/9Wtdl13kdUGfU62/hu?=
	=?us-ascii?Q?F6ICnRPde5S3HrLJ3Bs4W8baNbiRXwrbE9LpSKhNetapNA1jqPgKHs27Vk1Q?=
	=?us-ascii?Q?AL2e26MB2WP+NluQkvJDM1DC+sNjq+LfvCa0jwCMYl1dY4jsbZ+atIYTMHBJ?=
	=?us-ascii?Q?h3/cj5D5OY6eBBEn9d7+6UZPnEpw9sbbDi52GUs2c//KfXJugAwVFV5hzcpF?=
	=?us-ascii?Q?v2mEMT4/y5u2Ptb90C+M2uBP3HpnnKr0UdgqXgttmUMaGuung4RrB+iH3Xp0?=
	=?us-ascii?Q?iJXxr+TnqqoSC9bhTEkcTwDc13a+mr3w+/ZAKglhMxyiB6iHyvQmG+AItV8Y?=
	=?us-ascii?Q?RJEZ+2DqpBYGYRWW4PN1rtc+rKfRz9jekiSmIoNLFwQdeAm59Sg/vUcI0dEy?=
	=?us-ascii?Q?MpjZ08XsT/H7vr7y7t4/dT8RKxHir5DXf1mHNxrYYh0fGeQaQ6849qt4vjcF?=
	=?us-ascii?Q?HtJ1zBElQH2yCE1jVHJ8UMzqXGI69kSGarBG5o/96Xwjp1T24L9A4ZEOqQ4K?=
	=?us-ascii?Q?3hrWhd9nPmePYalPyZrZH4cvGwrpO27E74q2s2iNWTewamKup1hFEnsJcpms?=
	=?us-ascii?Q?3BYu5mtMaCFT+PLkAY91HYzrlLmL1wZkreI+iFltWR0+EVUTJvrJV0pOKuTp?=
	=?us-ascii?Q?z9oewr9Y5ataf6Rr0Qt7ZLQ4de4QFJIDS2s3CBTBYc2LLFcuv/ZWyUQJUDH1?=
	=?us-ascii?Q?25L/p0LPlcNZykOOM/BklGwFgRk4oR0+rGDM3/b+u/Hr54YpJhrQs9LmAKPJ?=
	=?us-ascii?Q?Rk7F7SCa8tYmZNQoKMztaJ7s4XHXTf9RGb0OhNlPoiraT9PEYdLybSI1dNYx?=
	=?us-ascii?Q?k0CIULhI3m3g2XHuoTu7EVrH8rlbnEI3wyoPKM/hwvNGz2TbTyCHV7x2LTgH?=
	=?us-ascii?Q?FrkoHOiQS5c8kKNcGg4fm9d3R7eXoLmFlyr0CoSDh68yBUjOm8M1PsqBMqOf?=
	=?us-ascii?Q?YYy1BaRh59c4ryzEOpz4XjM6msFCxhSqhQDvvuDk91fujuzIsSsiHscR0Bdj?=
	=?us-ascii?Q?Hoc53zuLxJh/ygroNQoa7N8QKKF8oOIzXyPfbEgldYwMcBvOPHk/cFjnEqVt?=
	=?us-ascii?Q?XYf1rCKFs0tqB4O+fmtcCQMmWDWX/g4sYrrfOYoCWZi8+8qQHvLQO9OpGBu6?=
	=?us-ascii?Q?VjidY5dd2ijZlEVDoc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT093;
	6:Blg8kOmq+zjz+XTKytAWIvoqnoLvMP857ZB2WoipnkVgMSRuZx7VisDFQmO/oCnL/xZh+bdsZSuOSa4UcRBcUObKivcixqd2SOsF53bOIZ5KR6DgMH4UXZfwE1p2QQhV65mcyw4fBn1jqJ6Zj5zhLxpxA5ld+PAsad9NEXr027JnzcOxi9Pf4lpZ6FGrLQJ9fjR1YVCqA/n9kVtpAQrb4l7VvhFN310ijQDn7xyTKcXlPiLKOBX7SP7+s5blFrRx2nZU22qOaQyPD8ymgI8o9Yd0wokKtoZ3/GR9CgJXIHxwSpwZ5QAhHXNZb+iAC9ElGgC6uSbL3lNKxk2s5oP2yQ==;
	5:wQU44nGMiSH8Eovd5BX5f/mpZMnqDJEWuQo6//QoGkgRcTBZOfRF10d82QPWpGzCruRWZ5dD7fkSUbx4MLeVzyKefTc74RtS826p94P1fkmIbhtZsmnnA41o+zWpVxo12ngG+5sZMEEFcIaXJZPBDA==;
	24:87L0FeddTrQ3fkJHAeNKdvB/hhqsN/MKIO5r+J4IykYlOBOXGm6oLYr2EmAn8o1lO7f013DlYbV7eyvs+kC9AklO6MN0TDPfc5WOABelLDk=;
	7:H3dxBJHriw5x1co5GQEekwyhmr/WF8UvMD3iQ8m4JTeVhu4ohxDsJjvsjVPUphzAuyA3hVK+Uh8zq9ASG4zkh2tltzwqrel/Q0cocOCdTKh3oGnceggoDqQpBnO0wSaIr324LNZjQrIpOQTzM0hYInT6rV+EJQcXo0vJn2ukdOuzrUvdcFAbGgthW5BdpLwYIJ0Al07Fc41+TEdCMqa6G9yODwaAVb5V0l74NkhkMDUKQGQrlcAHd1zkKc8ZgQ0L
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 18:26:25.0442 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT093
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.46
Subject: [Qemu-arm] [PATCH v3 3/6] cadence_gem: Add support for screening
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
X-TUID: n1YxuLe2Vthi

The Cadence GEM hardware allows incoming data to be 'screened' based on some
register values. Add support for these screens.

We also need to increase the max regs to avoid compilation failures. These new
registers are implemented in the next patch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V3:
 - Add error checking
 - Fix up screening function
V2:
 - Initial commit

 hw/net/cadence_gem.c         | 167 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/net/cadence_gem.h |   6 +-
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 08b3747..0b15c9c 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -27,6 +27,7 @@
 
 #include "hw/net/cadence_gem.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "net/checksum.h"
 
 #ifdef CADENCE_GEM_ERR_DEBUG
@@ -142,6 +143,37 @@
 #define GEM_DESCONF6      (0x00000294/4)
 #define GEM_DESCONF7      (0x00000298/4)
 
+#define GEM_SCREENING_TYPE1_REGISTER_0  (0x00000500 / 4)
+
+#define GEM_ST1R_UDP_PORT_MATCH_ENABLE  (1 << 29)
+#define GEM_ST1R_DSTC_ENABLE            (1 << 28)
+#define GEM_ST1R_UDP_PORT_MATCH_SHIFT   (12)
+#define GEM_ST1R_UDP_PORT_MATCH_WIDTH   (27 - GEM_ST1R_UDP_PORT_MATCH_SHIFT + 1)
+#define GEM_ST1R_DSTC_MATCH_SHIFT       (4)
+#define GEM_ST1R_DSTC_MATCH_WIDTH       (11 - GEM_ST1R_DSTC_MATCH_SHIFT + 1)
+#define GEM_ST1R_QUEUE_SHIFT            (0)
+#define GEM_ST1R_QUEUE_WIDTH            (3 - GEM_ST1R_QUEUE_SHIFT + 1)
+
+#define GEM_SCREENING_TYPE2_REGISTER_0  (0x00000540 / 4)
+
+#define GEM_ST2R_COMPARE_A_ENABLE       (1 << 18)
+#define GEM_ST2R_COMPARE_A_SHIFT        (13)
+#define GEM_ST2R_COMPARE_WIDTH          (17 - GEM_ST2R_COMPARE_A_SHIFT + 1)
+#define GEM_ST2R_ETHERTYPE_ENABLE       (1 << 12)
+#define GEM_ST2R_ETHERTYPE_INDEX_SHIFT  (9)
+#define GEM_ST2R_ETHERTYPE_INDEX_WIDTH  (11 - GEM_ST2R_ETHERTYPE_INDEX_SHIFT \
+                                            + 1)
+#define GEM_ST2R_QUEUE_SHIFT            (0)
+#define GEM_ST2R_QUEUE_WIDTH            (3 - GEM_ST2R_QUEUE_SHIFT + 1)
+
+#define GEM_SCREENING_TYPE2_ETHERTYPE_REG_0     (0x000006e0 / 4)
+#define GEM_TYPE2_COMPARE_0_WORD_0              (0x00000700 / 4)
+
+#define GEM_T2CW1_COMPARE_OFFSET_SHIFT  (7)
+#define GEM_T2CW1_COMPARE_OFFSET_WIDTH  (8 - GEM_T2CW1_COMPARE_OFFSET_SHIFT + 1)
+#define GEM_T2CW1_OFFSET_VALUE_SHIFT    (0)
+#define GEM_T2CW1_OFFSET_VALUE_WIDTH    (6 - GEM_T2CW1_OFFSET_VALUE_SHIFT + 1)
+
 /*****************************************/
 #define GEM_NWCTRL_TXSTART     0x00000200 /* Transmit Enable */
 #define GEM_NWCTRL_TXENA       0x00000008 /* Transmit Enable */
@@ -602,6 +634,126 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
     return GEM_RX_REJECT;
 }
 
+/* Figure out which queue the received data should be sent to */
+static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
+                                 unsigned rxbufsize)
+{
+    uint32_t reg;
+    bool matched, mismatched;
+    int i, j;
+
+    for (i = 0; i < s->num_type1_screeners; i++) {
+        reg = s->regs[GEM_SCREENING_TYPE1_REGISTER_0 + i];
+        matched = false;
+        mismatched = false;
+
+        /* Screening is based on UDP Port */
+        if (reg & GEM_ST1R_UDP_PORT_MATCH_ENABLE) {
+            uint16_t udp_port = rxbuf_ptr[14 + 22] << 8 | rxbuf_ptr[14 + 23];
+            if (udp_port == extract32(reg, GEM_ST1R_UDP_PORT_MATCH_SHIFT,
+                                           GEM_ST1R_UDP_PORT_MATCH_WIDTH)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        /* Screening is based on DS/TC */
+        if (reg & GEM_ST1R_DSTC_ENABLE) {
+            uint8_t dscp = rxbuf_ptr[14 + 1];
+            if (dscp == extract32(reg, GEM_ST1R_DSTC_MATCH_SHIFT,
+                                       GEM_ST1R_DSTC_MATCH_WIDTH)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        if (matched && !mismatched) {
+            return extract32(reg, GEM_ST1R_QUEUE_SHIFT, GEM_ST1R_QUEUE_WIDTH);
+        }
+    }
+
+    for (i = 0; i < s->num_type2_screeners; i++) {
+        reg = s->regs[GEM_SCREENING_TYPE2_REGISTER_0 + i];
+        matched = false;
+        mismatched = false;
+
+        if (reg & GEM_ST2R_ETHERTYPE_ENABLE) {
+            uint16_t type = rxbuf_ptr[12] << 8 | rxbuf_ptr[13];
+            int et_idx = extract32(reg, GEM_ST2R_ETHERTYPE_INDEX_SHIFT,
+                                        GEM_ST2R_ETHERTYPE_INDEX_WIDTH);
+
+            if (et_idx > s->num_type2_screeners) {
+                qemu_log_mask(LOG_GUEST_ERROR, "Out of range ethertype "
+                              "register index: %d\n", et_idx);
+            }
+            if (type == s->regs[GEM_SCREENING_TYPE2_ETHERTYPE_REG_0 +
+                                et_idx]) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        /* Compare A, B, C */
+        for (j = 0; j < 3; j++) {
+            uint32_t cr0, cr1, mask;
+            uint16_t rx_cmp;
+            int offset;
+            int cr_idx = extract32(reg, GEM_ST2R_COMPARE_A_SHIFT + j * 6,
+                                        GEM_ST2R_COMPARE_WIDTH);
+
+            if (!(reg & (GEM_ST2R_COMPARE_A_ENABLE << (j * 6)))) {
+                continue;
+            }
+            if (cr_idx > s->num_type2_screeners) {
+                qemu_log_mask(LOG_GUEST_ERROR, "Out of range compare "
+                              "register index: %d\n", cr_idx);
+            }
+
+            cr0 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2];
+            cr1 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2 + 1];
+            offset = extract32(cr1, GEM_T2CW1_OFFSET_VALUE_SHIFT,
+                                    GEM_T2CW1_OFFSET_VALUE_WIDTH);
+
+            switch (extract32(cr1, GEM_T2CW1_COMPARE_OFFSET_SHIFT,
+                                   GEM_T2CW1_COMPARE_OFFSET_WIDTH)) {
+            case 3: /* Skip UDP header */
+                qemu_log_mask(LOG_UNIMP, "TCP compare offsets"
+                              "unimplemented - assuming UDP\n");
+                offset += 8;
+                /* Fallthrough */
+            case 2: /* skip the IP header */
+                offset += 20;
+                /* Fallthrough */
+            case 1: /* Count from after the ethertype */
+                offset += 14;
+                break;
+            case 0:
+                /* Offset from start of frame */
+                break;
+            }
+
+            rx_cmp = rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
+            mask = extract32(cr0, 0, 16);
+
+            if ((rx_cmp & mask) == (extract32(cr0, 16, 16) & mask)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        if (matched && !mismatched) {
+            return extract32(reg, GEM_ST2R_QUEUE_SHIFT, GEM_ST2R_QUEUE_WIDTH);
+        }
+    }
+
+    /* We made it here, assume it's queue 0 */
+    return 0;
+}
+
 static void gem_get_rx_desc(CadenceGEMState *s)
 {
     DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
@@ -712,6 +864,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 
     DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
 
+    /* Find which queue we are targetting */
+    q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
+
     while (bytes_to_copy) {
         /* Do nothing if receive is not enabled. */
         if (!gem_can_receive(nc)) {
@@ -1228,6 +1383,14 @@ static void gem_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
                    s->num_priority_queues);
         return;
+    } else if (s->num_type1_screeners > MAX_TYPE1_SCREENERS) {
+        error_setg(errp, "Invalid num-type1-screeners value: %" PRIx8,
+                   s->num_type1_screeners);
+        return;
+    } else if (s->num_type2_screeners > MAX_TYPE2_SCREENERS) {
+        error_setg(errp, "Invalid num-type2-screeners value: %" PRIx8,
+                   s->num_type2_screeners);
+        return;
     }
 
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
@@ -1273,6 +1436,10 @@ static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
     DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
                       num_priority_queues, 1),
+    DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
+                      num_type1_screeners, 4),
+    DEFINE_PROP_UINT8("num-type2-screeners", CadenceGEMState,
+                      num_type2_screeners, 4),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 77e0582..c469ffe 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -30,9 +30,11 @@
 #include "net/net.h"
 #include "hw/sysbus.h"
 
-#define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
+#define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
 
 #define MAX_PRIORITY_QUEUES             8
+#define MAX_TYPE1_SCREENERS             16
+#define MAX_TYPE2_SCREENERS             16
 
 typedef struct CadenceGEMState {
     /*< private >*/
@@ -46,6 +48,8 @@ typedef struct CadenceGEMState {
 
     /* Static properties */
     uint8_t num_priority_queues;
+    uint8_t num_type1_screeners;
+    uint8_t num_type2_screeners;
 
     /* GEM registers backing store */
     uint32_t regs[CADENCE_GEM_MAXREG];
-- 
2.7.4

