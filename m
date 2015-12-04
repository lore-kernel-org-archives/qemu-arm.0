Received: by 10.182.158.201 with SMTP id ww9csp414708obb;
        Thu, 3 Dec 2015 22:05:20 -0800 (PST)
X-Received: by 10.55.212.141 with SMTP id s13mr15812475qks.91.1449209120710;
        Thu, 03 Dec 2015 22:05:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6si9400987qka.65.2015.12.03.22.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 22:05:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4jUe-0004Xp-E8
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 01:05:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSk-0000j5-5B
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSh-0000EQ-KX
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:22 -0500
Received: from mail-bn1bn0104.outbound.protection.outlook.com
	([157.56.110.104]:18816
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4jSb-0000AG-UW; Fri, 04 Dec 2015 01:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OByUWMOl23IbXIsVV8qmP2rdOzMkGQzmf/KKe9y+FMk=;
	b=ZjYFcFt3uZBko2fuWWsiZ5C21Mve2bnSEdpyQu2zm0DhLsMnY+c4nBkXHV7GYyZASfaSnPgFnUHzWReQC6TXdCrEsal50m1d/EodY4NhLnXspJMiqrARixnwNWvrgxboqkC8EV1QQUcOAXZg9pDMwpWlX4kDiWn4zdq8QQ05m+g=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Fri, 4 Dec 2015 06:03:11 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 22:01:24 -0800
Message-ID: <1449208887-9564-5-git-send-email-Andrew.Baumann@microsoft.com>
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
	2:WoW0k2d5da5uCMVKnhYPlnGbXIu33UM7yxFd9gVyrj2XWh2Bd3nyAvzB1eNbvoxBMNySi21DdmynzdEu88OiwODs/VPaINUizdvL65N+u9wAi9sRqTt6CbZr7hsGTJYeD4JgBFjRH/iBaiU6AsCClg==;
	3:bu37m8YsUMfW/86S8UG2Abyjjn1mH72iPbaDw4bDIvkc1jRxzCTw6g2Z5JsJykFG4fKKCcG0zb2i+oqQZ/Ig28GF981nA6UG2t0SbQHhHy0rp2UL1l/YWbtySYQQPcTP;
	25:YysOYQ05Ais5CuwEd16LLI+eza9fT0j+kjomSV69I5NaAFYVTlk3yd3Xg1hYn3ZyCchluxKaoL8ncu2siAW1nK4ve/NHZpcaynrlx5QwB5oKewkwsQApQsz+Bh+Yc7wZEQpdmwOjdBoW3Uqab7lYxm/oJ7olJxDd2zO8Q/LDL54HKerAtq1LjT9Dw7w+Hsowt2SEkpeH9Q1LfcCHqjfOfObMXtSVMIVbaahT6+TeSjpAqCTuKEG0LpJXuaSLgqej
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:SxBWBtqENXJfVPJ+48wzj2RAF3z2FxjJZwOp6q+K2lHF/Jq/M5I9jsddnUEr9MswlyN3BAhdJvVQMOwnjnGwpK5I0cLua8rGrItWe/h9Y5yPM92CBSHhcRAnKR8ftNOiDbfvg6MzQE/44YdpaNim3ffIjC9/k2RD1hxJ+kl6OUEiSsDw7pdy/ESCynk6KTK3XPWS0YTn+3T81Gf61whBl2znY/25pvqwDNnzNrSbpZ9h2UA0WS0ietV29PTi+4g/+Ek7EgxmHAE38jQeMHvZYb/x2XckA3BN98uYb9GjTQrJrs6M0E3TFwMDyTqBdLBYyidR6HPetNMW8Q5rpYsPw0xeOqh8ayJLsVUDDtdNBSuZkjGFYQNOtpZbhV+HRXCZ8MMXis9zY+lc+CFgTmzPpC5/83edIjHDsP92l9Xsm3VRJNuCBaKCHw3XX91/YNI3RWT1hrnP5ABoqke4TvrVjd69GJn0iZt5IU5gBy+GhzYxp1QY8wfIcbKTZwZt+T4r;
	4:6HiJ8HCzkojfv6DNuJUKsdf+x0TOEGJ0FmPf1y/D4szAXAU9/SWBC0cOaH8LYMcywBLTqnFRkN3hgedNiPjwuw0bTjpi/u3H81atCETcaJ1Koi/K4iGTxDDI8yRnuVPo+TVyaFWHxlKwxk6+8ojdLCDz/vA9ffk8YC81RNbZ/49MAmFve5A6bHNVBj93K5nDUgyfco2KpzM8mL9Wt+kecJ46m12X3PfAwJ7XkIRSSUwb7bkiH6Aj5OMe6s4kCA0dPO1Gkd8dzx/lNX3+BSbaugyHEqfFT/Pz48L3NPFAsQhUr/nVhwxl+UaXHXTHqlCGzeKAHtBxhV/s11r9LRf53m1HryHrmXjwmX3jtJ3phDTGTg71YugqyLHmh7ktAfQbpVPHT9w/9NtwNyKeFh7Gq9uvFWyTOu+tggkNValpQ78=
X-Microsoft-Antispam-PRVS: <SN1PR0301MB204695F69362BC874ABB6D909E0C0@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(5005710100001)(50226001)(4001430100002)(105586002)(6116002)(106356001)(42186005)(86612001)(77096005)(48376002)(36756003)(5008740100001)(5004730100002)(10090500001)(1096002)(10290500002)(2950100001)(189998001)(87976001)(586003)(92566002)(2351001)(81156007)(19580405001)(5003940100001)(122386002)(19580395003)(86362001)(50986999)(40100003)(50466002)(110136002)(47776003)(5001960100002)(107886002)(76176999)(229853001)(97736004)(2004002)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:cjp81YJBbWUNHwFgc8motYvnFQfZVD3GZjAenoK?=
	=?us-ascii?Q?fZ8dqaTOJMb3RxC3L0br9yb6J9b/qwsgdloANXnaJkxb3Zj0M9Q78Cwxp+rc?=
	=?us-ascii?Q?zWay/cjvBJESeNRdL1C61IC4bg1CQvE6En2gTMPKgLSthKcFe23lPumZInPB?=
	=?us-ascii?Q?GFJC9LhBQeTfTi6PdWHDhBceAxOOI+2AUFXLkSY+lVtSMG5q9UNlhmCq7QwX?=
	=?us-ascii?Q?eUY5BG0/8m2rNlCLYCJ8/AhbycWFSPU3G9EsTnMGy2GYOXvbHNPB4bZrSDeq?=
	=?us-ascii?Q?MahVpy5dUsIpvaJ/s+aF8nwYInFCUXB4T7lQVDB1wOVtWVoUZhu563J8McIk?=
	=?us-ascii?Q?r46ydrweybmj3I80eK2mGnwnKkH008SquwBbmEKC3T7vFbpbQer0p6HuJKjO?=
	=?us-ascii?Q?MgSpnPIJzNH5YC0r6WwITKFhf2JbdVK3/BDGzO3vBf8CkYvifMFxLqqfjZlP?=
	=?us-ascii?Q?yo0X7ziwwtyhokWMbCqpnpN+3jJJJBP8t0Oq7mvuXoaC04fPBLtpaIvPL8GX?=
	=?us-ascii?Q?548HWgX9Ihya7KkerjjQd5CqUU16QkQxP0NDrVrqfiP/YgRsGF8BOQ7EBJDX?=
	=?us-ascii?Q?irsfw38cRxrIWchUBdR9l81yLbzz2F+RZVBvYwsZe8i6btoP4JJyVEsgXj8B?=
	=?us-ascii?Q?yLwXJ7p03ysE/z3r7fy87oIu/u+Q/vYNSG5qfIP7go7+pDW8no1pgFJFonrc?=
	=?us-ascii?Q?lkJ4pAzwjRWTDS6HLc5PhjubDnOTRfRBvKx7kgWNOA6xYc7CB48RUoFmwR8Q?=
	=?us-ascii?Q?DqrOHC0pD1wzLFsSJ64bORlXclKp/N6SWrDeCiT48icRHMf0fNzjGS4tSo2H?=
	=?us-ascii?Q?IR7l7rQs2+Ka6hyemavQa19h9TdTYymBk4ybPyq13ze1+ueJWfiYKNjGTmZM?=
	=?us-ascii?Q?G9fs7I5DWz7H8/T8+tdV1n/VBL9TCYN2owsKwJOymctt4Vlgc4xrr6t6KQPV?=
	=?us-ascii?Q?d5lgHXMBEcowgqBQaQkvWCtyY1JX4Uk1QoqUx9VgPOjYJL6w64ugqum5mhYV?=
	=?us-ascii?Q?FIt91goZniVY7gp+7/0q2ub0itI/SKkeqlv1counb84rO5HLVplyiw6pB2wT?=
	=?us-ascii?Q?nLrW2iOcrvRak155sGB2qN5J6RqNDpRKQffIMpRWfQaNInU3EN1KWVvmZ522?=
	=?us-ascii?Q?DG7+pl7ot5315pXfx+Kx2cfuVN/Sb0sO/t9nYLwqJ8YDwwWjIK/m6NYOrO6N?=
	=?us-ascii?Q?VUA2FKXnc/GsmH6Czl3go6HunolBw4FGX5Fd2?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:V9PE9cYNmP5YRLch/mCUnyEqhT52tf+iIn0U/F1WDEBDAjbMtXF08wNMfrOf7cmW/y5QPQRLvPWepvPbHVRIremSU+HkWJQU9J83WG61RIQk50fSy1iwl4W77yOyyyXxYoAwKYny7Hr+maGQHkjOHg==;
	24:uLqtv7+qmTI4k427iC/M4vbliiha00EL/UhRG0dBqK8tYinaU9eSTL0EIrHIWkhC+wbYUGz/MSzDwePLd+m9BWGzM2JcfJ3luED9U3zx+iQ=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 06:03:11.8785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.104
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH 5/8] bcm2835_peripherals: add rollup device for
	bcm2835 peripherals
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
X-TUID: +vYjz42wH6Vp

