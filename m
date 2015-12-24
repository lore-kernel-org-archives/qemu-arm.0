Received: by 10.182.158.201 with SMTP id ww9csp4395745obb;
        Wed, 23 Dec 2015 16:28:24 -0800 (PST)
X-Received: by 10.141.7.69 with SMTP id j66mr47972466qhd.2.1450916904163;
        Wed, 23 Dec 2015 16:28:24 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o93si42429827qkh.88.2015.12.23.16.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:28:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtlX-0004Te-QP
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:28:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjD-0000Ef-4Z
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:26:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtj9-0004tv-0u
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:25:59 -0500
Received: from mail-by2on0124.outbound.protection.outlook.com
	([207.46.100.124]:40306
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtj8-0004tn-IK; Wed, 23 Dec 2015 19:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TP7l96Rrzdwp2wxhZc8HDGAWDkIxVn0Otq+Bc3J6VU4=;
	b=Sc/Eju2TjWdFk7KFMkhBDSaxWdAnf4NQrs4TaPYDJpLNxbFTeHvtPpfZibYLTtNMBn5T7sYKl+pYyGvchp0WHwpsML6X5zI2NZ9VCLjvPCaChtwRtOnZS8ernk794z1FTbzdzUU5Asnzoeln3K1XStA05BVoSFhibKRb9JqpkUM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:50 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:28 -0800
Message-ID: <1450916731-5968-5-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:07i3fJVLR6Bk1oouVnA+Mfk0YNdIE/3PZxQBGGPoNyuzhI1mYHP0en1Wx+srK4mZaFNa+1OHg57ShyBQ8ZA4UBsuGNS5Uj85FHf0ePE0JyjpB966R7iKGVoMFfIkmSzaYh6AW9Y3NzS0JPIoocltiA==;
	3:NzQ/FoYFVp/PFYA01xxwoHX80Z1ZUtbqoOgb70Kamz1FHYTdWqJyToL8G2jt56sC7Uqn4XQqlezRfFOyvKlCFQk439mcgoUbQ3wrC8phW3fAb/5NeTp76dYh9Iws5b10;
	25:ARPwSHVybdzkg0+UdFDqXEyBTEqKQPUY5VgreUcJr554E77XnEfDZmLK8qskpRbX8qcTIYSu3cP52FTuK/29XpRtXDiUZh8Unn+L6Uhzyc/CQR8OgGvkRjRtVY6GmPV4YvjwmeAgio6NPz/xwXQl1zybCh1ZyjdH9gEBp5LUr6MTXQNL0WrBiKy3eTVItfCtLayz9OIDzsmt7uPsOlvAYRQ6fi9Mm3/HlgB+EwpqBsD0e1tn/UbgeBYOPMZBEeHX5F0OfMr3ympAGzP48GenFP+Tzhm4bCCiHoGjxVfhT9U=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:HCOeMTxyy3Q6Qn6YiooFJBeaxliTJFgTBtIKZE2NXVGwVYNOOyEwUZK4HkyxxJ8EI91UOZOFg25AztfcbgX2kj5JZDNvz1qB9nQUN+u/N41EcFUMxFEWn1XBjYYbrRoJIOqiGYDqSaJ8vSs72zVl/P183XDBceytUXUmTxJ+H3MWocT5MIIq0RWmZBw9VUfJWSa/q1fHCJh8YzGTOJngB+2XZFPeHLFMfKpxrRqKAtJC+DWFxzlEpshD1kYkb2wWlNTxlYXg5goJOzCYoKZZzRecek3DDS+QdWpwVYt9sf2cLStDlJBJpUoG55C5u1kCfUItpHUhf5Iw2TsSv1Xe4zD5ro2ZJexTcF5FN/wJE35mEvFckMRX377RaLecZe0b6uRIn2bAc+Lc8P8Z6diazQSq9QxLiJ0tVmjiuLLrd1G73M83haQSLkoYDOBsaVAXM88DN8yL37qfSFe/MdMlYsE8tJ2pLNESitg7EREJvBHXggzMA6pG1D5zzndoWsIG;
	4:De5KywmN+eUzyTrBoAbjvt4G4S29dw3zCcDSKJu7zRCo8FbICVVbDi13GzYYTlF+68RSlAwmqgX7U/ZvJEGPtglYto2NG5HYx2sVquCTgcE+g9OdKTHXwp3ApAoaJnk86SaJ2YIU3e1MeXRkshrd3y6Go4Ugq476R/RGk496aV4PiHOAlTQYMHTkDv8i4B78fzj2/sWkcw60FbYT38LXxxpI8dwJ/cg5Ea/NhLgwQn0ZLzaCrgwctsBf0P37PhG7KFFnCRAt5IaqYIBOQpZ/i1DmRbLnpNOACYFbhRJ2MKQNSdoDLeRzdTC5kc+hsAktw72Oh8N8ScmqTwkZOZvKHMYMVke7Y77CiK+vYZJMtgXmcfUFAOYHThU/e1H+M2UL
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033581E5BB8765FA49F00899EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(19580405001)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(2950100001)(76176999)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(21314002)(2004002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:B1xFFfhG2ONYbdPuBhAKh8tWR4RU2Iz2dalFJsb?=
	=?us-ascii?Q?n+OB5WA9ULKgbu9ni64g1+q1VRozXaXNFgYoYiHR4r+k3o9vTsM3xNM5O+dp?=
	=?us-ascii?Q?+PKs6DjP59ygNR3SHNdLSeCIYLHFb8WaANH+UmcvagTFSU6oto/WDs4CIdDk?=
	=?us-ascii?Q?ymvaBubgcB9fev7JyYbqqJyh1XlUIPcx3MNWT37zG6IFvf0PmaoJLrbIJ48p?=
	=?us-ascii?Q?Cu3rNlEoexKWIezoifLMCDB7OIPC2K9/e6V6en1pXasRK136jzhwvUR/Cadu?=
	=?us-ascii?Q?4WV6hVh3J8HLE+xp0fYizXtZJ5oQ5n08yqQXzI4JFM6y4v7+kKpIXK0cBdmc?=
	=?us-ascii?Q?VTHLInFbxccSmq/A2j8M2Y9JBS2aILB9/1REvdD1JFeYJC4KS08T7f181sSw?=
	=?us-ascii?Q?jomFDCApW3jb83N6x06aLb5umTFL2qZMhVQH65lSAHBt6meuqDTA2lKJGiRJ?=
	=?us-ascii?Q?04nWhpjOHaoemIpRypc5/1deCvi/zRwLX3bw6YrNpBHxHimaHAP/Ox8+oTvf?=
	=?us-ascii?Q?Mt5/AzndALpwa1h0RCPo5bVQ+gtUFFPzsEdjx2M4c1eKHrXJ7Ua8qduFelhS?=
	=?us-ascii?Q?B6rBN/UCiXYGW4RwSLzfHchzV/FNs+t2b3tY82K3O27chLM/t4ocDONf6IW6?=
	=?us-ascii?Q?ftflT8CxlK7yuK2l21S0NBuIFElNoAQHMC9OpBzsyOyzRDbaPg91GoVpnmef?=
	=?us-ascii?Q?5XC9gSPcfypTmGGKFW/6tvtm35D2islnkvlOXnxkv9lXfcvJZ/ekO3eeTESE?=
	=?us-ascii?Q?Z05rPq7jmEEm10oYsGcXsduouARRbqn44THO6+bfbbz2bEy8QRgCbvptD3e8?=
	=?us-ascii?Q?NrxMA0jS1/ulfJaXsk28RambCdTlZxudWASd+Zb5boQ5rdOKLAmmJ+F4k7VN?=
	=?us-ascii?Q?Nwaf4d4avgwwY7aFW4GcGm4IGCLahgro4WA5C0m5sZ6/b1OKIUvBObGd6Hrc?=
	=?us-ascii?Q?+3SsP5N6zBk+Bpd5iO9tZ8JDZvu4es4GxkSTw+e3YGmRatsmcH51DsSCpU29?=
	=?us-ascii?Q?0iseTQMTPKjrSBFwIJw+7kqM7Xt/R0pDrqwKmtPi3+yHGfYuCPkoIZjK+aS5?=
	=?us-ascii?Q?6LAweX0yUyfYGyZybAjBfcoriJEKKrUypPBxtlrnnAA2rJMJuiwOoU78rIwK?=
	=?us-ascii?Q?QENS8qo++aHOIRsHGYT9ynPqsNpDkxq3XAAC+YBinvtMs2KxI2KvFkqbuMNj?=
	=?us-ascii?Q?1x6ZVH4f9Yxo6t6cGRcJNMB0VO2xHcBNBbIU4?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:5Dt+hXvfCyxPcyn5bF7GbBG2MCU3oKtPSZWNH+aeofobYCnM+qyEEOJ7PAw0J5xsOhaHzfEtCD7/Dor1/RQ3ODSZrrI6v8GSPaiwFwSfhkrnSZPT9Ui/XnNmb5KnsJq38//0p+KCAS0d/vkRN/J9zQ==;
	24:Ze7WpDQy0LOtnmYB/LR17LbOLZ/Ejb6RZ4gEwKjklC+1L72+JXh/s7bHD74/VlK9bT30pARRierDclSQSAndggj8lEFZyLwVoah+3tleS4w=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:50.7431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.124
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 4/7] bcm2835_peripherals: add rollup device
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
X-TUID: 7KmZnPRF8DG5

This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
which are also present on bcm2836 (Pi2). It also implements the
private address space used for DMA.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v2 changes:
     * adapted to use common SDHCI emulation

 hw/arm/Makefile.objs                 |   1 +
 hw/arm/bcm2835_peripherals.c         | 198 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |  42 ++++++++
 include/hw/arm/raspi_platform.h      | 161 ++++++++++++++++++++++++++++
 4 files changed, 402 insertions(+)
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
index 0000000..deb6336
--- /dev/null
+++ b/hw/arm/bcm2835_peripherals.c
@@ -0,0 +1,198 @@
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
+/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
+#define BCM2835_SDHC_CAPAREG 0x52034b4
+
+static void bcm2835_peripherals_init(Object *obj)
+{
+    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
+
+    /* Memory region for peripheral devices, which we export to our parent */
+    memory_region_init_io(&s->peri_mr, OBJECT(s), NULL, s,
+                          "bcm2835_peripherals", 0x1000000);
+    object_property_add_child(obj, "peripheral_io", OBJECT(&s->peri_mr), NULL);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
+
+    /* Internal memory region for peripheral bus addresses (not exported) */
+    memory_region_init_io(&s->gpu_bus_mr, OBJECT(s), NULL, s, "bcm2835_gpu_bus",
+                          (uint64_t)1 << 32);
+    object_property_add_child(obj, "gpu_bus", OBJECT(&s->gpu_bus_mr), NULL);
+
+    /* Internal memory region for communication of mailbox channel data */
+    memory_region_init_io(&s->mbox_mr, OBJECT(s), NULL, s, "bcm2835_mbox",
+                          MBOX_CHAN_COUNT << 4);
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
+    object_property_add_const_link(OBJECT(&s->mboxes), "mbox_mr",
+                                   OBJECT(&s->mbox_mr), &error_abort);
+
+    /* Property channel */
+    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
+    object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
+    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->property), "dma_mr",
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
+    MemoryRegion *ram;
+    Error *err = NULL;
+    uint32_t ram_size;
+    int n;
+
+    /* Map peripherals and RAM into the GPU address space. */
+    memory_region_init_alias(&s->peri_mr_alias, OBJECT(s),
+                             "bcm2835_peripherals", &s->peri_mr, 0,
+                             memory_region_size(&s->peri_mr));
+
+    memory_region_add_subregion_overlap(&s->gpu_bus_mr, BCM2835_VC_PERI_BASE,
+                                        &s->peri_mr_alias, 1);
+
+    /* XXX: assume that RAM is contiguous and mapped at system address zero */
+    ram = memory_region_find(get_system_memory(), 0, 1).mr;
+    assert(ram != NULL && memory_region_size(ram) >= 128 * 1024 * 1024);
+    ram_size = memory_region_size(ram);
+
+    /* RAM is aliased four times (different cache configurations) on the GPU */
+    for (n = 0; n < 4; n++) {
+        memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
+                                 "bcm2835_gpu_ram_alias[*]", ram, 0, ram_size);
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
+                               INTERRUPT_VC_UART));
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
+                               INTERRUPT_ARM_MAILBOX - ARM_IRQ0_BASE));
+
+    /* Mailbox-addressable peripherals use the private mbox_mr address space
+     * and pseudo-irqs to dispatch requests and responses. */
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
+                               INTERRUPT_VC_ARASANSDIO));
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
index 0000000..b3ba574
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
+#define TYPE_BCM2835_PERIPHERALS "bcm2835_peripherals"
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
index 0000000..8386949
--- /dev/null
+++ b/include/hw/arm/raspi_platform.h
@@ -0,0 +1,161 @@
+/*
+ * bcm2708 aka bcm2835/2836 aka Raspberry Pi/Pi2 SoC platform defines
+ *
+ * These definitions are derived from those in Linux at
+ * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
+ * where they carry the following notice:
+ */
+
+/*
+ * arch/arm/mach-bcm2708/include/mach/platform.h
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
+/* Peripheral base address on the VC (GPU) system bus */
+#define BCM2835_VC_PERI_BASE 0x7e000000
+
+/* Peripheral base addresses seen by the CPU: Pi1 and Pi2 differ */
+#define BCM2835_PERI_BASE       0x20000000
+#define BCM2836_PERI_BASE       0x3F000000
+
+/* "QA7" (Pi2) interrupt controller and mailboxes etc. */
+#define BCM2836_CONTROL_BASE    0x40000000
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
+#define PCM_CLOCK_OFFSET        0x101098 /* PCM Clock */
+#define RNG_OFFSET              0x104000 /* Hardware RNG */
+#define GPIO_OFFSET             0x200000 /* GPIO */
+#define UART0_OFFSET            0x201000 /* Uart 0 */
+#define MMCI0_OFFSET            0x202000 /* MMC interface */
+#define I2S_OFFSET              0x203000 /* I2S */
+#define SPI0_OFFSET             0x204000 /* SPI0 */
+#define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define UART1_OFFSET            0x215000 /* Uart 1 */
+#define EMMC_OFFSET             0x300000 /* eMMC interface */
+#define SMI_OFFSET              0x600000 /* SMI */
+#define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
+#define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
+#define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
+
+/*
+ * Interrupt assignments
+ */
+
+#define ARM_IRQ1_BASE                  0
+#define INTERRUPT_TIMER0               (ARM_IRQ1_BASE + 0)
+#define INTERRUPT_TIMER1               (ARM_IRQ1_BASE + 1)
+#define INTERRUPT_TIMER2               (ARM_IRQ1_BASE + 2)
+#define INTERRUPT_TIMER3               (ARM_IRQ1_BASE + 3)
+#define INTERRUPT_CODEC0               (ARM_IRQ1_BASE + 4)
+#define INTERRUPT_CODEC1               (ARM_IRQ1_BASE + 5)
+#define INTERRUPT_CODEC2               (ARM_IRQ1_BASE + 6)
+#define INTERRUPT_VC_JPEG              (ARM_IRQ1_BASE + 7)
+#define INTERRUPT_ISP                  (ARM_IRQ1_BASE + 8)
+#define INTERRUPT_VC_USB               (ARM_IRQ1_BASE + 9)
+#define INTERRUPT_VC_3D                (ARM_IRQ1_BASE + 10)
+#define INTERRUPT_TRANSPOSER           (ARM_IRQ1_BASE + 11)
+#define INTERRUPT_MULTICORESYNC0       (ARM_IRQ1_BASE + 12)
+#define INTERRUPT_MULTICORESYNC1       (ARM_IRQ1_BASE + 13)
+#define INTERRUPT_MULTICORESYNC2       (ARM_IRQ1_BASE + 14)
+#define INTERRUPT_MULTICORESYNC3       (ARM_IRQ1_BASE + 15)
+#define INTERRUPT_DMA0                 (ARM_IRQ1_BASE + 16)
+#define INTERRUPT_DMA1                 (ARM_IRQ1_BASE + 17)
+#define INTERRUPT_VC_DMA2              (ARM_IRQ1_BASE + 18)
+#define INTERRUPT_VC_DMA3              (ARM_IRQ1_BASE + 19)
+#define INTERRUPT_DMA4                 (ARM_IRQ1_BASE + 20)
+#define INTERRUPT_DMA5                 (ARM_IRQ1_BASE + 21)
+#define INTERRUPT_DMA6                 (ARM_IRQ1_BASE + 22)
+#define INTERRUPT_DMA7                 (ARM_IRQ1_BASE + 23)
+#define INTERRUPT_DMA8                 (ARM_IRQ1_BASE + 24)
+#define INTERRUPT_DMA9                 (ARM_IRQ1_BASE + 25)
+#define INTERRUPT_DMA10                (ARM_IRQ1_BASE + 26)
+#define INTERRUPT_DMA11                (ARM_IRQ1_BASE + 27)
+#define INTERRUPT_DMA12                (ARM_IRQ1_BASE + 28)
+#define INTERRUPT_AUX                  (ARM_IRQ1_BASE + 29)
+#define INTERRUPT_ARM                  (ARM_IRQ1_BASE + 30)
+#define INTERRUPT_VPUDMA               (ARM_IRQ1_BASE + 31)
+
+#define ARM_IRQ2_BASE                  32
+#define INTERRUPT_HOSTPORT             (ARM_IRQ2_BASE + 0)
+#define INTERRUPT_VIDEOSCALER          (ARM_IRQ2_BASE + 1)
+#define INTERRUPT_CCP2TX               (ARM_IRQ2_BASE + 2)
+#define INTERRUPT_SDC                  (ARM_IRQ2_BASE + 3)
+#define INTERRUPT_DSI0                 (ARM_IRQ2_BASE + 4)
+#define INTERRUPT_AVE                  (ARM_IRQ2_BASE + 5)
+#define INTERRUPT_CAM0                 (ARM_IRQ2_BASE + 6)
+#define INTERRUPT_CAM1                 (ARM_IRQ2_BASE + 7)
+#define INTERRUPT_HDMI0                (ARM_IRQ2_BASE + 8)
+#define INTERRUPT_HDMI1                (ARM_IRQ2_BASE + 9)
+#define INTERRUPT_PIXELVALVE1          (ARM_IRQ2_BASE + 10)
+#define INTERRUPT_I2CSPISLV            (ARM_IRQ2_BASE + 11)
+#define INTERRUPT_DSI1                 (ARM_IRQ2_BASE + 12)
+#define INTERRUPT_PWA0                 (ARM_IRQ2_BASE + 13)
+#define INTERRUPT_PWA1                 (ARM_IRQ2_BASE + 14)
+#define INTERRUPT_CPR                  (ARM_IRQ2_BASE + 15)
+#define INTERRUPT_SMI                  (ARM_IRQ2_BASE + 16)
+#define INTERRUPT_GPIO0                (ARM_IRQ2_BASE + 17)
+#define INTERRUPT_GPIO1                (ARM_IRQ2_BASE + 18)
+#define INTERRUPT_GPIO2                (ARM_IRQ2_BASE + 19)
+#define INTERRUPT_GPIO3                (ARM_IRQ2_BASE + 20)
+#define INTERRUPT_VC_I2C               (ARM_IRQ2_BASE + 21)
+#define INTERRUPT_VC_SPI               (ARM_IRQ2_BASE + 22)
+#define INTERRUPT_VC_I2SPCM            (ARM_IRQ2_BASE + 23)
+#define INTERRUPT_VC_SDIO              (ARM_IRQ2_BASE + 24)
+#define INTERRUPT_VC_UART              (ARM_IRQ2_BASE + 25)
+#define INTERRUPT_SLIMBUS              (ARM_IRQ2_BASE + 26)
+#define INTERRUPT_VEC                  (ARM_IRQ2_BASE + 27)
+#define INTERRUPT_CPG                  (ARM_IRQ2_BASE + 28)
+#define INTERRUPT_RNG                  (ARM_IRQ2_BASE + 29)
+#define INTERRUPT_VC_ARASANSDIO        (ARM_IRQ2_BASE + 30)
+#define INTERRUPT_AVSPMON              (ARM_IRQ2_BASE + 31)
+
+#define ARM_IRQ0_BASE                  64
+#define INTERRUPT_ARM_TIMER            (ARM_IRQ0_BASE + 0)
+#define INTERRUPT_ARM_MAILBOX          (ARM_IRQ0_BASE + 1)
+#define INTERRUPT_ARM_DOORBELL_0       (ARM_IRQ0_BASE + 2)
+#define INTERRUPT_ARM_DOORBELL_1       (ARM_IRQ0_BASE + 3)
+#define INTERRUPT_VPU0_HALTED          (ARM_IRQ0_BASE + 4)
+#define INTERRUPT_VPU1_HALTED          (ARM_IRQ0_BASE + 5)
+#define INTERRUPT_ILLEGAL_TYPE0        (ARM_IRQ0_BASE + 6)
+#define INTERRUPT_ILLEGAL_TYPE1        (ARM_IRQ0_BASE + 7)
+#define INTERRUPT_PENDING1             (ARM_IRQ0_BASE + 8)
+#define INTERRUPT_PENDING2             (ARM_IRQ0_BASE + 9)
+#define INTERRUPT_JPEG                 (ARM_IRQ0_BASE + 10)
+#define INTERRUPT_USB                  (ARM_IRQ0_BASE + 11)
+#define INTERRUPT_3D                   (ARM_IRQ0_BASE + 12)
+#define INTERRUPT_DMA2                 (ARM_IRQ0_BASE + 13)
+#define INTERRUPT_DMA3                 (ARM_IRQ0_BASE + 14)
+#define INTERRUPT_I2C                  (ARM_IRQ0_BASE + 15)
+#define INTERRUPT_SPI                  (ARM_IRQ0_BASE + 16)
+#define INTERRUPT_I2SPCM               (ARM_IRQ0_BASE + 17)
+#define INTERRUPT_SDIO                 (ARM_IRQ0_BASE + 18)
+#define INTERRUPT_UART                 (ARM_IRQ0_BASE + 19)
+#define INTERRUPT_ARASANSDIO           (ARM_IRQ0_BASE + 20)
-- 
2.5.3

