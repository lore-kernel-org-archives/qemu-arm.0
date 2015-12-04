Received: by 10.182.158.201 with SMTP id ww9csp414703obb;
        Thu, 3 Dec 2015 22:05:20 -0800 (PST)
X-Received: by 10.140.93.14 with SMTP id c14mr15832895qge.59.1449209119965;
        Thu, 03 Dec 2015 22:05:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w189si12592468qka.117.2015.12.03.22.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 22:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4jUd-0004WW-JO
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 01:05:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSl-0000km-3R
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSj-0000FH-Km
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:22 -0500
Received: from mail-bn1on0142.outbound.protection.outlook.com
	([157.56.110.142]:38607
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4jSe-0000DD-BZ; Fri, 04 Dec 2015 01:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QzfxZVg9qrhxNmLNEmjvkVP3sUYfpow351NmoAd2/BU=;
	b=YMSzNtbryTvitHhX+/yv5lH/Q5KNlnjHC8XcsAZOGohQPWVBez7XzsynaiJwVR6wASDy7fCGqxOFg/3naAQ5oTEsPOrx/Z8g2Ro93mc8/7KGEuflhal5UUb0Fc7egKfhv7+bil+lfUh6+llomYFf5kqTiaiVmHlLUC1s0U0+SWQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Fri, 4 Dec 2015 06:03:14 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 22:01:27 -0800
Message-ID: <1449208887-9564-8-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:6::724]
X-ClientProxiedBy: CY1PR21CA0026.namprd21.prod.outlook.com (25.161.247.36) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:QMIKwFT0dnLZs0CSYR31KK77FO1hxxq4CSUroTKf6WRFAronUNedFY5JXhYEqncC7KP69RTBv6zUPv+gzuGp8fsPxqngj9ZHvCcWOvZs5393FfZu6d/M5Dt1a7xTsNd21EIWuZPVqrXITXGa/iVfng==;
	3:8annKNoFoV0Gg+SVKGoQOEDTXokw4w/WYycU9j7szzwi9zP/aOKE58wx2BGQH2UKnmyK6UJWIwGerzR4GhBd7RvisBj7hZUwIZNqeKuF+6RBPNR6CSdKiMeDOyzPLrTU;
	25:7OKvwd9qAO6s/ov8m3VSH2KsYjCmOtU4hVVI9IQTiVTlsncFUKJKkizpn16N6xHXQgx7RL6GIIJ/djnNZgYmAlAytXl/jREcYQDbxopg2x/MxTdYh78OwZWzpnI/wsld4+Ob4bMiqaE5UP4pfGdZMwTW4bPwIlfklockmYfzTjwkOUWKFj1YmMdt0R9THnSfxHTNuji3H1MfgHjt0tWH3Cga0YkyUj89OTPkFdcz1I6FInK3EnFvYVHlmZ+9xmsYP77wkekDC6yiT+dA1iQT3w==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:S5N0DghQH6oHIyzpIlQyhOrwQx9dcgIbG9jYbiaPdKRYSOn5PUDeK6208IHw/M9VJAJGl/aith+cSvKBj7wFQKhb7oVdO5kbOgxuYHpTiR96hm7sxI7dpTvpQFruAH1xafXqXsmxWgcLQcmZ6Q++s4wlEDgMj0LdlD69jhmgzhOeOrAOdNNvQyUM4jP+cZA0uEQSeZXWh3T0guoDZa5Dj0NCTSllJdRij/1OGXHqF8JQuuxJQbkuN+h8/Q4fk9Tmp9FewRzzdHe8H5reQ8Ms4cc2/rDVtbeX17GNv8mAlN9b6nEtP9DC0rvlihBaF9WDjkJ4CBte4vvQon3LGgzjRsgx1KthFOj00hL7zg9RZF5JzBprvmInMd/bGxWVBfEcosaicCgqU6n15Kj6QLTgEtUwSQ59oAuJ0NyJPSKB+DySeYlCcDwc1WX91BsyFY7lSgErB5FywLL0bs0iSq7SXdVi4J0kVVvOYgxGhxKmHvtkHI9mHKS4I37erT84Jx/6;
	4:Yadd5DeAjMXaEWfNGH/wNLGH+0fkP/Vhm6soKrS4X+Q5HUYlasxc3/lk84SA4iDdNJR7cGbkW9/kAW3wC/N79y0XT6NKU8IRPptz/YdkeQ975tw9Om8LaH0whS4ZgHC+ZYcIc0rq7TKg7zQaZ9V8Gbq4htMKoJRu0ZT9jq+r/rwB1SXyeNa8LzeipWZLO91v1Td1AkavdCeiAb0J8py7piepLw3sy43RuXklmdNhio9Mf/Bvds/xmGjE1f7uVugFOPJOp6fGoZLSavYK+FmAizzdoOrmv4JGDbAyIF6J5iQoVEf8P3DNihyW97/Xap0D15pwd+tJIZ43VIDLoGsnxCEfgHIgLShpAhWMCavswLhp2Z74MRA2jhpFA34JfZNprNEKTHdzU2UOJ5THSa+7qyA3lEIta8j4drx6y0oX+1NijwayX087CNMBdF7Nc/8b
