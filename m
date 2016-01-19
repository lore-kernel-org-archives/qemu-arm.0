Received: by 10.25.159.19 with SMTP id i19csp2220924lfe;
        Mon, 18 Jan 2016 17:36:42 -0800 (PST)
X-Received: by 10.140.155.87 with SMTP id b84mr35367615qhb.29.1453167402642;
        Mon, 18 Jan 2016 17:36:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h195si34261366qhc.51.2016.01.18.17.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 17:36:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLLDu-0006ai-4w
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 20:36:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aLLDY-0006J7-Cx
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 20:36:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aLLDV-0006AM-4X
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 20:36:20 -0500
Received: from mail-cys01nam02on0081.outbound.protection.outlook.com
	([104.47.37.81]:25776
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aLLDU-0006AA-SA
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 20:36:17 -0500
Received: from BL2NAM02FT064.eop-nam02.prod.protection.outlook.com
	(10.152.76.51) by BL2NAM02HT229.eop-nam02.prod.protection.outlook.com
	(10.152.76.213) with Microsoft SMTP Server (TLS) id 15.1.355.15;
	Tue, 19 Jan 2016 01:36:15 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT064.mail.protection.outlook.com (10.152.77.119) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Tue, 19 Jan 2016 01:36:14 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:42333
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aLLDR-0007fR-P6; Mon, 18 Jan 2016 17:36:13 -0800
Received: from [127.0.0.1] (port=49551 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aLLDR-0002kl-Jb; Mon, 18 Jan 2016 17:36:13 -0800
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u0J1UejJ031689; Mon, 18 Jan 2016 17:30:40 -0800
Received: from [172.19.74.182] (port=36250 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aLLDQ-0002ki-M9; Mon, 18 Jan 2016 17:36:12 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2016 17:33:48 -0800
Message-ID: <e83ff2fc1c0fcdc6c435e53b1f83f1049b2a87a3.1453166915.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22054.006
X-TM-AS-Result: No--2.362-7.0-31-10
X-imss-scan-details: No--2.362-7.0-31-10
X-TMASE-MatchedRID: +aiIZkdJNeWPU5OGrpmnoDCIlN/eSPB9LdLfmiFS7fs+/xaqysYMuPlY
	oV6p/cSx3g5DXsVK9iOGjH9jdN3fBaOfNrZ8RZlLHcQQBuf4ZFvJ5SXtoJPLyAfFyYfWAGdro8W
	MkQWv6iVJeFvFlVDkf46HM5rqDwqtb/onP+KaybLO/CcSpUqtiHBy1pXJ0egrd1k46exhRp10nf
	BiFTzSxVntny5sNMuMOd/tvbBSxKLkoZSPsJWdv/clnvVmn9YL9UElV5SMCCrLt16YWtxzeF9Np
	ZbddHv73iGQYUPZme7O51vq1xhTsg==
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(2906002)(36756003)(23676002)(5003600100002)(1096002)(33646002)(586003)(5001960100002)(118296001)(86362001)(92566002)(77096005)(1220700001)(50226001)(19580405001)(81156007)(575784001)(5820100001)(5001770100001)(107886002)(50466002)(229853001)(5008740100001)(6806005)(4326007)(11100500001)(19580395003)(47776003)(71366001)(64026002)(87936001)(105606002)(106466001)(4001430100002)(50986999)(85426001)(189998001)(2870700001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT229; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-MS-Office365-Filtering-Correlation-Id: 35aaacf2-9dc6-425f-d1e6-08d32070eb44
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BL2NAM02HT229; UriScan:(192813158149592); 
X-Microsoft-Antispam-PRVS: <102e541381d141eaaa874546e0c43ff3@BL2NAM02HT229.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13015025)(13018025)(13023025)(8121501046)(13017025)(520078)(10201501046)(3002001);
	SRVR:BL2NAM02HT229; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT229; 
X-Forefront-PRVS: 0826B2F01B
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2016 01:36:14.3078 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT229
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.81
Cc: qemu-arm@nongnu.org, soren.brinkmann@xilinx.com,
	alistair.francis@xilinx.com
Subject: [Qemu-devel] [PATCH v1 1/1] arm_gic: Update ID registers based on
	revision
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3SCKeNsq77Yf

Update the GIC ID registers (registers above 0xfe0) based on the GIC
revision instead of using the sames values for all GIC implementations.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
---

 hw/intc/arm_gic.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 13e297d..f6bfa53 100644
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
@@ -689,7 +697,22 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr of=
fset, MemTxAttrs attrs)
         if (offset & 3) {
             res =3D 0;
         } else {
-            res =3D gic_id[(offset - 0xfe0) >> 2];
+            switch (s->revision) {
+            case REV_11MPCORE:
+                res =3D gic_id_11mpcore[(offset - 0xfe0) >> 2];
+                break;
+            case 1:
+                res =3D gic_id_gicv1[(offset - 0xfe0) >> 2];
+                break;
+            case 2:
+                res =3D gic_id_gicv2[(offset - 0xfe0) >> 2];
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

