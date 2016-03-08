Received: by 10.25.208.211 with SMTP id h202csp2133083lfg;
        Tue, 8 Mar 2016 12:09:06 -0800 (PST)
X-Received: by 10.55.207.217 with SMTP id v86mr38356105qkl.16.1457467745919;
        Tue, 08 Mar 2016 12:09:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si4644590qgf.7.2016.03.08.12.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 12:09:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adNwH-0000ex-9D
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 15:09:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNtE-00042K-M0
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt9-0004K2-L5
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:56 -0500
Received: from mail-bn1bon0117.outbound.protection.outlook.com
	([157.56.111.117]:64688
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1adNt9-0004Jl-A4; Tue, 08 Mar 2016 15:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aBlmDDc2z8QT7P4uo4CgZYWiKSlsEKFuZmO/gVHosdM=;
	b=G4lhb43IyWZqkI2k7T2im2wSCXhRBmyKu1j+bMAsDBe4Ll5oVMvpSw2754KUrQLR8AE5oIJUcM52JjYcOK65S+EBtHxhUN5RxvfzVKr44cWzapZSjz1oM/TAaO1NzoeMjIdHGSabVUE8UqtLcS0fIXGYAREYy5Ccem7XSh4sTps=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8::5f2)
	by BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Tue, 8 Mar 2016 20:05:47 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 8 Mar 2016 12:05:26 -0800
Message-ID: <1457467526-8840-6-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:4898:80e8::5f2]
X-ClientProxiedBy: BY1PR10CA0031.namprd10.prod.outlook.com (25.160.197.41) To
	BLUPR0301MB2036.namprd03.prod.outlook.com (25.164.22.26)
