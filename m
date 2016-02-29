Received: by 10.25.208.211 with SMTP id h202csp1337323lfg;
        Mon, 29 Feb 2016 15:12:21 -0800 (PST)
X-Received: by 10.140.104.242 with SMTP id a105mr23060948qgf.1.1456787541652;
        Mon, 29 Feb 2016 15:12:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si27960541qhc.104.2016.02.29.15.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Feb 2016 15:12:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:39590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaWzF-0007GF-0W
	for alex.bennee@linaro.org; Mon, 29 Feb 2016 18:12:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aaWym-0006mv-0g
	for qemu-devel@nongnu.org; Mon, 29 Feb 2016 18:11:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aaWyg-00043O-Vd
	for qemu-devel@nongnu.org; Mon, 29 Feb 2016 18:11:51 -0500
Received: from mail-by2on0129.outbound.protection.outlook.com
	([207.46.100.129]:47128
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aaWyg-00043H-Eg; Mon, 29 Feb 2016 18:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+sgZzIB4LZETfo2Rz3FkqjaudcgQeb16rZF/pTwZZCo=;
	b=NMwLEuM21Yb7alU4ZeaUt/x5P3WpkhGhFY/gsFPbNiB2y7Q0tvMgaFy39DpUGxUMAGwWjCdibwCzWJ5BvU99R2M7Q/bLb8mbRxYhEe6h2awJwH75rwzW4//RPRWDfsPY6juRQ1Q6Nym2xLEBWR/KP/eSZl4RBwXg68MXuacEZGI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:d::724)
	by CY1PR0301MB2041.namprd03.prod.outlook.com (10.164.2.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.415.20; Mon, 29 Feb 2016 23:11:43 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 29 Feb 2016 15:11:30 -0800
Message-ID: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:d::724]
X-ClientProxiedBy: CO2PR05CA037.namprd05.prod.outlook.com (10.141.241.165) To
	CY1PR0301MB2041.namprd03.prod.outlook.com (25.164.2.23)
X-MS-Office365-Filtering-Correlation-Id: c3663254-448c-4183-dd42-08d3415db087
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	2:/dTRqGOG2LFOUM8TRjJEHzlUWQyaJ7DOSXKY/hlIhuk9Z+5SzYceKb3eoCkFINtol3LW5czV9VG2anpjs+WLJVy8NaqyukfKP0Zzs9VWEHr46vXv32u5WMsJSGMkKgVc4f3DsLF1JR/neDxRqX0yiLYMfB1PdjEFHtlHxaRmsAWJ12NHyXa/UjCs+ssdPk2Y;
	3:sTtFLS8OdAVH7I7p3Pq2TbeALn/seHy6MF4TTVktQwprOfQZ/8kdh3prxzBIot47FTUsKkBC3kOY3k+byqoAPrF3fYq/45dnrAwRIrXh0iof921eBMP70XDv663jFj4o;
	25:vyrfUki0O7iGypXhpenTjCw8Xl1XTN3J/VcFgK/TxPFVd8DLfjUWQ2gd32eQEgIG2IWrndIuVs1HcLWMmeTxa+foljWrLKydplRucotUdnRrNkKZ0KuG+jIfOtXUwRqVL3WEnrjWKj7o30BZwNnebEwW0vkDVfG9ofxKHsQEZEXOu/zThyqwhrG4PYjN7C0dq9KspdMqtKk6o1u5gIKdAm1lKG0kJJ2tpGa/NoxSvB6TTFweQcE2hn46Msnam8wtEjWTCPWpc6tcf7Hom4g6idrjWAtZkou8csfobk0rZfi46IFISa8kj/Xc0XMP8da+JELpm8zlrdDaOaln9lkwVg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2041;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	20:35RacSCRioURuQR2fKoaRaUxvOJJ20omR0YR/k2ZIDEwszyAODi9W9CBpZ3xRX2Mbm8T6fHMTcP9lPzOkPMM804xD1WOPj1zffDfOk/gveGjMuYQzBYi0lBzpHyYIRkxOnJzSNsA57b7WKs0ktZLikmiqVLCIB4xaL0e5Bl+p58NvOkpk2e+5wCXW2jIDFHMWlmVYZ81vuyqXh/HMWwi330qS1ROJfoOGQncTuKVeJHD0tiHEVKLYBNzb4NnWB1zrZMQ5FlOmVR6u7ldI8RTfMrzwZ+nprUTRbpb24N4PwTXR3yoF1y1U2K49ABbTwM+iKHj+SqNMjTqFGRe2zOr9J5aSR/O/InXigPym1IQpdeYiFCEC7B2To4zGF/qhwmyaBUKz/RQuUg7HHlrQWv3ZPqKtltF+xDtD58zTX+g7wrVfDVMrppLIRekm6NDWR0lP71Ufl7zIYce680Qf8QQHFaLdyjGdgFYEXwuvGYHk6pdkXksDx09eeASoLxpjDoj;
	4:4mcQry3/+xYr7lrMnl/41AZ6tLMaJmf4oP+RW3XgJe/zcjdb/CWnPsINFXaK2vymbG0nFkU5RPNykD3kUtsdb2n7ouUUV+pLzwYV27bxO+eXtYu5/K+HvNUt6A+hPfcJ9vSn9zatD9Bk4R5V26Yos082OBaNs8ygzk2kjbc/qoB8jgas4pk9rwjZRvTi3F5xeD8HOaHjXeOIqSvLVPBQVE4PQn+j8H+MP2f7yGemdn5gs/kKR7yc9J+fMufxLAiPUlb8dYcI0NJHcZYzQhz+sY4SSXl/ehYt9UcLitM1bNqfag5Tbv1kQIauVX+5NZtRucf8KufWJ2k2A9auR/TGgxqowa3llFiZ1rpUm4djys+HB7heFlyz367mAdio/0Hf
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2041403E4192106C8727B5B49EBA0@CY1PR0301MB2041.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:CY1PR0301MB2041; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2041; 
X-Forefront-PRVS: 0867F4F1AA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(164054003)(36756003)(10090500001)(42186005)(15975445007)(189998001)(2351001)(229853001)(19580395003)(86612001)(2906002)(5001960100003)(575784001)(40100003)(86362001)(5003940100001)(81156008)(122386002)(87976001)(48376002)(10290500002)(5004730100002)(5008740100001)(4326007)(1096002)(107886002)(110136002)(5005710100001)(77096005)(586003)(6116002)(4001430100002)(50986999)(50226001)(50466002)(92566002)(3826002)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2041;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2041;
	23:iZf98xQ1ps4yvF+OziUjKmBIYfI5dAGmAhirUCD?=
	=?us-ascii?Q?LDCvRqGol0hAo6659XrIGVtF6c2QsfGMeRUaZk1j6p8/EZMbvG+dBvCzAH5h?=
	=?us-ascii?Q?uULFEnhjb/Ig2horoYUDPzozukF/T4a3S0dyo65MJ1262XgtMuDRezoBPZVX?=
	=?us-ascii?Q?wrzj7k/wyU5BMLoCFkxYsykL6fLMlPLRycZrxuXeBddRt0f0pa9Gxies9Qf3?=
	=?us-ascii?Q?8Dwsqa9s7pcI/aJLEG+aWZi4PUQsvKWATd9ijjpaVSxSy9gOgwMgR8EQPeuW?=
	=?us-ascii?Q?MWCdu5nv3RHTU/YzFa/Wtsd5Wi93jJIUjm/5ouNbIP7+CNXbpB3rj3OJO2Rg?=
	=?us-ascii?Q?eQxS4NNcwYOjK6M/tgzauNb9IKTKBNH9QXDAwv6qFDudKMK5qCrYcJXUeYAJ?=
	=?us-ascii?Q?g4PWDuNKPD6vrMdGEJBbhxHTMtWKG0jvQIt/Y94NgM3obBUCwXhvEPtQpaFR?=
	=?us-ascii?Q?hbEJxv59hjX2ha8e6cGNPPprV4zB/EiYdNrfYlHd9+O/jmuaTKmOSvm1VwAT?=
	=?us-ascii?Q?BOG4P9n7ZdinhTT3sJNC4elA3ULHF27kaITDYtNbbdO8A8op+zmRB0e7SsVw?=
	=?us-ascii?Q?CM0GPpGGaYQGjyc3nGXVXrzGb13TLilHYPfWT6Zu+ZS+KmUs7mpCtmwdyAb0?=
	=?us-ascii?Q?6cQ0QU24Uz2cXMmOb52nL//ItLzCCryuJsGpkglAhBDz6Ps968t5bn57gGgq?=
	=?us-ascii?Q?YtsFBPgdr1QPlEJ4dDXpm7i1ItXxccu8+UddZGvP+GjyxQ/qyzynKbpCjqRB?=
	=?us-ascii?Q?rxLMzqpVUnnw9n4Phvn4xxsAdb6skwGmvr7ocmL349JztazrKVKHSZ4SwcOs?=
	=?us-ascii?Q?ozSzqIrXOaEszQxfQgDPamBIDCzjzqM8y8J/omc+opUKbeCNK1wchiRQDgda?=
	=?us-ascii?Q?84u4oaGvlPWTjiEh+TgJPenonNvfVJnvUgcbxuUgJofdfsP+rQEiFLhTpizW?=
	=?us-ascii?Q?FcunFwVyxfewutrgJ8nreLoC8Ivn0jjvI3HjuO1CquevhaPkLaZgnZ+kOVMv?=
	=?us-ascii?Q?BVj5AJ9sV9stvdpu3mjxtATh8fKJA3YLBARfu/aMPnFVWfgya59v12Y0S1N9?=
	=?us-ascii?Q?sxH1404oGDxK5x0DRS2MbtUbeYJH7EKjrydsxU/vWDPYeesmdQg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	5:S3DeLZyzDA1Tsi+xmORDSGkZlYSGAJWSgSq86R5Fbip6Gt0NYWnurFJQM2xk+rr374vZTCeE/BhRMdi6WwJf+Cl80A0de3wAGnydEkQGpOz2y2RLKz7OcptkpePRTh4OWRVtLkBmusL1lbZAxzc9ZA==;
	24:ARpTSMIUBJo7YpCuDIwVkbCu1AYBVrbx1xB2c6HqSNtRNdvFasFHGQVj//WiQliVfXGY1ESmtMOB8NysS2UIsvz+L1E8eQRwBQoAQk1JnQg=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2016 23:11:43.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2041
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.129
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH RFC] bcm2835_dma: add emulation of Raspberry Pi
	DMA controller
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
X-TUID: hdm0zSFjPvcv

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
This patch applies on top of the previous series for Windows and
framebuffer support:
  https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg06387.html

