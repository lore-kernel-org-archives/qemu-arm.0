Received: by 10.182.158.201 with SMTP id ww9csp4395197obb;
        Wed, 23 Dec 2015 16:26:55 -0800 (PST)
X-Received: by 10.141.4.67 with SMTP id g64mr46396479qhd.34.1450916815376;
        Wed, 23 Dec 2015 16:26:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b130si42398449qka.18.2015.12.23.16.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:26:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtk6-0001dm-Sw
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:26:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjF-0000Ja-H5
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:26:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjC-0004wF-Bt
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:26:01 -0500
Received: from mail-by2on0141.outbound.protection.outlook.com
	([207.46.100.141]:34504
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtjC-0004u5-4q; Wed, 23 Dec 2015 19:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QzfxZVg9qrhxNmLNEmjvkVP3sUYfpow351NmoAd2/BU=;
	b=m65BvJCh+Kv/IInrhpfE+zwXmrjh1giI8+2rdqZfPeda+0df9J9P9K91gzyhQKNxtjAbYLd1yoSk4tA9RKUUVN7oAgdpyIG9ciM6RrPIFPxs9RKxyAX8lZXiJ1DyA4HurmD4ufU6wLKoMu3UvkhjrAHUiZOAoWTywTTlwAhvooM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:54 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:31 -0800
Message-ID: <1450916731-5968-8-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:rgbZVlgtUOsewSkukqv99+l5pSC6QxTLmCHLXXTF3tKhxKQUXGGt84jymIU/9v1WvSnGg1HcNR8W4EN5rClysgQ86nrFgDxfGRCNNEqw5EGvXIMCfS34y/vy4afGZj8sMqtP38l67njQ+y43Bwfjtg==;
	3:tx++z+t4VN+MWwlnMoXyxGSjYWl3+fbA8/SeGlVPzMdA2QUQDHI4FeOio3VoPmRAn+31FyfGTMyux/ggB4vji5D9U5uOqadsYk5rWpFb8vH56MXmHHspsiKyHU6cK6BZ;
	25:yaY24/XbDYSXHxdwEBnni8OeYict7nmc4jQEdqIF0sQ5ITMScPA3t1EkCQM/9itLqBoD9KDM14VPSp+7tVdxbXK/fw8eqFypbrbP+gQNiZOYEakKVN9QOOFmRpQvPk/oDuV3uH5FuV6VxOk5EvpD8YJ1wKyl0hGUI5N9k7kdBTGptzG4PdEXVPEv5Lcyxy5ArdVfDr2udT8J6cllUUU/Y8FqJ9ZJh/+UCe1EuDy6iLThhTTeQ3oYDp8BAUZf3FD0LeMEuUETma5/KkLVahlEJyiyYjtoK2BFO61v8wxrs4Y=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:08S7inL3eC5fdhaWBbhvPaYG0Mg9a5j/pldDC3wIZHJf1zPPjChQItbE6xDhHWeLJvR9l7m95vgVDQVQ+j7u1Ub2lVkWJBiZa8ctOmTFWVCcIogXWvGGH7MjPVsCBjmaZJ3+Aljn/Tf3XFUN7ENxuLT2bUAFQkBBk0KhiKrNzo9Wf387slUDQqbjvq6VbiIWF7QTtvmLHceroOrPraaGBaAkLyZqm6i5oVJI7Jx4D0hDK24JVLlLps4JQh52SN23E47EwKL1rUhE6Ylvi85stCvnfxklEp7puE1ANdpJROGxOBr4JzOXUh+QVfDGLa1TdJEWJltpTDcySxmva50B1/ZbH8GbJHFj9jSZzxPjkzVYM3rNMpPEzGVNRqO0yWevjZ7WhhzYjDMu5ESaKXcBRVa8V1DMTq2y+AdF6F56K1RwTxgpayt/yd4egAd153CZ4jpzzOap5Y8+snUsiRdyl6drc6G4YeG6ezf5d3OB+ppriMajHzpXH0l3qbVw/rGz;
	4:/wFhjTV47/aZVPpQtx1j/1mCankmJz9soBpWQofZJ4U4XSv6p6ZYleR4r4SSNRwXiUUcmKhkJBKEiQGemGfQawyCntpG7NFaqLDbkLzaCwQHaegwZoFF6TeVgHxYFhtvjjD5NwEw9XmhLreCnhb+RlrBD5NKZHjplLRYVzToyKUxk+POqLjE0EctlSKZn1bpdUfk/2o0NWN72JyVo4S1z0MJoC58RHu8pCLSAY6xINhnWMjLW1SzcbW1XwKPVsv7F+d1AxpRLKBQEu0VeoB9R6w19rJffjUDbXzMONFx4WEiBDIUryGsPM8cADROjiPb7MQWcnDcc8VQkZJxxczk/GNZ35BaX7x1GHaY1452GSTwNBG7buuj6vyU4c4i2uif
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033B983ED982DB6456D44599EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(189002)(199003)(19580405001)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(2950100001)(76176999)(575784001)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(21314002)(3826002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:bF51yEG/FIJvOoSHGtyZAACElMu9yWLaTd1wA4P?=
	=?us-ascii?Q?Ydb0dYZLAWD3i0Pq2x038WteY3WNvXVm6dfkIReyVxH1ufEsXMqdVwmfnJge?=
	=?us-ascii?Q?kXkrjnj6BfaGODhhdnSaGwIkj+DYkAxVhpz9HSAOjjNcLgIhputR3T5NcJt+?=
	=?us-ascii?Q?A3ta8V+gEdZqQfXBEFWO8qauhwSZfnyWr4hP4DVMSI3PCxt5gIHvjNH6ubZd?=
	=?us-ascii?Q?0vRKs8tDxB4LcjJmeq4qT2VGH5fkO8a57QrrEzN6SUHbnD58lu/jq2ljsm/m?=
	=?us-ascii?Q?AHxNO6jZUN+6CVtNPReSWgRkOWxlVDDiYo1HWcGNpVADdb+J46inQhAmMU6e?=
	=?us-ascii?Q?eA7xYfoWLYLAHmE8YX7W+/nWT9BR2JmSYDaWk1GCo/gITScyyHGZC3sAaNA4?=
	=?us-ascii?Q?12VabuZpWjHpzVVAlVKJJ0KO3przmOFj9LNV0U85OJ0iKYX7Lux1z+uujN2i?=
	=?us-ascii?Q?h+V8wg1SzsmKqwO3Xu/I5OkVg5KuYtwoQhVUkrv6umRIj9TEaePgPnpWhr9U?=
	=?us-ascii?Q?NeCI2MDtU8x0G2wfgnvlNZ0+MaSn+7NAQNgbZHbKbUz8WTMS5SvfLlRWgtoO?=
	=?us-ascii?Q?KpYRCT3PPo8AlT2jS5O8p2jpj63DprJfGwGBhUctKNBV3En152wGR933GomC?=
	=?us-ascii?Q?30CBxks/MyY1CnEh7N8QLmirA7b24sTgrtLbYUG71KMUsbVONmvtFskHv1XK?=
	=?us-ascii?Q?epysGpDAL06N4vgElrxloHhJ10UzeadPk4piZ+sIN3mazSS0TDXH/mPar/Bp?=
	=?us-ascii?Q?hAisuhKqkIsK1d+usa+c/D23cEmgX9z7HIs+Z2IPyfdcYk/XAF7tn+BQgLXv?=
	=?us-ascii?Q?ngMrh5O/GbQnc0jt4wezjcNfkFwHuJMYOKUVu0eN1nFfNKMdFncPQEC8UuT5?=
	=?us-ascii?Q?lKlyqi4yjwTpjZYkoTGsoum24RAx5xC3teYWs2vtSJlmEv2zK1VAJPsFQH7/?=
	=?us-ascii?Q?w6yfDasWBxyQahCRXPtQj0qVUAwYRxMOUg3ATY7xZem51TIWCCFajr0oVOki?=
	=?us-ascii?Q?Pfei7uDEkc+/o5jv6cMIwtavdc7475P70GA1VIc5THeEZN0eO33lIvCzTouU?=
	=?us-ascii?Q?xJ3J0KbwvSLfu2Z6CCqw5yfr2qVv/0MDFxOLTxL3muUjL3ykPYdCSah2fyi6?=
	=?us-ascii?Q?r/WsYmU0TQVeA5EPY2OCogEp9yx8oNhQaiH/MdjHCY4IVl9tEsw4JTEDNjx6?=
	=?us-ascii?Q?vWcpXBqGK3uv6EMa4GZ8aH6eDQFdaYxjB9dE8MBeph36WPD5Io2xtYt5WrfG?=
	=?us-ascii?Q?gLYfpghPtpa7zX0Mq2riZy+JyzNmRsmwKqIhskohQ3uXGBMwpNFGAHEdx49E?=
	=?us-ascii?Q?vAw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:dI+Cqghgq6MqYVlYXnB/AxEgH/OdqtyBUL6PP+KqWWCGo6Miltr3McUvi0n/0OJxZc3rvSzne7stew9C7YVbyo6Vu/7dsTrM1zamG7Mm6LG1Q3ycVne7BGutqL4EK9QgVabo4V1tsNp7kyb96Ub2IQ==;
	24:k2Gph/doQm3gFQXGymsKjcACJWOq+9kEvLDDVpaW93ZhKtk0szqwVwr8+EkfKauprKOvAIu1FZY8oXC7DnXf+nHpvox4xZOUzAdrFvrnhiw=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:54.6495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.141
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 7/7] raspi: add raspberry pi 2 machine
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
X-TUID: VInMg/OBeVZ1

bcm2835/Pi1 requires more peripherals, and will be added in a later
patch series.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/arm/Makefile.objs |   2 +-
 hw/arm/raspi.c       | 179 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/raspi.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index f55f8d2..a711e4d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -11,7 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
 obj-$(CONFIG_DIGIC) += digic.o
 obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
-obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o
+obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
new file mode 100644
index 0000000..cc80c56
--- /dev/null
+++ b/hw/arm/raspi.c
@@ -0,0 +1,179 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+/* Based on versatilepb.c, copyright terms below. */
+
+/*
+ * ARM Versatile Platform/Application Baseboard System emulation.
+ *
+ * Copyright (c) 2005-2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#include "hw/arm/bcm2836.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/arm/arm.h"
+#include "sysemu/sysemu.h"
+#include "hw/arm/raspi_platform.h"
+
+#define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
+#define MVBAR_ADDR      0x400 /* secure vectors */
+#define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
+#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
+
+/* Table of Linux board IDs for different Pi versions */
+static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
+
+typedef struct RaspiMachineState {
+    union {
+        Object obj;
+        BCM2836State pi2;
+    } soc;
+    MemoryRegion ram;
+} RaspiMachineState;
+
+static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
+{
+    static const uint32_t smpboot[] = {
+        0xE1A0E00F, /*    mov     lr, pc */
+        0xE3A0FE42, /*    mov     pc, #0x420           ;call BOARDSETUP_ADDR */
+        0xEE100FB0, /*    mrc     p15, 0, r0, c0, c0, 5;get core ID */
+        0xE7E10050, /*    ubfx    r0, r0, #0, #2       ;extract LSB */
+        0xE59F5014, /*    ldr     r5, =0x400000CC      ;load mbox base */
+        0xE320F001, /* 1: yield */
+        0xE7953200, /*    ldr     r3, [r5, r0, lsl #4] ;read mbox for our core*/
+        0xE3530000, /*    cmp     r3, #0               ;spin while zero */
+        0x0AFFFFFB, /*    beq     1b */
+        0xE7853200, /*    str     r3, [r5, r0, lsl #4] ;clear mbox */
+        0xE12FFF13, /*    bx      r3                   ;jump to target */
+        0x400000CC, /* (constant: mailbox 3 read/clear base) */
+    };
+
+    assert(SMPBOOT_ADDR + sizeof(smpboot) <= MVBAR_ADDR);
+    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
+                       info->smp_loader_start);
+}
+
+static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info *info)
+{
+    static const uint32_t board_setup[] = {
+        /* MVBAR_ADDR: secure monitor vectors */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xE1B0F00E, /* movs pc, lr ;SMC exception return */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        /* BOARDSETUP_ADDR */
+        0xE3A00B01, /* mov     r0, #0x400             ;MVBAR_ADDR */
+        0xEE0C0F30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
+        0xE3000131, /* movw    r0, #0x131             ;enable HVC, AW, FW, NS */
+        0xEE010F11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
+        0xE1A0100E, /* mov     r1, lr                 ;save LR across SMC */
+        0xE1600070, /* smc     #0                     ;monitor call */
+        0xE1A0F001, /* mov     pc, r1                 ;return */
+    };
+
+    rom_add_blob_fixed("raspi_boardsetup", board_setup, sizeof(board_setup),
+                       MVBAR_ADDR);
+}
+
+static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
+{
+    CPUState *cs = CPU(cpu);
+    cpu_set_pc(cs, info->smp_loader_start);
+}
+
+static void setup_boot(MachineState *machine, int version, size_t ram_size)
+{
+    static struct arm_boot_info binfo;
+    int r;
+
+    binfo.board_id = raspi_boardid[version];
+    binfo.ram_size = ram_size;
+    binfo.nb_cpus = smp_cpus;
+
+    /* Pi2 supports security extensions, which require special setup code */
+    if (version == 2) {
+        binfo.smp_loader_start = SMPBOOT_ADDR,
+        binfo.write_secondary_boot = write_smpboot,
+        binfo.secondary_cpu_reset_hook = reset_secondary,
+        binfo.board_setup_addr = BOARDSETUP_ADDR;
+        binfo.write_board_setup = write_board_setup;
+        binfo.secure_board_setup = true;
+        binfo.secure_boot = true;
+    }
+
+    /* If the user specified a "firmware" image (e.g. UEFI), we bypass
+       the normal Linux boot process */
+    if (machine->firmware) {
+        /* load the firmware image (typically kernel.img) */
+        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
+                                ram_size - FIRMWARE_ADDR);
+        if (r < 0) {
+            error_report("Failed to load firmware from %s", machine->firmware);
+            exit(1);
+        }
+
+        /* set variables so arm_load_kernel does the right thing */
+        binfo.entry = FIRMWARE_ADDR;
+        binfo.firmware_loaded = true;
+    } else {
+        /* Just let arm_load_kernel do everything for us... */
+        binfo.kernel_filename = machine->kernel_filename;
+        binfo.kernel_cmdline = machine->kernel_cmdline;
+        binfo.initrd_filename = machine->initrd_filename;
+    }
+
+    arm_load_kernel(ARM_CPU(first_cpu), &binfo);
+}
+
+static void raspi2_init(MachineState *machine)
+{
+    RaspiMachineState *s = g_new0(RaspiMachineState, 1);
+
+    /* Initialise the SOC */
+    object_initialize(&s->soc.pi2, sizeof(s->soc.pi2), TYPE_BCM2836);
+    object_property_add_child(OBJECT(machine), "soc", &s->soc.obj,
+                              &error_abort);
+
+    /* Allocate and map RAM */
+    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
+                                         machine->ram_size);
+    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
+
+    /* Setup the SOC */
+    object_property_set_bool(&s->soc.obj, true, "realized", &error_abort);
+
+    /* Boot! */
+    setup_boot(machine, 2, machine->ram_size);
+}
+
+static void raspi2_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi 2";
+    mc->init = raspi2_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->max_cpus = BCM2836_NCPUS;
+    /* XXX: Temporary restriction in RAM size from the full 1GB. Since
+     * we do not yet support the framebuffer / GPU, we need to limit
+     * RAM usable by the OS to sit below the peripherals. */
+    mc->default_ram_size = BCM2836_PERI_BASE;
+};
+DEFINE_MACHINE("raspi2", raspi2_machine_init)
-- 
2.5.3