X-MS-Office365-Filtering-Correlation-Id: 0aabb6e0-258f-4f4c-1237-08d3478d0a7d
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	2:pJpzpmRiR2oTvLy/V8qzM4LEH0HJc1o3cnJya72e1HPYYAYrQ0iYBTcfW2HLr3btx7zvEicnbm/4uNz45NGyX21rCDnLx/NiLVTPzvuUItRfhmJM4RQTHp6xjqAuAjEPUBenTU1R1e2B9U/5I13UP+O949G1NswVMbkeYLP8/DqSdB1TJR9wugQy3fSYl45b;
	3:3T9jW4yVMYxlpiuTtTrHOtZhnQ7TPJl9nlOhLCi6Rm3MBz2AZ4vViQE0xQpQMj9q9W1WgjH132JVW4l5pqjvk3IA/WTZ+CzjUtdJR8zKkpVG2WYorMKAYoPKw0uiM227;
	25:ts7F6fhrLwmhdBXEC0Rj0AiTcTQLpRropddKkumCURlMemeQQE06xxz3uePAAg8EX8xgaAYKvpUXVI3vQIdneJycYLX4ak5PPRf731pUrBW2qxOalW+6bOPf1xhfju4Nw0p0oIbsriihxuabg7QF2qeE+dnZprF4OwEo/McQH518jJbfqxoRIS0/+WFZH8qyBxPGAZhdkcqbv8FNqwom0Be9njHMAmP5YLicDMKqBECt/I7OGUIL5gqaBRIcjpMfL0a6HiYk/YFxrRfg9trrySWaytWrKaCvlwuxjkm4xD+0T20qqRxQHmy8g7gu0nEE2fUUEWiqLFXnD4JT+QkaD6yJ5/Wif2QonxUN24JmT3o=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	20:1ZTxe4u/30qchHxvMPcJNl9dATDG5N4i3vC8FdaElMw8Ts/zl1I6bzM/aqc5jReVLVWhJmcH592TJcoXTQXpXRS2GlwH5fg2p9DgKGrzlIjlLMLVU82dxm5L1zRtVT0o7uFg07KKovEudv73dzxMXyj3C0JiKAbaVaoCpdcx12oWa8Hld7euNwJr7HuQ714MbP2wNG7yVmvlNWRxU0gP1tepATwxYAC4sdwgtRis+buv3pRcK0JrjT0d14Ep3Vs/zUVEbsl5rhDmkIW0xIbj8zenxY/zmDibO1N0FAzyz3jXnC453uqzkIzTAhaXebRN0UWSd0B6tfuTDD2/ekvb+P1/dO05Adk4WIQ87nF5XIuOJUs4OJHw7Aq95prIC2Madf0Gck+evSdgHYSkof2lIiki302MiS+5Pzu7l3UdtujZCGYo9ACCQcgdpPB1t+nKnU4tAegqGh8x/NpTDV3vTG5qTPIyXOhIdVYcTuigPxhGQgopp/BKwkCNAotywMyd;
	4:WuJmWduZ51GpBo34UfLomkm5wQVeP4raPXATkyM4Xd3FE21DMfSi7MZCKMS+e404xE9ONJu5L0XOmPVZECFqR2trvoXVrdasTDmavpET43iTISvn8VgDT4taQW7/S7lk6h3awPBgpY19TtuWp6YBxb6oFQ4WFoeRgoA3w9Ngb2pfBzIWdKrrLqtDaodp3ZdluWw5IPzn+p7xgTcoe0RuuF4p97opmxAd/iXoV0rE1cLR5msA0XObKSoTFaPBtRVd2J1LEvHGa7LjBmwlDsHw5/MSaQlk3VPceNleunC0dSfuYlelRcXj8Uj67o0H3e+EDM59/pqgAAtGka2rpR4wddGr3NC3iL4hDcqEUgZL6t8=
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2036ACCC5FAB70D50F138D3C9EB20@BLUPR0301MB2036.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
X-Forefront-PRVS: 08756AC3C8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(10290500002)(47776003)(5005710100001)(2950100001)(86362001)(575784001)(189998001)(86612001)(36756003)(10090500001)(19580395003)(42186005)(2906002)(6116002)(23676002)(586003)(2870700001)(5008740100001)(4001430100002)(50986999)(5820100001)(76176999)(92566002)(50466002)(77096005)(2351001)(229853001)(19580405001)(110136002)(107886002)(5004730100002)(81166005)(1096002)(4326007)(50226001)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2036;
	23:lAD7EBwQm04AsxSJ4a+xN1crH3VWWLcs8WdyEIH?=
	=?us-ascii?Q?JBpbh3A21kQshsJPAZPVNPrYKsKu8w38XQzyxnpFO8KXaKzBoJYl5P9yDj/M?=
	=?us-ascii?Q?Wl6KsCnSn9kQ4g2kGtfBA/PoIvjSJ1nXPGK50JFB1A8BTUOsHdVp620q4oQj?=
	=?us-ascii?Q?I1XWSgcWAaXvXXlfoEJilKYZrW0whqPXTQDFCrX4ZVQaLZ2VQz/fbHg+TE59?=
	=?us-ascii?Q?gAPk2oc541ghyE5yY2q4YJfF37muOOJvixXrNWkxm6DPTyFJOMTewLX/DFym?=
	=?us-ascii?Q?xsg5FG80pyk7/UC5gR9T5HkiFHTxU9ix/jSZfcQqhffTOmxPL2Ak1qln8u7Y?=
	=?us-ascii?Q?tdkQqA09/PbIkCBjfQh0LjXt+GJmiwaC/XFIFbQc5gYIHsGkObIWlobZfF3Q?=
	=?us-ascii?Q?KBMWa/dk7utQF8i1/ptqDUWI7vOCrjl084jCtlMQQ6y2iyMwjc47YQB+B6sx?=
	=?us-ascii?Q?r1y0/zD0mesZ3R0ph7Yc3/qiDDcQkDN5Spg7gdzsw+LxOObsEylyWV+mzkU7?=
	=?us-ascii?Q?u6HYr46o/DcNlD+w+pCyvgcH/fyqQEhBncn0oCi7pifGamSE8+BeFMReiYjl?=
	=?us-ascii?Q?s7YUb0ODAUFPqyNK03P0OQWqsAE71UyzJ7R2cdAJSJkNBxdPZqh/Yow3yJyZ?=
	=?us-ascii?Q?T0bR58T8iQHQwu86jnAKEO9L9fkUg4LE/0Rqjr38sQaQ3lpuYV+0ShaKTtL5?=
	=?us-ascii?Q?u+5Qcjx7A7SMPx9g5iH/vHLzKeqvnlTdR754X3DTFDUU7xr2pPwYH9F2XAet?=
	=?us-ascii?Q?KyqgiP6t0ui+Bd6B4SEn0g3HgIMQSJC2+YB3zwgVihZ+26AIeb0xlk4Lw7xv?=
	=?us-ascii?Q?AUzRHImHr6+uezlCViIQ+iHYl2O3Pw9X66JDZPvODofFMa3nKMsJ1GdI97dD?=
	=?us-ascii?Q?+7OSxkgydVGXU987eBw6/jet9O4PGt/lTrf2ofPtZu1Gb+XqLIhV4tEauT0Q?=
	=?us-ascii?Q?iLm9bXKmj1zO8yq1Cr9WdUK8OUxQxvuTsFNnBJt8qVBwYLwsf8MAJf4ENsVb?=
	=?us-ascii?Q?S+2pfh3On2o9DwmL7s+LPvk6003D/16GOg9aKlLnxOfU47RxMPLxPlrPW5lL?=
	=?us-ascii?Q?6l1Y9chc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	5:SBtNnbuyhb0jQWtlPoCyMFNLDt+rJoFO+b/5p5oAjqepVLoVqMhoBg8q7P+Aq7Myd3prGFMo6sIBmGDP3OVyp5L+bX2FHhljOzh9xi4ItXnoRVMrHXjvciZygN+FT5b+8DXPP3PEduuVnKV/9JjQtQ==;
	24:PpuLq4EaWWbZGLJeIAIKC5hbnz0O2CrF08eg027zjIE4Re1lThwWJQnfCdVQvYbUs4pFiA8FvN7VPhdvt2Jc00AGRxxDY6BLplMnugA2wZM=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2016 20:05:47.1963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.117
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 5/5] bcm2835_dma: add emulation of Raspberry
	Pi DMA controller
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
X-TUID: jTTqp+d2MDaM

