Received: by 10.25.208.137 with SMTP id h131csp418924lfg;
        Fri, 6 May 2016 11:16:02 -0700 (PDT)
X-Received: by 10.195.31.130 with SMTP id km2mr20430374wjd.86.1462558562207;
        Fri, 06 May 2016 11:16:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b75si12164375wmf.43.2016.05.06.11.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 11:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aykHw-0001NF-RZ
	for alex.bennee@linaro.org; Fri, 06 May 2016 14:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykH1-0008Mg-O0
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykGq-0004pj-3V
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:42 -0400
Received: from mail-cys01nam02on0049.outbound.protection.outlook.com
	([104.47.37.49]:12896
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykGp-0004nj-Ue
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:36 -0400
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
	(10.152.72.53) by SN1NAM02HT226.eop-nam02.prod.protection.outlook.com
	(10.152.72.224) with Microsoft SMTP Server (TLS) id 15.1.485.4;
	Fri, 6 May 2016 18:14:26 +0000
Authentication-Results: spf=temperror (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=temperror action=none header.from=xilinx.com; 
Received-SPF: TempError (protection.outlook.com: error in processing during
	lookup of xilinx.com: DNS Timeout)
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with
	Microsoft SMTP Server (TLS) id 15.1.485.4 via Frontend Transport;
	Fri, 6 May 2016 18:14:24 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:58471
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGe-0002Gs-9g; Fri, 06 May 2016 11:14:24 -0700
Received: from [127.0.0.1] (port=39078 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGe-0001Yf-5g; Fri, 06 May 2016 11:14:24 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u46I8AUN012899; Fri, 6 May 2016 11:08:11 -0700
Received: from [172.19.74.182] (port=48406 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGd-0001Yc-9Y; Fri, 06 May 2016 11:14:23 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
Date: Fri, 6 May 2016 11:11:02 -0700
Message-ID: <6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462557987.git.alistair.francis@xilinx.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22304.005
X-TM-AS-Result: No--3.422-7.0-31-10
X-imss-scan-details: No--3.422-7.0-31-10
X-TMASE-MatchedRID: Z28ZQS4q9JyzLD5kmcW6ZEyQ5fRSh265CqIJhrrDy28q1hvYOvwvB+Lz
	NWBegCW2wgn7iDBesS1YF3qW3Je6+2pcCn7+ST3kxUqDfpa8DymJfZjU1ngPCeVnYCjGoZRlQQT
	dEe7VvaOErb0fgDKQayY4tJFYnuTbcRsDZgzUNQPWnhXHS1vPZku/kTKv9giuqwOHO1Fdn0Kb4t
	j0DvxRUIs9ro6z1cfcCdyqwX4Zffl+3BndfXUhXQ==
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(189002)(199003)(189998001)(586003)(2906002)(8936002)(4326007)(81166005)(76176999)(9786002)(50986999)(6806005)(19580405001)(50226002)(47776003)(19580395003)(5008740100001)(5003600100002)(1220700001)(11100500001)(77096005)(2950100001)(118296001)(64026002)(71366001)(48376002)(50466002)(33646002)(92566002)(5001770100001)(36756003)(87936001)(2201001)(86362001)(5003940100001)(229853001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT226; H:xsj-tvapsmtpgw01;
	FPR:; SPF:TempError; MLV:sfv; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bbb67104-2fca-4756-fb95-08d375da417c
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT226;
X-Microsoft-Antispam-PRVS: <0127ed0522974b50841356ec0014f63d@SN1NAM02HT226.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13017025)(13015025)(13023025)(13024025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT226; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT226; 
X-Forefront-PRVS: 09347618C4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2016 18:14:24.9214 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT226
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.49
Subject: [Qemu-devel] [PATCH v1 2/2] target-arm: Enable EL2 for the A53s and
 A57s
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
Cc: edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQeXqGkZx9fe

Enable EL2 by default for the A53s and A57s.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 target-arm/cpu64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
index 1635deb..59a2042 100644
--- a/target-arm/cpu64.c
+++ b/target-arm/cpu64.c
@@ -110,6 +110,7 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
     cpu->midr = 0x411fd070;
@@ -165,6 +166,7 @@ static void aarch64_a53_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
     cpu->midr = 0x410fd034;
-- 
2.5.0

