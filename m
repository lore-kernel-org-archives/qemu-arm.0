Received: by 10.25.21.156 with SMTP id 28csp958036lfv;
        Thu, 28 Jul 2016 12:01:40 -0700 (PDT)
X-Received: by 10.55.18.9 with SMTP id c9mr11165833qkh.157.1469732500238;
        Thu, 28 Jul 2016 12:01:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o97si2932168qko.135.2016.07.28.12.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 12:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSqYt-0003Cw-HQ
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 15:01:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYI-0002dD-IJ
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYD-0001sR-GK
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:01 -0400
Received: from mail-sn1nam02on0069.outbound.protection.outlook.com
	([104.47.36.69]:34400
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYD-0001s4-5G; Thu, 28 Jul 2016 15:00:57 -0400
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
	(10.152.74.57) by CY1NAM02HT087.eop-nam02.prod.protection.outlook.com
	(10.152.74.219) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 19:00:54 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 19:00:55 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:46884
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYA-0008J7-6t; Thu, 28 Jul 2016 12:00:54 -0700
Received: from [127.0.0.1] (port=52171 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYA-0007nf-4I; Thu, 28 Jul 2016 12:00:54 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SIs8AV008150; Thu, 28 Jul 2016 11:54:08 -0700
Received: from [172.19.74.182] (port=55026 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY9-0007nc-Ct; Thu, 28 Jul 2016 12:00:53 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 12:00:24 -0700
Message-ID: <6543ec0d0c4bfd2678d0ed683efb197e91b17733.1469727764.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469727764.git.alistair.francis@xilinx.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
X-TM-AS-Result: No--7.473-7.0-31-10
X-imss-scan-details: No--7.473-7.0-31-10
X-TMASE-MatchedRID: SXW45AgdkCvgk9PeQ8a1PH6DQ2TEDqZsIR1rLBJm/M4cVJCT3tVgas+c
	wCLpvDnEC96AWDFf8+uARNfvLyvPS3i25HfozijkXP5rFAucBUEk9Lf/qe8xx1vo8FSqar5SMXw
	w+T4dG2eSEcf4eD2yrr51pkQVwz+7XsXCkRP5gegCg1rav4R3DfQ7szeVKdNb0SxMhOhuA0TAdu
	QncIjXRjuB1oJO8M/5u2zvfeWYl2UdppKJuaP/f47Su3QulAZ5tjHGWON8yeNtw+n+iKWyyLYNA
	3mHUdu3lZoS4NDC00mX7nDC+4gKehlFrvoa/gAROI8QpSH7EH6wqLgRdvwAinDwxJWw/hfysxmB
	Cv9mGmjan9ppH+fHToDH47fLJDa0oTjn55bHlofxgYoa5xcgTwrefVId6fzV82HMiBe0UlXDcDW
	4tUEEBomTR3l2no8mgDLqnrRlXrZ8nn9tnqel2LI7zVffJqTzrOrmO9rKpS2CcdoQvAcHi6I3JD
	89QgeLQvxXKrtMpxHXsFmKy5QHMX7cGd19dSFd
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(50466002)(48376002)(2950100001)(106466001)(9786002)(76176999)(11100500001)(4326007)(50986999)(71366001)(105606002)(5001770100001)(356003)(19580405001)(19580395003)(92566002)(85426001)(230783001)(2906002)(86362001)(118296001)(5003940100001)(229853001)(77096005)(7696003)(305945005)(64026002)(47776003)(36756003)(7846002)(586003)(81156014)(8936002)(33646002)(81166006)(50226002)(189998001)(87936001)(8676002)(461764006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT087; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT051;
	1:PZPik0v9V9lfH2rp2bG94U3ojD/3QpKHvkDf9qKBKVl4Ednv5S+vDQQCZzLzsO17NgMcmnM6V/AauMn5C+NiEIHatO4lMm8osGcB/YoOfAo+sh83ZJv7Hkn5/ydHsaXU+6aPqbQ/p31fn1zflEroYWBYjKSxOfzPBS1NIsY807DjyIej/MkAGJWdNWkAtU45EoCMLe/oLENbWJoocXfc6GtwlXv3ExVDs8B2e4I0J4QIqIDd3QWHDutSlfXoVrOyFP57+mC8yWon7O1mdqXq6HbKLfL2TYvIdckGBymx1okNW2+qH1FiRcPhB3JsWv8aCbOCIDSAFEbbRXumtvc+51qUaAP4FPobTnnvSP3QojmPC1QPo/bFAURmBdpOboIdcMXhyRfGqZcqlXC5v3Fgh9mcvuYS7Nha1/swFeVBewnMFSEQPJaMw9XqzKGki2K7KRl+3kav2G4T7lh/SkkGGpwdcN+IbfpAVM4UDl8KhY2ZGc+W9vuSJbALUj3pDF0XqmxgwqBxHWkmOhbcTkbQoQAPeUgs9ifoUZBA8BTtyKoGgSx6XEpfR87kSKE6yac5eUTREvl65foMEUfavg76QG0Va7+v+ee1cVBdBQAfiVk=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4c74a30-acc2-4a36-c56a-08d3b71980ef
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT087;
	2:fzGWIQoD9DEJr7FKu57A/8gWHLKSPqe2fx7tLvvqwULoNs/P3U+qIpX/LfobLXrShgfr+XopLxXf1GrCReRtquspFn92ddVOa9ijapm1AppRqmUeEsl3Rl9/a4D72k7TNsgmDPbLzE1ezAMJp2KCml+NHLPhMCxzJi55sx1n8xUKkzeec9A7VbkDVXU6g954;
	3:94Mx7ZicHE3e5FcisCsaHSM+fzT19xsAtdnGG6Wvwadk0rOhyJMZH+au+nTob4631wIQG1feCsYUsJ0nQN9yUlfJo1wC/BHyojSrxCg9SU4vnj+nY7tV8uquETrNJStfGmLZuipMdwjsV6Rm2hmHh6amn92QjAwsFYOK42N8vsG8WnW6E3fPUPjvKRyg22glfZjcFZ0HERkSNgqtMjkcgdzeaqFBJOwZM8YkHTw33Jk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT087;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT087;
	25:1Wj6wKoAcPkbyDVqvbQy5ZmC+IDGCJT151HybLA9o+io46tKH2ThcEyak8NkiUQ9yuphmTWbK2w5zclu/7njgLzgykrPQkcLUSwbcb2zxG1RRbJM4w6wDDn9La9tR9wTmujFkiiNhOSy392IoH9ExVx3KmFri5KleJlMrDc/3Lf1qDCkzOSf5/LZJz2bttjGl42/YaEreAJ3eZaeYMJ9Wq6Gvd0AHkENjH2V4ijx023NNaaF6RISo16qvqt86rTJHdN6VskwYsaMtzinq6If90AZDpJSd7ERsNQjONqXHjBTrOYP4x4jLDACvjqcdBV2AyTFu19w5bEW36DaY/FJ5DwEvwDMLlZ8ljD1yQXFwzLJXunT0uIuBCGRlw/EwmXg5R2J6e1m9PBPBHVj5+g0u7PqxNLAeIQSrsFH/cJXYes6l9x5hWV6yP3/TjmoRXgod7p7y35jNy3S/y4cCdbP0/7k+0lXUKmmHNlXWEZpl72cn6EzRsb9DLkPQGm/406ekRPBBBmfxToUkpjkE9KTSSLQLI6I9zNm89toyKrh7XK+6ZHwI1DBf44bF+6Rt64/K72bt7t/XCefRqGZzh8bKTGsGsKeRjlTCcT3Wku2DKbw4Ev962Yxr6JDzCh/3M1F/Lip0UGO1wzUUCBSQh2oKJWg8zfiJ6NS7Keu5tt/ie6QLxzOlAA5ro+3rG7l82+YI56NfgCzhtkiC0fNkPYfe+hLSxhYfK9JRq/7uVg/OsVm9aqnPjmYzvtPDw+ktMF/gppvx/+xwZfdHeyed5hqmA==
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT087;
	31:TxCxyAph8HEiCC/+K7Cm8LHXj2J7JUo67a1Zo60AgsBcSnROwwHYKC2dPGsiUxcgrhc/6I/1A8zlvJgELVcbVgZ9pubQabWnZu5qtUP4qpLBfaXszKdzFgPQdJsIefcwSJ2E9+ebHLXA8mn1cqAKxtLlJD/eRcI3MVHm/6P+I8qF0Aqt1tbEjCaPB8yH8e8mZ/Foya0TTBTXOmTGSU/zGUWJf8TePToqgRRz1bXnimU=;
	20:xrkG4a8/sJtRv483kP6AHWKR8Nek2PsYIm/M+PNKDvPLlevIJFAisWmWtQ2hp4ce8RIvxKm7tICj4exIBFiyWsGlWh/llvQ+QkbjrM8NgYr79ARuNRnAUjb62S3bS2y5TFj4kExB2PE9ogfyxovSPrmH+qhV0LS+9uW1e7tT7pWgS571SSJmZtySk0PN25wHk0LulY2J764fKXTntbgXjmHU3laRDGYcq+8/8HLt0iYTGqdjw3Le2S5OGz9G/7sagJ6ddY8phty17VgnSfw+o1balszXVxgbjr5XOp3a/M28ue4cyKh4vC3t4/ZDXSZQsMJ6RV23OaVhU+A7dz+qPbndARTfxIQPgEcZGD3ICrd0YuTsTMYK098v+kqgdfxajo4YDReqO4WMmxTKcsRXlhBh2zlHwr1BOJVW27IZt5vJGVVtz94XkKxPnhv+pk3dCCv19JnU4eniU6OAveiWezXDhOCBU1HfUviEO2Ng0PdXIFmvdAsV56XDaV4T4ZYU
X-Microsoft-Antispam-PRVS: <cf1a4b86eb1d4c3c9e0a06c9d951ff94@CY1NAM02HT087.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(5005006)(13015025)(13024025)(13017025)(13018025)(13023025)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT087; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT087; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT087;
	4:OBcWNqyfEqdRr3VThSpgd0i7y1okiV0F9GfbSiGgKN/pqKu8t/gKaeaUnAwTgqnnx6fYw3SaXajKwF6Z6hqCAKtk0ab1jOXluodfg9tFtG0J5xIv+Yz4CJ88nSZZ62QuL9VbEnOhXTim1s+LnLZ/95wFi/1Zw1pAbrTJHpshzk0P/9mYgGpuXQQYVhLt3/6hgQyaPJja0K1wkHjufvZYFCoagWo/iq8IWik9Y3IZnHR33Qv818pbduK+Tx9YPKLFZL6sGFObvK33dOHDNo2e8ZEuryBohK0ZsLAJPniVMSC8EjIjDHOxGL/sVOhQk/B1/HM0kLU1uiMfS+iJGEJeoQKabszHRqeSM+R23Yg67znz9xuqAauUt7ByVFpHTs/56onwtuRTHhDAfT0+EuhcmLbp3UsSAT4B0c3E6fCfZ7jlTcsSlqaPnGBSKrG4SXU/9Ekazv/7rOGOLHfJWcdtFP8M35PCg+nPGTLoXezuLq+D1zbAnvSPMgsB8ywvJIZ3mQxyPDeLQwx+YHy/9h7lGCQW9h+FNFs0vT4xig256/s=
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT087;
	23:K6rlrFTXSsPwcZEXcIQOEJQTzmQ5q/M5bKDBglQ6H?=
	=?us-ascii?Q?ePkOCEcqR3t3pJ1rMVIYzRA+Ad/Yy0EU5lNtHaxtZ4mTbGfGmgjtnR1fBtVA?=
	=?us-ascii?Q?WXmoTPsVG+Ow4qdkqcWzMkeaiTJzEroT8UUjYYXMzFycNMsKURIDb12nKsPQ?=
	=?us-ascii?Q?Y78rm3a0ob9H9odA4Ec+WclfHZXA+uQb/GgCgo4rpNxl1wYztWUENPRyOWOF?=
	=?us-ascii?Q?1wAMiFVRoh9+eCmQEzkPijGMiC8KK3e3iwivgaXW8smED3K9MtFotDIt39Pe?=
	=?us-ascii?Q?986AxVYKqQ4CxV/f3wV6XAGPSBFAHTuHFxS44tFMoevdyq1rTDF1VdyL2Slg?=
	=?us-ascii?Q?aeZy2589wSTR+5WWSY+dbhmDyTxJPMHXtUEuG0bDlvo3CSn0Lb64kkJT/h5R?=
	=?us-ascii?Q?RTgLhfDO8pWNezTdp3JoCxiDZQQg2Y9GVE/ueG2CqfEyPIXS3sPxQkW/0w8w?=
	=?us-ascii?Q?BSQ2nCj6NYDC85Q9O6PQegQm4tg204zxa+mA7d8gjVoJ6vE6G1psxwH9fc/8?=
	=?us-ascii?Q?jDSlZlsocMVOfbzNtt6PfSoaHeCIHnhm8w6OGrLZHAF3pmrpMROyEzTdZUuB?=
	=?us-ascii?Q?Yqsqxo+ne5j0qaievF6pSXt0LZP/Jylcfk1p93dXQGfbKkshZMJRa4n5U+eA?=
	=?us-ascii?Q?Av9R3c8FTa+AuzFuYkKcDE0ry1OG1TxAzUcfI0Bnz+aejUruQrnCxmaEQ8ta?=
	=?us-ascii?Q?Jb9EUEwsZ3wHOKeqjJyBFV5wSi5VuWcxitoB1abY7QKxgdizXAA0FE3YG/V3?=
	=?us-ascii?Q?AQSe+C25jVWfI4+kTjqkrNv/mCCdwj2VnRPJZnqGUZ7r2IAXvjiX7e4acV2Y?=
	=?us-ascii?Q?la6C+C2UaUkZaYEAIbrgnZt9b11LkwiT6j4WcGw4oE2GDgPg1ENBHsd2hyGj?=
	=?us-ascii?Q?y1ZiVoqtjvs96BdMLzZDdHJvPk6ZWZSY6rDScWXZYszxf4/SRT8bz9kze4tk?=
	=?us-ascii?Q?+ljcFJI0Heiglidgu/q3bNw53mUWeFx19qjuLWae4DqdKNktl3rsJ16IDa21?=
	=?us-ascii?Q?lmFa+6fTfy2hJ2d94mVPb6ne8X3rzaBt/+FfYwVsmeyLNgApxvg3YGhUe93I?=
	=?us-ascii?Q?A3hY/CKCGS6iHlwxSYSmsnqgAOz57nmHuRhefwHWH6NqVxEy5XjB07RZ2XwS?=
	=?us-ascii?Q?3dYRY41BUl1zxfDne0U8CWOBo3lFEVgmBw+eux3M9GFoALCoKvNMMbyfP6/E?=
	=?us-ascii?Q?mLa10lvS3E8lrOCVYNbxfGhP1n0i1zSncHpuI/meAc2dzYQSaeE80u+6Q=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT087;
	6:EvvKSchtIi6OhW/nyrDcBaFeoBh4gjlJKAik8BYNn72cBwWhyJ1H2n8m7LZbHLwJVSWtVsL/46cuQGiAdhhKdGDal4BOeSMiBGGuCek73kZwVQNCv44njr0zF8lZR1KhJeVh/vHXZBJBlQfFPA2/L5PR03gVlCuEhMsSLdEf1oodnz1iW8l8YWjl5O8Z8VLTeI1ufIEinMvBrzxSDC6rg4I6CKdlMPK/FMJscqd0gw7Rl+7wZBcAWklgDjD8j5UiY8Mxl3bc1fVKNk2gDkhVlh9mHVR4ml33qY7cupxvv/Is3tCnWlOJH1eldgPYMY8gtzSr6gmY+jW+dJX5zdkGXw==;
	5:s+L9DJKwJN9VZ6xc282VhHjeSdPYvLtszPaKj2SL+ZV5c1NPC/ZMzZCJwUEYBkGyFNblnJvHWdh25KFQ6HA/ZgrMC2ZetyM28V4XQYKBKcLbJvPCSy23pOHxm0rF/5RoSvFLNUY54VOdKxObl0g8jQ==;
	24:cW06e7tWkG++emQuBfIMuMyZF30tupZpmQ/zqxNXawRyTbvqrh/AArIyJJd2AUSFpPmMAe8Ne2Q8EDcHGNWTtIhCIjhXN4obllVf8jYUv2I=;
	7:/YLvU0TrMT4XgjtiL4x0CGIuuzShrAXrM29EyXzF/aTkv77JOzoCXQgYus3yOEq3rVIBYGdtpyr+vLH2v3unkpBAoVy/mNcmQx8bsQoyDdVP6rjYLfBTkkUsrKixfp5A/eJMvGZMFqt3PbMm7iYYntRownVC1aHCZMz3NGn/+gzNOaKTUqFYo17VYTA0U1OUFEo3ffxwQE93JvYPcZ3obso/GYu3xuD8pA95QLRNif/0UbXL4hQvWJi8XsZcyyMg
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 19:00:55.0884 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT087
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.69
Subject: [Qemu-arm] [PATCH for-2.8 v4 2/6] cadence_gem: Add the
 num-priority-queues property
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
X-TUID: 3LQ6K9jD5HZl

The Cadence GEM hardware supports N number priority queues, this patch is a
step towards that by adding the property to set the queues. At the moment
behaviour doesn't change as we only use queue 0.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
V3:
 - Add error checking
V2:
 - Fixup commit message
 - Add the property in this patch
 - Increase vmstate version

 hw/net/cadence_gem.c         | 94 ++++++++++++++++++++++++++------------------
 include/hw/net/cadence_gem.h | 13 ++++--
 2 files changed, 64 insertions(+), 43 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7adc2a8..08b3747 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -26,6 +26,7 @@
 #include <zlib.h> /* For crc32 */
 
 #include "hw/net/cadence_gem.h"
+#include "qapi/error.h"
 #include "net/checksum.h"
 
 #ifdef CADENCE_GEM_ERR_DEBUG
@@ -428,18 +429,18 @@ static int gem_can_receive(NetClientState *nc)
         return 0;
     }
 
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         if (s->can_rx_state != 2) {
             s->can_rx_state = 2;
             DB_PRINT("can't receive - busy buffer descriptor 0x%x\n",
-                     s->rx_desc_addr);
+                     s->rx_desc_addr[0]);
         }
         return 0;
     }
 
     if (s->can_rx_state != 0) {
         s->can_rx_state = 0;
-        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr);
+        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr[0]);
     }
     return 1;
 }