From: Gr=C3=A9gory ESTRADE <gregory.estrade@gmail.com>

At present, all DMA transfers complete inline (so a looping descriptor
queue will lock up the device). We also do not model pause/abort,
arbitrarion/priority, or debug features.

Signed-off-by: Gr=C3=A9gory ESTRADE <gregory.estrade@gmail.com>
[AB: implement 2D mode, cleanup/refactoring for upstream submission]
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

Notes:
    v2:
     * avoid ldl_phys/stl_phys
     * compute address of channel structure only after asserting its validi=
ty
     * correctly implement per-channel reset and abort bits
     * set channel paused bit when completing DMA

 hw/arm/bcm2835_peripherals.c         |  26 +++
 hw/dma/Makefile.objs                 |   1 +
 hw/dma/bcm2835_dma.c                 | 408 +++++++++++++++++++++++++++++++=
++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/dma/bcm2835_dma.h         |  47 ++++
 5 files changed, 484 insertions(+)
 create mode 100644 hw/dma/bcm2835_dma.c
 create mode 100644 include/hw/dma/bcm2835_dma.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 4d74a18..8099a8a 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -88,6 +88,14 @@ static void bcm2835_peripherals_init(Object *obj)
     object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
     object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
     qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
+
+    /* DMA Channels */
+    object_initialize(&s->dma, sizeof(s->dma), TYPE_BCM2835_DMA);
+    object_property_add_child(obj, "dma", OBJECT(&s->dma), NULL);
+    qdev_set_parent_bus(DEVICE(&s->dma), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
+                                   OBJECT(&s->gpu_bus_mr), &error_abort);
 }
=20
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -258,6 +266,24 @@ static void bcm2835_peripherals_realize(DeviceState *d=
ev, Error **errp)
         return;
     }
=20
+    /* DMA Channels */
+    object_property_set_bool(OBJECT(&s->dma), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, DMA_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 0));
+    memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
+
+    for (n =3D 0; n <=3D 12; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  INTERRUPT_DMA0 + n));
+    }
 }
=20
 static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 0e65ed0..a1abbcf 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -11,3 +11,4 @@ common-obj-$(CONFIG_SUN4M) +=3D sun4m_iommu.o
