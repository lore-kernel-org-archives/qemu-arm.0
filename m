Received: by 10.25.159.19 with SMTP id i19csp3418658lfe;
        Wed, 20 Jan 2016 16:21:28 -0800 (PST)
X-Received: by 10.140.93.247 with SMTP id d110mr48559420qge.28.1453335688109;
        Wed, 20 Jan 2016 16:21:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m84si46425205qhb.18.2016.01.20.16.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 16:21:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aM30B-0004Ag-D2
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 19:21:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aM308-0004AH-4H
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 19:21:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aM304-0005pC-TD
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 19:21:24 -0500
Received: from mail-bl2nam02on0052.outbound.protection.outlook.com
	([104.47.38.52]:16000
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM304-0005p6-O2; Wed, 20 Jan 2016 19:21:20 -0500
Received: from SN1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(10.152.72.56) by SN1NAM02HT006.eop-nam02.prod.protection.outlook.com
	(10.152.72.197) with Microsoft SMTP Server (TLS) id 15.1.355.15;
	Thu, 21 Jan 2016 00:21:19 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT030.mail.protection.outlook.com (10.152.72.114) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 21 Jan 2016 00:21:19 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:60680
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM302-0002R2-8w; Wed, 20 Jan 2016 16:21:18 -0800
Received: from [127.0.0.1] (port=39665 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM302-0002mC-3u; Wed, 20 Jan 2016 16:21:18 -0800
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u0L0Fifu031291; Wed, 20 Jan 2016 16:15:44 -0800
Received: from [172.19.74.182] (port=47664 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aM301-0002m9-6W; Wed, 20 Jan 2016 16:21:17 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 20 Jan 2016 16:18:48 -0800
Message-ID: <629e7fa5d47f2800e51cc1f18d12635f1eece349.1453333840.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22054.006
X-TM-AS-Result: No--3.775-7.0-31-10
X-imss-scan-details: No--3.775-7.0-31-10
X-TMASE-MatchedRID: rHai9PqIGYaPU5OGrpmnoDCIlN/eSPB9LdLfmiFS7ftb8pv4L0h+Ipas
	fA8Y/RCFP4Kb2cIvyMka8S7tBYtNDJCoy9iDotiwQML2WBMvCAV4NuUV8eAvqU4IqSdLdTKdgSk
	lFxt6Wp1JJron2SWOtHPMBnsZcQ+qr78SC5iivxyDGx/OQ1GV8t0H8LFZNFG76sBnwpOylLOrfQ
	fjoLgiQxULfFKmzULHwqXQsy59H3PstC3NG489tLMmKUG932y0mIkziBFj4lMoOIlsNUaKtjqhr
	F1VZT5PnX3fvcolKicTAXsVrPkiB9w/eEBWrQMXNtVyxaZAdmCs6ecteaV3CH7cGd19dSFd
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(4326007)(5001960100002)(107886002)(189998001)(106466001)(1096002)(50986999)(23676002)(77096005)(36756003)(105606002)(11100500001)(1220700001)(586003)(575784001)(85426001)(5820100001)(5003600100002)(81156007)(5001770100001)(92566002)(87936001)(5008740100001)(2906002)(64026002)(6806005)(50226001)(118296001)(33646002)(19580395003)(229853001)(19580405001)(4001430100002)(47776003)(2870700001)(86362001)(50466002)(71366001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT006; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-MS-Office365-Filtering-Correlation-Id: 8a0afc8c-34dc-41da-96fc-08d321f8c8c3
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:SN1NAM02HT006; UriScan:(192813158149592); 
X-Microsoft-Antispam-PRVS: <f1969bd7c27e42d2b3c4a0e07831964b@SN1NAM02HT006.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13015025)(8121501046)(13023025)(520078)(13018025)(13024025)(13017025)(10201501046)(3002001);
	SRVR:SN1NAM02HT006; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT006; 
X-Forefront-PRVS: 08286A0BE2
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2016 00:21:19.1051 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT006
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.52
Cc: qemu-arm@nongnu.org, soren.brinkmann@xilinx.com,
	alistair.francis@xilinx.com
Subject: [Qemu-arm] [PATCH v3 1/1] arm_gic: Update ID registers based on
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
X-TUID: axCmaureeOAA

Update the GIC ID registers (registers above 0xfe0) based on the GIC
revision instead of using the sames values for all GIC implementations.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
---
V3:
 - Add an assert()
V2:
 - Update array indexing to match new values
 - Check the maximum value of offset as well

 hw/intc/arm_gic.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 13e297d..cd60176 100644
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
@@ -683,14 +691,31 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr o=
ffset, MemTxAttrs attrs)
         }
=20
         res =3D s->sgi_pending[irq][cpu];
-    } else if (offset < 0xfe0) {
+    } else if (offset < 0xfd0) {
         goto bad_reg;
-    } else /* offset >=3D 0xfe0 */ {
+    } else if (offset < 0x1000) {
         if (offset & 3) {
             res =3D 0;
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
+    } else {
+        g_assert_not_reached();
     }
     return res;
 bad_reg:
--=20
2.5.0

