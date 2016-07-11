Received: by 10.25.21.156 with SMTP id 28csp90886lfv;
        Mon, 11 Jul 2016 16:24:52 -0700 (PDT)
X-Received: by 10.55.157.139 with SMTP id g133mr27872069qke.107.1468279492195;
        Mon, 11 Jul 2016 16:24:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si304420qtd.43.2016.07.11.16.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 16:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMkZH-0005Cz-Le
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 19:24:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkXQ-00045t-Mw
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 19:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkXL-0007IX-H9
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 19:22:55 -0400
Received: from mail-bl2nam02on0085.outbound.protection.outlook.com
	([104.47.38.85]:33261
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkXL-0007IT-Cz
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 19:22:51 -0400
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
	(10.152.76.59) by BL2NAM02HT105.eop-nam02.prod.protection.outlook.com
	(10.152.76.156) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.534.7;
	Mon, 11 Jul 2016 23:22:50 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.534.7
	via Frontend Transport; Mon, 11 Jul 2016 23:22:47 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:43769
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkXG-0002ym-6P; Mon, 11 Jul 2016 16:22:46 -0700
Received: from [127.0.0.1] (port=49056 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkXG-00018F-2d; Mon, 11 Jul 2016 16:22:46 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6BNG6up021018; Mon, 11 Jul 2016 16:16:06 -0700
Received: from [172.19.74.182] (port=39680 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkXF-00018C-56; Mon, 11 Jul 2016 16:22:45 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 11 Jul 2016 16:22:24 -0700
Message-ID: <69992ebef8db49ddc320cd9f5d9a60c95c593aa7.1467752513.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22444.005
X-TM-AS-Result: No-1.022-7.0-31-10
X-imss-scan-details: No-1.022-7.0-31-10
X-TMASE-MatchedRID: KYMyBIAmGGUcqJwtUHLtOdOEZs/2oH3cvz6rXsYUspHVU2WiOk7jaAm1
	YMuIrlxQyWfrAWRuDcGt3sLYKglzIdapN96o/xAjxZQoGMRGhhNY6vvKPQt6xSA6eO+NDmAxW9o
	SzMAtdLLi8zVgXoAltsIJ+4gwXrEtWBd6ltyXuvukKJtLqA0f79vv/O+c6tVIGiCoMk1n3UkVKw
	Qs6xG/X6WZrVCwpTuN83bQqbM84CRv5Z2wcPJTtnhkyQGTbxKjXIhyZAhWoW9Lv5Eyr/YIrqsDh
	ztRXZ9Cm+LY9A78UVCLPa6Os9XH3Kx4gs6iDnXyftwZ3X11IV0=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(86362001)(15650500001)(229853001)(189998001)(77096005)(11100500001)(85426001)(106466001)(92566002)(118296001)(7846002)(8936002)(47776003)(105606002)(50226002)(575784001)(33646002)(71366001)(586003)(19580405001)(5001770100001)(2906002)(64026002)(356003)(87936001)(305945005)(5003600100003)(7696003)(50986999)(81166006)(48376002)(50466002)(4326007)(19580395003)(9786002)(36756003)(5003940100001)(81156014)(8676002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT105; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9238a8af-7778-425b-f4ed-08d3a9e24628
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT105;
X-Microsoft-Antispam-PRVS: <089f2a713b974c5095eee91f6fb0744e@BL2NAM02HT105.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(50582790962513)(192813158149592)(126837547833334); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(8121501046)(13024025)(13015025)(13023025)(5005006)(13017025)(10201501046)(3002001)(6055026);
	SRVR:BL2NAM02HT105; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT105; 
X-Forefront-PRVS: 00003DBFE7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2016 23:22:47.1351 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT105
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.85
Subject: [Qemu-devel] [PATCH v1 1/1] MAINTAINERS: Update the Xilinx
 maintainers
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	crosthwaitepeter@gmail.com, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k0whbR/greT8

Update the Xilinx maintainers documentation to simplify what we maintain
and cover all of our upstream code.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 MAINTAINERS | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d0e2c3..14183d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -449,23 +449,23 @@ S: Maintained
 F: hw/*/versatile*
 
 Xilinx Zynq
+M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 M: Alistair Francis <alistair.francis@xilinx.com>
-M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
-F: hw/arm/xilinx_zynq.c
-F: hw/misc/zynq_slcr.c
+F: hw/*/xilinx_*
 F: hw/*/cadence_*
-F: hw/ssi/xilinx_spips.c
+F: hw/misc/zynq_slcr.c
+F: include/hw/xilinx.h
+X: hw/ssi/xilinx_*
 
 Xilinx ZynqMP
 M: Alistair Francis <alistair.francis@xilinx.com>
-M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
+M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
-F: hw/arm/xlnx-zynqmp.c
-F: hw/arm/xlnx-ep108.c
-F: include/hw/arm/xlnx-zynqmp.h
+F: hw/*/xlnx*.c
+F: include/hw/*/xlnx*.c
 
 ARM ACPI Subsystem
 M: Shannon Zhao <zhaoshenglong@huawei.com>
@@ -948,14 +948,6 @@ S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
 
-Xilinx EDK
-M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-M: Alistair Francis <alistair.francis@xilinx.com>
-M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
-S: Maintained
-F: hw/*/xilinx_*
-F: include/hw/xilinx.h
-
 Network packet abstractions
 M: Dmitry Fleytman <dmitry@daynix.com>
 S: Maintained
@@ -1243,6 +1235,12 @@ F: docs/*qmp-*
 F: scripts/qmp/
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
 
+Register API
+M: Alistair Francis <alistair.francis@xilinx.com>
+S: Maintained
+F: hw/core/register.c
+F: include/hw/register.h
+
 SLIRP
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>
 M: Jan Kiszka <jan.kiszka@siemens.com>
-- 
2.7.4

