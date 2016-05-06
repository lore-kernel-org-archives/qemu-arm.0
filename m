Received: by 10.25.208.137 with SMTP id h131csp420351lfg;
        Fri, 6 May 2016 11:19:30 -0700 (PDT)
X-Received: by 10.28.177.132 with SMTP id a126mr10353201wmf.86.1462558770059;
        Fri, 06 May 2016 11:19:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id wc9si8817690wjc.69.2016.05.06.11.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 11:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aykLI-0007GZ-PV
	for alex.bennee@linaro.org; Fri, 06 May 2016 14:19:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykH1-0008LO-1U
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:15:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykGp-0004pX-CJ
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:41 -0400
Received: from mail-bl2nam02on0083.outbound.protection.outlook.com
	([104.47.38.83]:36448
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykGp-0004nf-8X
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:35 -0400
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
	(10.152.76.55) by BL2NAM02HT186.eop-nam02.prod.protection.outlook.com
	(10.152.76.244) with Microsoft SMTP Server (TLS) id 15.1.485.4;
	Fri, 6 May 2016 18:14:25 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with
	Microsoft SMTP Server (TLS) id 15.1.485.4 via Frontend Transport;
	Fri, 6 May 2016 18:14:22 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:58463
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGc-0002Gp-8G; Fri, 06 May 2016 11:14:22 -0700
Received: from [127.0.0.1] (port=39070 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGb-0001YW-OP; Fri, 06 May 2016 11:14:21 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u46I88kN012895; Fri, 6 May 2016 11:08:08 -0700
Received: from [172.19.74.182] (port=48402 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGa-0001YS-UU; Fri, 06 May 2016 11:14:20 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
Date: Fri, 6 May 2016 11:11:00 -0700
Message-ID: <77db20f0411ab4e6c62cc307e390bfd415101282.1462557987.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462557987.git.alistair.francis@xilinx.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22304.005
X-TM-AS-Result: No--2.369-7.0-31-10
X-imss-scan-details: No--2.369-7.0-31-10
X-TMASE-MatchedRID: f9f8R8FcFNiLwgJA7qJvFMnUT+eskUQPsuIso71Vk6JYjwH7MZdcVPlY
	oV6p/cSxGy4u1Pg8lxWfnOHGpXL/zJnghuhFDtTnwM5GqAoqJip9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO2I3adjBtsMrCc+zKLyuunOqqIB265KaePgz2seCEu4+VeAQA2QLOYo5/JtLz4nPzbn3u
	0ZnH25wK+Xnjiu0RE275WQtTds0mO605ODjtjkV/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uA
	BDi47cA
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(50986999)(76176999)(105606002)(92566002)(8936002)(50226002)(5003600100002)(6806005)(229853001)(81166005)(4326007)(118296001)(64026002)(85426001)(189998001)(1220700001)(47776003)(33646002)(48376002)(19580395003)(71366001)(50466002)(5008740100001)(19580405001)(77096005)(86362001)(5003940100001)(87936001)(2906002)(2950100001)(5001770100001)(2201001)(586003)(9786002)(36756003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT186; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; MLV:sfv; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a181450-4821-4980-5aca-08d375da4083
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT186;
X-Microsoft-Antispam-PRVS: <5e9bc543899f4eb59f583bdd1e734d0a@BL2NAM02HT186.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13017025)(13015025)(13023025)(13024025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BL2NAM02HT186; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT186; 
X-Forefront-PRVS: 09347618C4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2016 18:14:22.8479 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT186
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.83
Subject: [Qemu-devel] [PATCH v1 1/2] target-arm: Add the HSTR_EL2 register
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
X-TUID: PKS3v6Jd9Ltv

Add the Hypervisor System Trap Register for EL2.

This register is used early in the Linux boot and without it the kernel
aborts with a "Synchronous Abort" error.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 target-arm/helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..65e8ff1 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3470,6 +3470,9 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "HSTR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     REGINFO_SENTINEL
 };
 
@@ -3703,6 +3706,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, cp15.hpfar_el2) },
+    { .name = "HSTR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
+      .access = PL2_RW,
+      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore, },
     REGINFO_SENTINEL
 };
 
-- 
2.5.0