=20
 obj-$(CONFIG_OMAP) +=3D omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) +=3D pxa2xx_dma.o
+obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
new file mode 100644
index 0000000..c7ce4e4
--- /dev/null
+++ b/hw/dma/bcm2835_dma.c
@@ -0,0 +1,408 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/dma/bcm2835_dma.h"
+
+/* DMA CS Control and Status bits */
+#define BCM2708_DMA_ACTIVE      (1 << 0)
+#define BCM2708_DMA_END         (1 << 1) /* GE */
+#define BCM2708_DMA_INT         (1 << 2)
+#define BCM2708_DMA_ISPAUSED    (1 << 4)  /* Pause requested or not active=
 */
+#define BCM2708_DMA_ISHELD      (1 << 5)  /* Is held by DREQ flow control =
*/
+#define BCM2708_DMA_ERR         (1 << 8)
+#define BCM2708_DMA_ABORT       (1 << 30) /* stop current CB, go to next, =
WO */
+#define BCM2708_DMA_RESET       (1 << 31) /* WO, self clearing */
+
+/* DMA control block "info" field bits */
+#define BCM2708_DMA_INT_EN      (1 << 0)
+#define BCM2708_DMA_TDMODE      (1 << 1)
+#define BCM2708_DMA_WAIT_RESP   (1 << 3)
+#define BCM2708_DMA_D_INC       (1 << 4)
+#define BCM2708_DMA_D_WIDTH     (1 << 5)
+#define BCM2708_DMA_D_DREQ      (1 << 6)
+#define BCM2708_DMA_D_IGNORE    (1 << 7)
+#define BCM2708_DMA_S_INC       (1 << 8)
+#define BCM2708_DMA_S_WIDTH     (1 << 9)
+#define BCM2708_DMA_S_DREQ      (1 << 10)
+#define BCM2708_DMA_S_IGNORE    (1 << 11)
+
+/* Register offsets */
+#define BCM2708_DMA_CS          0x00 /* Control and Status */
+#define BCM2708_DMA_ADDR        0x04 /* Control block address */
+/* the current control block appears in the following registers - read onl=
y */
+#define BCM2708_DMA_INFO        0x08
+#define BCM2708_DMA_SOURCE_AD   0x0c
+#define BCM2708_DMA_DEST_AD     0x10
+#define BCM2708_DMA_TXFR_LEN    0x14
+#define BCM2708_DMA_STRIDE      0x18
+#define BCM2708_DMA_NEXTCB      0x1C
+#define BCM2708_DMA_DEBUG       0x20
+
+#define BCM2708_DMA_INT_STATUS  0xfe0 /* Interrupt status of each channel =
*/
+#define BCM2708_DMA_ENABLE      0xff0 /* Global enable bits for each chann=
el */
+
+#define BCM2708_DMA_CS_RW_MASK  0x30ff0001 /* All RW bits in DMA_CS */
+
+static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
+{
+    BCM2835DMAChan *ch =3D &s->chan[c];
+    uint32_t data, xlen, ylen;
+    int16_t dst_stride, src_stride;
+
+    if (!(s->enable & (1 << c))) {
+        return;
+    }
+
+    while ((s->enable & (1 << c)) && (ch->conblk_ad !=3D 0)) {
+        /* CB fetch */
+        ch->ti =3D ldl_le_phys(&s->dma_as, ch->conblk_ad);
+        ch->source_ad =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 4);
+        ch->dest_ad =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 8);
+        ch->txfr_len =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 12);
+        ch->stride =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 16);
+        ch->nextconbk =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 20);
+
+        if (ch->ti & BCM2708_DMA_TDMODE) {
+            /* 2D transfer mode */
+            ylen =3D (ch->txfr_len >> 16) & 0x3fff;
+            xlen =3D ch->txfr_len & 0xffff;
+            dst_stride =3D ch->stride >> 16;
+            src_stride =3D ch->stride & 0xffff;
+        } else {
+            ylen =3D 1;
+            xlen =3D ch->txfr_len;
+            dst_stride =3D 0;
+            src_stride =3D 0;
+        }
+
+        while (ylen !=3D 0) {
+            /* Normal transfer mode */
+            while (xlen !=3D 0) {
+                if (ch->ti & BCM2708_DMA_S_IGNORE) {
+                    /* Ignore reads */
+                    data =3D 0;
+                } else {
+                    data =3D ldl_le_phys(&s->dma_as, ch->source_ad);
+                }
+                if (ch->ti & BCM2708_DMA_S_INC) {
+                    ch->source_ad +=3D 4;
+                }
+
+                if (ch->ti & BCM2708_DMA_D_IGNORE) {
+                    /* Ignore writes */
+                } else {
+                    stl_le_phys(&s->dma_as, ch->dest_ad, data);
+                }
+                if (ch->ti & BCM2708_DMA_D_INC) {
+                    ch->dest_ad +=3D 4;
+                }
+
+                /* update remaining transfer length */
+                xlen -=3D 4;
+                if (ch->ti & BCM2708_DMA_TDMODE) {
+                    ch->txfr_len =3D (ylen << 16) | xlen;
+                } else {
+                    ch->txfr_len =3D xlen;
+                }
+            }
+
+            if (--ylen !=3D 0) {
+                ch->source_ad +=3D src_stride;
+                ch->dest_ad +=3D dst_stride;
+            }
+        }
+        ch->cs |=3D BCM2708_DMA_END;
+        if (ch->ti & BCM2708_DMA_INT_EN) {
+            ch->cs |=3D BCM2708_DMA_INT;
+            s->int_status |=3D (1 << c);
+            qemu_set_irq(ch->irq, 1);
+        }
+
+        /* Process next CB */
+        ch->conblk_ad =3D ch->nextconbk;
+    }
+
+    ch->cs &=3D ~BCM2708_DMA_ACTIVE;
+    ch->cs |=3D BCM2708_DMA_ISPAUSED;
+}
+
+static void bcm2835_dma_chan_reset(BCM2835DMAChan *ch)
+{
+    ch->cs =3D 0;
+    ch->conblk_ad =3D 0;
+}
+
+static uint64_t bcm2835_dma_read(BCM2835DMAState *s, hwaddr offset,
+                                 unsigned size, unsigned c)
+{
+    BCM2835DMAChan *ch;
+    uint32_t res =3D 0;
+
+    assert(size =3D=3D 4);
+    assert(c < BCM2835_DMA_NCHANS);
+
+    ch =3D &s->chan[c];
+
+    switch (offset) {
+    case BCM2708_DMA_CS:
+        res =3D ch->cs;
+        break;
+    case BCM2708_DMA_ADDR:
+        res =3D ch->conblk_ad;
+        break;
+    case BCM2708_DMA_INFO:
+        res =3D ch->ti;
+        break;
+    case BCM2708_DMA_SOURCE_AD:
+        res =3D ch->source_ad;
+        break;
+    case BCM2708_DMA_DEST_AD:
+        res =3D ch->dest_ad;
+        break;
+    case BCM2708_DMA_TXFR_LEN:
+        res =3D ch->txfr_len;
+        break;
+    case BCM2708_DMA_STRIDE:
+        res =3D ch->stride;
+        break;
+    case BCM2708_DMA_NEXTCB:
+        res =3D ch->nextconbk;
+        break;
+    case BCM2708_DMA_DEBUG:
+        res =3D ch->debug;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        break;
+    }
+    return res;
+}
+
+static void bcm2835_dma_write(BCM2835DMAState *s, hwaddr offset,
+                              uint64_t value, unsigned size, unsigned c)
+{
+    BCM2835DMAChan *ch;
+    uint32_t oldcs;
+
+    assert(size =3D=3D 4);
+    assert(c < BCM2835_DMA_NCHANS);
+
+    ch =3D &s->chan[c];
+
+    switch (offset) {
+    case BCM2708_DMA_CS:
+        oldcs =3D ch->cs;
+        if (value & BCM2708_DMA_RESET) {
+            bcm2835_dma_chan_reset(ch);
+        }
+        if (value & BCM2708_DMA_ABORT) {
+            /* abort is a no-op, since we always run to completion */
+        }
+        if (value & BCM2708_DMA_END) {
+            ch->cs &=3D ~BCM2708_DMA_END;
+        }
+        if (value & BCM2708_DMA_INT) {
+            ch->cs &=3D ~BCM2708_DMA_INT;
+            s->int_status &=3D ~(1 << c);
+            qemu_set_irq(ch->irq, 0);
+        }
+        ch->cs &=3D ~BCM2708_DMA_CS_RW_MASK;
+        ch->cs |=3D (value & BCM2708_DMA_CS_RW_MASK);
+        if (!(oldcs & BCM2708_DMA_ACTIVE) && (ch->cs & BCM2708_DMA_ACTIVE)=
) {
+            bcm2835_dma_update(s, c);
+        }
+        break;
+    case BCM2708_DMA_ADDR:
+        ch->conblk_ad =3D value;
+        break;
+    case BCM2708_DMA_DEBUG:
+        ch->debug =3D value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+static uint64_t bcm2835_dma0_read(void *opaque, hwaddr offset, unsigned si=
ze)
+{
+    BCM2835DMAState *s =3D opaque;
+
+    if (offset < 0xf00) {
+        return bcm2835_dma_read(s, (offset & 0xff), size, (offset >> 8) & =
0xf);
+    } else {
+        switch (offset) {
+        case BCM2708_DMA_INT_STATUS:
+            return s->int_status;
+        case BCM2708_DMA_ENABLE:
+            return s->enable;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\=
n",
+                          __func__, offset);
+            return 0;
+        }
+    }
+}
+
+static uint64_t bcm2835_dma15_read(void *opaque, hwaddr offset, unsigned s=
ize)
+{
+    return bcm2835_dma_read(opaque, (offset & 0xff), size, 15);
+}
+
+static void bcm2835_dma0_write(void *opaque, hwaddr offset, uint64_t value=
,
+                               unsigned size)
+{
+    BCM2835DMAState *s =3D opaque;
+
+    if (offset < 0xf00) {
+        bcm2835_dma_write(s, (offset & 0xff), value, size, (offset >> 8) &=
 0xf);
+    } else {
+        switch (offset) {
+        case BCM2708_DMA_INT_STATUS:
+            break;
+        case BCM2708_DMA_ENABLE:
+            s->enable =3D (value & 0xffff);
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\=
n",
+                          __func__, offset);
+        }
+    }
+
+}
+
+static void bcm2835_dma15_write(void *opaque, hwaddr offset, uint64_t valu=
e,
+                                unsigned size)
+{
+    bcm2835_dma_write(opaque, (offset & 0xff), value, size, 15);
+}
+
+static const MemoryRegionOps bcm2835_dma0_ops =3D {
+    .read =3D bcm2835_dma0_read,
+    .write =3D bcm2835_dma0_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+};
+
+static const MemoryRegionOps bcm2835_dma15_ops =3D {
+    .read =3D bcm2835_dma15_read,
+    .write =3D bcm2835_dma15_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_dma_chan =3D {
+    .name =3D TYPE_BCM2835_DMA "-chan",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(cs, BCM2835DMAChan),
+        VMSTATE_UINT32(conblk_ad, BCM2835DMAChan),
+        VMSTATE_UINT32(ti, BCM2835DMAChan),
+        VMSTATE_UINT32(source_ad, BCM2835DMAChan),
+        VMSTATE_UINT32(dest_ad, BCM2835DMAChan),
+        VMSTATE_UINT32(txfr_len, BCM2835DMAChan),
+        VMSTATE_UINT32(stride, BCM2835DMAChan),
+        VMSTATE_UINT32(nextconbk, BCM2835DMAChan),
+        VMSTATE_UINT32(debug, BCM2835DMAChan),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_bcm2835_dma =3D {
+    .name =3D TYPE_BCM2835_DMA,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(chan, BCM2835DMAState, BCM2835_DMA_NCHANS, 1,
+                             vmstate_bcm2835_dma_chan, BCM2835DMAChan),
+        VMSTATE_UINT32(int_status, BCM2835DMAState),
+        VMSTATE_UINT32(enable, BCM2835DMAState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_dma_init(Object *obj)
+{
+    BCM2835DMAState *s =3D BCM2835_DMA(obj);
+    int n;
+
+    /* DMA channels 0-14 occupy a contiguous block of IO memory, along
+     * with the global enable and interrupt status bits. Channel 15
+     * has the same register map, but is mapped at a discontiguous
+     * address in a separate IO block.
+     */
+    memory_region_init_io(&s->iomem0, OBJECT(s), &bcm2835_dma0_ops, s,
+                          TYPE_BCM2835_DMA, 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem0);
+
+    memory_region_init_io(&s->iomem15, OBJECT(s), &bcm2835_dma15_ops, s,
+                          TYPE_BCM2835_DMA "-chan15", 0x100);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem15);
+
+    for (n =3D 0; n < 16; n++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->chan[n].irq);
+    }
+}
+
+static void bcm2835_dma_reset(DeviceState *dev)
+{
+    BCM2835DMAState *s =3D BCM2835_DMA(dev);
+    int n;
+
+    s->enable =3D 0xffff;
+    s->int_status =3D 0;
+    for (n =3D 0; n < BCM2835_DMA_NCHANS; n++) {
+        bcm2835_dma_chan_reset(&s->chan[n]);
+    }
+}
+
+static void bcm2835_dma_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835DMAState *s =3D BCM2835_DMA(dev);
+    Error *err =3D NULL;
+    Object *obj;
+
+    obj =3D object_property_get_link(OBJECT(dev), "dma-mr", &err);
+    if (obj =3D=3D NULL) {
+        error_setg(errp, "%s: required dma-mr link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->dma_mr =3D MEMORY_REGION(obj);
+    address_space_init(&s->dma_as, s->dma_mr, NULL);
+
+    bcm2835_dma_reset(dev);
+}
+
+static void bcm2835_dma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D bcm2835_dma_realize;
+    dc->reset =3D bcm2835_dma_reset;
+    dc->vmsd =3D &vmstate_bcm2835_dma;
+}
+
+static TypeInfo bcm2835_dma_info =3D {
+    .name          =3D TYPE_BCM2835_DMA,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(BCM2835DMAState),
+    .class_init    =3D bcm2835_dma_class_init,
+    .instance_init =3D bcm2835_dma_init,
+};
+
+static void bcm2835_dma_register_types(void)
+{
+    type_register_static(&bcm2835_dma_info);
+}
+
+type_init(bcm2835_dma_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_=
peripherals.h
index e19d360..e12ae37 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -16,6 +16,7 @@
 #include "hw/sysbus.h"
 #include "hw/char/bcm2835_aux.h"
 #include "hw/display/bcm2835_fb.h"
+#include "hw/dma/bcm2835_dma.h"
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_mbox.h"
@@ -37,6 +38,7 @@ typedef struct BCM2835PeripheralState {
     SysBusDevice *uart0;
     BCM2835AuxState aux;
     BCM2835FBState fb;
+    BCM2835DMAState dma;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835MboxState mboxes;
diff --git a/include/hw/dma/bcm2835_dma.h b/include/hw/dma/bcm2835_dma.h
new file mode 100644
index 0000000..75312e2
--- /dev/null
+++ b/include/hw/dma/bcm2835_dma.h
@@ -0,0 +1,47 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_DMA_H
+#define BCM2835_DMA_H
+
+#include "qemu-common.h"
+#include "exec/address-spaces.h"
+#include "hw/sysbus.h"
+
+typedef struct {
+    uint32_t cs;
+    uint32_t conblk_ad;
+    uint32_t ti;
+    uint32_t source_ad;
+    uint32_t dest_ad;
+    uint32_t txfr_len;
+    uint32_t stride;
+    uint32_t nextconbk;
+    uint32_t debug;
+
+    qemu_irq irq;
+} BCM2835DMAChan;
+
+#define TYPE_BCM2835_DMA "bcm2835-dma"
+#define BCM2835_DMA(obj) \
+        OBJECT_CHECK(BCM2835DMAState, (obj), TYPE_BCM2835_DMA)
+
+#define BCM2835_DMA_NCHANS 16
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion iomem0, iomem15;
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
+
+    BCM2835DMAChan chan[BCM2835_DMA_NCHANS];
+    uint32_t int_status;
+    uint32_t enable;
+} BCM2835DMAState;
+
+#endif
--=20
2.7.0

