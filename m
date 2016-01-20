Received: by 10.25.159.19 with SMTP id i19csp3385042lfe;
        Wed, 20 Jan 2016 14:45:21 -0800 (PST)
X-Received: by 10.140.100.229 with SMTP id s92mr46721450qge.19.1453329921838;
        Wed, 20 Jan 2016 14:45:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m84si46011442qhb.18.2016.01.20.14.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 14:45:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aM1VB-0006QI-Ct
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 17:45:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aM1V9-0006Pw-7g
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 17:45:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aM1V6-0000cT-0w
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 17:45:19 -0500
Received: from mail-bl2nam02on0052.outbound.protection.outlook.com
	([104.47.38.52]:60438
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM1V5-0000bA-RE; Wed, 20 Jan 2016 17:45:15 -0500
Received: from CY1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(10.152.74.58) by CY1NAM02HT201.eop-nam02.prod.protection.outlook.com
	(10.152.74.169) with Microsoft SMTP Server (TLS) id 15.1.355.15;
	Wed, 20 Jan 2016 22:45:13 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT038.mail.protection.outlook.com (10.152.74.217) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 22:45:12 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:52058
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM1V1-0002QD-Hu; Wed, 20 Jan 2016 14:45:11 -0800
Received: from [127.0.0.1] (port=59276 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM1V1-0006d1-Ay; Wed, 20 Jan 2016 14:45:11 -0800
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u0KMdbQ2018173; Wed, 20 Jan 2016 14:39:37 -0800
Received: from [172.19.74.182] (port=46376 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM1V0-0006cy-Ga; Wed, 20 Jan 2016 14:45:10 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 20 Jan 2016 14:42:42 -0800
Message-ID: <118acc7c92ab1eac93ad2dcb25944569f4c6ae59.1453328768.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22054.006
X-TM-AS-Result: No--3.290-7.0-31-10
X-imss-scan-details: No--3.290-7.0-31-10
X-TMASE-MatchedRID: rDfjNDBkNcOPU5OGrpmnoDCIlN/eSPB9LdLfmiFS7ftb8pv4L0h+IiXc
	O6fodzRlCeertVoXp2gBtjkcfRMmqfbqHz4xwhvSFUp+lByZqyaDD+Gu27vc6y8zQZ2rR/OpN9B
	HgseStitFhtKHemq9oiqrdhRtfw3Qv1l2Uvx6idoLbigRnpKlKZx+7GyJjhAUMh7yJliR2dUIdq
	MpdvUZ6HnWMDjvnciCJ/qPFpKhBB1V+3IfE+H84SJ/a1Ja+OuDXuFfopFEKSlE9cKgX3q6h99Br
	QsxPDrc1UYqwZO3b9LrI5GJ+elRqg1Rh5V9wLZHeJk2g1TMqBRgO21BQaodlQ==
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(1096002)(5820100001)(189998001)(4001430100002)(586003)(86362001)(64026002)(107886002)(5001770100001)(5008740100001)(1220700001)(81156007)(85426001)(71366001)(575784001)(4326007)(50466002)(47776003)(77096005)(87936001)(118296001)(2906002)(229853001)(2870700001)(33646002)(11100500001)(6806005)(105606002)(50226001)(19580395003)(5001960100002)(92566002)(5003600100002)(106466001)(50986999)(19580405001)(36756003)(23676002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT201; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-MS-Office365-Filtering-Correlation-Id: ce10c728-a9c8-44fc-0593-08d321eb5b85
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1NAM02HT201; UriScan:(192813158149592); 
X-Microsoft-Antispam-PRVS: <8acf0b4e20454623ad3476aaf994c5a3@CY1NAM02HT201.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13018025)(520078)(5005006)(13017025)(13023025)(8121501046)(13015025)(3002001)(10201501046);
	SRVR:CY1NAM02HT201; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT201; 
X-Forefront-PRVS: 0827D7ACB9
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 22:45:12.3347 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT201
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.52
Cc: qemu-arm@nongnu.org, soren.brinkmann@xilinx.com,
	alistair.francis@xilinx.com
Subject: [Qemu-arm] [PATCH v2 1/1] arm_gic: Update ID registers based on
	revision
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
X-TUID: fXeEOMA70RdX

Update the GIC ID registers (registers above 0xfe0) based on the GIC
revision instead of using the sames values for all GIC implementations.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
---
V2:
 - Update array indexing to match new values
 - Check the maximum value of offset as well

 hw/intc/arm_gic.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 13e297d..8eb3a2d 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -31,8 +31,16 @@ do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__); =
} while (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
=20
-static const uint8_t gic_id[] =3D {
-    0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
+static const uint8_t gic_id_11mpcore[] =3D {
+    0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
+};
+
+static const uint8_t gic_id_gicv1[] =3D {
+    0x04, 0x00, 0x00, 0x00, 0x90, 0xb3, 0x1b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
+};
+
+static const uint8_t gic_id_gicv2[] =3D {
+    0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
=20
 static inline int gic_get_current_cpu(GICState *s)
@@ -683,13 +691,30 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr o=
ffset, MemTxAttrs attrs)
         }
=20
         res =3D s->sgi_pending[irq][cpu];
-    } else if (offset < 0xfe0) {
+    } else if (offset < 0xfd0) {
         goto bad_reg;
-    } else /* offset >=3D 0xfe0 */ {
+    } else /* offset >=3D 0xfd0 */ {
         if (offset & 3) {
             res =3D 0;
+        } else if (offset > 0xfdf) {
+            goto bad_reg;
         } else {
-            res =3D gic_id[(offset - 0xfe0) >> 2];
+            switch (s->revision) {
+            case REV_11MPCORE:
+                res =3D gic_id_11mpcore[(offset - 0xfd0) >> 2];
+                break;
+            case 1:
+                res =3D gic_id_gicv1[(offset - 0xfd0) >> 2];
+                break;
+            case 2:
+                res =3D gic_id_gicv2[(offset - 0xfd0) >> 2];
+                break;
+            case REV_NVIC:
+                /* Shouldn't be able to get here */
+                abort();
+            default:
+                res =3D 0;
+            }
         }
     }
     return res;
--=20
2.5.0

