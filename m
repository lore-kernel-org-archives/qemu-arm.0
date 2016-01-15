Received: by 10.25.159.19 with SMTP id i19csp769057lfe;
        Fri, 15 Jan 2016 16:00:29 -0800 (PST)
X-Received: by 10.140.108.164 with SMTP id j33mr16885757qgf.17.1452902429024;
        Fri, 15 Jan 2016 16:00:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si16033901qhc.14.2016.01.15.16.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:00:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEI8-0005sI-H8
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:00:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHE-0004ad-12
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEH9-00012l-0D
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:31 -0500
Received: from mail-bl2on0139.outbound.protection.outlook.com
	([65.55.169.139]:49713
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEH8-00012d-Nv; Fri, 15 Jan 2016 18:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=I1D0D+ZkKZvJlCWXaITg3GCJU9k508o0qxaiyovcl20=;
	b=WC7uJsUmVkUddHUbhkcV1Z2LpwpB/CsFc5bk/X7f2ilIC3pa6PCv+UIEMUMaHJlu8jZZA62BIX9jUlsgXCHfCwtolletBPqPSS8lOJSsic+slD5XxlUDqJOSHHOCxzYWuXaihrpygIFw/iipDOnCeA3OOQurAZTMTqX7yZvrvwQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:23 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:53 -0800
Message-ID: <1452902337-13844-5-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: 19736a39-adee-47b3-eae8-08d31e07e530
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:jmWxlb69ceADXSKE8nxsViU+mc0Fwb1AkQ9b32Gx+FOXmdeeZmk0dnhrzC8SAXr4wOo7zXuM0PoKlFyULPNn/CaMDfotIuAVQfIFPKG6z/MLAwZ/XpF7YrTGHDlbLolpLYwFpZ0wLnBciRURITerWpBgzL0rfJTKQZRVz4KLX4yyyMf3g2ycaDwRm1PslNFH;
	3:2Qt67fqlTcnIDQOg6FBm+UR1mXRzrEVvtI4htFhBIzvHzlxg7YpJA/cMOy4RIvkYstPLTGycZlcrSWlXorLiKCD63QmTP1inOTaOFRQp2diZr6+HzztP/rfTk9PMjvAR;
	25:BoafRvu6WSfytfka2EYZAmMO4dlkHqiTg99rdlbXas7bu2QrHZt8vOn38co7B4yi0gKxbemqn7bXfXjd2hg780IJsfZ23ptxxCY4Advf5ZcKd5RsVwEbjJBOaEOPG+rptUbyqmX4U54PKAnw08uVgD6h9icNUeS+fqjPJq/mq6jTRo3Nc/TRkGSq+OFZVtSf//v8ZNZQQte+vQt+tmQBXAT/TPZ72dZxnh5Mg5GS35zed/Uxz8VR6t62v9rBmb0xg8E35Nerkb6tnjSQ0B5hvAiDfxS37ynuWpxUdoynpXQ=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:9nXXdenXbq548b/Ccs+vNx6sY1hkVmFu1OyegL+OsuBydHbxq9ELs1mnGIk1z/HHJW/9DKWlBsWNiQwLYqZkb9kDklvQISRBgLQcfFJxAe4ZYxavOa6hI70C9CdXQZIp0etvLepJwbBIPz6XgNXD12M6AUIa+NPDqsBGXEs4/7YRYOnrMqUJP8URtZJfzQXpDuaa+Hau3loL1KKSXreNW+P6/yA8M2mQ7pE7FnwpUlZvbnY5xJ4F66pZ9fMlpCKR6JaANq71qLF4FS2AEGGD1vEqW7UxxxwUw5BP/0ndqGZCH3+DEMM0deXeFr1wfynKH9sJR8te6T8U9VYRxXGis4hDd896Yqd1pIQ9pQepq8spkyD1OkJBKKtUjb+DDTdmvtADOq5h2UFEaV9Ra0AEYq9+8OLGbVIY8xQRnAOeT1KVR6ejZHYbV+y7QbhX/QOf31WzT7PsxN2hk4ujuctzkeJQsJrLZMWiVwFEskCOnBWGKZ9ATW+OhW9t3P9d2TF5;
	4:iMAaFWIpe1gb0nk6fRvGbAGB9GSCSNWX05A7pWMTtZnxRU4NgBuWzKTAOHL6mmz5leAsfJq7dw8qI/vtZ250z1h0Ng2mbpt2wXWfiqNXhty0azt/Q5oIIzyh2BF1GDqWrKUAYp1kjVW8h7VpJLTZA+rEtAqHO07xJXE7U7lpyZvCGKymzKJa491MZBdP/VXNcASHImETtZDKGBZppNntM4WL9xb3lKrfXommzXcjyR05rGzr9lPsujlZ8jE/bF/HJLZmmNhV3FOG5ZoyUJ5q1d2A8kT8KEzJlXdgOz/QpBxa5sB9JHue574cBxJgtTvyi4xoGPGBwtxLnaYFqc+fKevwUJ+hz98FKA2+yEW1yuVslxjPrDo/VJKTdMlcTZ/X
X-Microsoft-Antispam-PRVS: <BLUPR0301MB203351C69827FC4C8C51FDBB9ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 08220FA8D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(4001430100002)(106356001)(86362001)(2351001)(2950100001)(2906002)(586003)(77096005)(189998001)(42186005)(5008740100001)(229853001)(50986999)(1096002)(47776003)(4326007)(6116002)(87976001)(48376002)(76176999)(5004730100002)(92566002)(122386002)(5005710100001)(86612001)(40100003)(101416001)(50466002)(107886002)(50226001)(10090500001)(110136002)(5001960100002)(81156007)(5003940100001)(97736004)(19580395003)(105586002)(36756003)(19580405001)(10290500002)(2004002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:tqRfyxjD1bItoXSPRl7N7qNmK2Y8wtxsem9m2NR?=
	=?us-ascii?Q?JwhqwJ2pTRbEhsXC+ji0KjrhtTmpuz3WSBL7CVDW/N0CHUq61Krb3vtWymVl?=
	=?us-ascii?Q?sbHHwUwkNj7ZC1zN63JbKqHL4IeWoyYZnVoml/5P3oVTpMLwXPAqoavr4FYx?=
	=?us-ascii?Q?IrVobelW0LEzUI2f0pEbrb5UveLoZACvpRppKSlXlFUwmP8MNCKxDTSZFUcx?=
	=?us-ascii?Q?4FwEzdoGv9XDs2vcb44sthUrFvNT3O2+BBwQsFSmpXx+fXQgwUA3HnBVivkb?=
	=?us-ascii?Q?xwDhv7kN700mJQpiNM5OCm+B/3rKulULOe9lqJMN+mybe4yJEKBI1LXyJPrC?=
	=?us-ascii?Q?Ngv18zXMuSe0gULabPf3ejmCKgWbCdu5M3E9J51tAiAfGKiTndWkYajygywc?=
	=?us-ascii?Q?U3BL+9tZKZ9GachYIC2S00R4K+fAodpGwjLeFoqs8LZmL4PPSXYxsyTBpatS?=
	=?us-ascii?Q?5d396B2LAl5osKxD8elFyGxwkjY4wSzm254za4IVy3zhwRaPRVax/l6DTVwE?=
	=?us-ascii?Q?E57Xf1X8aDOFbuoRPeKsyFzcfgxFC+TaxKQQLujBIxNrA5f3+Y67j1+WRvTg?=
	=?us-ascii?Q?Er1iHwYdzrWcqPjm8A8wsZLZp52WPs6WM78B7aEubVP1VMYihTGPflv9iKLG?=
	=?us-ascii?Q?uwd7kttfIfQe+u0BSFNkmdZjRQwVT0OzOJsh2ts45uCoOng2JkSoEwBpetAh?=
	=?us-ascii?Q?euGzW0s3W2Ms6i6Rx+z1Cro1ZNf6GANhly5IKOi+SUhm9zZtBo/ulsdLgV7l?=
	=?us-ascii?Q?bbCnEEKjBL3Gzkdtgxwi9aN4FoxOiS9Iqt1hL8CAt/OdMviFr+J5AWnR+a7q?=
	=?us-ascii?Q?NrSVr+cKgkNDpfuUgGIXCdWXjJZfv1WRcqsaP7+yxpgrYMKNT4IvCti8LOzT?=
	=?us-ascii?Q?9fJ3t04KVF1QEAb4XuOjBp5180epaQH2//6811SUzzzjAlXHz4dKd2Pc7CNQ?=
	=?us-ascii?Q?ulyDIIkM4fiRovNFYImc0odxdqPwgybtQpKbundjFfZSLRDnV3p2U9r0DvWz?=
	=?us-ascii?Q?866fcJquNAAWb+W+uPr9/UXX70ifi1DRabi7zV5U8v5MemplUlU2UG2LG89/?=
	=?us-ascii?Q?ggiTMeryxwvW41xjZrFrxVRYqD8itO+hVFD/TOmrMWgXNNw3uWycL0aa6+xW?=
	=?us-ascii?Q?NDmJT+Gi7RZoU2T31z2KGjEHJ5fCVGpxcKRC+97kcOfYipbuW/QukOVntnxQ?=
	=?us-ascii?Q?vdtp/xnNaP1OOYk6DCXnBGTytfdjtFft6DD09?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:UqB/fxFjV+GOzmrqQzWbWFDQslN62aGh+fP6fpRZhsAECla4YCXXNHOHixA0cD9BGcvUmCRE6I8giNCFsA9t/ps4Fse+Cpr/JQm6xbjYzJTA7PiSUCi0pN0FbEplrV0BA8R1827SPJoLF/q3KuF88g==;
	24:wNBNUKbHeBnaqGvQpLQPM9Z+4SUp7zWnF9BKcsxJ4Ns5aDaYIKXsUFKBHmmO13HjK9bH8SP0wD3C/luTA+TN94yxyXg9psZpMFdts9ob2TY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:23.8789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.139
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v4 4/8] bcm2835_peripherals: add rollup device
	for bcm2835 peripherals
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
X-TUID: Dwd64sDnDKD+

This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
which are also present on bcm2836 (Pi2). It also implements the
private address spaces used for DMA and mailboxes.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v3:
     * clean up raspi_platform.h
     * s/_/-/ in type/property/child names
     * use memory_region_init where appropriate rather than memory_region_init_io
     * pass ram as link property
    
    v2:
     * adapted to use common SDHCI emulation

 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 205 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |  42 +++++++
 include/hw/arm/raspi_platform.h      | 128 ++++++++++++++++++++++
 4 files changed, 376 insertions(+)
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
index 0000000..879a41d
--- /dev/null
+++ b/hw/arm/bcm2835_peripherals.c
@@ -0,0 +1,205 @@
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
+#include "hw/misc/bcm2835_mbox_defs.h"
+#include "hw/arm/raspi_platform.h"
+
+/* Peripheral base address on the VC (GPU) system bus */
+#define BCM2835_VC_PERI_BASE 0x7e000000
+
+/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
+#define BCM2835_SDHC_CAPAREG 0x52034b4
+
+static void bcm2835_peripherals_init(Object *obj)
+{
+    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
+
+    /* Memory region for peripheral devices, which we export to our parent */
+    memory_region_init_io(&s->peri_mr, obj, NULL, s, "bcm2835-peripherals",
+                          0x1000000);
+    object_property_add_child(obj, "peripheral-io", OBJECT(&s->peri_mr), NULL);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
+
+    /* Internal memory region for peripheral bus addresses (not exported) */
+    memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 << 32);
+    object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr), NULL);
+
+    /* Internal memory region for request/response communication with
+     * mailbox-addressable peripherals (not exported)
+     */
+    memory_region_init(&s->mbox_mr, obj, "bcm2835-mbox",
+                       MBOX_CHAN_COUNT << MBOX_AS_CHAN_SHIFT);
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
+    /* Mailboxes */
+    object_initialize(&s->mboxes, sizeof(s->mboxes), TYPE_BCM2835_MBOX);
+    object_property_add_child(obj, "mbox", OBJECT(&s->mboxes), NULL);
+    qdev_set_parent_bus(DEVICE(&s->mboxes), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
+                                   OBJECT(&s->mbox_mr), &error_abort);
+
+    /* Property channel */
+    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
+    object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
+    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->property), "dma-mr",
+                                   OBJECT(&s->gpu_bus_mr), &error_abort);
+
+    /* Extended Mass Media Controller */
+    object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
+    object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
+    qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
+}
+
+static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(dev);
+    Object *obj;
+    MemoryRegion *ram;
+    Error *err = NULL;
+    uint32_t ram_size;
+    int n;
+
+    obj = object_property_get_link(OBJECT(dev), "ram", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required ram link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    ram = MEMORY_REGION(obj);
+    ram_size = memory_region_size(ram);
+
+    /* Map peripherals and RAM into the GPU address space. */
+    memory_region_init_alias(&s->peri_mr_alias, OBJECT(s),
+                             "bcm2835-peripherals", &s->peri_mr, 0,
+                             memory_region_size(&s->peri_mr));
+
+    memory_region_add_subregion_overlap(&s->gpu_bus_mr, BCM2835_VC_PERI_BASE,
+                                        &s->peri_mr_alias, 1);
+
+    /* RAM is aliased four times (different cache configurations) on the GPU */
+    for (n = 0; n < 4; n++) {
+        memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
+                                 "bcm2835-gpu-ram-alias[*]", ram, 0, ram_size);
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
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_UART));
+
+    /* Mailboxes */
+    object_property_set_bool(OBJECT(&s->mboxes), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, ARMCTRL_0_SBM_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mboxes), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->mboxes), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
+                               INTERRUPT_ARM_MAILBOX));
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
+    memory_region_add_subregion(&s->mbox_mr,
+                MBOX_CHAN_PROPERTY << MBOX_AS_CHAN_SHIFT,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->property), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
+                      qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PROPERTY));
+
+    /* Extended Mass Media Controller */
+    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
+                            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, EMMC_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhci), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_ARASANSDIO));
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
index 0000000..5d888dc
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
+#include "hw/misc/bcm2835_mbox.h"
+#include "hw/sd/sdhci.h"
+
+#define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
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
+    BCM2835ICState ic;
+    BCM2835PropertyState property;
+    BCM2835MboxState mboxes;
+    SDHCIState sdhci;
+} BCM2835PeripheralState;
+
+#endif /* BCM2835_PERIPHERALS_H */
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
new file mode 100644
index 0000000..6467e88
--- /dev/null
+++ b/include/hw/arm/raspi_platform.h
@@ -0,0 +1,128 @@
+/*
+ * bcm2708 aka bcm2835/2836 aka Raspberry Pi/Pi2 SoC platform defines
+ *
+ * These definitions are derived from those in Raspbian Linux at
+ * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
+ * where they carry the following notice:
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
+#define PCM_CLOCK_OFFSET        0x101098
+#define RNG_OFFSET              0x104000
+#define GPIO_OFFSET             0x200000
+#define UART0_OFFSET            0x201000
+#define MMCI0_OFFSET            0x202000
+#define I2S_OFFSET              0x203000
+#define SPI0_OFFSET             0x204000
+#define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define UART1_OFFSET            0x215000
+#define EMMC_OFFSET             0x300000
+#define SMI_OFFSET              0x600000
+#define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
+#define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
+#define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
+
+/* GPU interrupts */
+#define INTERRUPT_TIMER0               0
+#define INTERRUPT_TIMER1               1
+#define INTERRUPT_TIMER2               2
+#define INTERRUPT_TIMER3               3
+#define INTERRUPT_CODEC0               4
+#define INTERRUPT_CODEC1               5
+#define INTERRUPT_CODEC2               6
+#define INTERRUPT_JPEG                 7
+#define INTERRUPT_ISP                  8
+#define INTERRUPT_USB                  9
+#define INTERRUPT_3D                   10
+#define INTERRUPT_TRANSPOSER           11
+#define INTERRUPT_MULTICORESYNC0       12
+#define INTERRUPT_MULTICORESYNC1       13
+#define INTERRUPT_MULTICORESYNC2       14
+#define INTERRUPT_MULTICORESYNC3       15
+#define INTERRUPT_DMA0                 16
+#define INTERRUPT_DMA1                 17
+#define INTERRUPT_DMA2                 18
+#define INTERRUPT_DMA3                 19
+#define INTERRUPT_DMA4                 20
+#define INTERRUPT_DMA5                 21
+#define INTERRUPT_DMA6                 22
+#define INTERRUPT_DMA7                 23
+#define INTERRUPT_DMA8                 24
+#define INTERRUPT_DMA9                 25
+#define INTERRUPT_DMA10                26
+#define INTERRUPT_DMA11                27
+#define INTERRUPT_DMA12                28
+#define INTERRUPT_AUX                  29
+#define INTERRUPT_ARM                  30
+#define INTERRUPT_VPUDMA               31
+#define INTERRUPT_HOSTPORT             32
+#define INTERRUPT_VIDEOSCALER          33
+#define INTERRUPT_CCP2TX               34
+#define INTERRUPT_SDC                  35
+#define INTERRUPT_DSI0                 36
+#define INTERRUPT_AVE                  37
+#define INTERRUPT_CAM0                 38
+#define INTERRUPT_CAM1                 39
+#define INTERRUPT_HDMI0                40
+#define INTERRUPT_HDMI1                41
+#define INTERRUPT_PIXELVALVE1          42
+#define INTERRUPT_I2CSPISLV            43
+#define INTERRUPT_DSI1                 44
+#define INTERRUPT_PWA0                 45
+#define INTERRUPT_PWA1                 46
+#define INTERRUPT_CPR                  47
+#define INTERRUPT_SMI                  48
+#define INTERRUPT_GPIO0                49
+#define INTERRUPT_GPIO1                50
+#define INTERRUPT_GPIO2                51
+#define INTERRUPT_GPIO3                52
+#define INTERRUPT_I2C                  53
+#define INTERRUPT_SPI                  54
+#define INTERRUPT_I2SPCM               55
+#define INTERRUPT_SDIO                 56
+#define INTERRUPT_UART                 57
+#define INTERRUPT_SLIMBUS              58
+#define INTERRUPT_VEC                  59
+#define INTERRUPT_CPG                  60
+#define INTERRUPT_RNG                  61
+#define INTERRUPT_ARASANSDIO           62
+#define INTERRUPT_AVSPMON              63
+
+/* ARM CPU IRQs use a private number space */
+#define INTERRUPT_ARM_TIMER            0
+#define INTERRUPT_ARM_MAILBOX          1
+#define INTERRUPT_ARM_DOORBELL_0       2
+#define INTERRUPT_ARM_DOORBELL_1       3
+#define INTERRUPT_VPU0_HALTED          4
+#define INTERRUPT_VPU1_HALTED          5
+#define INTERRUPT_ILLEGAL_TYPE0        6
+#define INTERRUPT_ILLEGAL_TYPE1        7
-- 
2.5.3

