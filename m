Received: by 10.25.21.156 with SMTP id 28csp957742lfv;
        Thu, 28 Jul 2016 12:01:05 -0700 (PDT)
X-Received: by 10.200.37.60 with SMTP id 57mr58667555qtm.82.1469732465272;
        Thu, 28 Jul 2016 12:01:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x142si8957132qka.115.2016.07.28.12.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 12:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSqYK-0002dt-Jl
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 15:01:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYF-0002aY-L1
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYA-0001rP-Kh
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:00:58 -0400
Received: from mail-sn1nam02on0048.outbound.protection.outlook.com
	([104.47.36.48]:34944
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYA-0001rD-Cx; Thu, 28 Jul 2016 15:00:54 -0400
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
	(10.152.72.53) by SN1NAM02HT158.eop-nam02.prod.protection.outlook.com
	(10.152.72.170) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 19:00:53 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 19:00:52 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:46877
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY7-0008J4-Rd; Thu, 28 Jul 2016 12:00:51 -0700
Received: from [127.0.0.1] (port=52164 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY7-0007nW-Nw; Thu, 28 Jul 2016 12:00:51 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SIs6OK008129; Thu, 28 Jul 2016 11:54:06 -0700
Received: from [172.19.74.182] (port=55024 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqY7-0007nT-3R; Thu, 28 Jul 2016 12:00:51 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 12:00:21 -0700
Message-ID: <486595809cf416d18a750aafbcfa1c81d7160c59.1469727764.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469727764.git.alistair.francis@xilinx.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
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
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(7846002)(586003)(7696003)(356003)(8936002)(86362001)(4326007)(77096005)(305945005)(71366001)(92566002)(47776003)(118296001)(2906002)(36756003)(81166006)(81156014)(50226002)(64026002)(2950100001)(50986999)(105606002)(48376002)(106466001)(5001770100001)(189998001)(5003940100001)(19580405001)(229853001)(11100500001)(85426001)(76176999)(33646002)(87936001)(9786002)(8676002)(50466002)(19580395003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT158; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT034;
	1:3uI9z4PSbBuYGLF9eZfWHKUe5TiH2g0cKeB8tltNi2NCZogSbyujCw96nib2mDfnlnUAzwFfNV2o9IpCKt/A7aS+w6Ldb74jzUoSnhGRRsT6zjgu4diRHZDdngut6apOz1yp9feM6qzm4V+AjFhp9RkTIC2stv79GAZj3Mji31WNdFV6RplRha8bzups9xFerZI/HNtKHttmlcQQCc/hAMEidu9brXnhFoRhy10VrLEBQTgZWBilfWVcWxC8/JsgPhr7aWF8Rh6a2F5nmqCXG4tT/vhH0LrEFiRWj1BQFkKSVGL3V2tJYiSG6Txx68pgo1SASEOlptM7jPdcG7XO/StDYegAuGCTHWjF2FttWbNn6GPoqIFtI0TrQM8PAV77ibLhIm43Sa2GcC47lhg3EU5FyCih1UtxbDj2+sWvyjkxTBAQkuuQq2Y98q3o5SLUrgVT4Jy2BBdmrMxrgOpIED843rEgl3GL5ygnD5mBWJPNMsu6r/QKmI2AVtkNXcVm/QWocdz2HoFOvMPj9p7+dBRSrDnC9EZjSRps6/SGKK4ZQWTlUGkZAaKmEY4xjpGUrsqiIXXvphbxLLoRk2rtwAYBkG4+lt2RUlnfyJ4eC/o=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc170935-b54b-45b2-fd43-08d3b7197f6c
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT158;
	2:bNCyio/c83/u1oq1BNweEMRHrcOt3AR5SZIwSUVIFItmdsOEBm8FMzPcT4T6RVU2P1hG+waRrA8oYt/UQBTwZCCWvwWOGwbBgRQsKSSrPY4laQ4cLAB2xApe27SwYXaGnQHH77mGd1wC5qSaJbTiLuOTurJW03wTSvxkB/ObKEvR3vZa2uXQepBZwGG6+kVI;
	3:2wS1/ABPTIbvbJyGg4h0YH8kZK068BZTSl1EIhC6/XDqyruKVs7CVn9hyHc+E1sxhEd88+YGlomJErSAVPpJDL5YGNRsZgwPrlAjn7jPGfJXAWqUmYMbZYOUcuj+nvVDfvN7VzX2EE8m0nMP5WiABLpWai7I0L7KtrlyBS+uZkjLl7YW7EZxCH5G7/n7aFBQZi2n+BNmWdXQoTKDQpJLgsgJG448HGrOxpqMCUou+JQ=;
	25:IojpoRaDVd3C+GcjuUQpNq7Sy2wlMqexb4GWQRiE6J7txvk0ghbofiMpSzDdQW3++ca1ZLqnsjIc41feVs5QcsD9IT7SKC+jx0EE6M+WeRWyVVCd0miwwYbTdk+p5NpzTucdnratS2l9midP1PLpVv97u9jAEcXMOLnP2JlgC12sLjff48G4sFlXaqpVBojEN/xuuc6xqI4k/qXPhX27YAfkpatBudM6QQlK419ZWRdJ12upyUI2aecBv+qxGYh0kf/eaLFJC9ZbqRFkrAYh6OLgB5XacVxV55XHUgaopOWfDwfJyOHHf00x58MHXIsO7WGXlsNuhkJsIS49UUZ8965xtqd9EwKKh2/zgCJyPKnfoTRjYMMxPOJpoM5fr7FQJlaa4bsiHqgyPLgDYCJGtovcNHA0WjPp4zWmkbnd4v0=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT158;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT158;
	31:Alg7HVdpfkJKDAmhPrBmyIMXgffMgX7rPqqijC0O6IQex21jkyjpL7LMACE1MIX94+5lRrGucAhsxZV8cZTO5QkUUwKljSTwuDCftjGNFrWvyuUy+2K+g//Cr44ISTmRFHn+9UHVNq1tzVTfsGpFtOxHDP02XnzfCRpnaCiMPtTdabiug91lz01RUlC1Q0LIhvpOm8KWlYzDu6lT60b0uySyUDca8LCwpDU7v8o4f/Y=;
	20:03tsFEpGBiMEHIVD9x5Fl9xzZwaRRNvmguA85hUPESJTt98xSqEH65VxKrYw0ls6DR8B34zhuK5BVTrbL27wvQEDnpsS0gWZ/FvY8DjhvgH3OEgPfVXHymKvANCa5WVQ0oQNTZ0Ms8i8fXnOwWK0P/9HgCFP2cZrwtf58mTUSwZoIRTqPVDp2WxnNDfgyDYC4+iWsOAiI8rC/xnHcwHz3j3I00YsAyv7XGsTnDWgkyA82XUR2Di2su9CcQoBfX5rlVUZKB8uK78NQDb0ef1wt0mD/di6lL3VhGPMB+o3UFef8H8631GArwZqYtOVoJlPCcShU+RhyMv8zMfqYLVFESiLPn+mCB6V6fpi4HUHLRLfmvmkma6Vt29j6MmYBYihKNgXiiMAXukvhKYdblHbHj/yll/qs2fxKDo72Z2OdksgbS9qSPDN5YdUiYR3L+gnJKkCh4Emji/vvGpUb4lyABEeyc9SvIIUDnXN8Vy7siFlYBtv2BbV9ZhtciSICAEg
X-Microsoft-Antispam-PRVS: <422568c1e61e4f3bb58320285ac8dd89@SN1NAM02HT158.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13024025)(13018025)(13015025)(13023025)(5005006)(13017025)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT158; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT158; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT158;
	4:2gi/fTGrgTu2Gdlgsv2KoOYap68fquGDHZ6TL1BPkVFxRlWU9EcoXTscDMtHEnzfv+kvx83gKjszEe7Q0YQPL6Zc4xX43WXpq7xS30yQrL/YEQydyj9mGkw13+hPvPEtu3PxsN8CgJhJFp0/406q8FUgnhJQN31cItGU3y94xYittko4IMz6E5W3GkLMBe7GVP6XRYOcnVXEbQZLxRgKD+Jt+yfyhIRtSwN4uuH4CWCTto8ridVHH650IGLzWtsEn6WQocJsLoj8kn/L/lkJCZ0LLBaBYMDX+TKXu4APlIJxklcav3bKUPtyepxhQv8RIh6m7+vjOfflCA/ZsN05sBGOHuBwTX4YPZ2axCFy5DjSw0J5G7dnP0aESuW1YmTA9ASHYFOHjO+vHN8ami3Dwx8scqlQMvm8WZ7Cu/4tFBG4qJGUpYFaA/nepShif0ELvaHAFOPIuV4JSQkCbl1sZgxNFR/LgGDhXOiu4C7DxZINdOzmyCqLJg1Lgm9MFS+9O6JSHs4NkvB+k67fCS6HpTPN7fcDOL477L74oSoGXws=
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT158;
	23:hlBtQETRL9TF6FicM1WkRmHqFbwa7Ey/toOCpFKP7?=
	=?us-ascii?Q?WvBxCbcuuPH8E0e/wNi91FbxJHe+O4IE7BpMYfagaHEt4yP0os/JGnp7dfxE?=
	=?us-ascii?Q?KyMugldyvlBSQiwRovZQ764282LXYNffuLkO7OavVIkIsjxc8wSK9mxEGfEp?=
	=?us-ascii?Q?ZLfswZ0FZ9E3zXRciV82E4l4ZdBIclWLZTcXFBSyi03XJStajGBgEVm4731E?=
	=?us-ascii?Q?hD0c7ZxbWxOhdTkj60ipWtYfuofJBtk9k2Ajd4MtMQpnIsPhasJua1Y9RmF6?=
	=?us-ascii?Q?x2RWIMD3/gNsI89hNctV/qLtSwqmo/hVMXvaRSRojFte4Qk2ZXfTlDJe+wO+?=
	=?us-ascii?Q?D5A5JULqF6G+e2qoXGLxX7pS3VJj5ZERrIbtby/j2GgqeIPhqCXpacLR21T5?=
	=?us-ascii?Q?1sqEVq7Y/R3/S41j1+C0NzCHML9FeDlsLS6XrFU5USDgsRxMTXYJy4IZvojq?=
	=?us-ascii?Q?EFIhGD+kqTKC+2Gn/hU+sF69TDVSE5a/k8nZN+k4rII9mBAFR2eDwLvEg7CR?=
	=?us-ascii?Q?11sxrRePTBMnfgC9zUQQCh7jJRqRj10N94r3WT7bH8mTQvhcIkZ9IIWaRoNo?=
	=?us-ascii?Q?UA0lg76Q4zWYEoB46ZG27oBLIRt4FEyiYC75BdfZTlGiRVjMAc7asEs5U2BT?=
	=?us-ascii?Q?FOsPse78DEZ5PbcBEGzk0ZqR1XQU9HwLToYknE3BMzEv4I5AwVyLKVwjgIZj?=
	=?us-ascii?Q?9uulfXypdVB0M4rXEwwzLsP2+WCs7i3NVHnpPo02xA+6AG9R5cVdYnkocg0M?=
	=?us-ascii?Q?o/h0TCNZtFxDhyEq/Ja1CwL2tyDG/iDAtw6Czud1slFu33I5CB7jLd5lbvvH?=
	=?us-ascii?Q?47Rn+wNnRVXwFSPeowpOzZyvflDbGD2qBDnwkLdR3B+5B+yGKpUV1msfw4M8?=
	=?us-ascii?Q?eMeAKqc7rQtL9thhLGrvEtxSuNobi8EPxyAT2W+f3Xy1546dV8TdjdzAtkNS?=
	=?us-ascii?Q?yCvphKD53mBBOgppWXWKtMX05d+Kd2iDkFpTNiaVSb9PMRMkBVVBRMPEzpmv?=
	=?us-ascii?Q?DjSZzJWUQIleP7Lg2EY2/olFVIzkQUHA7cihCKKzm41QpCxFjapWnq5OS3zx?=
	=?us-ascii?Q?CJFUMwWIqlqOyBNoYY2f45LfUUuwVuvol0/kmKm4jZQAO+g6ja0V4a36SNeG?=
	=?us-ascii?Q?cx7NHcEHX8vNT0CDLuIQOJnsAMBfrH3RuCEZaPNKN0oO6W9j7Fgt4J36ll22?=
	=?us-ascii?Q?EqGI+ClzDwuxcw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT158;
	6:UFcyXKuwYIwkzY/uOdVbZXCXysusi8Up8hOfytgNffa4RuuQKE0xbxXhBKjHWPYWL76msZSU6OZGGakCaj8A+S2zTkkUaLpCIWchYmk4NZZAqm/yJC5bZVJ2yJoG7BP0Kwu1vJvG1hspEkgIcODJaPWEPG4y2PpchVHqq5WuABVVad5CHlclp0amAn6KksxGGMjvaV3awfzqnqdstwqo5EMpw6kUW674jqxT0gcjsdGKbshOKCqpsH5Q4w91JHvn8ISogtr0ihVBVAlexg2Sq8D3AvHgv+4bbc5wNeBi3ACuyqHLUBS5meIwRY7MFqyue4cgsPpMFd8YEd+1DLJhQg==;
	5:V/gVjB2gbxL+AQBYJM4mgz72Dq/21/tjCasl0kd06imBDM+Pq5hpnpKwbtld5ZgjHY5Qc63/iHwXTfqXLcpZL4WzRUA9idfNwXdYAgGylFNscgJDM7L64fzkOQNSyB2mYVpyZxOmyLrTq8h6eG/P/Q==;
	24:Wa5T2GlsBUnjER7+/wfyAUUqOZvY+bbF1AhIcCRIHz7HIphfTPrAZ9egKmmx5uFYMxtjK3EaEYhsZTpJgwMIwUHvVvGTGuv5zO1okWY9xBU=;
	7:1xSeLF7Iwrwa4BbWRwNVqFlMJ0bkgL2RuvXEhqG5T0jFOBxxyErDpAzXSe/VhEcQmYW44A2/NwK4owlWiMRIUxwfPbJkQr9EafBxqv7gvW/+dAVQyAKM2BVCYm6C/RUUyl3/q1657xiMvtpXryV5H+vYA+TJTYdMDsEdCHg4d6KtTPhnbLVM2TZn66Jse9SU40lk2eCZfRtzcwQjMgHxQsQGXgyRbaxijmX7eDGtfsjnDzNCOlhDn0Czmqe9qFD3
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 19:00:52.7098 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT158
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.48
Subject: [Qemu-arm] [PATCH for-2.8 v4 1/6] cadence_gem: QOMify Cadence GEM
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
X-TUID: eCDD9t+L+9x0

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

