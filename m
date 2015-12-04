Received: by 10.182.158.201 with SMTP id ww9csp414748obb;
        Thu, 3 Dec 2015 22:05:25 -0800 (PST)
X-Received: by 10.140.153.213 with SMTP id 204mr17405539qhz.30.1449209125790;
        Thu, 03 Dec 2015 22:05:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si4891759qhy.43.2015.12.03.22.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 22:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4jUj-0004fo-I6
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 01:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSk-0000jC-83
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSi-0000Em-Nr
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:22 -0500
Received: from mail-bn1on0111.outbound.protection.outlook.com
	([157.56.110.111]:25728
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4jSd-0000CJ-K6; Fri, 04 Dec 2015 01:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z3+4CK+m3wxGanAy2YfScBkGgL5ymaPt+P2DeWbcO9s=;
	b=nC0KCLAZsCDERIS7XMxeA4Zfp9gyI2omVVIQppYpmWDvWHS6rdNbrrK+aecADOp/23e/qa3uiQfss4IvcupiBUWqPlT9gPBqI/di50crHnnDDuxDwd9aoBefc9/CCsRngOda7fyZHKflAjFXj63s+SuzDnAp7KkDtDDhLiG2a4c=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Fri, 4 Dec 2015 06:03:13 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 22:01:26 -0800
Message-ID: <1449208887-9564-7-git-send-email-Andrew.Baumann@microsoft.com>
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
	2:5lC36AoXie+ZTRiaVZoYuPOJW1VOnBmLcYAVPL2gd+ZG+SMozkuUOB10LscVia64vHMeaJcinXd3xc9TKvr9d1vjBsfVh/YaDFN1P/1duyc9phE9MIfU5+E1qm2/FwPWxtNtknUpMrMbUyAxrU/FWg==;
	3:8uLgqCUoumzyQdEsfjul5rX6uI8C2WNmT93NJm8Gwt7vhgx6ifZf/GAuvO19PtWqsYwbnfikhejXUPUiKnnKO/8VAHbPl3nRNynLiS2RlRHEfktGH2vhD4MdtMDK41o9;
	25:PgazNljvXJs1EiY163fXHR5wayhzr9+r9WcgoZERbjgR49HSYU3vbqdhbn7vCz6Dz/b4tRuNFK+aM5iLzLff9/ETBZmEUk80JUAtP7V32c4Kl8Maau0BazCEBShLwoXFAlaEjatCfIjEQ5ylgNDM2fw/4iY6/j1hVwmuJOW9t5Vz12wHUqr5OYAlhqJMUVSfZQmTwm0pDlV/j7hVBKx7S88qyRoEWcqlacBvvFqUrnSHF3cbBFuhetfII5y5IwCOd0Q/smuQTreFICX3kzvYzw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:E5sLD5GKLZF20Ml8Nqb58xnqnEId77xgB6xm/W1ylqtX4LxseY40iriGWux/+sedv4WwqwrUGpVbMZyV/K0D09raYQqTwQtpcZ2EngXKSj3vAsNP3ubwp/RCmeELZLKI7rEJUXPJy4pD+qTY8wWDia4WDFoVFmUJczre2+G81T2JiHc+7wZgqm3RlapxD798cg54Z20BnC2ynev661HAY31M0n9UTQy0hksjNm4f1KjSYIRq2pStIjLA3uutsHhKfHXeutU1F3jN3EgEiNfkC94Fgm7Lvb1JPRoo/Yt1d9Al4BzZ5gRzUDc9qyc1mSVP8hjNmyF8fD4bhgm1S3oqBa4RF2db0NERouPYlmxVAgaiighTc9yScdRQlcO2I0c3ucDbCiY/eC680JMoUXZuE3CR72uHdbcnHOyeaZjNdyMnA8rZoiEVdNLwJfXXnO66hZwL9fgdsWg73Ov3MC+uumnbaMy30V6gTb26RVVQa0oNnNTxSI5xyOXp22212Ree;
	4:6iae3dOCkhGXV+HRyOMjRVtHU4qElXohRCxRLYg/bmKTdFrIRwR/6dWAv4L81Mp/Yi5a2nLT57X9WY/QIU6J0OQcAznb7q1uzel2ecLzAcnTaZLjwzupuuINQLu/PlQ1UtE0mCXlMl/+jaFo22fBgTeOKYRk83j5DnyM7fmalRMCr9Qo7hB1KWfwiMFmP/amWiAF6A7isjLI6T44R0GWRnq0oeWIirjp4uQtdqeCg9RUuHs94uXwKcL0ABQGLyJbqBY7V2bpT3Q/jTHRO6LCt4MdTIUiGBNdNruwlEKKad9NAlI0zZdnPEA//7ZH61B357XZS9LMUvtrtn4FvBQMT4r7yb6kyxEmmemPfuh35x1nEw8LpeM46dElYyVP8Yvo5JX9iYw41cZZg6kA8PUh0nHRFZ2NFKGW6Be5IpDM3yCUjtzbzAGU2dgu3Ttcvazr
X-Microsoft-Antispam-PRVS: <SN1PR0301MB20464E3BAA1BBEA3CB68A1569E0C0@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(5005710100001)(50226001)(4001430100002)(105586002)(6116002)(106356001)(42186005)(86612001)(77096005)(48376002)(36756003)(5008740100001)(5004730100002)(10090500001)(1096002)(10290500002)(2950100001)(189998001)(87976001)(586003)(92566002)(2351001)(81156007)(19580405001)(5003940100001)(122386002)(19580395003)(86362001)(50986999)(40100003)(50466002)(110136002)(47776003)(5001960100002)(107886002)(76176999)(229853001)(97736004)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:jyiPeRaKVIE6t2CkmWC8fPBm+jA2eXFz5rcqbsL?=
	=?us-ascii?Q?hLMZb7S2MnanlFLkWUIYoDd6lzM8NyhvTz1sNxkf7Gh/6RwLhUhols5n5lUa?=
	=?us-ascii?Q?VKXANyVf+IPEzTN+5K78ZMkihAxBqY2eaKShKNJ4nS4rbIqrovLlUy0TxqLD?=
	=?us-ascii?Q?bY111PmsXvWF96kD7JMfTHw4GE9efpv+P1p9iJXhkpKfyYd/aU1eOuVbNuof?=
	=?us-ascii?Q?INpxxafaZL4+EVJkldBwkb/3iNtfJkEUbJlwevRid5bSQcM6qnK4s+k1Sw4D?=
	=?us-ascii?Q?6Xm8HnHFX8cdioYRbffhiBvnw9iFy+bG3M/Dd5ugGb3KcVfnWJ86dCOIFU2k?=
	=?us-ascii?Q?8Xlpdjo25RXbQJMiGxed8XzolH63hGc0RhCP4EauMnXYP/qqXaC9QYybwVnG?=
	=?us-ascii?Q?JB5CgJc8Zq3wWCouub0CleiSY4KlzwdWGSRnqdx55vET8lqn11lPpE6I+F4H?=
	=?us-ascii?Q?iAHkOiZJYNkfEsKthmIZjf++aSKYjOrMomhgL/Dn0fMVZB+01GZzV5UTGim+?=
	=?us-ascii?Q?O69f5OnczQeCYC6PBmu7FH81WKqOt2KQreLgXpVY7ySQwfSe0CD8YqZhdR6B?=
	=?us-ascii?Q?PvwHMFDtmT2XV0oMEi4zzdx1ChkdaibM0ORI1A3AsmTEUo4H5lWTqzucxvUV?=
	=?us-ascii?Q?qxj6gjyf3+WQjYpJXmbMg0XFeI0JMfM7/RMeXdoH1m3eIeTMMUBiYuACLEQQ?=
	=?us-ascii?Q?f3+lyLDknUCO2zifMaKc+e0z3b34QybB1yLAfa9ffp2dBvfq7rIfrucbR4T6?=
	=?us-ascii?Q?ENFDF0uhq4iNp0G9swWWkYOduuyoUN8e9lkIgfmrpHJoH+u2O90GISV3rAnL?=
	=?us-ascii?Q?gocVFlo2ljIDDEeAIMZqSvG7va+XyJKqrVv5VfSGkGLb3ScAUO/7pMfroj/e?=
	=?us-ascii?Q?1pAq6RYWzN7w1V/P/IdfCQ07n/E07iOt+YGpw52c7x9VS/FOYPRTwruIm40U?=
	=?us-ascii?Q?38DoDgBJ23jDtdZpvXbsSnA/mIE1bXJEZBf5Asw820FN4RaPO/U40HCN11S1?=
	=?us-ascii?Q?bkpcWTmm2Iz7UFylgUOlMIYXXohmjiN22gCyhk6tlC8OwQwqCk8kCszcHYki?=
	=?us-ascii?Q?NlBU7QrebCX2F/Ba6aCtOxncd5I+0gbohb5M3XWsvAPO3HzrqFHQt427A9x5?=
	=?us-ascii?Q?C5jaZWPZn1mIYovLaOcTvDlsFz5xSRoS7+rEyeB0mnNgyxILHOb5KzA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:EE6WbY6DPwMuZw4YeSXb0kIhf6oX1JjYWoIwzIw7PztOIb51YLwzU7s071K6TzflBFQGsCjz6UM5Ip0rIr0hlSoMCF8d1J83K00vf7LhDKhu4EUhVd8SJuDguwvEcyGuQI0k0kMqcRwcoDJidWenAw==;
	24:59ZO3EFYuHuI0mvaAR081RJv3yxNQt0h9GLkz0n5QoyNxwj8+ghp45qfDY9UkIQBnEaa1WoUUECZYNv6yAuPtiJAr1Sr19d6O/NK5OSVL68=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 06:03:13.5974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.111
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH 7/8] bcm2836: add bcm2836 soc device
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
X-TUID: sllQ/xK+BM1j

This is the SoC for Raspberry Pi 2.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/arm/Makefile.objs     |   2 +-
 hw/arm/bcm2836.c         | 135 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2836.h |  33 ++++++++++++
 3 files changed, 169 insertions(+), 1 deletion(-)
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
index 0000000..4b0544e
--- /dev/null
+++ b/hw/arm/bcm2836.c
@@ -0,0 +1,135 @@
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
+    Error *err = NULL;
+    int n;
+
+    /* common peripherals from bcm2835 */
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

