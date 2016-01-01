Received: by 10.182.158.201 with SMTP id ww9csp8831976obb;
        Thu, 31 Dec 2015 16:32:07 -0800 (PST)
X-Received: by 10.140.133.144 with SMTP id 138mr101598945qhf.0.1451608327290;
        Thu, 31 Dec 2015 16:32:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c63si83529685qkb.22.2015.12.31.16.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:32:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEndW-0003AR-Pl
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:32:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndR-0002yx-9U
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndP-00066H-9D
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:32:01 -0500
Received: from mail-bl2on0105.outbound.protection.outlook.com
	([65.55.169.105]:34976
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndI-00063m-3K; Thu, 31 Dec 2015 19:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gzMvDfnoGVAKg55bKJigbSnYdopcBeWwF8olLYzCY1U=;
	b=H25acJffObIQd4WVuL3qcUorc6/W78fnmNR+jv3Gh+BNgiKAQoRob1BV1O5T7+Q6B8ef64OF2tzO2naf/xLSrkseCGOvbtMhZuYJ6gEcOEjSBpIZ/QQLBID3uNgWHKUrXsSuZHsxzVrfv+JbL6Ccy97KlnqjrrfyWDo9Y2Ej0tQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:50 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:31 -0800
Message-ID: <1451608294-16432-5-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:MovIeBc5WqDTx1BcEN5XQXyrA5i/4squ14TO5nGwXyaZU+A2NE/VG4l65GHidDGd62A6weFQ/WicM+P1fTtsaIitibeFGI4VAdZ0SDbNqXVQFaPiWCd9U08e27JjlvHOKlr+Dm8lyO089WJ95J4asA==;
	3:3VTuI8WUsy23uDNVDLDGv7f+h4J2Xg5uW2DqDSXtEeYqTKeLLGAPFScaYF+X//vP+HfAghSpLWLSQ1YNBc191iQJ9fvzgQOOsM2llQIX8Fq6Pq+z3M6Hy3xhagG0F94X;
	25:ry4rMAaNkL5fOhZkHUNzO8YyPGAGhZEdciSfwRBvxVVmfqm2fnb1/Bk2b9F9lyL4bEOIkxPinGjIWOlb0qnIH8HSOocUR5Wq9bs442YcdWJMvQXLdOxP4Am0DIBuilS65sXFQBATn1wT/qlxLha3M/9XZzbEuU7eldxMvR7M3WP9fa1KJUbhJFcTa7mO2PiG/6xOk00eXQvpdI4iK5iS/7WMQxSFofgvnwwPYSEQdBYO4J5aENQVer06CdcE8z4yGN3T4gUiKYnsJ5LOwcMTKDyXR4N7yUtd3k5ejuJSX08=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:10aR9durEuR7CwTvzSBQzvAnA+mzoXUq2Qh/dXF/2dJXW1CMveEz2wipzEx//IAAzro57VIDtlf3ddbiFCcIm3GzhXzxE0z2ntufBI8oQlfX/ul39oc3VF8/01/elilk2SNGd1Z3nAM6HNVPqLKLS2U+H0BzrEX/b4x/T19+f98DaYkv1kZysDSPj7hYS59YpgWG4OJN/B61+xdLTarOOOxsGW5sFQIdlMLFfWS3zI10KE+Shed8kK35U6aEtPkGz2eiPOvgP/StGFyUqsBT/cBcHX7QgicFQRxbQx/jaHZ1A+xcFjbxegRV20QQmMnOk/N9cuVkgq/63V70FE+CnY+MxVYLV1f8iPTweOhXgXIX7z8tglPKmPi0Fg8AVIxoy2p4SUd4jr/2klWlua0vxMOAwgTeYIMnKysSfHAaFQ4pOaTQa57ZT3n81bn1ElfzlB+XW63N/oT7GWmobD8s5fm9Mmi9f5aNV1M2r/I89Oi31NgwBnJ9PV74P6EXshOo;
	4:0V7J/TSzL4yeyP2dMbE3IJ7o84mkmwCXeYHhuAtV7C8vDxFU82uqHrKLf4YXo4x2pP+NY/7gALCS1GSt6caioVV6Om7s/Ews20KuHNTQzxVeGIod3V5m4FAvfQ8f9XolKm3s3XR1/N7kWPY/5R8S7Bku4SrgQlBC65WXxMkfGyRx3PJrp/ae4XD35RnZEM+/+CBYdumVWO2rXUzZOn9hykbloIQQKft4GOtTq6c9MMJtGo5nr6Jyv43j7Wz3oTH32aLvaGx0bRwqPW54Ymw4xzKvmExT+frsVsmPrFg82TbFSxqWepZ22iIQx2DwTx00M2C6yqzLZH7tXPLm2mILQ57/HoECBi7bQ7oz52oQLM2pyDbN6Kt/8bYGNyL+9mr+
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2043466E39D7E029F124E3719EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(189002)(199003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(5001960100002)(50226001)(107886002)(76176999)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(2950100001)(19580405001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(2004002)(3826002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:HUqX/KfEbavikanmb+8z8HOBtjgNgHZNSZ6Ixf0?=
	=?us-ascii?Q?1BbLN0iaEC3wPrqVTVz7gU89r54D2our1jFRdn56cRJVqoBCWCntqPz14GXQ?=
	=?us-ascii?Q?+hwtwBbixKkDbERy1qCvCnd31kJL/MkYZupR983Iah16HWUWvwRywfRRaJ2U?=
	=?us-ascii?Q?+DjEZldZd7bDZ/agizRVtCKv8SPzQZMWwWYp+Ext9xsuOV1hqa2ieG8cm6YY?=
	=?us-ascii?Q?9wrg0/pY01Rc0ZUrkBLPUSixKPtiEuT1sWoeWBL4UJC1dqnM/9ACfKz7yb6W?=
	=?us-ascii?Q?TsOtLqCGS5lAX3L38koJZZzeCzXWN4JVpPFwaFkFhmvarGad5cki+yu1V9I9?=
	=?us-ascii?Q?c8qaJhwpNO6itQwmNkA7G6jWhs8wXfTDFppuFcEqgcQSQHoh9+lw+c6cYHaw?=
	=?us-ascii?Q?xHR9Zn/WPRJ7wONEKv9IudUMjlP/qF8MqXiByzEjlMcAspcNo7E9k9APfVCm?=
	=?us-ascii?Q?SBYTT+l+UQSOOtCnZ2/1UQ4aZlc2Io1ZP7VOTMrtv8XvxtEm8iaXruE746J3?=
	=?us-ascii?Q?BlKxFpZi6DgShhfvElVeYSaJIsNGLMYTj/9cJGsmQefPAZQwsSfKKk9BL74R?=
	=?us-ascii?Q?7fSbCe6qjBBBPtzGrAQuWguq5vGbbeJTiGYcwG47b0H7byRD6mW9Qak1uGaA?=
	=?us-ascii?Q?vbJvcmiSseWLkQAMf3TEsIqmV/IZE/uDtKeekTZVk7A4cfmb8qHJZS9iV9ZU?=
	=?us-ascii?Q?F/yWB4W1SnbIMCxZjtIDtfudB9gHoCpsFGL5eiYgNun3WOt1XQijKU0OxOCC?=
	=?us-ascii?Q?B8NlILcEe5wxPqW/wSu/M+iImgO2wlVL55xwwprOA4+Ott4vtMhjvMh6YIWC?=
	=?us-ascii?Q?lNVNnvb3uJe9kNGFh13gNJvk/BG/F0Fd/rK2Xy/Iqf7CDtyDB9DA0dOxbWD4?=
	=?us-ascii?Q?rtdYzH4OznY53Yhvt5AGVXFWrqESQzAjgN9SWzO0haFZooQ2lw781/w452XP?=
	=?us-ascii?Q?hFCvdTclFkKqBp/y/Z947+RLt3Cor9v+k+Jyrv4TSbL2sx3ZJnDHDmxGLCoo?=
	=?us-ascii?Q?1PNxz/8FqcAg4XJP8E5R8oSFLndwpomwx0uYDdoti0wJEwTm/wYIcjqJS4tR?=
	=?us-ascii?Q?Le123WZ4VvcETFCmxlFMiDBy9vK0uZHGgu7WQM458ma3W+2gxZRMObLkge+Z?=
	=?us-ascii?Q?X3VY6y3PP89HyXf1REAmiByGPcbO1qCANsSWKhi+9pVmKBFhDAx9l7OnM1hA?=
	=?us-ascii?Q?NDUICTRXlp8N2GxiNJnyR51x2zH4cSO5z04PeZsNBwNkDEbnNaNZPDuTo5f0?=
	=?us-ascii?Q?RmB4wNBLDGGgILO+d00dTWEQkJiFGa+dsKqjzp5cGVPX6O9vEWjUk+eq8bf2?=
	=?us-ascii?Q?OJA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:DB3s60LcyWur9n+SUyz4StANrqAhfR8pYMmfQs6hrNYfUS38+YAs2276m6zmP+NftJifXzgD4A1Hn6t5EltVuk2kBLNYj05N5iaywMT+bMUIhJkg6oSIW2cR74lSKYOe62sJdAq2yShKNMLZ9Hrkqg==;
	24:O0JnRTSGCRAppT+8dnFtmr0hV0Fb7S4oWaU+pHZUq0cBln8SSobK8H9vbTEGQZEC5kPC2OTlCUuw2J8xSYdyoeLfRLX61+p2px0jUF8mQW0=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:50.1227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.105
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v3 4/7] bcm2835_peripherals: add rollup device
	for bcm2835 peripherals
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
X-TUID: fsCFUIdlKntO

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
    
    v2 changes:
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

