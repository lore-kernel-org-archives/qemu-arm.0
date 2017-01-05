Received: by 10.25.205.13 with SMTP id d13csp9582484lfg;
        Wed, 4 Jan 2017 20:43:45 -0800 (PST)
X-Received: by 10.200.35.181 with SMTP id q50mr2802559qtq.66.1483591424904;
        Wed, 04 Jan 2017 20:43:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f124si24315491qkb.300.2017.01.04.20.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jan 2017 20:43:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cOztu-0000Gb-5f
	for alex.bennee@linaro.org; Wed, 04 Jan 2017 23:43:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmH-0001gY-K5
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmF-0001RS-Nb
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cOzmF-0001Qf-EM
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:47 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	v054XnCL043711
	for <qemu-devel@nongnu.org>; Wed, 4 Jan 2017 23:35:46 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
	by mx0a-001b2d01.pphosted.com with ESMTP id 27s6qcjjub-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 04 Jan 2017 23:35:46 -0500
Received: from localhost
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 5 Jan 2017 14:35:43 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 5 Jan 2017 14:35:40 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 7BF002BB0055;
	Thu,  5 Jan 2017 15:35:39 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
	by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v054Zds56947132; Thu, 5 Jan 2017 15:35:39 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	v054ZcRW008972; Thu, 5 Jan 2017 15:35:39 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	v054Zc9J008969; Thu, 5 Jan 2017 15:35:38 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B32D8A01AB;
	Thu,  5 Jan 2017 15:35:37 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Date: Thu,  5 Jan 2017 15:34:30 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170105043430.3176-1-alastair@au1.ibm.com>
References: <20170105043430.3176-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17010504-0012-0000-0000-0000020048DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17010504-0013-0000-0000-000006C16FC6
Message-Id: <20170105043430.3176-8-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701050074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v5 7/7] arm: Add an RX8900 RTC to the ASpeed
 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Chris Smart <chris@distroguy.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alastair D'Silva <alastair@d-silva.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FjBOTdj6C0AF

From: Alastair D'Silva <alastair@d-silva.org>

Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: Chris Smart <chris@distroguy.com>
---
 hw/arm/aspeed.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 40c1383..ef63fd0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -26,6 +26,12 @@ static struct arm_boot_info aspeed_board_binfo = {
     .nb_cpus = 1,
 };
 
+typedef struct AspeedI2CDevice {
+    const char *type;
+    uint8_t address;
+    int bus;
+} AspeedI2CDevice;
+
 typedef struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram;
@@ -37,6 +43,7 @@ typedef struct AspeedBoardConfig {
     const char *fmc_model;
     const char *spi_model;
     uint32_t num_cs;
+    const AspeedI2CDevice *i2c_devices;
 } AspeedBoardConfig;
 
 enum {
@@ -80,6 +87,11 @@ enum {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
 
+
+static const AspeedI2CDevice ast2500_i2c_devices[] = {
+        {"rx8900", 0x32, 11}
+};
+
 static const AspeedBoardConfig aspeed_boards[] = {
     [PALMETTO_BMC] = {
         .soc_name  = "ast2400-a1",
@@ -94,6 +106,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
         .fmc_model = "n25q256a",
         .spi_model = "mx25l25635e",
         .num_cs    = 1,
+        .i2c_devices = ast2500_i2c_devices,
     },
     [ROMULUS_BMC]  = {
         .soc_name  = "ast2500-a1",
@@ -104,6 +117,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
     },
 };
 
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       Error **errp)
 {
@@ -130,6 +144,19 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
     }
 }
 
+static void aspeed_i2c_init(AspeedBoardState *bmc,
+        const AspeedBoardConfig *cfg)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    const AspeedI2CDevice *dev;
+
+    for (dev = cfg->i2c_devices; dev != NULL && dev->type != NULL; dev++) {
+        I2CBus *i2c_bus = aspeed_i2c_get_bus((DeviceState *)&soc->i2c,
+                                             dev->bus);
+        (void)i2c_create_slave(i2c_bus, dev->type, dev->address);
+    }
+}
+
 static void aspeed_board_init(MachineState *machine,
                               const AspeedBoardConfig *cfg)
 {
@@ -174,6 +201,8 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.ram_size = ram_size;
     aspeed_board_binfo.loader_start = sc->info->sdram_base;
 
+    aspeed_i2c_init(bmc, cfg);
+
     arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
 }
 
-- 
2.9.3