@@ -452,7 +453,7 @@ static void gem_update_int_status(CadenceGEMState *s)
 {
     if (s->regs[GEM_ISR]) {
         DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
-        qemu_set_irq(s->irq, 1);
+        qemu_set_irq(s->irq[0], 1);
     }
 }
 
@@ -603,15 +604,15 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
 
 static void gem_get_rx_desc(CadenceGEMState *s)
 {
-    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr);
+    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
     /* read current descriptor */
-    cpu_physical_memory_read(s->rx_desc_addr,
-                             (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+    cpu_physical_memory_read(s->rx_desc_addr[0],
+                             (uint8_t *)s->rx_desc[0], sizeof(s->rx_desc[0]));
 
     /* Descriptor owned by software ? */
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         DB_PRINT("descriptor 0x%x owned by sw.\n",
-                 (unsigned)s->rx_desc_addr);
+                 (unsigned)s->rx_desc_addr[0]);
         s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
         s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
         /* Handle interrupt consequences */
@@ -632,6 +633,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     uint8_t   *rxbuf_ptr;
     bool first_desc = true;
     int maf;
+    int q = 0;
 
     s = qemu_get_nic_opaque(nc);
 
@@ -718,54 +720,56 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc));
+                rx_desc_get_buffer(s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc) + rxbuf_offset,
+        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[q]) +
+                                                                 rxbuf_offset,
                                   rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
         /* Update the descriptor.  */
         if (first_desc) {
-            rx_desc_set_sof(s->rx_desc);
+            rx_desc_set_sof(s->rx_desc[q]);
             first_desc = false;
         }
         if (bytes_to_copy == 0) {
-            rx_desc_set_eof(s->rx_desc);
-            rx_desc_set_length(s->rx_desc, size);
+            rx_desc_set_eof(s->rx_desc[q]);
+            rx_desc_set_length(s->rx_desc[q], size);
         }
