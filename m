Received: by 10.182.158.201 with SMTP id ww9csp8832631obb;
        Thu, 31 Dec 2015 16:33:54 -0800 (PST)
X-Received: by 10.55.22.225 with SMTP id 94mr93155968qkw.74.1451608434967;
        Thu, 31 Dec 2015 16:33:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c189si67526766qhc.122.2015.12.31.16.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:33:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEnfG-0006Qw-M9
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:33:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndN-0002nx-Bu
	for qemu-devel@nongnu.org; Thu, 31 Dec 2015 19:31:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndI-000647-RD
	for qemu-devel@nongnu.org; Thu, 31 Dec 2015 19:31:57 -0500
Received: from mail-bl2on0105.outbound.protection.outlook.com
	([65.55.169.105]:34976
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndI-00063m-M3; Thu, 31 Dec 2015 19:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=r9jvSdw0QbP41cIu7wSwat5ZqVD1wOc5bpUDp5S9xPs=;
	b=ArW0ZxQMsHAxv9Ge5EbL+jzGdxKemSdruihPfSsTtLqBcoLnyYlgmfmsA6mAIBd01V0SuVnPZVvf81P6DQu9ypokekhacdMPG9gIJI8yrR1ksmlC/LhFTMH6rJMHXtyEBWYjlTs84RvvcT+pi00xL4ks6NGTTG8MF8Jo4iwzRKA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:51 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:33 -0800
Message-ID: <1451608294-16432-7-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:MGErbk+hroYSZsaTbidlDmOIYmACDQwCFd7NVUtUwT+gfqR0b16H0tBUbR1fXJW8/awlT4w/GVtetQ8Rnkt+6ZWjONvvL8YApGZciJm1UTyCj6cRd0HIzK0aQBFATFtrrrnQJzf0mKSFaHcLelqxzA==;
	3:c9yKhx77ELFgDWyPTsSWpk46N264XElqzPKOv18QyALSB6Bm7rJNcS8tZri2xAmGsiwo5LrW5xaKqVrY53XG0nhVSIx6Geq8IEpKTQtMPnqZqgjo8ZU9UngzvRBfWyd9;
	25:sqgQxdBxYZvkOvB2QrURlP4fvk96fGhYiq23rVXk6WbvIiUIKP/+eGVNrO2uZhHLJct8x9m2GlWD6UKJ1IwPo7RqudS5giGr2FXV5kyBTTusfzBCVxAic1vPh9w9V1QiOIOthJCBcGboKBrXvb8jg5C3aqy9V/yUF3fyNwLooFLMZOxl/VryaNfCcVGViFpcaz3CbyYoNVbGHvECwgpiJMpV/6Z3Zm5pkgTPjNGh4YtEkUAMQhrbljjzw3N4xXqe+9j+8vn1DLPR1XqY7CRjYFd5S7FD4DN+27PbttGA0Is=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:gFwVHXaAKyEjoOK4m7fE4vfK79To78NhOaSBVz+0eqktmpmWQ/xsxdAFY8LytBVR96GG4NYNdThJxNG9FNSHPo6ERunFe6OzQxt0AE2xcKXRzh4hYh7pbX0Kg4BVmbeB3THzQWVTSS2gx9XTu/ulLzhjJmcqKoN7SOhlLO+rKxhiuQdDzSqIzjJRVmwktirTPaV+JocQtyMBPBHdbpVxhLdMkN0DhZckrQK8w3SVWSuP4HKbM70BOwTdo72x9Sl42OtR0d58YIQKdaCmIHR7H/tuv8t2CqRNZ/zjszxnsBYfFmqxgKQ9CG9ZisvEr+T7RX01jIZ5Rtvtu12zhPJHZZZUk0NMPUphUGX2yOzdug/b+K9e7JWFg/8tmA5BrkDdykd3MjiaxSAvkRDxWV03fAVp1xA0CQHJMBgkaEpaS0WRO3N/PH/qu8TIhl1O4P40D8lN90UtK7Q7jTf9FV+yf5Wtn32n2zYvMbhBVFFI7mnt6wQORAYyB+A43Q+Lhz6Q;
	4:SRakLrtuHHC0F79whVdVEm250GVqljcnrVd2/gM3t59xme9Jah9rC8/JIBf0rYxkSs9jUjeSfS7rd4Z8XCh6I0Mp2RPC/f+7etx5y9Hnipkw2MbB0W53LvmqBHkzNPA/303jkgWSfNvlzKvSHNo9ObomINhPxk8SrWIdgFzNt71r2LkDrHeLRXCixDXC0HHEvT7xC4n10Ivm8wf+6+G0bJse1KDy4GpTuDSMXrIoMjcovv1BoCkCJMisJh5zZ+qgbNOqGTkWEeJnxBMXYHNioTj3DyaO7jj/YRHMwQrw7TJCaQLKFIfdY3m3AFlezhLY6Mow5J26TQ91NJV53MXMYLkO9i+Cluh9/hoC8MIhTec+bPOAM0yDxO47Ks7FmfRo
X-Microsoft-Antispam-PRVS: <CY1PR0301MB204380B083A5FAA04F48D3879EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(5001960100002)(50226001)(107886002)(76176999)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(2950100001)(19580405001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:IXQPn+RZ2Aii8NgZS7xc8zVIxeChyjQ1S7neYfe?=
	=?us-ascii?Q?0i4xeMo3Bje5IuONJMu+6tCRraWV1yJ76r8Cn6Rc/QNWtFsHk1Mz6DdyOc0x?=
	=?us-ascii?Q?hxaThysRjp747IZPD/Vkn/ry0di1XjttTlp59viTineeKyzA5cnBXDxyBeZL?=
	=?us-ascii?Q?70OC/6aC7i1w4n2gLSoxcNXyl/dRHm8vsvGUzhJLobevRR+lmajYSdGMbumP?=
	=?us-ascii?Q?V2mQ54ibIa08ZMjXbqzNiMvRZ/C1ukDHDg8UPDCR9FQH5SrgoUCh61GKRTs7?=
	=?us-ascii?Q?1llEiePyOKXV/CTlR5qfrZGwQUriVVNADSOaHTk8vBtTkQUyFSw4x1H5s42B?=
	=?us-ascii?Q?xSGhOBOP2/N3tAmvm1N4fUsoac8+1K0NvBHiPk31+9haAo7ttr35PuiyCqLK?=
	=?us-ascii?Q?Go6ds8d+/Gu4iXngqh5KAH+qqzPzuxEDGdQY2/k68tC2ZDDZpmgJdlqNiTm3?=
	=?us-ascii?Q?gSUCKgYqWURf4CIUkMpohrRdG2Jd+pcuzhOh+oit8nUs2iF6vtVTjvMmXtYm?=
	=?us-ascii?Q?Pva14dCdBYGSJAb8GhabAg+It6buIyWmrc6hMIJnmVPjnkJMkQuJoBCpR7Lr?=
	=?us-ascii?Q?R/JBfFHtAkbS1YPekpQXtSoycxnkpIsJGiUC4RCqrsTCw/9cW0N/PoCU44fl?=
	=?us-ascii?Q?lJJR459GnFhV+GKtJIQmLxPssrw5AS4WgE01vpgcCh6Yj0jcxcAJ/hxVOIIu?=
	=?us-ascii?Q?mv4STCqIWWlIEbMd7AqX+phd/HImOSzUuWkm6vVCEeBKLdTQn1k93PXrqBsN?=
	=?us-ascii?Q?gY2GQjSZtST3UgQmL+TUeS5PoDI0b+f3gZUdPUAEX9MhRtYxGRQRpMQyXT6X?=
	=?us-ascii?Q?0to16798qkptJlruskjOpJSB/2V/gdU8+DQEdgIW5Kvp2iaoGDkWmR+I3EMK?=
	=?us-ascii?Q?rY1Ph18TEDP2g81//bXTzsNAZDNS5tU0FAOrE9v7SVEEj9k+zEa5V1VrBV6q?=
	=?us-ascii?Q?Lv5QFlX/BiUdRPhzcDiibjTs8zvETnBX8F0r2GE4yrb8EtOC1MNh96hp6vz3?=
	=?us-ascii?Q?ucf9luba6MAGl3w+5jZvWaxWUu05P2LYdf2+5kqJjw/o8eB6rQRhsI3C1nTE?=
	=?us-ascii?Q?OkXLu7ZksWCjLfRv4m9NesstgqLYILqRAIJHq1PDw9yMFFbRtfeWOcfzDhcv?=
	=?us-ascii?Q?HiM4+h/Ov0kwJbjSrUcIwAKj9MGwQ79V/cjOmkiNit8feF/6M/9nIY2zp/ZG?=
	=?us-ascii?Q?UheaZ6hC3b+JA2qk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:FAL9j1zU674TJkaXuoBsr/HJ5hpVc9XII61qkfsCzNErTzJ5zocyZU3GFwrrXjmA5LWaab/GZPWMTltRHZ8sGRd38axhPttevF0DjeMxPjU7GIz3GERFQK3AuN7sMsSqmEO9JLQGRoRjsAv1GPiFeg==;
	24:hBrhORvHwGUdo2tEtQbFEJwqvk7C0axaw5wOyvecTYUl2gddAkXQ6gBglMB9XuF/fDqj0KtENFqjMpu7a4q0QHYkRqPmcXYhYv0/yZLVR60=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:51.3728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.105
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 6/7] bcm2836: add bcm2836 soc device
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
X-TUID: 78AU4kPUy5wF

This is the SoC for Raspberry Pi 2.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
The use of smp_cpus is dubious here. Ideally it should be passed as a
property from the board, but I found that simply initialising (and not
later realizing) an ARM cpu had unintended side-effects. Is it ok to
defer the object_initialize call to the realize method, when we know
how many CPUs are configured?

 hw/arm/Makefile.objs     |   2 +-
 hw/arm/bcm2836.c         | 155 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2836.h |  33 ++++++++++
 3 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/bcm2836.c
 create mode 100644 include/hw/arm/bcm2836.h

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 82cc142..f55f8d2 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -11,7 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
 obj-$(CONFIG_DIGIC) += digic.o
 obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
-obj-$(CONFIG_RASPI) += bcm2835_peripherals.o
+obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
new file mode 100644
index 0000000..bec7667
--- /dev/null
+++ b/hw/arm/bcm2836.c
@@ -0,0 +1,155 @@
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
+#include "hw/arm/bcm2836.h"
+#include "hw/arm/raspi_platform.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h" /* for smp_cpus */
+#include "exec/address-spaces.h"
+
+/* Peripheral base address seen by the CPU */
+#define BCM2836_PERI_BASE       0x3F000000
+
+/* "QA7" (Pi2) interrupt controller and mailboxes etc. */
+#define BCM2836_CONTROL_BASE    0x40000000
+
+static void bcm2836_init(Object *obj)
+{
+    BCM2836State *s = BCM2836(obj);
+    int n;
+
+    /* TODO: probably shouldn't be using smp_cpus here */
+    assert(smp_cpus <= BCM2836_NCPUS);
+    for (n = 0; n < smp_cpus; n++) {
+        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
+                          "cortex-a15-" TYPE_ARM_CPU);
+        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
+                                  &error_abort);
+    }
+
+    object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2836_CONTROL);
+    object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);
+    qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
+
+    object_initialize(&s->peripherals, sizeof(s->peripherals),
+                      TYPE_BCM2835_PERIPHERALS);
+    object_property_add_child(obj, "peripherals", OBJECT(&s->peripherals),
+                              &error_abort);
+    qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
+}
+
+static void bcm2836_realize(DeviceState *dev, Error **errp)
+{
+    BCM2836State *s = BCM2836(dev);
+    Object *obj;
+    Error *err = NULL;
+    int n;
+
+    /* common peripherals from bcm2835 */
+    obj = object_property_get_link(OBJECT(dev), "ram", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required ram link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    object_property_add_const_link(OBJECT(&s->peripherals), "ram", obj, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&s->peripherals), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
+                            BCM2836_PERI_BASE, 1);
+
+    /* bcm2836 interrupt controller (and mailboxes, etc.) */
+    object_property_set_bool(OBJECT(&s->ic), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ic), 0, BCM2836_CONTROL_BASE);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
+                       qdev_get_gpio_in_named(DEVICE(&s->ic), "gpu_irq", 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
+                       qdev_get_gpio_in_named(DEVICE(&s->ic), "gpu_fiq", 0));
+
+    /* TODO: probably shouldn't be using smp_cpus here */
+    assert(smp_cpus <= BCM2836_NCPUS);
+    for (n = 0; n < smp_cpus; n++) {
+        /* Mirror bcm2836, which has clusterid set to 0xf */
+        s->cpus[n].mp_affinity = 0xF00 | n;
+
+        /* set periphbase/CBAR value for CPU-local registers */
+        object_property_set_int(OBJECT(&s->cpus[n]),
+                                BCM2836_PERI_BASE + MCORE_OFFSET,
+                                "reset-cbar", &err);
+        if (err) {
+            error_report_err(err);
+            exit(1);
+        }
+
+        object_property_set_bool(OBJECT(&s->cpus[n]), true, "realized", &err);
+        if (err) {
+            error_report_err(err);
+            exit(1);
+        }
+
+        /* Connect irq/fiq outputs from the interrupt controller. */
+        qdev_connect_gpio_out_named(DEVICE(&s->ic), "irq", n,
+                                    qdev_get_gpio_in(DEVICE(&s->cpus[n]),
+                                                     ARM_CPU_IRQ));
+        qdev_connect_gpio_out_named(DEVICE(&s->ic), "fiq", n,
+                                    qdev_get_gpio_in(DEVICE(&s->cpus[n]),
+                                                     ARM_CPU_FIQ));
+
+        /* Connect timers from the CPU to the interrupt controller */
+        s->cpus[n].gt_timer_outputs[GTIMER_PHYS]
+            = qdev_get_gpio_in_named(DEVICE(&s->ic), "cntpsirq", 0);
+        s->cpus[n].gt_timer_outputs[GTIMER_VIRT]
+            = qdev_get_gpio_in_named(DEVICE(&s->ic), "cntvirq", 0);
+    }
+}
+
+static void bcm2836_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = bcm2836_realize;
+
+    /*
+     * Reason: creates an ARM CPU, thus use after free(), see
+     * arm_cpu_class_init()
+     */
+    dc->cannot_destroy_with_object_finalize_yet = true;
+}
+
+static const TypeInfo bcm2836_type_info = {
+    .name = TYPE_BCM2836,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2836State),
+    .instance_init = bcm2836_init,
+    .class_init = bcm2836_class_init,
+};
+
+static void bcm2836_register_types(void)
+{
+    type_register_static(&bcm2836_type_info);
+}
+
+type_init(bcm2836_register_types)
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
new file mode 100644
index 0000000..a78e919
--- /dev/null
+++ b/include/hw/arm/bcm2836.h
@@ -0,0 +1,33 @@
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
+#ifndef BCM2836_H
+#define BCM2836_H
+
+#include "hw/arm/arm.h"
+#include "hw/arm/bcm2835_peripherals.h"
+#include "hw/intc/bcm2836_control.h"
+
+#define TYPE_BCM2836 "bcm2836"
+#define BCM2836(obj) OBJECT_CHECK(BCM2836State, (obj), TYPE_BCM2836)
+
+#define BCM2836_NCPUS 4
+
+typedef struct BCM2836State {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    ARMCPU cpus[BCM2836_NCPUS];
+    BCM2836ControlState ic;
+    BCM2835PeripheralState peripherals;
+} BCM2836State;
+
+#endif /* BCM2836_H */
-- 
2.5.3