X-Microsoft-Antispam-PRVS: <SN1PR0301MB2046F3446ECF71325D20681E9E0C0@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(5005710100001)(50226001)(4001430100002)(105586002)(6116002)(106356001)(42186005)(86612001)(77096005)(48376002)(575784001)(36756003)(5008740100001)(5004730100002)(10090500001)(1096002)(10290500002)(2950100001)(189998001)(87976001)(586003)(92566002)(2351001)(81156007)(19580405001)(5003940100001)(122386002)(19580395003)(86362001)(50986999)(40100003)(50466002)(110136002)(47776003)(5001960100002)(107886002)(76176999)(229853001)(97736004)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:MdMsbWpNh/BaTJoQwR3mclbprJN4tVmHdie5Abg?=
	=?us-ascii?Q?T9FZGq7/iq27w2c18o4mDt6DCGs5XQfI1ChzP3qsmYyUCiYKXzaAldhe6FIc?=
	=?us-ascii?Q?Cn3F9NX13X3arZA3ZW/l+Z4JopG0yxoDHYicpXD5EoNv56Y/0kfIBAVzauzG?=
	=?us-ascii?Q?xI5JB2GOq9l7NgLG9jIpLJnxo3DowQr8KdjNAxEJBfThz0pCHU3v1nP5u2sD?=
	=?us-ascii?Q?RBxzNp3ECAuzohl2YTu/TVkt2wCPWSG6BKNPO8YYyd9ITCnz2YRHuy0lJWnh?=
	=?us-ascii?Q?bbpW2u8jOVrY15xcvXSmVKFZybWCV+B97onX8bx2N9/FQD0oIEvO1/0i8WIc?=
	=?us-ascii?Q?Usj+XZ2to+hJD8cMTdIwiiCAh8751koqWkot29HuPAssvoJByAebTjIqQmGo?=
	=?us-ascii?Q?SHBaCvpDAyo2O6lhIA7C8kmFMPPGbVCctjMcfNZ6blgwthEUXzuQnpw971To?=
	=?us-ascii?Q?rE/ynSaotiGRqYc5It7vbGdzAu4dwU7AUP79TXPq6Ehu8XZ06FI0xgViVqWK?=
	=?us-ascii?Q?HYvLynNDzRxQ6QuJxlJvaFe72Bxfgkmm/LW5UpoRlev2TT7tF+aJR7L5EAn0?=
	=?us-ascii?Q?1vEzCMtR5uhS4KaTGNnQ4daN0MSc9eZ9R+Jzj6BTRhmwmnR+810cyc7k/evo?=
	=?us-ascii?Q?890DSWw34gVXfpBhBV4j7rk1cD/rNe70BXitYldE0qR98QHHidiJ43PuDO21?=
	=?us-ascii?Q?C7gGmQNia7I9KIQr1bjaZUdT1GVSmGex1tRsyDQ1I8veqA7GuB5b91p6vtWI?=
	=?us-ascii?Q?S83HDpFceDtGOjywDln1CEo78I0rxw8glmzdPPM8rJqnqDF6g4xKq0LwTLXk?=
	=?us-ascii?Q?fXqIh1ZEZvkMW7qHETplSvZuYlP19nZKblvR2xdz0bETicigpXawPyjC9ijj?=
	=?us-ascii?Q?0A0g6jiNs/lExdhsr/4zVZl/owwPZ92Gw+ofk+7sWvrOnYkGNlJemTjwW1S6?=
	=?us-ascii?Q?ww93URayTC4y4BXw0pRT7SJI6vM7eM8jBTUYLWNpkQigxrXJYzfXz35wOdlf?=
	=?us-ascii?Q?7t/lTfNPCYAfKSQfWTqvsYbLv3KMzgw+ex29OVvKy2TSkr8k7c9iSBwodnlg?=
	=?us-ascii?Q?Z64bhFa+vRbQVmIW7GPInd87hKdQIzlgD6Gf/gTRvA7Q3fiMW4jEudLtQ/9N?=
	=?us-ascii?Q?/p1zT/xkf7F0cKr9qzjixe1lrgGLAtjNLwc1SeDrtTRWPvmwnbNOcM+brrox?=
	=?us-ascii?Q?ymeo28Bkx1F9roMOb8PYIxDLIHHRUUcGoQr5y?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:LAOZyBVtODf0RQtZ85LePDgG0+JOLZeTyjXtJz0JfX4myKL8DveZBipx7fVjjDWH2w8Kc8V9y/pq9Ng/FOSKXvm82jUBCJvrtEQBpRefs/E3RAmXIJlCV1w7sFmohpmyRRUKYlTZagXoAswCqtFpIQ==;
	24:FFqWWBvxKAbsZ0gKXyzIpASTjxi6sBGugYFvrXxLmQ1UvSq8GMAvnTyGS1TcmxUIu1QJRNrHvzOD6ByUff/GeTpIpGMJN27G5yVb0RC8ICk=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 06:03:14.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.142
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: f/V2hh2KQF+9

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

