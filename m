Received: by 10.25.159.131 with SMTP id i125csp95251lfe;
        Thu, 1 Dec 2016 21:51:06 -0800 (PST)
X-Received: by 10.55.6.14 with SMTP id 14mr37076051qkg.167.1480657866681;
        Thu, 01 Dec 2016 21:51:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m15si2151569qki.262.2016.12.01.21.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 21:51:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCgkU-00013J-3u
	for alex.bennee@linaro.org; Fri, 02 Dec 2016 00:51:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCggo-0006hv-IA
	for qemu-arm@nongnu.org; Fri, 02 Dec 2016 00:47:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCggl-0001Q1-8A
	for qemu-arm@nongnu.org; Fri, 02 Dec 2016 00:47:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38533
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cCggl-0001PO-13
	for qemu-arm@nongnu.org; Fri, 02 Dec 2016 00:47:15 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uB25dAUS050425
	for <qemu-arm@nongnu.org>; Fri, 2 Dec 2016 00:47:14 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
	by mx0b-001b2d01.pphosted.com with ESMTP id 272xu7yx7k-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Fri, 02 Dec 2016 00:47:14 -0500
Received: from localhost
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Fri, 2 Dec 2016 15:47:11 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2016 15:47:09 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 59B022BB0055;
	Fri,  2 Dec 2016 16:47:09 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uB25l9pP7668150; Fri, 2 Dec 2016 16:47:09 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uB25l8kN031522; Fri, 2 Dec 2016 16:47:09 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uB25l89q031518; Fri, 2 Dec 2016 16:47:08 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DA270A01FA;
	Fri,  2 Dec 2016 16:47:07 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Fri,  2 Dec 2016 16:46:17 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161202054617.6749-1-alastair@au1.ibm.com>
References: <20161202054617.6749-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120205-0004-0000-0000-000001C293DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120205-0005-0000-0000-0000093B39FD
Message-Id: <20161202054617.6749-8-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612020099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH v3 7/7] arm: Add an RX8900 RTC to the ASpeed board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Chris Smart <chris@distroguy.com>,
	Joel Stanley <joel@jms.id.au>, Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wwkvEJ0N8kjg

From: Alastair D'Silva <alastair@d-silva.org>

Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: Chris Smart <chris@distroguy.com>
---
 hw/arm/aspeed.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c7206fd..7445242 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -26,6 +26,20 @@ static struct arm_boot_info aspeed_board_binfo = {
     .nb_cpus = 1,
 };
 
+typedef struct IRQConfig {
+    const char *name;
+    int irq;
+    int nvic_irq;
+} IRQConfig;
+
+typedef struct AspeedI2CDevice {
+    const char *type;
+    uint8_t address;
+    int bus;
+    /* device_inputs not yet implemented */
+    const IRQConfig *device_outputs;
+} AspeedI2CDevice;
+
 typedef struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram;
@@ -34,6 +48,7 @@ typedef struct AspeedBoardState {
 typedef struct AspeedBoardConfig {
     const char *soc_name;
     uint32_t hw_strap1;
+    const AspeedI2CDevice *i2c_devices;
 } AspeedBoardConfig;
 
 enum {
@@ -64,9 +79,25 @@ enum {
         SCU_HW_STRAP_MAC0_RGMII) &                                      \
         ~SCU_HW_STRAP_2ND_BOOT_WDT)
 
+static const IRQConfig rx8900_out[] = {
+        {"rx8900-interrupt-out", 0, 22},
+        {NULL}
+};
+
+static const AspeedI2CDevice ast2500_i2c_devices[] = {
+        {"rx8900", 0x32, 11, rx8900_out},
+        {NULL}
+};
+
 static const AspeedBoardConfig aspeed_boards[] = {
-    [PALMETTO_BMC] = { "ast2400-a0", PALMETTO_BMC_HW_STRAP1 },
-    [AST2500_EVB]  = { "ast2500-a1", AST2500_EVB_HW_STRAP1 },
+    [PALMETTO_BMC] = {
+        "ast2400-a0", PALMETTO_BMC_HW_STRAP1,
+        NULL
+    },
+    [AST2500_EVB]  = {
+        "ast2500-a1", AST2500_EVB_HW_STRAP1,
+        ast2500_i2c_devices
+    },
 };
 
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
@@ -95,6 +126,27 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
     }
 }
 
+static void aspeed_i2c_init(AspeedBoardState *bmc,
+        const AspeedBoardConfig *cfg)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    const AspeedI2CDevice *dev;
+    const IRQConfig *out;
+
+    for (dev = cfg->i2c_devices; dev != NULL && dev->type != NULL; dev++) {
+        I2CBus *i2c_bus = aspeed_i2c_get_bus((DeviceState *)&soc->i2c,
+                                             dev->bus);
+        DeviceState *i2c_slave = i2c_create_slave(i2c_bus, dev->type,
+                                                  dev->address);
+
+        for (out = dev->device_outputs; out != NULL && out->name != NULL;
+                out++) {
+            qdev_connect_gpio_out_named(i2c_slave, out->name, out->irq,
+                    qdev_get_gpio_in(DEVICE(&soc->vic), out->nvic_irq));
+        }
+    }
+}
+
 static void aspeed_board_init(MachineState *machine,
                               const AspeedBoardConfig *cfg)
 {
@@ -137,6 +189,8 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.ram_size = ram_size;
     aspeed_board_binfo.loader_start = sc->info->sdram_base;
 
+    aspeed_i2c_init(bmc, cfg);
+
     arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
 }
 
-- 
2.9.3

