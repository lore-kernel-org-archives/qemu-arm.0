Received: by 10.25.159.19 with SMTP id i19csp1203428lfe;
        Fri, 29 Jan 2016 14:53:25 -0800 (PST)
X-Received: by 10.55.21.28 with SMTP id f28mr14075259qkh.57.1454108005705;
        Fri, 29 Jan 2016 14:53:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si19247900qhx.101.2016.01.29.14.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHuv-0004LD-8Y
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:53:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsm-0000U4-B8
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsi-0003Qg-VJ
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:12 -0500
Received: from mail-by2on0102.outbound.protection.outlook.com
	([207.46.100.102]:41329
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHsi-0003Pv-FG; Fri, 29 Jan 2016 17:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cdYqKn29Qv1sJ0T+aIpsL0AzBLJmVm3jD4BLXUURoRw=;
	b=SX9U80yMo9tzDfmSsGePeyY7MgEbKg+pVzBFV4+NwtfN5EUe1Pt78Ihd1AxzR+v2GZO4YrEMzHKWMV0bsiK/aXfkYMAmGydjSfqIZ7a/yT9+UH0DSAUsabgGCK8Ku83s8VPJsP3LE4kKY6ILT+1Czu+pwDqvDzCGW7m6e+Bw3+w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:51:05 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:40 -0800
Message-ID: <1454107844-15704-5-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: 8f4978b8-cedc-4343-4b5f-08d328feabcc
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:93I62ykOkj83zPIXTXqj6VOsqVEbXvhDZjgY21/HBQmtKhblzRwGXpa1oys7hJ0XG76XVU3CFVPjDQx1okffLE0PkP5dm0swzcLX2GKMr8cvSCEQcM032qVKaJlxARWk+r8MwqqMDliOsTWZSx53haUQFfbrkWJKdqPFdTF32ts87TxdGVOp/1GsUX+PxMC4;
	3:ep4CkSROFm4pGB4Z5pDsZppMnv9eacMrAbZVmP80ZtikN6kiFAguf5jjheFjMkJwqTz8rFY+2M7pLRkIJVXy380NX0q5tSeZmtKWM9YIvzpijEsaWaeKN54l4dzEaJgV;
	25:u9g5W+1U3BOPYDHMv4stIl3alngFh++1TPPkWtVrs7Gb2PLEQxwdFtQnd9mYTxJy6hj+A0aanftkEZBsZUUGfcv5q4qvJUr6AZqU/IuefC5vLG+ntovyPE0EKEtN0XF1Qm46AuM7llChyyGizm17BvNQSq/CiVlyGQKiPP/ManiOe1l/5R7aKH7ROgbSJSZ6BXxWoMHwWBHGsOLSKCZ+xTO4RfLXLoIKIVd0pCXWCu4tOY0y6BbCuICLlM7fFVBsPo0IP4O8+UgEVuKLEP1IDN/nIy3aYOUj/dnxiLPEilQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:kYT0q1jlYRr9NkYY9CqAOFkzYV8EeodMA00mVlxcRuB5OL5YLJ1NZtuspDzedWLbcKELZEPFPI3lHRbOrmn2TLVqHqNSxogE/fVeZ0Oe/dUWii6PEF64yO7IE86He996EOe/SCAiarw7atzju/kuTpI4LqU/9HDzAHwzQc5c0puyNt7flXCP5c+2aJqJNFUunU5cpvM3sCkhWNlJmYuHDZHlhWq0IEhwPgSZ01jor7uh9mCf2o+/Zty8AopZrji3a4Ml0Rvf9j8XBjURuPWX98aUylVfd95WZ+6urEtoCVLBoMVl+ULpwx0pvWUd/BUt68YrQEmoCkhtuv2VqG0wQhW3kDWxy0ZcJeADCd1P8kO3roqwdic1vP19cVWSAWejQshmQzWmkSbJgJ62mOZvjgpnz0SIB8rqlfucKM2fDyBM3ptO7o08DrCQI8p61K+gqIF0fiolS5ozEzhMenvp6VhgCbXQqrIzF/JUidB4pSD3MngkA29e6c/RERpoatfD;
	4:BFvUbG0mR4pLJF+MiY1L4m9Q5v80iYKKMDvVijSSfeJZfv6srBSp3qp0yfqae8s+KbZNlSDmUsGP9YA6RzGwlbiOz7rr6Vl+LCe1RptdIT9oHf8OM5N7tFWrDEfklWFtrgrln08D6LEuh6TOowHfwm1bdsy+L3jJw4Hp3qZ1We4otxmoNGxM+3Q1Mw/5hJ9tXdPDL6F1DqefzxUDSpZDtsQGiTxtm77bW6HYcjZkfmiUlINCLEsqrxAVYWcs9ADW9ZWoZe7y0vxGn/5bsUsI2U58y5BMdoeoRvSw7c+D/21pguqIXTZG3o+3g3uCeqUSC2ViYYhbK7jIIePqOF4nOaOwHOVZwve6+3kJsrX1QHljk90wi33Tyl2dfl2ncci9
X-Microsoft-Antispam-PRVS: <BLUPR0301MB20344BB369F1CF06C48A1B689EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
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
	23:UFAfc/C8VZsAQLiKysfFBuFCreDthlo0QoYXbJn?=
	=?us-ascii?Q?UlL4GUoLEZaIrP+5fDnIHmd8Uexwny+8OxZFX4wwpAFUW6K806elknpsWfnK?=
	=?us-ascii?Q?8TTgyZKR2M+F2VwtROFCun6TodJO5g71uLl8ZZtHMCSiksHm4ykFHUA4fYlX?=
	=?us-ascii?Q?GFRpXr9j3aTDm765/+IEh7/aZj+daAkSHzc6gE7oAj6l/6veOHaGQFGhTtEN?=
	=?us-ascii?Q?J9ohZNfF9u7yfxoqsokq88kYz5rWv2S4sKkr8K04oMkuEACXXoZq2LKyofLD?=
	=?us-ascii?Q?5y6GaY5x+tCMRxpFUt3ORa9mfFULSHnYAEtYDf2oVZ1yGplHjoT0RWX6Iy0V?=
	=?us-ascii?Q?qNx+0SWw7llkpv7y4GydAUbZWQpkV+GWyVcHRXzkIHEM5Fcxk9Di0kBLURlZ?=
	=?us-ascii?Q?g+1HT8K58Y2OTHoVo+YoTPv2nENibE31eQT9NSbXqzxjCZTwMw7X9e/swv0c?=
	=?us-ascii?Q?05Ki0bTPL3DBdFqypbdqW6mheFX1LsvAOuT9S+ONeZC7VpY+6BvQKWipUgJt?=
	=?us-ascii?Q?oVY3YT32I5OqmX9R9nDFBNmeCWvs1UwoO+O8HWB9WLnVdiu+GVnmY9zb94wG?=
	=?us-ascii?Q?/Xju7ZMBcHm3IlXVRMporAkqN+K9LOwm5wFBXWLr22IMGsdL9YkzVDr3JVRU?=
	=?us-ascii?Q?BJOyW56Hlye5A2DqwZ3wFzv5sC2g+Hs/L+B2XKHJlMox1g/ls3gaIjX/xxiD?=
	=?us-ascii?Q?oGurXSc9QDuneKbB3/6LcJ2zAyYfP71YSWuxdqHQwxhogjMkzblJvKhf0WD6?=
	=?us-ascii?Q?I9Zl4esJJzuR/weINJeGqRppR8VaXpFP7PDBCtqZvUTuvUvX8mtnr72Gqolg?=
	=?us-ascii?Q?RIhUGag1ObMpvSnmGD87QtBZNxVXblR0QAZiQqt1zTkH8xShXOwi++HjXKZj?=
	=?us-ascii?Q?/q+WNMcMR7MkcsErxdPrKEX5/XtDn9aXSe6I5aL9RG5wwEa7X/X/HB8Fwn3H?=
	=?us-ascii?Q?lhLcam+DZO/GwUtbJ3HfbU0Ftd2edJ93ZsKyeLH2ToB1a1iPyFlsifWV9hPb?=
	=?us-ascii?Q?rQkJE7sapIuCDYJAgyjfFAyDRz3F4q5Qy/zdRZ6Igf5GCNP4VIy+Z087XJHH?=
	=?us-ascii?Q?/YNja8/O+cOz1OK9OvcvaSS1hD3Y6?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:j2t3ZHTPsYAR1fsy4vEbi69MuZkS4c1hcf7RWQ07Ba+U56klyHPooYRoV7UjZ+GnpdaDvduiwPbQY0ZWAM3VAXiQQeNaD+591QFisfgC6WGSkf5zTWa+1j9K4ni7B4t5sow642xte2uEBeX1fYVvmA==;
	24:1NhdIAwFaIpDE8ay1vh0+dnuG04bhPM+wNgRlPbNqLdcNVkcqNF8EXV68+yCC1nj6rtQEoac1y4mPm5AZFlGtvA9XOWZ7VM1LIliC/ekZVU=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:51:05.0030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.102
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v5 4/8] bcm2835_peripherals: add rollup device
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
X-TUID: 3lHbjzEyXDhX

This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
which are also present on bcm2836 (Pi2). It also implements the
private address spaces used for DMA and mailboxes.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v5:
     * s/memory_region_init_io/memory_region_init/
    
    v3:
     * clean up raspi_platform.h
     * s/_/-/ in type/property/child names
     * use memory_region_init where appropriate rather than memory_region_init_io
     * pass ram as link property
    
    v2:
     * adapted to use common SDHCI emulation

 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 204 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |  42 ++++++++
 include/hw/arm/raspi_platform.h      | 128 ++++++++++++++++++++++
 4 files changed, 375 insertions(+)
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
index 0000000..18b72ec
--- /dev/null
+++ b/hw/arm/bcm2835_peripherals.c
@@ -0,0 +1,204 @@
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
+    memory_region_init(&s->peri_mr, obj,"bcm2835-peripherals", 0x1000000);
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

