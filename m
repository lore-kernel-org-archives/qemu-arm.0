Received: by 10.25.208.211 with SMTP id h202csp1222387lfg;
        Mon, 4 Apr 2016 09:14:13 -0700 (PDT)
X-Received: by 10.140.226.19 with SMTP id w19mr9585730qhb.55.1459786453610;
        Mon, 04 Apr 2016 09:14:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d193si22785266qka.54.2016.04.04.09.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 09:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an78n-0004E5-3B
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 12:14:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1an78h-0004Ab-Ke
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:14:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1an78c-0003mY-Hd
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:14:07 -0400
Received: from mail-bn1bon0084.outbound.protection.outlook.com
	([157.56.111.84]:45556
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>)
	id 1an78c-0003mC-5A; Mon, 04 Apr 2016 12:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-caviumnetworks-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MFIAols2JUp5PwGo0LLSzqyr3hIDmKdZyZkZA2ziYp0=;
	b=OMP7JehC38bkIWbFKq26dEsVLPWd8BHHvYywUNu/JBhk/uaLlTeF16pI56RbxMf4AC4mT+UW5ldW02CLzqlYGKqxqNY2IVSJa3MW9OKzYpwEiXvqf3J2292SSSJWQzXecNGtm4mybiicrp2oPgz/eBtjPt0b3PVZD7omOvUf6mk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none
	header.from=caviumnetworks.com;
Received: from localhost.localdomain (106.51.142.172) by
	BLUPR0701MB1683.namprd07.prod.outlook.com (10.163.84.29) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Mon, 4 Apr 2016 13:40:47 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 19:09:54 +0530
Message-ID: <1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [106.51.142.172]
X-ClientProxiedBy: BM1PR01CA0025.INDPRD01.PROD.OUTLOOK.COM (10.163.198.160) To
	BLUPR0701MB1683.namprd07.prod.outlook.com (10.163.84.29)