After preparing that, I was disappointed to discover that Raspbian
won't boot cleanly without the DMA controller. In the hope of beating
the freeze deadline (it's still February 29 here :-) I'm sending this
for review.

After applying this patch, it is possible to boot Raspbian to the GUI
using a command such as:

  qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
  2015-09-24-raspbian-jessie.img -append "rw earlyprintk loglevel=8
  console=ttyAMA0 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootwait"
  -dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio

As before, this derives from the original (out of tree) work of
Gregory Estrade, Stefan Weil and others to support Raspberry Pi
1. This patch in particulary is Gregory's code, which I have cleaned
up for submission.

Thanks,
Andrew

 hw/arm/bcm2835_peripherals.c         |  26 +++
 hw/dma/Makefile.objs                 |   1 +
 hw/dma/bcm2835_dma.c                 | 397 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/dma/bcm2835_dma.h         |  47 +++++
 5 files changed, 473 insertions(+)
 create mode 100644 hw/dma/bcm2835_dma.c
 create mode 100644 include/hw/dma/bcm2835_dma.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index c2b812a..fdd346e 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -87,6 +87,14 @@ static void bcm2835_peripherals_init(Object *obj)
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
 
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -246,6 +254,24 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
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
+    for (n = 0; n <= 12; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  INTERRUPT_DMA0 + n));
+    }
 }
 
 static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 0e65ed0..a1abbcf 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -11,3 +11,4 @@ common-obj-$(CONFIG_SUN4M) += sun4m_iommu.o
 
 obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
