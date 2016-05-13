Received: by 10.25.208.137 with SMTP id h131csp344758lfg;
        Fri, 13 May 2016 14:32:11 -0700 (PDT)
X-Received: by 10.55.214.18 with SMTP id t18mr2490672qki.202.1463175131669;
        Fri, 13 May 2016 14:32:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n11si13328084qkn.63.2016.05.13.14.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 14:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1Kgt-0000aE-67
	for alex.bennee@linaro.org; Fri, 13 May 2016 17:32:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1b1Kgp-0000XB-Hn
	for qemu-arm@nongnu.org; Fri, 13 May 2016 17:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1b1Kgm-00011W-A6
	for qemu-arm@nongnu.org; Fri, 13 May 2016 17:32:07 -0400
Received: from mail-sn1nam02on0067.outbound.protection.outlook.com
	([104.47.36.67]:44576
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1b1Kgm-00011O-2E; Fri, 13 May 2016 17:32:04 -0400
Received: from SN1NAM02FT006.eop-nam02.prod.protection.outlook.com
	(10.152.72.53) by SN1NAM02HT042.eop-nam02.prod.protection.outlook.com
	(10.152.72.229) with Microsoft SMTP Server (TLS) id 15.1.492.8;
	Fri, 13 May 2016 21:32:02 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT006.mail.protection.outlook.com (10.152.72.68) with Microsoft
	SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Fri, 13 May 2016 21:32:02 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:54392
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1b1Kgj-0000AF-Ho; Fri, 13 May 2016 14:32:01 -0700
Received: from [127.0.0.1] (port=34997 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1b1Kgj-0007ig-ES; Fri, 13 May 2016 14:32:01 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u4DLPj4i001374; Fri, 13 May 2016 14:25:45 -0700
Received: from [172.19.74.182] (port=60014 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1b1Kgi-0007id-Hi; Fri, 13 May 2016 14:32:00 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
Date: Fri, 13 May 2016 14:28:33 -0700
Message-ID: <ea5aae4b10283de4705b864fe9d4bd2eaddaacae.1463174342.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22318.005
X-TM-AS-Result: No--4.835-7.0-31-10
X-imss-scan-details: No--4.835-7.0-31-10
X-TMASE-MatchedRID: nFi+jZvuSCKLwgJA7qJvFMnUT+eskUQPsuIso71Vk6Jh2fnHe1cil/HJ
	52J1Kit6kZ3T6ylBNAUBtjkcfRMmqZH0YXYnbGozFEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTtlu/
	VKvCjKPUVZPGDWtOfCBv8relFiGTrM9/NatGZHlLTuzUcwDHO2f1QxAPxrzbJfv3OdaUbtlfRvZ
	TgwKkqjYUMzBNz1P/xqUUYbHSknHnyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(2201001)(118296001)(229853001)(50986999)(86362001)(77096005)(85426001)(8676002)(2906002)(8936002)(5001770100001)(81166006)(189998001)(5003600100002)(4326007)(36756003)(106466001)(9786002)(1220700001)(105606002)(11100500001)(6806005)(87936001)(586003)(47776003)(33646002)(50226002)(50466002)(48376002)(19580405001)(19580395003)(71366001)(64026002)(92566002)(5008740100001)(5003940100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT042; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; MLV:sfv; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d61a5d13-a4f8-47eb-4c40-08d37b7605cf
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT042;
X-Microsoft-Antispam-PRVS: <e83c0b14fa634cb1be80e56075783853@SN1NAM02HT042.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13024025)(8121501046)(13023025)(13015025)(5005006)(13017025)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT042; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT042; 
X-Forefront-PRVS: 0941B96580
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2016 21:32:02.1169 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.67
Subject: [Qemu-arm] [PATCH v2 1/1] target-arm: Add the HSTR_EL2 register
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
Cc: edgar.iglesias@xilinx.com, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 498tpy2hwk90

Add the Hypervisor System Trap Register for EL2.

This register is used early in the Linux boot and without it the kernel
aborts with a "Synchronous Abort" error.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V2:
 - Add 32-bit access
 - Connect to a variable

 target-arm/cpu.h    | 1 +
 target-arm/helper.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 9deef86..0eb93c6 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -279,6 +279,7 @@ typedef struct CPUARMState {
             uint64_t far_el[4];
         };
         uint64_t hpfar_el2;
+        uint64_t hstr_el2;
         union { /* Translation result. */
             struct {
                 uint64_t _unused_par_0;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index a2ab701..d652c01 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3470,6 +3470,9 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     REGINFO_SENTINEL
 };
 
@@ -3705,6 +3708,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, cp15.hpfar_el2) },
+    { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
+      .cp = 15, .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
+      .access = PL2_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.hstr_el2) },
     REGINFO_SENTINEL
 };
 
-- 
2.7.4

