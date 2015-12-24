Received: by 10.182.158.201 with SMTP id ww9csp4394924obb;
        Wed, 23 Dec 2015 16:26:07 -0800 (PST)
X-Received: by 10.140.221.145 with SMTP id r139mr47396457qhb.94.1450916767211;
        Wed, 23 Dec 2015 16:26:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v130si42303164qhc.35.2015.12.23.16.26.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtjK-0000U5-Oj
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:26:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjI-0000Py-DF
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:26:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjH-0004xv-3v
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:26:04 -0500
Received: from mail-by2on0141.outbound.protection.outlook.com
	([207.46.100.141]:34504
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtjB-0004u5-LN; Wed, 23 Dec 2015 19:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z3+4CK+m3wxGanAy2YfScBkGgL5ymaPt+P2DeWbcO9s=;
	b=TjN4DWrJU0iHLC6BDwMXS6VXt5SUufBFcOD3LhhHA8xaS68+Ho6AwBtHO6sofHrbEbb8PsLHbELwm3dAgVcYgZxSRFDQxP6cY7j/dhTvjC9yAuDXcoNeil/qsYacxf5LugUBUwnKJHrKMUneRL1IlE4HVUf/yBW+rqr7l4AjcmM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:53 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:30 -0800
Message-ID: <1450916731-5968-7-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:W/Koz6t2cXjoRdi/rbNML40Nl/6cNuqCtS3aH0Gjeb21v17CIJDJ3z3urSqL0raEMXkG5NyqHofDTjF63igyEuKMds8kZAqUUhMF/VMxFRWEsCYd8js2f+ZMHlKpiv9Z1SIacfnkYGWzZLmH2lgbYQ==;
	3:fX/HJkh/Jh2Z0R+3GE3MB/gy47ijGk9pigcqNuuaDOp5jBN8t2CaAlK+YouaQeVDmGBWj6mRyNzV7R4LIWniknIJWYlS29mVZsizkDAz5wPZA57IVtes+FJLXkwFKT4G;
	25:LykQE9Iduy8VotfHzg4TKzoRMUxkIrG3FDNEsK+FDQE3avLlvyKa7jFYVOyIjCXrk14RVj+W1eNBXHObexswq04S9GCdKRRHkgHz/HruJIFSDplIU6WNiKuLanuDrzxSCt7SkmQuHyrWoTQgvKMSfMjBAVbXaDHLK+hlies5uvR1XmnAbcr6JU9er9YyM7ph0jG3UUzezeYEhmfQkSRl5DBPRbEf5zno0DeS1y13ykMvqK7YA56MHMWuFZBTFl3d+82m3PWuUdDsBk4Fqsw2D7wcXpB1EC+pOUaGEsgVlX8=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:x3v9sUyd8OVAdWMrSaxjCltQOmNxqFEG1vWXUmvO0xmeVBGLTp6RsP02BKInumXZRnsiPy+jx+UgtBdEdfxWr5NQMZaY6OxlmIaQYD/oH3MO+2ZbCSvFMEo+JhEkuKSm2NoBoVmmSfD8SyoXbLP1OVgymf1vrphADEEqPgc2TI8siexjrqGe3sB+1N6LXOR6Vpa8CeNgMerBbR9SKRc3Wv3Wmy/GgtnyPMkt0CCLJLbPWA+nk8A9i9oWqZAr5OVQ6TZjLITS8e7Ls+1m2v6qt23NfXsVbsk48T6i3uzNA/sDRFxLrOrCfsYbHTyV+nRLxMxW7NQP11jWA2cw2IJVF46vEVRzUpQGOxFyZy8ai7UjIu2V8P2kzw7brUWYVFTjixoXsemW4MiSTlsjYABNv2pbDQPjjHKJbsAa2j6x8KWlV8OzZTYPF0PEewAVjAyiMnp6oZbl5VP6OuuLIPiXLxJggwcu2NmpOfjMmW/MfrHqfLfMAHIro/x+hajnrhgh;
	4:IDPDR3BxoMnP8s0EUV7Q3AR5wyLRerN57BBX7nRqXYvGHe5ag9buXJp5gqgq3s0bidqFODnrBqn2FiUN5A83nQ2mLwk0fS9c1s036Sf5VVXmy9Vhap6fP0WONQayp4bREAo7rvUleJm8JG59oYV8rZn2/5yBY0TYDAe2xAiliu0UTjGUdYEXbQuRMdbwdcuttljyOEx5f49wGUQE0KdYIKu4BGYS9L6LmAHaag2QZO2f0X+N8Eda7zphJCnFR5WLK7ttEzfshbUINeCLWf8em999DDcogz8QCTS+SFYjkeTTsIlvHrY0XPzrKUouiBHJ2m5GE9d5qJFcbKepW2RIUUi9S4ZiscmiS7Is17p3GlpyW68UKlFZkMYaL13EtN23
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033046BCD6B8F4F1EFAAC909EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(19580405001)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(2950100001)(76176999)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:N2gfEO03zrwem/XVRDH07hEmLqQxQTtDWujKCJQ?=
	=?us-ascii?Q?ndtrAVOn05PQgZRthJ3rNPYvRQF6/IEdpM5SdB9yY/UmBOh65i4nW4fkN9mQ?=
	=?us-ascii?Q?6EPDxXmqHBcxjk8uGY88QanNWIR8j4PxW0pfIf1daNoKexDXrvIvYLEgddM9?=
	=?us-ascii?Q?funWzQjv7Etqu1DDmlxsLminrkDvtuLa93ff6QUQyl5CLoE33+hHiwqtCkL6?=
	=?us-ascii?Q?yZHSN3onDz3AoUTHkELAVr4G6rVQ4WygPgrS/ZXatNzmOxWXAIwG0DtK2/St?=
	=?us-ascii?Q?XW0zMim+kaH8kH/FkkHsy6aRB/6kcnTFPZIrR19NYhJ3xrWSta4I1VcuPxcG?=
	=?us-ascii?Q?jVra9FBsMiKblJkaWYXqovkCygFY592EOPPbZJM0iVzOxUeAoNpN1kLzt8Ir?=
	=?us-ascii?Q?qJgKs0MXW3KEAbiswTdYbVgzhsI1gAQ6FP7ZFw0EjC0DzCoymoO767NEb6Al?=
	=?us-ascii?Q?OF03NUs0kVt6wpJsyDCfy/LpHvX43c7pY2TWcJHo7pOs18zS/yo0i7sA+1m+?=
	=?us-ascii?Q?lbtooQzCROuVq74pe4WKX5pvCnzhljs50fhK+Yqwumny/tvUn5LgEa5CKDpf?=
	=?us-ascii?Q?8OvPij4HGF2/N07tq8P3X8vQFaXGhWkN/6tHA/Y0eVWeoHx60MKZsf+cmPGF?=
	=?us-ascii?Q?dEgUm0MO7np49yeB92zgS65gH0TG5ZQ8vOpi4xYioTyLzEVlyilliv4h5U2X?=
	=?us-ascii?Q?CM3QSspOkeg7SkQ5YCrJAo0bQeHJbe1nz6JxzBPgJOuwr1XNqW+fEPKs2A0t?=
	=?us-ascii?Q?CRGKslHV7CU77qHYjWsG/6buVOy9/xdfB/erif0nfNawHT06jNWePBwAyibq?=
	=?us-ascii?Q?cxoYNytxtEMuG4eANWdb5AuB+En0n8oqxGOI7dIWLp/43QQ/LtSBv5eh/ji8?=
	=?us-ascii?Q?shHiCFJgSN7FYbrKcTQWbzUD8fKsjw8V/Ez2zGA63G97TAsEcxcFbE8Sd71n?=
	=?us-ascii?Q?bz7N8pq/tvLtjXUl53+Bzl36FflUAjIZhN+2PVnWZZGU+FkL2Vwj0rAvg8aC?=
	=?us-ascii?Q?3SK9HcMHzkhrVPgd5dBpQvPO1H4rYf6MaBMls1IMMBhUjqEEu0ntthJDmpLT?=
	=?us-ascii?Q?ETcOUJewxo/EGPE/1iwmzFHIgHgX6cYcGzKJQoHPnHlAVIpfklQNQsNnap5f?=
	=?us-ascii?Q?b/K0509gTSvx3YDqcFPwpef/7adUfMZ9DgcHJ3nVdEYnVE87ZVfEEOw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:DrtDUpnsAClXAmIa8T8+EUuITkZR4yf0k880tMfFKmCKCw0q1V0zBNJ01uIqPjchhfoQNsPKcQ8z83u4cZMVMPut9UFx+Q+uydqq6YmUpc0XfpAHBnwnZp1jEE4dsqPyZ71TGS2eMG8qQhOQHosEtg==;
	24:SzmwBSoNejiel+gtWkfd4zT0YkKoO2KrKoot8HAKh4EV0LqSJghIXU5a1yqKMvUVuo2BkQMgXdhRIkaeMfOytsQt7wyRPWmRf0R8soOazRk=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:53.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.141
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 6/7] bcm2836: add bcm2836 soc device
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
X-TUID: K9WIV/T+Et48

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

