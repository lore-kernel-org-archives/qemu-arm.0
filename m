Received: by 10.25.159.19 with SMTP id i19csp769045lfe;
        Fri, 15 Jan 2016 16:00:27 -0800 (PST)
X-Received: by 10.55.73.68 with SMTP id w65mr16558321qka.68.1452902427836;
        Fri, 15 Jan 2016 16:00:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l21si16013516qhc.82.2016.01.15.16.00.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:00:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEI7-0005pv-CU
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:00:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHG-0004es-1O
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHA-00013X-W3
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:33 -0500
Received: from mail-bl2on0126.outbound.protection.outlook.com
	([65.55.169.126]:52763
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEHA-00013L-RD; Fri, 15 Jan 2016 18:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zgcAOXGkco0+9F7XJE2a5OaLBLrSLhIMiMpJesEOchI=;
	b=EHtP2OICor1+6+m6eiI3SLVeC5/vzA0yQODhECd/U58PsCKlkAl8DoigLhzD6qQk2/7MzvkVSC8TTLnFW8ut5wePE9ICnLILSRcxUd88SMO79VTaVP87jv6qEmC3Rif+xUyDIsJVCLY2fCC/XBA3YEXq+QTftRHelxuH+xemsCg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:26 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:55 -0800
Message-ID: <1452902337-13844-7-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: 01b0f86f-b461-486d-dc4f-08d31e07e6c3
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:qdMqPFRuihBKyU/AdymR/Xulw7XPNJGozmqHNvcNalEjKCYjNIzND62q5qSbzHj6HCPzsc8uWxQFCxgwQ1oV7zrXBx6RZSIqRu8Faz5g2QFrsYQ9TsMcl+jjTIIbg1oqwsUvhlOPCzV4moF4tO8TBEUqO2Q/Hw507a0fG0R0XNPxATEhn+mU965PmIyK4Xcn;
	3:Ekcd031Gu7UBwkTdSIDTC9BiiDL7qhTAqQs8hFDhypnL7Dioixt9agorO329LhOezFgo7Ez8+cCkmi4qIW6RralxujLjX9LC0882+V2jq3PuEqynJAT6YizlHgQRIB7r;
	25:cDOCzP7MFVz9UMYnydyD9SWh1jJdChCBVn+9lmHuEoJIwJIgCmJFpMRGZb/KCRda7D956PBJWxxDcWtJGZEVwnipABqRm6oUUILv0W8aR5i72ibWJHVWJHhkaPR9XYRYYLWBFp7PaluREjw1cKJv6R8lQGqA2fioGvvqBRVIwTK1BpepfeDsmdLGgvMImZtbaM0QarQVq/LFHp6bWubxp5bmpW2CEq+1QlyNlFsy4JyR6a3aIwScm17zRCD8TuQzSxhIqOJvQTiEuxTwI1795B2ydSfME5C1a50tlaSFcZ8=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:cV+H1LnIAYmfm4Axxj+nOzWKuZBt4S91WjfiBViaoei8R3O7Snf4x3Q/lXD6dRYPmQ/BtL6Sn2UHWWT5pMpo1NC+3UYz+4vbBqfcPwHfdHGgiwzNkRI2Ym8ySf/Fkuvh/8AKitqubPuDZpjL5U1hQejwqJnTmqQyRnGm5adRoEExfuqmb7oYSAiEyY33GUKLqN7bB5UIwlng7WLkR1geT21kcRd69TK9771sk7kL9B4poRwFYIfcjzBoYW4pRwTjXMeQ7zcXPbxRSFpIJ0/jNvcoCKuB6p5madm0FEXnI/cMRRyPHMYo8lmU6UmOh62TDJrQ+7yqlux7ELtL3l3lPH/hUeCzSkLHhDNJumxS2IGU8sDVQSD2hkS+a86B3laXlo/VnJyp9dWuexRTDIOeXqqFFSaRmdFF1I9DdnZJ6pGVY6CQaFcF4oCkGVe3Bvx2+jPYUMq5avB475wfT+FWvDS3MNc8HUCpE+K62xNYkMGXC9wSwuxZ04n3FodjFDGX;
	4:tcfecff07AcocMIMxCC7SKZNh6UllKaXptM1pNdCchMjrqEZRmjVrPp8Asg3/uF//YBWGyhoqgOrH570OF7cs3Omx8je3vw7ctyyZCOa/fjrcBFo0E8bi5A0TCn0+ebjLIesJuSjcSUVBK4/WUv7aaEYC2dFcdsNWzZYaNd9THD0K92/tL7J/goKyK486WEurI1hehvvnIS8VKLNsggr9xPABu3/2KTFbGWIhC880q8IgYsVfcRJM1oAyJIrv00xpzIuJzjN5OjYDslirjJu9nkORReujMxYgXK4yR0wSFtOcVVDUvK5L/RmEsjBneMkY7o+faEPQaGEKs/m40zpUB5AP0Nnt1xRY5dpNGFEpslVqCZJff2m+TvrmZOtX6HC
X-Microsoft-Antispam-PRVS: <BLUPR0301MB20333A652FCA88725824E62E9ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 08220FA8D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(4001430100002)(575784001)(106356001)(86362001)(2351001)(2950100001)(2906002)(586003)(77096005)(189998001)(42186005)(5008740100001)(229853001)(50986999)(1096002)(47776003)(4326007)(6116002)(87976001)(48376002)(76176999)(5004730100002)(92566002)(122386002)(5005710100001)(86612001)(40100003)(101416001)(50466002)(107886002)(50226001)(10090500001)(110136002)(5001960100002)(81156007)(5003940100001)(97736004)(19580395003)(105586002)(36756003)(19580405001)(10290500002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:QOHbMoI5kBKKH3VcsMxygG2Q3gnTQRIPpy0uJF/?=
	=?us-ascii?Q?eyMSX0l4iv309UYRzRLkaasEUaCYcQpITvWTSn6HBtxAvgfJvzKKKPkY1iEZ?=
	=?us-ascii?Q?jP3SepxB8Qe+d2RZ8nbDiE+cRftd33aoAfSawbH1f60CgaRvP3B2/HX6M4cN?=
	=?us-ascii?Q?UbsCZUpi61FvQyAwZN9N+OuSKGLDdCaXhTiaHn4C7GtYxFvVyjxWcaH7LA41?=
	=?us-ascii?Q?TuChwVsv1Xbm4gvujW99+uhsh12yn4Lc0O9yFhvNMddIyO17/cWhmC16Hq+H?=
	=?us-ascii?Q?eAVIrQbpFYRJvMyODNSQ2Ev3EWxGR1y3Fp8/2QwY6vJD74KkWFGUB8fy05XT?=
	=?us-ascii?Q?zPERBgzhRyDtzx1HxpPUDgktp4YiiuhVvF3uoivdSK4yRUNrx85x/7pxOmOY?=
	=?us-ascii?Q?eXoLlB7Ot4vowGb7DWfA7Lv20REgyErRV0hZ/H3lRe6RE2avpuKLWNZNTlhP?=
	=?us-ascii?Q?n4NEXnvOPg81Cq2jei2E5NeetTcCoCjeOM1DnXwxYsxaVaLEhPgpgbOQH8tl?=
	=?us-ascii?Q?wDLRRUkXognMz5LhDrisJ/MAa9yH4Aemh6sXbiP89Z2eAg49zfNsTPBUdStF?=
	=?us-ascii?Q?aRV8lk/P1cjeXFHzCPgANDDM3RQKONT/tzLIY8ML7AMQib5291QBpZcB5okc?=
	=?us-ascii?Q?V0X5bVjtiW7ZzNgUaI1TTyuPPKwZd3W4OIfXXZAPHbtZrh9g8u1aB8ObugPm?=
	=?us-ascii?Q?4vIiA9mAmv6FfEIjBXBXD+O5jbts2AcEY1PldIr6xDWp9du9lkMJLTl1CQCk?=
	=?us-ascii?Q?5LxtNWAlv3v92mItRl62wHUxhetYD8Kz6ofsIOIImBbNyLDCy2s/sUsTu1zV?=
	=?us-ascii?Q?O0Plrvx3YWFwqeM+IABAeX4LP7k10/8qNrfWG7EGZOTduzzUzvIgf3lsIkz6?=
	=?us-ascii?Q?cm+Rkmyv5PlDn2m5eMZiJET0c+DdeCoxNHQHQlvUIAW85E3R7m4WMxyLK8ya?=
	=?us-ascii?Q?pDmvQI6F9tRigVHABVe5nLnosmF7bjGPN16CC46ldt6ktmZqiTdLl1V7GFC/?=
	=?us-ascii?Q?ywdjXV4crgsB0rvHwgrejo35wMKyZ3dbV1KPGirDyRBWdsKgVJWbh36W/2HJ?=
	=?us-ascii?Q?RWJX13mJMA9X6BuNEGcKHqUUceApat6W5dUToeC3C94SAoro0VVabXX0TzQl?=
	=?us-ascii?Q?T/fVW0NwkcWlJa58RkuQme84pLJjgs7j+l6/L9ewHEAduQifD0SEOYH35+v/?=
	=?us-ascii?Q?pWZK7ya3nVOQfAvPewJ8eKUtDIaZmkbRkFAQT5Y58OHM3xOSs8i4nZEZE+A?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:ZNgwVFdco/DLrV/ZIMxSN3Ji0/23DcaBRLQofpjPqmvX4cuQQ6xck6Yfd2Bi+WcSdDvgTGwznkyq9x62xxp07MEV1wzCo3UX4tBbqLs0nCHvNNvcxIhkwkVAB9l/pbyZzIE0/jgZaUD4ZbLjMhGe0A==;
	24:0Sgs1kSBU8eQTcFA2VzjHFBla/zaVZC78o/wv+wiE5DvDTltpGNqS7VZJj/sqL8J/7jJrSHdnmXsKKKvPxZ67Gxi8bTMV2KkKk249PxCzlA=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:26.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.126
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v4 6/8] bcm2836: add bcm2836 soc device
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
X-TUID: siQKO9tCat6o

This is the SoC for Raspberry Pi 2.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v4:
    * s/ic/control/
    * replace use of smp_cpus with enabled-cpus property
    * propagate errors rather than exit(1)

 hw/arm/Makefile.objs     |   2 +-
 hw/arm/bcm2836.c         | 165 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2836.h |  34 ++++++++++
 3 files changed, 200 insertions(+), 1 deletion(-)
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
index 0000000..0fd6118
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
+        s->cpus[n].gt_timer_outputs[GTIMER_PHYS]
+            = qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", 0);
+        s->cpus[n].gt_timer_outputs[GTIMER_VIRT]
+            = qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", 0);
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
index 0000000..cd0fd02
--- /dev/null
+++ b/include/hw/arm/bcm2836.h
@@ -0,0 +1,34 @@
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
+    ARMCPU cpus[BCM2836_NCPUS];
+    BCM2836ControlState control;
+    BCM2835PeripheralState peripherals;
+} BCM2836State;
+
+#endif /* BCM2836_H */
-- 
2.5.3

