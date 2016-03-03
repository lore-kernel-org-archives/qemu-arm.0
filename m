Received: by 10.25.208.211 with SMTP id h202csp13903lfg;
        Thu, 3 Mar 2016 10:27:56 -0800 (PST)
X-Received: by 10.55.80.68 with SMTP id e65mr5006393qkb.46.1457029675931;
        Thu, 03 Mar 2016 10:27:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u108si9493124qge.50.2016.03.03.10.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:27:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abXyd-00008l-CE
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:27:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvp-0003sR-7v
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:25:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvk-0007Zg-Nb
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:25:01 -0500
Received: from mail-by2on0105.outbound.protection.outlook.com
	([207.46.100.105]:50240
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1abXvk-0007ZS-C9; Thu, 03 Mar 2016 13:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bDYlwa2WTKlSR95sSY3vwXbX7r2L4EkVzRvOW2qhZU4=;
	b=BM/xLxPQOiDFIDnxjLxKx3CFQ0soeX5ikoL9ckxVqZj7f2MSfiqOEPG4GLPm36uE8e/hbqdxey5bWVbhHOmc3Bkt3zAbhgdifNnMUbRK5hdfk+I0+mK8aIiiKlVmcTDIBX8Au47LndExJ158XhNY9pY3UYQ5WJwO63JICLAFkmE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by CY1PR0301MB2042.namprd03.prod.outlook.com (10.164.2.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Thu, 3 Mar 2016 18:24:53 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 10:24:39 -0800
Message-ID: <1457029479-11312-6-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: CO2PR20CA0017.namprd20.prod.outlook.com (25.163.96.27) To
	CY1PR0301MB2042.namprd03.prod.outlook.com (25.164.2.24)
X-MS-Office365-Filtering-Correlation-Id: b48c7c62-4218-4953-b8f1-08d343911da0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	2:X+lmP8rOXMK2skqCQPlEc35YElOY/K2aIcjvWbDuLzRTv6X3NJxqVfLMQwHu2+8QeUzJYdpXFxouYBqcn+QJJfWEczs5FuvNIL6YWCz77hOXb+GY0RTK3Yjgxkh13mIb6FvwDxh0W8rRnlO50QpoLiYlLT4pXvmzhGMfcDJ3qXlB5848fkBD8MlJRQd/AI77;
	3:cEFmf2MjE/DUCxfdBxsFeb+bakK3MgbseqJfMsfl33IDxREvGwKQVQ8ndzJvZlI9cDfn9HEfWYl0lY2XamNKAwathZEJUl3uKhuzniBrCaEzjoxVhheeNxTHmhigWj8U;
	25:qjj9CEWoHpuuVrzPV3KNGDL6f3JS167f+uYhI1U6+2p+Qf3xR/qF4PXu6r0Jli+43YQhL8x9lUFdFjBLhsSEbHE72Ajd+DAErI4OS7y5LXmslqwnrfsOuuNLxZ8GWBtcDd2++Dg1c72bbBdHCDdoi5gEhBaalw43dbZ/b3H2EW8q/FVfPNYECBO6KzpI7+0dJUU7a5gACDRsBE8Uj8yJV8fKq0mlSRiFQNu7gU9nx2UKY4V1GGyVQCdSe9fiMOqeFGvrNOdlyDnvCmh1yYymE36Q635raKhsZJQpGhgeGLpoijDu9ougzeJIALOl2EZnimpf+8CZnuNatoOzVXsSxQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2042;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	20:MubgArtFURNxVaZGqf3IyHri86liaj+5MGsP3AyKuPKr87IMMWaH8Bu/52Mb67qzQWyHizhhGrucpZRPxIG0ATVtpHO++/9+kEMaybdaZ2OofXFnSlbhkq/KusqwVEokIMxkefiNC0teJ97Tm8cPYSmULSOq1u2jzDmC6wECSDqt9ikUQY8lJuYnh40qat10sguSn+yI5xx6TlzN/6okonZA5nlH8SXzDaytLYA1SuiiH/Lg9/n8lnClxqvlsLk9otV2Fe3kCtzvAYa8ehK392R+TkN4sUuM0QGdQVt9pF4Yp9GO7hMXHbsVaK2vk7bjcjJuMy87jLkJ7tO1TsV015WkQ6T2V5TMfVWPs0At5uS7VDC0zZadcXm3DyygvqrMnKrSTVhiIZXCOtisIKrsdB56JLbE4VqSbVQ/Snj0Sn3FJ+rByu0e4hPLyupPOYqOoxD7iDvsWO8LTX9owp0xIWRvX1r5ZK9GirYubRThfoj54R0sjbhcTbJCiReFmt3X;
	4:p9zQEiVCymKyTSbi0v/nObOcR2TqN0CYumeV68H0lGNBO0Yv2yNo6OzFwaoXR67wAmKiaQ+CeaWhKFtyNFAvskVD4n5eHGmLZEunyzPIW/0HHWNVqUrV8PuSZ2jMMYP4Td+afBBKK9TPkB0ly2hTQgYkgv6wpm60WUGNbnvbRK70ZrPRWZDUQ7VGxf4Qvp35IxAEk53r30YoGa2DsLMHRvYgp1hFdRCRSisL7fPAmZLva9ql+dOyZoaYVI/T9KcO+fA4YAxAn0KeB2/tW0yor/ThAwkt5wA+QN8OBN4r+9xu5KsQZu6cmIOq3q1Ufo34cP5W3b+V9/6hq5FuFe71YnoQfKZgaOBP12K/uFrFPW3AC/cyktYI9jtMjFca5WL7
X-Microsoft-Antispam-PRVS: <CY1PR0301MB204280730E6D23D0F13ACE3A9EBD0@CY1PR0301MB2042.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:CY1PR0301MB2042; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2042; 
X-Forefront-PRVS: 0870212862
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(2351001)(50986999)(4326007)(76176999)(1096002)(2906002)(5005710100001)(87976001)(10290500002)(40100003)(36756003)(4001430100002)(6116002)(47776003)(586003)(122386002)(42186005)(92566002)(86612001)(19580395003)(77096005)(10090500001)(575784001)(5003940100001)(86362001)(19580405001)(189998001)(2950100001)(50226001)(229853001)(48376002)(5008740100001)(110136002)(50466002)(5004730100002)(107886002)(81166005)(3826002)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2042;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2042;
	23:7o/C8cem/Cep4Ea/MeCQRn2hIy2/o390Z7x2TE7?=
	=?us-ascii?Q?p4zRlAakhQ/48ebm7I+7ydZUaBoGxV1q17OAcUAPJ8HF8dpzM5pZVkzsjxn/?=
	=?us-ascii?Q?spi4U6lbKA4zh2vRZwDdJtZsFj/L6bHkDS+NDGUjWCv93BQkv/miju8Oy+Vl?=
	=?us-ascii?Q?+GYviKWtRVXiLnHQPASOBo1PQHebGLg5xdtFepJDtiZigvBopT6FwkZmg7yg?=
	=?us-ascii?Q?xiR55WChn/Kz7u7RRGwAzn7i8o6Exwzh+JOTExkg4aBnYjDgYbMGnsEOLxEp?=
	=?us-ascii?Q?cvGDH2oEIWfLoDdTLNgxJXAZlahwtg0RGD5tBaBo6w2oANr7oP7a4LyKmoyL?=
	=?us-ascii?Q?B6bZpXr/tYUO2YDOifWA164gPcrr/pYOCoH0etTJEJ+8YoNk/+ZMO7ahiZ9r?=
	=?us-ascii?Q?x3YgPAWN3WZmbZilnBA1w+4RlJODFVsW9AMlJX+SeStjTD4D0kPQyzDj0Hum?=
	=?us-ascii?Q?olCiURfApdG+o7ZMl0bgO1714r9KgTLy9TlpAJ3JzmlFGm/5v7bZGgGPk0wV?=
	=?us-ascii?Q?do4M3aSoj8pQL0onaBh/OSX1Trf6765r/Dt79wHWehg6FFTVObayDP/RmwzO?=
	=?us-ascii?Q?gHrZgiX/PG3jNUM/VxIvDtYywNSXyjq6zPF9fAtWOGtG6MBT2W4axFVm10tj?=
	=?us-ascii?Q?isLL+DKIOTH5LF9Sr0b2QmlQbIAEjDGN1mSUCBLOSo3vwnwSNEMJhoed87hc?=
	=?us-ascii?Q?t7+270LUl47mmb14nJdbsB/CZjZkDMB1t7kK2d/11Utjj0LueSEOZyBZ5Kug?=
	=?us-ascii?Q?CIR1h7cG5vpytDg97HElGOY85PXwi7JH9ODZPiWmhhGlGp0IP3VxcsYEbt9N?=
	=?us-ascii?Q?Z/uXcX7HHIXFZrkld+jrJN5ddBd6uvBJpXn6WaN6As+YR/vYmTUMzR8irwXb?=
	=?us-ascii?Q?wfk+vipd2s2fv7Uwcgp8dHNR9otx8SmGMPjERpCe09NoleDn+W6yfUqvJIZg?=
	=?us-ascii?Q?8OOHBfcCq6dJ0Od1Hw5gFwbm0MPRRvI65JMQTKPzA+axR2rXY0yptfjHlRM/?=
	=?us-ascii?Q?KOCiwq9o3VgrxQ6M8ECwH9JnA2ufIQhEIdrl1vtg8Yi9x4LPxUxmTRy9bK2R?=
	=?us-ascii?Q?kEBOqbxhU2AHViOKqJHh3oCL5oYRI2Mz394IPyAFVkDJ0njZRUZ4x8iqU9yW?=
	=?us-ascii?Q?Ui15rOVIxuo8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	5:oDoL3asz5R7+yRSIb/JwViDXLLDaDsuPdwJ0OgiEpjQ6HSbIjsEG6aL5CeNNi7K9+W278Tb8WAKE+SnjzaqGloSEmX52vKO+UKjbsRrI8ssc4cebhQfkL84VeQotEtxSLCN1I+pDbVx0MniepTMThw==;
	24:0oXIOMOWMMEGwovfBoXiaTYBcxccGtcZMisFTUMpUxfjAFdDYc7xKsu3nchr54wFAf+eyz/WuOmJ7lwIdPMz648q6+YGRHDfKtWq+W22M38=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2016 18:24:53.2638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.105
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 5/5] bcm2835_dma: add emulation of Raspberry
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
X-TUID: H3DGmvbp2shD

At present, all DMA transfers complete inline (so a looping descriptor
queue will lock up the device). We also do not model pause/abort,
arbitrarion/priority, or debug features.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v2:
     * avoid ldl_phys/stl_phys
     * compute address of channel structure only after asserting its validity
     * correctly implement per-channel reset and abort bits
     * set channel paused bit when completing DMA

 hw/arm/bcm2835_peripherals.c         |  26 +++
 hw/dma/Makefile.objs                 |   1 +
 hw/dma/bcm2835_dma.c                 | 408 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/dma/bcm2835_dma.h         |  47 ++++
 5 files changed, 484 insertions(+)
 create mode 100644 hw/dma/bcm2835_dma.c
 create mode 100644 include/hw/dma/bcm2835_dma.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 9b9de99..eeb4934 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -89,6 +89,14 @@ static void bcm2835_peripherals_init(Object *obj)
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
@@ -257,6 +265,24 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
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
+        ch->ti = ldl_le_phys(&s->dma_as, ch->conblk_ad);
+        ch->source_ad = ldl_le_phys(&s->dma_as, ch->conblk_ad + 4);
+        ch->dest_ad = ldl_le_phys(&s->dma_as, ch->conblk_ad + 8);
+        ch->txfr_len = ldl_le_phys(&s->dma_as, ch->conblk_ad + 12);
+        ch->stride = ldl_le_phys(&s->dma_as, ch->conblk_ad + 16);
+        ch->nextconbk = ldl_le_phys(&s->dma_as, ch->conblk_ad + 20);
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
+                    data = ldl_le_phys(&s->dma_as, ch->source_ad);
+                }
+                if (ch->ti & BCM2708_DMA_S_INC) {
+                    ch->source_ad += 4;
+                }
+
+                if (ch->ti & BCM2708_DMA_D_IGNORE) {
+                    /* Ignore writes */
+                } else {
+                    stl_le_phys(&s->dma_as, ch->dest_ad, data);
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
+
+    ch->cs &= ~BCM2708_DMA_ACTIVE;
+    ch->cs |= BCM2708_DMA_ISPAUSED;
+}
+
+static void bcm2835_dma_chan_reset(BCM2835DMAChan *ch)
+{
+    ch->cs = 0;
+    ch->conblk_ad = 0;
+}
+
+static uint64_t bcm2835_dma_read(BCM2835DMAState *s, hwaddr offset,
+                                 unsigned size, unsigned c)
+{
+    BCM2835DMAChan *ch;
+    uint32_t res = 0;
+
+    assert(size == 4);
+    assert(c < BCM2835_DMA_NCHANS);
+
+    ch = &s->chan[c];
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
+    BCM2835DMAChan *ch;
+    uint32_t oldcs;
+
+    assert(size == 4);
+    assert(c < BCM2835_DMA_NCHANS);
+
+    ch = &s->chan[c];
+
+    switch (offset) {
+    case BCM2708_DMA_CS:
+        oldcs = ch->cs;
+        if (value & BCM2708_DMA_RESET) {
+            bcm2835_dma_chan_reset(ch);
+        }
+        if (value & BCM2708_DMA_ABORT) {
+            /* abort is a no-op, since we always run to completion */
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
+        bcm2835_dma_chan_reset(&s->chan[n]);
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

