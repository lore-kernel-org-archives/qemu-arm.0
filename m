Received: by 10.25.159.19 with SMTP id i19csp1202756lfe;
        Fri, 29 Jan 2016 14:51:22 -0800 (PST)
X-Received: by 10.140.158.199 with SMTP id e190mr14771544qhe.74.1454107882594;
        Fri, 29 Jan 2016 14:51:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z205si19332346qhc.12.2016.01.29.14.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHsv-0000ki-UD
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:51:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHss-0000fA-86
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:51:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsq-0003WQ-P1
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:51:18 -0500
Received: from mail-by2on0117.outbound.protection.outlook.com
	([207.46.100.117]:38976
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHsl-0003Rx-4g; Fri, 29 Jan 2016 17:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=N7Yrhe4JgO0eOIZ0FK4M5CQtvrjLbTIe7rtCuddXFqk=;
	b=UsjHfeWzcoErroIyeVGPIyLt1z0zJs1AH1SHbduBGygJddwNjr/yOqaa7MmKPBL/RRhP6n+8Mvo3wugCMdycEPiIsr9c0TBRFq4gn9JxQj5e0cjy9gjWeDOg8v1cSbWVSic3BvG5raulL4ymSbazryDdY0GtRufRebhJeQ1ugO8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:51:07 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:42 -0800
Message-ID: <1454107844-15704-7-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: a08d0ce3-4b69-4bba-2896-08d328fead6b
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:OB0Wd9TZLOtRT8Zupbb25hCcP+oV3cHJkJ9X3sQZdopqEtzLNn8lFYVzf1ze2qGfvtRpr/q9OKIxJ3L+Sld86UsTS6e+UBvxlmGSeQ/0IhtyQ+DZ0W3zdHZ4eotASJRJ2SgNmhRSL4Wg0kMyXeDq9QFhn5xLR9d2/vam4YU8uSg4jqPsMIeAaNRWGpAcXGOn;
	3:b7wKNLDdLadJVLR7moFKldXf1rkwQwN/1+8HXumQ9gm7iSyFZQ5jawIMd/7xPQDko76s6zOFM+qXSnXddOacejJzv0GdwTED4Q8eDiiJhmFZs0IoMAjcOrkmMJwxOWyk;
	25:Uyfo691Wtt0gtgleo8R0ON449eLUnnVyuQoTo2InDoa50DHji80hhEbf8H4aCTSqaUO4zutuwTBsyqUiLsbbSzwXfVI4nhPBrrlddssYAV3lSxr/kNR9HJXHp7P9VhQJlR0q8NeUwgKRZ5e6t32FTRxxmgtjC+JP9aRa0QYBaZ1XIOUBYhUExzsaHjdwuOxdDU+R1U1cHTdfOYrT8qqymkVFM2ZJZIYn3by9UKubQRdlrMMEjDjBDwg+zlsnArx44sqPrNQvBVN6YiczSJdT+5PyKR80MF/w/PDd6mP/OHY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:DRrtKkwyJIFi8ZAhyFOEbgUCfP2oJbxQjzmKOI1/v7+6DEakAdPEGDvC9gFEqCImvkeDawhylU6sIjTx04SW2WzkBNKrywDWmSTodGSOl/w/z6vnTOiyI+U1DUAePl3hohc+gmq1bbMsK+e9C9FhVBeTq2Gvbkf2rbK+zpA/FUy9j2PjKAWccCr0PSSV3XdmIeH7xZ2AH7qHXBzJDss1zeLCuUFmFy+7PY6i3AQfwaFt+BW8UmtWlJP5Tj63J52g1PkU6ZosvRDmFwQ5AFMbIK3cSJWDOqVs+aF54oaUPk95xckp+0g7qXEmij8tnB5BIBPXGCL7mLtpim+5nZ9rPNpVNM52GPgQfT0RoF3aM+9OAYgLiQVxdIdvaUbP5cdEoUFFAr9qwNgD4kO1k7N8BKI4BTfyuuRnMD3RW2eiJC7cw++FHeM4A5wJy+BBietAcQHIJUym/P3Dd8VsGaofrU9ofo4echuYhZKParHu6eU6qF7++TAOfGjCgLngd/Sd;
	4:G/OIwV04ZKg+GeDgZyat1d+qpmLSHJwK+HWYH54ai/ObOBMvA6aVmWsfArH+yy7D5P29lpR9krcC3uWONeHA5r8cie9pwGhX6U2t+UDlji4ATI7mBZ24Cs9C7DuGtRf/PP07uv7W4Ikv569OJ6BLEjRAmbBf4p5y1gv6ORr36IXImlwWKG9VY6XO3oDixg79pWMqsNAa+2kvxmZDEcSvGQ8SUgrEYiK0B4np4qlg/kMquyK7BeEfPQoTu+Ry6r3Hcg5iV3eAlf6ZfLIjmUNq2Zc/EKe7Rr5XOBzIeJ0h/KN94neM6yCpXIPFRr/+oAgnai0ebBZe70RCMKr/1xy0RhaXKNy5wybLk7pnuRdm4IBHiW0x3rRI7u+6A2fyZbAL
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2034112194A90A3F4AE765AF9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 083691450C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(229853001)(2950100001)(1096002)(6116002)(3470700001)(122386002)(107886002)(5003940100001)(110136002)(5001960100002)(40100003)(48376002)(47776003)(86612001)(86362001)(50986999)(4001430100002)(189998001)(76176999)(586003)(92566002)(10290500002)(5008740100001)(87976001)(4326007)(50226001)(2351001)(10090500001)(50466002)(36756003)(5005710100001)(5004730100002)(77096005)(19580405001)(2906002)(19580395003)(42186005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:DcQ1YZlegeHL56jrNozQsS//ovPpM+dSijfV+9t?=
	=?us-ascii?Q?+4YT5w22a2OM4rculzE47sji5Vh4KegzVHVaN8AkbPSMx69OUFajcSblrr8u?=
	=?us-ascii?Q?x4miQ1jOBWb+z753UJovoI2cQILe041Bq7sRXyiMU3+8a6BgnA7TDF/vnaqx?=
	=?us-ascii?Q?brHGuqlM8izeTkWl7mx2Z5Uo8dkoS+4xi9ulGDdvI7DiSG8IPo37J4jlkz0k?=
	=?us-ascii?Q?sNkOaWY7JY7nUgqklDc6b7AWlK2my1FqinGtihtiElrXy+QrKmPgdL9lzFaN?=
	=?us-ascii?Q?drI94b5keB+WdQRfy1bZhhWdcgOQcLpkLREPI4k32QGyLmmaEQqe8w5EiAmk?=
	=?us-ascii?Q?h8n6aDFMWcmwYnisJiav1oTCZWJjT4kmzn0BXwBDHKzNE06lD/xe7SsHDbqF?=
	=?us-ascii?Q?V3wzRhVdxqELIxICNrZnps1+M2F+vB1zJNQEXD8xxTWQnWeAAfSQXHkKvoDw?=
	=?us-ascii?Q?36KBpD4VgenrX45Vc+3pS/DjsBAryvOPzaLn7SHxiA0fm3tvYO1M6qcFuaYA?=
	=?us-ascii?Q?5aEwJcy6ZaqH2/hxZ+avwvPQhPoBBlNWRF94v7psNMIf3ZIM9OEYACb/KDKW?=
	=?us-ascii?Q?vGITl9d3iIH/hqpZepIQUj09LvCJvypi2GGkfaTTIgvLURhl0WsnYfqFq/o7?=
	=?us-ascii?Q?g0gp5+FhfN5eV34VNfdJh8edpX2yncU1JLC6K+4G54tQvjRzTHFmMjrMDyo5?=
	=?us-ascii?Q?vxeZHIe6kgxUcrFBW/R+x7CVuPG79LQGGWGyaUVOtIatGmtAdvHASrwNeXwf?=
	=?us-ascii?Q?23Nwbm2PGC3u5h35vhaJFwHNf93j2wUXLzsVl6v7z54nZtTx5rYH6ACFbYo4?=
	=?us-ascii?Q?cnWESj+R8bp76mvaAB5W23zbEz/qnUkSl1ieQbHN626DaSNJ5GwYFmB4BxtC?=
	=?us-ascii?Q?zD2cxUVaCWih+TORlaHN3jOYw/YFjjpuC9uJ/eSSdk6ZwJAr2paPgjTiFMvX?=
	=?us-ascii?Q?DOaEuLD+ov/hzwHHBZ4IJGtjBjdHiqD/3xtv7Jcf0XgPWUy94TqsI6qFqZ0C?=
	=?us-ascii?Q?NBIVYeXquRzCEgPBRnTO0Q048vku819s+oCklYXFIWbyHA6h0jq1C0RjDzj5?=
	=?us-ascii?Q?ySsyhT9CTNEb8DgbcD96Ph4e69M4p?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:Pzc5/s7+Bww2FMwCAWX8QSE9nCLlQ7PtNS+mEbwRCyQH6TZ14VyCv0RIZNi7hlUIuZjMrSGbMWPL657j36cqdGhOwCkB32xwDxC94aYgplp6h7lG5NVZstZbfZEpzmggo9uwduGsmswugVyuN9WrrQ==;
	24:/ZwYMyKjh3s9VkW+HJYX+Fy6AB2vOLw5Xy/55eugMzEa/Bw6kAxVWCYiSq75trCMpMpYVt54G2aVVsLcQ3dwRgoYL1fnh3Ez96AIWinRUR4=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:51:07.6594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.117
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-arm] [PATCH v5 6/8] bcm2836: add bcm2836 SoC device
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
X-TUID: wtbWmA/QPust

This is the SoC for Raspberry Pi 2.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v5:
    * use qdev_connect_gpio_out to connect CPU timers, rather than direct assignment
    * minor formatting tweaks
    
    v4:
    * s/ic/control/
    * replace use of smp_cpus with enabled-cpus property
    * propagate errors rather than exit(1)

 hw/arm/Makefile.objs     |   2 +-
 hw/arm/bcm2836.c         | 165 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2836.h |  35 ++++++++++
 3 files changed, 201 insertions(+), 1 deletion(-)
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
index 0000000..69c7438
--- /dev/null
+++ b/hw/arm/bcm2836.c
@@ -0,0 +1,165 @@
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
+    for (n = 0; n < BCM2836_NCPUS; n++) {
+        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
+                          "cortex-a15-" TYPE_ARM_CPU);
+        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
+                                  &error_abort);
+    }
+
+    object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
+    object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
+    qdev_set_parent_bus(DEVICE(&s->control), sysbus_get_default());
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
+
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
+    object_property_set_bool(OBJECT(&s->control), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, BCM2836_CONTROL_BASE);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
+        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
+
+    for (n = 0; n < BCM2836_NCPUS; n++) {
+        /* Mirror bcm2836, which has clusterid set to 0xf
+         * TODO: this should be converted to a property of ARM_CPU
+         */
+        s->cpus[n].mp_affinity = 0xF00 | n;
+
+        /* set periphbase/CBAR value for CPU-local registers */
+        object_property_set_int(OBJECT(&s->cpus[n]),
+                                BCM2836_PERI_BASE + MCORE_OFFSET,
+                                "reset-cbar", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        /* start powered off if not enabled */
+        object_property_set_bool(OBJECT(&s->cpus[n]), n >= s->enabled_cpus,
+                                 "start-powered-off", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        object_property_set_bool(OBJECT(&s->cpus[n]), true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        /* Connect irq/fiq outputs from the interrupt controller. */
+        qdev_connect_gpio_out_named(DEVICE(&s->control), "irq", n,
+                qdev_get_gpio_in(DEVICE(&s->cpus[n]), ARM_CPU_IRQ));
+        qdev_connect_gpio_out_named(DEVICE(&s->control), "fiq", n,
+                qdev_get_gpio_in(DEVICE(&s->cpus[n]), ARM_CPU_FIQ));
+
+        /* Connect timers from the CPU to the interrupt controller */
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_PHYS,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_VIRT,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", n));
+    }
+}
+
+static Property bcm2836_props[] = {
+    DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2836_NCPUS),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void bcm2836_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->props = bcm2836_props;
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
index 0000000..76de199
--- /dev/null
+++ b/include/hw/arm/bcm2836.h
@@ -0,0 +1,35 @@
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
+    uint32_t enabled_cpus;
+
+    ARMCPU cpus[BCM2836_NCPUS];
+    BCM2836ControlState control;
+    BCM2835PeripheralState peripherals;
+} BCM2836State;
+
+#endif /* BCM2836_H */
-- 
2.5.3