This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
which are also present on bcm2836 (Pi2). It also implements the
private address space used for DMA.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 185 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |  42 ++++++++
 include/hw/arm/raspi_platform.h      | 161 ++++++++++++++++++++++++++++++
 4 files changed, 389 insertions(+)
 create mode 100644 hw/arm/bcm2835_peripherals.c
 create mode 100644 include/hw/arm/bcm2835_peripherals.h
 create mode 100644 include/hw/arm/raspi_platform.h

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2195b60..82cc142 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -11,6 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
 obj-$(CONFIG_DIGIC) += digic.o
 obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
+obj-$(CONFIG_RASPI) += bcm2835_peripherals.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
new file mode 100644
index 0000000..3a3a1aa
--- /dev/null
+++ b/hw/arm/bcm2835_peripherals.c
@@ -0,0 +1,185 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "hw/arm/bcm2835_peripherals.h"
+#include "hw/arm/bcm2835_mbox.h"
+#include "hw/arm/raspi_platform.h"
+
+static void bcm2835_peripherals_init(Object *obj)
+{
+    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
+
+    /* Memory region for peripheral devices, which we export to our parent */
+    memory_region_init_io(&s->peri_mr, OBJECT(s), NULL, s,
+                          "bcm2835_peripherals", 0x1000000);
+    object_property_add_child(obj, "peripheral_io", OBJECT(&s->peri_mr), NULL);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
+
+    /* Internal memory region for peripheral bus addresses (not exported) */
+    memory_region_init_io(&s->gpu_bus_mr, OBJECT(s), NULL, s, "bcm2835_gpu_bus",
+                          (uint64_t)1 << 32);
+    object_property_add_child(obj, "gpu_bus", OBJECT(&s->gpu_bus_mr), NULL);
+
+    /* Internal memory region for communication of mailbox channel data */
+    memory_region_init_io(&s->mbox_mr, OBJECT(s), NULL, s, "bcm2835_mbox",
+                          MBOX_CHAN_COUNT << 4);
+
+    /* Interrupt Controller */
+    object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
+    object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);
+    qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
+
+    /* UART0 */
+    s->uart0 = SYS_BUS_DEVICE(object_new("pl011"));
+    object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
+    qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
+
+    /* Semaphores / Doorbells / Mailboxes */
+    object_initialize(&s->sbm, sizeof(s->sbm), TYPE_BCM2835_SBM);
+    object_property_add_child(obj, "sbm", OBJECT(&s->sbm), NULL);
+    qdev_set_parent_bus(DEVICE(&s->sbm), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->sbm), "mbox_mr",
+                                   OBJECT(&s->mbox_mr), &error_abort);
+
+    /* Property channel */
+    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
+    object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
+    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->property), "dma_mr",
+                                   OBJECT(&s->gpu_bus_mr), &error_abort);
+
+    /* Extended Mass Media Controller */
+    object_initialize(&s->emmc, sizeof(s->emmc), TYPE_BCM2835_EMMC);
+    object_property_add_child(obj, "emmc", OBJECT(&s->emmc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->emmc), sysbus_get_default());
+}
+
+static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(dev);
+    MemoryRegion *ram;
+    Error *err = NULL;
+    uint32_t ram_size;
+    int n;
+
+    /* Map peripherals and RAM into the GPU address space. */
+    memory_region_init_alias(&s->peri_mr_alias, OBJECT(s),
+                             "bcm2835_peripherals", &s->peri_mr, 0,
+                             memory_region_size(&s->peri_mr));
+
+    memory_region_add_subregion_overlap(&s->gpu_bus_mr, BCM2835_VC_PERI_BASE,
+                                        &s->peri_mr_alias, 1);
+
+    /* XXX: assume that RAM is contiguous and mapped at system address zero */
+    ram = memory_region_find(get_system_memory(), 0, 1).mr;
+    assert(ram != NULL && memory_region_size(ram) >= 128 * 1024 * 1024);
+    ram_size = memory_region_size(ram);
+
+    /* RAM is aliased four times (different cache configurations) on the GPU */
+    for (n = 0; n < 4; n++) {
+        memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
+                                 "bcm2835_gpu_ram_alias[*]", ram, 0, ram_size);
+        memory_region_add_subregion_overlap(&s->gpu_bus_mr, (hwaddr)n << 30,
+                                            &s->ram_alias[n], 0);
+    }
+
+    /* Interrupt Controller */
+    object_property_set_bool(OBJECT(&s->ic), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, ARMCTRL_IC_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
+    sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
+
+    /* UART0 */
+    object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, UART0_OFFSET,
+                                sysbus_mmio_get_region(s->uart0, 0));
+    sysbus_connect_irq(s->uart0, 0,
+                       qdev_get_gpio_in(DEVICE(&s->ic), INTERRUPT_VC_UART));
+
+    /* Semaphores / Doorbells / Mailboxes */
+    object_property_set_bool(OBJECT(&s->sbm), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, ARMCTRL_0_SBM_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sbm), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sbm), 0,
+                       qdev_get_gpio_in(DEVICE(&s->ic), INTERRUPT_ARM_MAILBOX));
+
+    /* Mailbox-addressable peripherals use the private mbox_mr address space
+     * and pseudo-irqs to dispatch requests and responses. */
+
+    /* Property channel */
+    object_property_set_int(OBJECT(&s->property), ram_size, "ram-size", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&s->property), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->mbox_mr, MBOX_CHAN_PROPERTY<<4,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->property), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
+                       qdev_get_gpio_in(DEVICE(&s->sbm), MBOX_CHAN_PROPERTY));
+
+    /* Extended Mass Media Controller */
+    object_property_set_bool(OBJECT(&s->emmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, EMMC_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->emmc), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
+                       qdev_get_gpio_in(DEVICE(&s->ic),
+                                        INTERRUPT_VC_ARASANSDIO));
+}
+
+static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = bcm2835_peripherals_realize;
+}
+
+static const TypeInfo bcm2835_peripherals_type_info = {
+    .name = TYPE_BCM2835_PERIPHERALS,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835PeripheralState),
+    .instance_init = bcm2835_peripherals_init,
+    .class_init = bcm2835_peripherals_class_init,
+};
+
+static void bcm2835_peripherals_register_types(void)
+{
+    type_register_static(&bcm2835_peripherals_type_info);
+}
+
+type_init(bcm2835_peripherals_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
new file mode 100644
index 0000000..e760a7b
--- /dev/null
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -0,0 +1,42 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_PERIPHERALS_H
+#define BCM2835_PERIPHERALS_H
+
+#include "qemu-common.h"
+#include "exec/address-spaces.h"
+#include "hw/sysbus.h"
+#include "hw/intc/bcm2835_ic.h"
+#include "hw/misc/bcm2835_property.h"
+#include "hw/misc/bcm2835_sbm.h"
+#include "hw/sd/bcm2835_emmc.h"
+
+#define TYPE_BCM2835_PERIPHERALS "bcm2835_peripherals"
+#define BCM2835_PERIPHERALS(obj) \
+    OBJECT_CHECK(BCM2835PeripheralState, (obj), TYPE_BCM2835_PERIPHERALS)
+
+typedef struct BCM2835PeripheralState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion peri_mr, peri_mr_alias, gpu_bus_mr, mbox_mr;
+    MemoryRegion ram_alias[4];
+    qemu_irq irq, fiq;
+
+    SysBusDevice *uart0;
+    BCM2835IcState ic;
+    BCM2835PropertyState property;
+    BCM2835SbmState sbm;
+    BCM2835EmmcState emmc;
+} BCM2835PeripheralState;
+
+#endif /* BCM2835_PERIPHERALS_H */
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
new file mode 100644
index 0000000..8386949
--- /dev/null
+++ b/include/hw/arm/raspi_platform.h
@@ -0,0 +1,161 @@
+/*
+ * bcm2708 aka bcm2835/2836 aka Raspberry Pi/Pi2 SoC platform defines
+ *
+ * These definitions are derived from those in Linux at
+ * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
+ * where they carry the following notice:
+ */
+
+/*
+ * arch/arm/mach-bcm2708/include/mach/platform.h
+ *
+ * Copyright (C) 2010 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+/* Peripheral base address on the VC (GPU) system bus */
+#define BCM2835_VC_PERI_BASE 0x7e000000
+
+/* Peripheral base addresses seen by the CPU: Pi1 and Pi2 differ */
+#define BCM2835_PERI_BASE       0x20000000
+#define BCM2836_PERI_BASE       0x3F000000
+
+/* "QA7" (Pi2) interrupt controller and mailboxes etc. */
+#define BCM2836_CONTROL_BASE    0x40000000
+
+#define MCORE_OFFSET            0x0000   /* Fake frame buffer device
+                                          * (the multicore sync block) */
+#define IC0_OFFSET              0x2000
+#define ST_OFFSET               0x3000   /* System Timer */
+#define MPHI_OFFSET             0x6000   /* Message-based Parallel Host Intf. */
+#define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
+#define ARM_OFFSET              0xB000   /* BCM2708 ARM control block */
+#define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
+#define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
+#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
+#define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Semaphores
+                                                      * Doorbells & Mailboxes */
+#define PM_OFFSET               0x100000 /* Power Management, Reset controller
+                                          * and Watchdog registers */
+#define PCM_CLOCK_OFFSET        0x101098 /* PCM Clock */
+#define RNG_OFFSET              0x104000 /* Hardware RNG */
+#define GPIO_OFFSET             0x200000 /* GPIO */
+#define UART0_OFFSET            0x201000 /* Uart 0 */
+#define MMCI0_OFFSET            0x202000 /* MMC interface */
+#define I2S_OFFSET              0x203000 /* I2S */
+#define SPI0_OFFSET             0x204000 /* SPI0 */
+#define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define UART1_OFFSET            0x215000 /* Uart 1 */
+#define EMMC_OFFSET             0x300000 /* eMMC interface */
+#define SMI_OFFSET              0x600000 /* SMI */
+#define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
+#define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
+#define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
+
+/*
+ * Interrupt assignments
+ */
+
+#define ARM_IRQ1_BASE                  0
+#define INTERRUPT_TIMER0               (ARM_IRQ1_BASE + 0)
+#define INTERRUPT_TIMER1               (ARM_IRQ1_BASE + 1)
+#define INTERRUPT_TIMER2               (ARM_IRQ1_BASE + 2)
+#define INTERRUPT_TIMER3               (ARM_IRQ1_BASE + 3)
+#define INTERRUPT_CODEC0               (ARM_IRQ1_BASE + 4)
+#define INTERRUPT_CODEC1               (ARM_IRQ1_BASE + 5)
+#define INTERRUPT_CODEC2               (ARM_IRQ1_BASE + 6)
+#define INTERRUPT_VC_JPEG              (ARM_IRQ1_BASE + 7)
+#define INTERRUPT_ISP                  (ARM_IRQ1_BASE + 8)
+#define INTERRUPT_VC_USB               (ARM_IRQ1_BASE + 9)
+#define INTERRUPT_VC_3D                (ARM_IRQ1_BASE + 10)
+#define INTERRUPT_TRANSPOSER           (ARM_IRQ1_BASE + 11)
+#define INTERRUPT_MULTICORESYNC0       (ARM_IRQ1_BASE + 12)
+#define INTERRUPT_MULTICORESYNC1       (ARM_IRQ1_BASE + 13)
+#define INTERRUPT_MULTICORESYNC2       (ARM_IRQ1_BASE + 14)
+#define INTERRUPT_MULTICORESYNC3       (ARM_IRQ1_BASE + 15)
+#define INTERRUPT_DMA0                 (ARM_IRQ1_BASE + 16)
+#define INTERRUPT_DMA1                 (ARM_IRQ1_BASE + 17)
+#define INTERRUPT_VC_DMA2              (ARM_IRQ1_BASE + 18)
+#define INTERRUPT_VC_DMA3              (ARM_IRQ1_BASE + 19)
+#define INTERRUPT_DMA4                 (ARM_IRQ1_BASE + 20)
+#define INTERRUPT_DMA5                 (ARM_IRQ1_BASE + 21)
+#define INTERRUPT_DMA6                 (ARM_IRQ1_BASE + 22)
+#define INTERRUPT_DMA7                 (ARM_IRQ1_BASE + 23)
+#define INTERRUPT_DMA8                 (ARM_IRQ1_BASE + 24)
+#define INTERRUPT_DMA9                 (ARM_IRQ1_BASE + 25)
+#define INTERRUPT_DMA10                (ARM_IRQ1_BASE + 26)
+#define INTERRUPT_DMA11                (ARM_IRQ1_BASE + 27)
+#define INTERRUPT_DMA12                (ARM_IRQ1_BASE + 28)
+#define INTERRUPT_AUX                  (ARM_IRQ1_BASE + 29)
+#define INTERRUPT_ARM                  (ARM_IRQ1_BASE + 30)
+#define INTERRUPT_VPUDMA               (ARM_IRQ1_BASE + 31)
+
+#define ARM_IRQ2_BASE                  32
+#define INTERRUPT_HOSTPORT             (ARM_IRQ2_BASE + 0)
+#define INTERRUPT_VIDEOSCALER          (ARM_IRQ2_BASE + 1)
+#define INTERRUPT_CCP2TX               (ARM_IRQ2_BASE + 2)
+#define INTERRUPT_SDC                  (ARM_IRQ2_BASE + 3)
+#define INTERRUPT_DSI0                 (ARM_IRQ2_BASE + 4)
+#define INTERRUPT_AVE                  (ARM_IRQ2_BASE + 5)
+#define INTERRUPT_CAM0                 (ARM_IRQ2_BASE + 6)
+#define INTERRUPT_CAM1                 (ARM_IRQ2_BASE + 7)
+#define INTERRUPT_HDMI0                (ARM_IRQ2_BASE + 8)
+#define INTERRUPT_HDMI1                (ARM_IRQ2_BASE + 9)
+#define INTERRUPT_PIXELVALVE1          (ARM_IRQ2_BASE + 10)
+#define INTERRUPT_I2CSPISLV            (ARM_IRQ2_BASE + 11)
+#define INTERRUPT_DSI1                 (ARM_IRQ2_BASE + 12)
+#define INTERRUPT_PWA0                 (ARM_IRQ2_BASE + 13)
+#define INTERRUPT_PWA1                 (ARM_IRQ2_BASE + 14)
+#define INTERRUPT_CPR                  (ARM_IRQ2_BASE + 15)
+#define INTERRUPT_SMI                  (ARM_IRQ2_BASE + 16)
+#define INTERRUPT_GPIO0                (ARM_IRQ2_BASE + 17)
+#define INTERRUPT_GPIO1                (ARM_IRQ2_BASE + 18)
+#define INTERRUPT_GPIO2                (ARM_IRQ2_BASE + 19)
+#define INTERRUPT_GPIO3                (ARM_IRQ2_BASE + 20)
+#define INTERRUPT_VC_I2C               (ARM_IRQ2_BASE + 21)
+#define INTERRUPT_VC_SPI               (ARM_IRQ2_BASE + 22)
+#define INTERRUPT_VC_I2SPCM            (ARM_IRQ2_BASE + 23)
+#define INTERRUPT_VC_SDIO              (ARM_IRQ2_BASE + 24)
+#define INTERRUPT_VC_UART              (ARM_IRQ2_BASE + 25)
+#define INTERRUPT_SLIMBUS              (ARM_IRQ2_BASE + 26)
+#define INTERRUPT_VEC                  (ARM_IRQ2_BASE + 27)
+#define INTERRUPT_CPG                  (ARM_IRQ2_BASE + 28)
+#define INTERRUPT_RNG                  (ARM_IRQ2_BASE + 29)
+#define INTERRUPT_VC_ARASANSDIO        (ARM_IRQ2_BASE + 30)
+#define INTERRUPT_AVSPMON              (ARM_IRQ2_BASE + 31)
+
+#define ARM_IRQ0_BASE                  64
+#define INTERRUPT_ARM_TIMER            (ARM_IRQ0_BASE + 0)
+#define INTERRUPT_ARM_MAILBOX          (ARM_IRQ0_BASE + 1)
+#define INTERRUPT_ARM_DOORBELL_0       (ARM_IRQ0_BASE + 2)
+#define INTERRUPT_ARM_DOORBELL_1       (ARM_IRQ0_BASE + 3)
+#define INTERRUPT_VPU0_HALTED          (ARM_IRQ0_BASE + 4)
+#define INTERRUPT_VPU1_HALTED          (ARM_IRQ0_BASE + 5)
+#define INTERRUPT_ILLEGAL_TYPE0        (ARM_IRQ0_BASE + 6)
+#define INTERRUPT_ILLEGAL_TYPE1        (ARM_IRQ0_BASE + 7)
+#define INTERRUPT_PENDING1             (ARM_IRQ0_BASE + 8)
+#define INTERRUPT_PENDING2             (ARM_IRQ0_BASE + 9)
+#define INTERRUPT_JPEG                 (ARM_IRQ0_BASE + 10)
+#define INTERRUPT_USB                  (ARM_IRQ0_BASE + 11)
+#define INTERRUPT_3D                   (ARM_IRQ0_BASE + 12)
+#define INTERRUPT_DMA2                 (ARM_IRQ0_BASE + 13)
+#define INTERRUPT_DMA3                 (ARM_IRQ0_BASE + 14)
+#define INTERRUPT_I2C                  (ARM_IRQ0_BASE + 15)
+#define INTERRUPT_SPI                  (ARM_IRQ0_BASE + 16)
+#define INTERRUPT_I2SPCM               (ARM_IRQ0_BASE + 17)
+#define INTERRUPT_SDIO                 (ARM_IRQ0_BASE + 18)
+#define INTERRUPT_UART                 (ARM_IRQ0_BASE + 19)
+#define INTERRUPT_ARASANSDIO           (ARM_IRQ0_BASE + 20)
-- 
2.5.3