+obj-$(CONFIG_RASPI) += bcm2835_dma.o
diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
new file mode 100644
index 0000000..1b3cdcf
--- /dev/null
+++ b/hw/dma/bcm2835_dma.c
@@ -0,0 +1,397 @@
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
+#define BCM2708_DMA_ISPAUSED    (1 << 4)  /* Pause requested or not active */
+#define BCM2708_DMA_ISHELD      (1 << 5)  /* Is held by DREQ flow control */
+#define BCM2708_DMA_ERR         (1 << 8)
+#define BCM2708_DMA_ABORT       (1 << 30) /* stop current CB, go to next, WO */
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
+/* the current control block appears in the following registers - read only */
+#define BCM2708_DMA_INFO        0x08
+#define BCM2708_DMA_SOURCE_AD   0x0c
+#define BCM2708_DMA_DEST_AD     0x10
+#define BCM2708_DMA_TXFR_LEN    0x14
+#define BCM2708_DMA_STRIDE      0x18
+#define BCM2708_DMA_NEXTCB      0x1C
+#define BCM2708_DMA_DEBUG       0x20
+
+#define BCM2708_DMA_INT_STATUS  0xfe0 /* Interrupt status of each channel */
+#define BCM2708_DMA_ENABLE      0xff0 /* Global enable bits for each channel */
+
+#define BCM2708_DMA_CS_RW_MASK  0x30ff0001 /* All RW bits in DMA_CS */
+
+static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
+{
+    BCM2835DMAChan *ch = &s->chan[c];
+    uint32_t data, xlen, ylen;
+    int16_t dst_stride, src_stride;
+
+    if (!(s->enable & (1 << c))) {
+        return;
+    }
+
+    while ((s->enable & (1 << c)) && (ch->conblk_ad != 0)) {
+        /* CB fetch */
+        ch->ti = ldl_phys(&s->dma_as, ch->conblk_ad);
+        ch->source_ad = ldl_phys(&s->dma_as, ch->conblk_ad + 4);
+        ch->dest_ad = ldl_phys(&s->dma_as, ch->conblk_ad + 8);
+        ch->txfr_len = ldl_phys(&s->dma_as, ch->conblk_ad + 12);
+        ch->stride = ldl_phys(&s->dma_as, ch->conblk_ad + 16);
+        ch->nextconbk = ldl_phys(&s->dma_as, ch->conblk_ad + 20);
+
+        if (ch->ti & BCM2708_DMA_TDMODE) {
+            /* 2D transfer mode */
+            ylen = (ch->txfr_len >> 16) & 0x3fff;
+            xlen = ch->txfr_len & 0xffff;
+            dst_stride = ch->stride >> 16;
+            src_stride = ch->stride & 0xffff;
+        } else {
+            ylen = 1;
+            xlen = ch->txfr_len;
+            dst_stride = 0;
+            src_stride = 0;
+        }
+
+        while (ylen != 0) {
+            /* Normal transfer mode */
+            while (xlen != 0) {
+                if (ch->ti & BCM2708_DMA_S_IGNORE) {
+                    /* Ignore reads */
+                    data = 0;
+                } else {
+                    data = ldl_phys(&s->dma_as, ch->source_ad);
+                }
+                if (ch->ti & BCM2708_DMA_S_INC) {
+                    ch->source_ad += 4;
+                }
+
+                if (ch->ti & BCM2708_DMA_D_IGNORE) {
+                    /* Ignore writes */
+                } else {
+                    stl_phys(&s->dma_as, ch->dest_ad, data);
+                }
+                if (ch->ti & BCM2708_DMA_D_INC) {
+                    ch->dest_ad += 4;
+                }
+
+                /* update remaining transfer length */
+                xlen -= 4;
+                if (ch->ti & BCM2708_DMA_TDMODE) {
+                    ch->txfr_len = (ylen << 16) | xlen;
+                } else {
+                    ch->txfr_len = xlen;
+                }
+            }
+
+            if (--ylen != 0) {
+                ch->source_ad += src_stride;
+                ch->dest_ad += dst_stride;
+            }
+        }
+        ch->cs |= BCM2708_DMA_END;
+        if (ch->ti & BCM2708_DMA_INT_EN) {
+            ch->cs |= BCM2708_DMA_INT;
+            s->int_status |= (1 << c);
+            qemu_set_irq(ch->irq, 1);
+        }
+
+        /* Process next CB */
+        ch->conblk_ad = ch->nextconbk;
+    }
+    ch->cs &= ~BCM2708_DMA_ACTIVE;
+}
+
+static uint64_t bcm2835_dma_read(BCM2835DMAState *s, hwaddr offset,
+                                 unsigned size, unsigned c)
+{
+    BCM2835DMAChan *ch = &s->chan[c];
+    uint32_t res = 0;
+
+    assert(size == 4);
+    assert(c < BCM2835_DMA_NCHANS);
+
+    switch (offset) {
+    case BCM2708_DMA_CS:
+        res = ch->cs;
+        break;
+    case BCM2708_DMA_ADDR:
+        res = ch->conblk_ad;
+        break;
+    case BCM2708_DMA_INFO:
+        res = ch->ti;
+        break;
+    case BCM2708_DMA_SOURCE_AD:
+        res = ch->source_ad;
+        break;
+    case BCM2708_DMA_DEST_AD:
+        res = ch->dest_ad;
+        break;
+    case BCM2708_DMA_TXFR_LEN:
+        res = ch->txfr_len;
+        break;
+    case BCM2708_DMA_STRIDE:
+        res = ch->stride;
+        break;
+    case BCM2708_DMA_NEXTCB:
+        res = ch->nextconbk;
+        break;
+    case BCM2708_DMA_DEBUG:
+        res = ch->debug;
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
+    BCM2835DMAChan *ch = &s->chan[c];
+    uint32_t oldcs;
+
+    assert(size == 4);
+    assert(c < BCM2835_DMA_NCHANS);
+
+    switch (offset) {
+    case BCM2708_DMA_CS:
+        oldcs = ch->cs;
+        if (value & BCM2708_DMA_RESET) {
+            ch->cs |= BCM2708_DMA_RESET;
+        }
+        if (value & BCM2708_DMA_ABORT) {
+            ch->cs |= BCM2708_DMA_ABORT;
+        }
+        if (value & BCM2708_DMA_END) {
+            ch->cs &= ~BCM2708_DMA_END;
+        }
+        if (value & BCM2708_DMA_INT) {
+            ch->cs &= ~BCM2708_DMA_INT;
+            s->int_status &= ~(1 << c);
+            qemu_set_irq(ch->irq, 0);
+        }
+        ch->cs &= ~BCM2708_DMA_CS_RW_MASK;
+        ch->cs |= (value & BCM2708_DMA_CS_RW_MASK);
+        if (!(oldcs & BCM2708_DMA_ACTIVE) && (ch->cs & BCM2708_DMA_ACTIVE)) {
+            bcm2835_dma_update(s, c);
+        }
+        break;
+    case BCM2708_DMA_ADDR:
+        ch->conblk_ad = value;
+        break;
+    case BCM2708_DMA_DEBUG:
+        ch->debug = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+static uint64_t bcm2835_dma0_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2835DMAState *s = opaque;
+
+    if (offset < 0xf00) {
+        return bcm2835_dma_read(s, (offset & 0xff), size, (offset >> 8) & 0xf);
+    } else {
+        switch (offset) {
+        case BCM2708_DMA_INT_STATUS:
+            return s->int_status;
+        case BCM2708_DMA_ENABLE:
+            return s->enable;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                          __func__, offset);
+            return 0;
+        }
+    }
+}
+
+static uint64_t bcm2835_dma15_read(void *opaque, hwaddr offset, unsigned size)
+{
+    return bcm2835_dma_read(opaque, (offset & 0xff), size, 15);
+}
+
+static void bcm2835_dma0_write(void *opaque, hwaddr offset, uint64_t value,
+                               unsigned size)
+{
+    BCM2835DMAState *s = opaque;
+
+    if (offset < 0xf00) {
+        bcm2835_dma_write(s, (offset & 0xff), value, size, (offset >> 8) & 0xf);
+    } else {
+        switch (offset) {
+        case BCM2708_DMA_INT_STATUS:
+            break;
+        case BCM2708_DMA_ENABLE:
+            s->enable = (value & 0xffff);
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                          __func__, offset);
+        }
+    }
+
+}
+
+static void bcm2835_dma15_write(void *opaque, hwaddr offset, uint64_t value,
+                                unsigned size)
+{
+    bcm2835_dma_write(opaque, (offset & 0xff), value, size, 15);
+}
+
+static const MemoryRegionOps bcm2835_dma0_ops = {
+    .read = bcm2835_dma0_read,
+    .write = bcm2835_dma0_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const MemoryRegionOps bcm2835_dma15_ops = {
+    .read = bcm2835_dma15_read,
+    .write = bcm2835_dma15_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_dma_chan = {
+    .name = TYPE_BCM2835_DMA "-chan",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
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
+static const VMStateDescription vmstate_bcm2835_dma = {
+    .name = TYPE_BCM2835_DMA,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
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
+    BCM2835DMAState *s = BCM2835_DMA(obj);
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
+    for (n = 0; n < 16; n++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->chan[n].irq);
+    }
+}
+
+static void bcm2835_dma_reset(DeviceState *dev)
+{
+    BCM2835DMAState *s = BCM2835_DMA(dev);
+    int n;
+
+    s->enable = 0xffff;
+    s->int_status = 0;
+    for (n = 0; n < BCM2835_DMA_NCHANS; n++) {
+        s->chan[n].cs = 0;
+        s->chan[n].conblk_ad = 0;
+    }
+}
+
+static void bcm2835_dma_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835DMAState *s = BCM2835_DMA(dev);
+    Error *err = NULL;
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "dma-mr", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required dma-mr link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->dma_mr = MEMORY_REGION(obj);
+    address_space_init(&s->dma_as, s->dma_mr, NULL);
+
+    bcm2835_dma_reset(dev);
+}
+
+static void bcm2835_dma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2835_dma_realize;
+    dc->reset = bcm2835_dma_reset;
+    dc->vmsd = &vmstate_bcm2835_dma;
+}
+
+static TypeInfo bcm2835_dma_info = {
+    .name          = TYPE_BCM2835_DMA,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835DMAState),
+    .class_init    = bcm2835_dma_class_init,
+    .instance_init = bcm2835_dma_init,
+};
+
+static void bcm2835_dma_register_types(void)
+{
+    type_register_static(&bcm2835_dma_info);
+}
+
+type_init(bcm2835_dma_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
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
-- 
2.5.3