X-MS-Office365-Filtering-Correlation-Id: e8dcb81b-3aad-4130-106e-08d35c8ebc75
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	2:dG7mFG7Wof7ozwuwFm3eyeDMsGRXOG8pH4UBPgMsuj7kQVXQQfTIoPqmF3pNFZiDlQrMVF5C+NLTETW6s6oPJPGqS6ggynp/Hg5+CVMy+RRvzMok6f6xLdKd/tNguffxtSt82ZjYJ3AOUSDuhS2fPTSWUI850sMEGr1vR3yQLc8MkUxnTgTR/8bsx5Gb33rd;
	3:v+X+epPl/TEdcvrWTDGW05MFVNttvzA+meUA3vDoLrmCq5i9GVBXn3+b2AzA/sc9axEqImPO8flRLW9D1+qF8baOZl9fQXmhH5CvLlaFZ+uzb+GKZLqBfWJPfNTR7L/t
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0701MB1683;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	25:S6UC0dOaBNElXzXupOQt+ssCTaMwqTfVPIxcReuaPQxj6Z5ehPcS1pcvi+62AHo0vDQ5Q0eWEr/EhRmHT/2Od67WduxNFnjjkzKrwlFzjAlohAej6DbM9x2ukeUgnyJ9WSzkbeXcii5uZJNfkTFqmlMq4AhzjVzoIaEMwssiZyXLKSweXPUXnSP5pw90tRzq7YIA9UPH/eaU1kMwayfTDFqH8O1YP9+No5x+z2TvxGvn0JUC3EO7c26Vknh1D3Zlq6cRpdUtnHXTceF4YPmegkBqN+8BpOoTxwLPjuFBWEZ2BqmRSBeCHiUuLg9+2KHSmdU53fJj3WlcJpW3rtCLAheaHhjWs+fO+5e0E7+zsyV9VvX57i6Qw4iyBShJQNrstsXOoLShYLgx59HzExthCO7l7mHeIEriUIhJGpM7TSPPVwrB+IzzAS5AZmJVgT1YoPRteXs3LhH89ckjBeWePGoatHc4y02T+jj/q+fZZooxHMWXPNy4ZKDhIFHlzQlDau9W6rheL4LjtYjhx6TcjlE4dWJ/tCrvRUOHxOWtlUOWWXYheE62HzOP4blHoNoYKvwnNFMYQ8VG3gDNzx0C84DgR8pJp1MCn84qZXbKHLZnURzgPRQO6ZRwVGVsyAMcMlxntC/c9FeU5j+CZhUiTw==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	20:30o3kfMX3+Et7mzIssp4fxV7Z3F9ZyLEYg4fW29VhbPxxevvrspiuO2b65V9Z8Pg1iV3181Phwk+FVzLLCd7aTgN56D439Xt2kQm4/Fl/aDybrbXbgYClR2rrD2v8A/fmJRG/7j5Ewo25AeO2+yirLrgS9ihYklavjvCvEeuS5KVzw2pgRPlmw61ggWPfyOJHX7xr9iOkp4UPQOgvuCJV1/42pdUu0PAHjJz+rV1kPiSuO/dMIks3c3C15rR2OtfEX+8g53qE9++gupyXZ70NTXRexu3mEUixaRH0W037BrEc0p3waW6hS//D4oTNtgpSk7ybVc2Pn3CQ79nhiLwwU2gmqSCwytv1LPoywwGKBxUU5agUIN/S0PEav1FRSXP4RUEwU54cK+lYvaMeFREboeY/KGjp35VgpP7fnKQ6VAHElg9VcfHvaXSPn28rLAGxS34uX0O1Imbd3CflUFO2NubMm8+o4BnmVb/ongFd/hfoYDcLQgQ5WLGNuZC0j1gvYzo6aydurgIzrFAsT2KBcDNDfeytv5p0RCRX9CKN3VY38qVPM41NzCeVetzvsAcaalbHL2PnNXFrTjtvO7fhT7MVde6nCIt+1KJF8oWOs8=
X-Microsoft-Antispam-PRVS: <BLUPR0701MB168322B3E67039418750129CFF9D0@BLUPR0701MB1683.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0701MB1683; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0701MB1683; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	4:SPrFE9RrA7quBCRcSn9P9i0FhwmW+TlfjMxnXwOdQNfbdsDj3I40zM5mlczNBUrC19EPB7q41BnSwlaQqQK6sVY31URkT561x1JsmR/eol70roFv3KE31SvXkVGbi7+kzewJ+T/2EtXWF1FtozU1I0HHd2cyq10D02iEk8vWwZNaq/NGP+thHnJXD2GzJ3MvFdrSeOnZnyskzcwu50yfgzST+er8JE2Fw40eva9e0XNAwBtoI5PLGGbt02L16t0dFyyvZFbC/EqlA5RGgXq2TLW2RcpEifkLvJLwu+0ZfSNZiuxFW6YQoQHSS3Z7qqN4XsTcb0qdpP5VaDlQkI8EzCL32MavsbAJqLFIWESVcD4ztDm/AKLj9+LyaSiJgTvY
X-Forefront-PRVS: 0902222726
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6069001)(47776003)(36756003)(1096002)(5001770100001)(6116002)(3846002)(229853001)(50466002)(50986999)(76176999)(2950100001)(586003)(19580405001)(2906002)(4326007)(5008740100001)(19580395003)(5004730100002)(81166005)(2876002)(4001430100002)(86152002)(5009440100003)(42186005)(66066001)(5003940100001)(92566002)(50226001)(77096005)(48376002)(107886002)(33646002)(189998001)(20860200002)(32040200001)(217873001)(4720700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0701MB1683;
	H:localhost.localdomain; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0701MB1683;
	23:Pc631tb7n79ZsZKYsByoC0VuuobWbIwKkJM2rRQ?=
	=?us-ascii?Q?D8lKf13FPNu4/EtUUt0uQ0oTPBV1xdLJI93Uys2ekZitbLxkjlj8UXMzJ1Bp?=
	=?us-ascii?Q?TYzkTzMHh/VJg0Q8A9rTuWR1b550jIRhg4GuEpLWIfWLmEzMGtcbSyi132Bq?=
	=?us-ascii?Q?C+CgDmgJfFHORcPwo4wvpNREylxmqxyhS14gGeTdLZGDgxv4nX29PPmYki/F?=
	=?us-ascii?Q?Pe2Dc4QYK3R0casq0mk+dzXuFQz6e5Yd17uwi3Bl4pXqGYqKRhoPi4NbOQ8b?=
	=?us-ascii?Q?93qdIKInd86GkOuz9kiA43IpfCXS1GvVFkr3ysWoBOTGhMIf9MM9qjtWHH9x?=
	=?us-ascii?Q?QAa/R/5DSR2P2Y7n/u2pekyMumIZK2u2ax2dduFjv+COe23KI+gljLFhI7TO?=
	=?us-ascii?Q?qtU8zSb6E5StItlB7hNkydhY0qdUIFOPwtHjWvaRlEBEI2TblKgpefG0VoXO?=
	=?us-ascii?Q?00yAmVYl3064IhOcVr+Yc3HLDkygDUehoLEJRA4mee86eeH9EWDQO9h7u7gF?=
	=?us-ascii?Q?52BMHz87GDGEuEHtSTc5tST+B6/7Tm2eaXrvTz2IC0vTQq0ditynC8dk4u1K?=
	=?us-ascii?Q?lOOcRF3Q09hAKb9k7KpJPDcz5uUobIW4wWcMycdCvbs1LZc1mHkavSnQtAmx?=
	=?us-ascii?Q?Dg9lCond8lqwWSQAycKhOdWDlsgHhVhP49N9LBOFDGJJ16ANyOxl+n4LNR5q?=
	=?us-ascii?Q?NqrjRh6iFJ76l6PgJj/mElGCpa9xvPO2iVGCgL+EyGGl2cWqlZnIMg9uz9zQ?=
	=?us-ascii?Q?RMByjVk1PPT9ZHJIhl7YAQlQuYlmvCim9LXzCboeVaJBi8cIccd6f+uCYiJ+?=
	=?us-ascii?Q?jLURzhstuaCjdYfCPdekX+3meVpiIuxF7lEC7soBuVvTHTOJv1kXfncCZdpT?=
	=?us-ascii?Q?EdJbQ8PzQw08sXZ5ixKrdmEA3XZ9ti9N1HKgfB2vN+W8eP4ME8aM8r84zBvr?=
	=?us-ascii?Q?X70puG76sI3OIG6fEXyiIk1bYKm/c/oLvtxrQnZX08AQT6gQeyNTJdRvSIxk?=
	=?us-ascii?Q?SvqiXn11cm73zIWgB7kPR132XX2SQMbef2xpnf65OTGKYWjLFWOMzr756ndm?=
	=?us-ascii?Q?jUBXbTn9epfcavxF8M3WMKHu/Im2LIkaG/PFCMYC7TSLnBOXsEg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0701MB1683;
	5:qgE63TlVmz7Nd/SGEbEKvongppEp54b/5f57afM2sxc4O2X74AbjM+C+phppCJFT6wJm/GUFPA72U26oZneewF5mJbJnDrg7erCBBBVaU2+3R5FTd6dC1XU/NqXgj1JosKtu8/sc89ssYGTVo0ar6Q==;
	24:UGVydhlrvdeezFxwhMDOvk6ZuDfBDwzqxjLsAiGdXrxzBzd0pr7V6EEjuDmUWwkNBGX/Bghiyca7JebLLTsxAkvbiP/FIdN7Ci41ekbrfww=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2016 13:40:47.9864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0701MB1683
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.84
Cc: Prasun.Kapoor@caviumnetworks.com, Vijay <vijayak@cavium.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Subject: [Qemu-arm] [RFC PATCH v1 1/2] target-arm: Update page size for
	aarch64
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xKrwCRVlewAM

From: Vijay <vijayak@cavium.com>

Set target page size to minimum 4K for aarch64.
This helps to reduce live migration downtime significantly.

Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
---
 target-arm/cpu.h |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 066ff67..2e4b48f 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1562,11 +1562,18 @@ bool write_cpustate_to_list(ARMCPU *cpu);
 #if defined(CONFIG_USER_ONLY)
 #define TARGET_PAGE_BITS 12
 #else
+/*
+ * Aarch64 support minimum 4K page size
+ */
+#if defined(TARGET_AARCH64)
+#define TARGET_PAGE_BITS 12
+#else
 /* The ARM MMU allows 1k pages.  */
 /* ??? Linux doesn't actually use these, and they're deprecated in recent
    architecture revisions.  Maybe a configure option to disable them.  */
 #define TARGET_PAGE_BITS 10
 #endif
+#endif
 
 #if defined(TARGET_AARCH64)
 #  define TARGET_PHYS_ADDR_SPACE_BITS 48
-- 
1.7.9.5

