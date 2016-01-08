Received: by 10.25.134.130 with SMTP id i124csp618552lfd;
        Fri, 8 Jan 2016 11:00:07 -0800 (PST)
X-Received: by 10.55.41.66 with SMTP id p63mr17215051qkh.69.1452279607671;
        Fri, 08 Jan 2016 11:00:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q79si7373751qkl.39.2016.01.08.11.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 11:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHcGd-0004mS-B4
	for alex.bennee@linaro.org; Fri, 08 Jan 2016 14:00:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aHcGF-0004Ug-G4
	for qemu-devel@nongnu.org; Fri, 08 Jan 2016 13:59:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aHcGC-0002mc-B6
	for qemu-devel@nongnu.org; Fri, 08 Jan 2016 13:59:43 -0500
Received: from mail-sn1nam02on0062.outbound.protection.outlook.com
	([104.47.36.62]:59642
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aHcGC-0002mW-63
	for qemu-devel@nongnu.org; Fri, 08 Jan 2016 13:59:40 -0500
Received: from SN1NAM02FT010.eop-nam02.prod.protection.outlook.com
	(10.152.72.59) by SN1NAM02HT155.eop-nam02.prod.protection.outlook.com
	(10.152.72.169) with Microsoft SMTP Server (TLS) id 15.1.355.15;
	Fri, 8 Jan 2016 18:59:37 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT010.mail.protection.outlook.com (10.152.72.86) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Fri, 8 Jan 2016 18:59:36 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:39901
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aHcG8-00058a-4N; Fri, 08 Jan 2016 10:59:36 -0800
Received: from [127.0.0.1] (port=46623 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aHcG7-0007zm-UZ; Fri, 08 Jan 2016 10:59:35 -0800
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u08Is6LI012565; Fri, 8 Jan 2016 10:54:06 -0800
Received: from [172.19.74.182] (port=51730 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aHcG6-0007zj-U3; Fri, 08 Jan 2016 10:59:34 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2016 10:57:13 -0800
Message-ID: <861da5c44f261ee3f160607c9d128ce0e9f89e9e.1452277501.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22052.005
X-TM-AS-Result: No--1.188-7.0-31-10
X-imss-scan-details: No--1.188-7.0-31-10
X-TMASE-MatchedRID: LtdDkAUA39X4DetQQCtOBfzu9Lw9C7fAPZmbnY2qDInfUZT83lbkECW4
	gi/wgh1NvQwDKMUFVHQS5thlB89aW79ZdlL8eonaC24oEZ6SpSmb4wHqRpnaDttSQLwFRJi5zkP
	7zATTNX1l66ZlnvIHHwLV3D3ZnU5xlHKmxxYuk2CAueG3LlBx+iYykE+cFiX6SULSTjypHDwZZO
	gZztc429VGKsGTt2/S6yORifnpUaoNUYeVfcC2R3iZNoNUzKgUN+XOQZygrvY=
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(64026002)(36756003)(92566002)(87936001)(1096002)(586003)(105606002)(1220700001)(4001430100002)(23676002)(77096005)(106466001)(50986999)(85426001)(4001450100002)(33646002)(86362001)(19580395003)(5003600100002)(5001960100002)(5001770100001)(50466002)(81156007)(19580405001)(107886002)(229853001)(189998001)(118296001)(5820100001)(50226001)(71366001)(6806005)(2906002)(5008740100001)(450100001)(4326007)(47776003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT155; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-MS-Office365-Filtering-Correlation-Id: fef3b925-6502-4974-2b8d-08d3185ddab2
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:SN1NAM02HT155; UriScan:(192813158149592); 
X-Microsoft-Antispam-PRVS: <999d9d2894b04d5cb73ab99e7312dc33@SN1NAM02HT155.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(13015025)(5005006)(13018025)(13017025)(520078)(10201501046)(3002001);
	SRVR:SN1NAM02HT155; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT155; 
X-Forefront-PRVS: 0815F8251E
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2016 18:59:36.4975 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT155
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.62
Cc: qemu-arm@nongnu.org, soren.brinkmann@xilinx.com,
	alistair.francis@xilinx.com
Subject: [Qemu-devel] [PATCH v1 1/1] arm_gic: Include the GIC ArchRev in the
	ICPIDR2 register
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
X-TUID: qE/QE4cz4Iep

The ARM GIC documentation (page 4-119) describes that bits
7 to 4 of the ICPIDR2 register should include the GIC architecture
version. This patche ORs the version into the existing return value.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
---

 hw/intc/arm_gic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 13e297d..f47d606 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -688,6 +688,10 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr of=
fset, MemTxAttrs attrs)
     } else /* offset >=3D 0xfe0 */ {
         if (offset & 3) {
             res =3D 0;
+        } else if (offset =3D=3D 0xfe8 && s->revision !=3D REV_11MPCORE &&
+                                      s->revision !=3D REV_NVIC) {
+            /* ICPIDR2 includes the GICv1 or GICv2 version information */
+            res =3D gic_id[(offset - 0xfe0) >> 2] | (s->revision << 4);
         } else {
             res =3D gic_id[(offset - 0xfe0) >> 2];
         }
--=20
2.5.0