-        rx_desc_set_ownership(s->rx_desc);
+        rx_desc_set_ownership(s->rx_desc[q]);
 
         switch (maf) {
         case GEM_RX_PROMISCUOUS_ACCEPT:
             break;
         case GEM_RX_BROADCAST_ACCEPT:
-            rx_desc_set_broadcast(s->rx_desc);
+            rx_desc_set_broadcast(s->rx_desc[q]);
             break;
         case GEM_RX_UNICAST_HASH_ACCEPT:
-            rx_desc_set_unicast_hash(s->rx_desc);
+            rx_desc_set_unicast_hash(s->rx_desc[q]);
             break;
         case GEM_RX_MULTICAST_HASH_ACCEPT:
-            rx_desc_set_multicast_hash(s->rx_desc);
+            rx_desc_set_multicast_hash(s->rx_desc[q]);
             break;
         case GEM_RX_REJECT:
             abort();
         default: /* SAR */
-            rx_desc_set_sar(s->rx_desc, maf);
+            rx_desc_set_sar(s->rx_desc[q], maf);
         }
 
         /* Descriptor write-back.  */
-        cpu_physical_memory_write(s->rx_desc_addr,
-                                  (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+        cpu_physical_memory_write(s->rx_desc_addr[q],
+                                  (uint8_t *)s->rx_desc[q],
+                                  sizeof(s->rx_desc[q]));
 
         /* Next descriptor */
-        if (rx_desc_get_wrap(s->rx_desc)) {
+        if (rx_desc_get_wrap(s->rx_desc[q])) {
             DB_PRINT("wrapping RX descriptor list\n");
-            s->rx_desc_addr = s->regs[GEM_RXQBASE];
+            s->rx_desc_addr[q] = s->regs[GEM_RXQBASE];
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
-            s->rx_desc_addr += 8;
+            s->rx_desc_addr[q] += 8;
         }
         gem_get_rx_desc(s);
     }
@@ -839,6 +843,7 @@ static void gem_transmit(CadenceGEMState *s)
     uint8_t     tx_packet[2048];
     uint8_t     *p;
     unsigned    total_bytes;
+    int q = 0;
 
     /* Do nothing if transmit is not enabled. */
     if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
@@ -855,7 +860,7 @@ static void gem_transmit(CadenceGEMState *s)
     total_bytes = 0;
 
     /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr;
+    packet_desc_addr = s->tx_desc_addr[q];
 
     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
@@ -902,18 +907,18 @@ static void gem_transmit(CadenceGEMState *s)
             /* Modify the 1st descriptor of this packet to be owned by
              * the processor.
              */
-            cpu_physical_memory_read(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
                                      sizeof(desc_first));
             tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
                                       sizeof(desc_first));
             /* Advance the hardware current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr = s->regs[GEM_TXQBASE];
+                s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
             } else {
-                s->tx_desc_addr = packet_desc_addr + 8;
+                s->tx_desc_addr[q] = packet_desc_addr + 8;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr);
+            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
 
             s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
             s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
@@ -1076,7 +1081,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
     switch (offset) {
     case GEM_ISR:
         DB_PRINT("lowering irq on ISR read\n");
-        qemu_set_irq(s->irq, 0);
+        qemu_set_irq(s->irq[0], 0);
         break;
     case GEM_PHYMNTNC:
         if (retval & GEM_PHYMNTNC_OP_R) {
@@ -1139,7 +1144,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         }
         if (!(val & GEM_NWCTRL_TXENA)) {
             /* Reset to start of Q when transmit disabled. */
-            s->tx_desc_addr = s->regs[GEM_TXQBASE];
+            s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
         }
         if (gem_can_receive(qemu_get_queue(s->nic))) {
             qemu_flush_queued_packets(qemu_get_queue(s->nic));
@@ -1150,10 +1155,10 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         gem_update_int_status(s);
         break;
     case GEM_RXQBASE:
-        s->rx_desc_addr = val;
+        s->rx_desc_addr[0] = val;
         break;
     case GEM_TXQBASE:
-        s->tx_desc_addr = val;
+        s->tx_desc_addr[0] = val;
         break;
     case GEM_RXSTATUS:
         gem_update_int_status(s);
@@ -1218,7 +1223,14 @@ static void gem_realize(DeviceState *dev, Error **errp)
 {
     CadenceGEMState *s = CADENCE_GEM(dev);
 
-    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+    if (s->num_priority_queues == 0 ||
+        s->num_priority_queues > MAX_PRIORITY_QUEUES) {
+        error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
+                   s->num_priority_queues);
+        return;
+    }
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
@@ -1242,14 +1254,16 @@ static void gem_init(Object *obj)
 
 static const VMStateDescription vmstate_cadence_gem = {
     .name = "cadence_gem",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
         VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
         VMSTATE_UINT8(phy_loop, CadenceGEMState),
-        VMSTATE_UINT32(rx_desc_addr, CadenceGEMState),
-        VMSTATE_UINT32(tx_desc_addr, CadenceGEMState),
+        VMSTATE_UINT32_ARRAY(rx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
+        VMSTATE_UINT32_ARRAY(tx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
         VMSTATE_BOOL_ARRAY(sar_active, CadenceGEMState, 4),
         VMSTATE_END_OF_LIST(),
     }
@@ -1257,6 +1271,8 @@ static const VMStateDescription vmstate_cadence_gem = {
 
 static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
+    DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
+                      num_priority_queues, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index f2e08e3..77e0582 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -32,6 +32,8 @@
 
 #define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
 
+#define MAX_PRIORITY_QUEUES             8
+
 typedef struct CadenceGEMState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -40,7 +42,10 @@ typedef struct CadenceGEMState {
     MemoryRegion iomem;
     NICState *nic;
     NICConf conf;
-    qemu_irq irq;
+    qemu_irq irq[MAX_PRIORITY_QUEUES];
+
+    /* Static properties */
+    uint8_t num_priority_queues;
 
     /* GEM registers backing store */
     uint32_t regs[CADENCE_GEM_MAXREG];
@@ -59,12 +64,12 @@ typedef struct CadenceGEMState {
     uint8_t phy_loop; /* Are we in phy loopback? */
 
     /* The current DMA descriptor pointers */
-    uint32_t rx_desc_addr;
-    uint32_t tx_desc_addr;
+    uint32_t rx_desc_addr[MAX_PRIORITY_QUEUES];
+    uint32_t tx_desc_addr[MAX_PRIORITY_QUEUES];
 
     uint8_t can_rx_state; /* Debug only */
 
-    unsigned rx_desc[2];
+    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.7.4

