Received: by 10.182.158.201 with SMTP id ww9csp8832163obb;
        Thu, 31 Dec 2015 16:32:38 -0800 (PST)
X-Received: by 10.55.71.82 with SMTP id u79mr96787301qka.55.1451608358446;
        Thu, 31 Dec 2015 16:32:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13si2943026qka.120.2015.12.31.16.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:32:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEne1-0003qj-3h
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:32:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndL-0002mZ-Mt
	for qemu-devel@nongnu.org; Thu, 31 Dec 2015 19:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndH-00063b-9F
	for qemu-devel@nongnu.org; Thu, 31 Dec 2015 19:31:55 -0500
Received: from mail-bl2on0137.outbound.protection.outlook.com
	([65.55.169.137]:60296
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndH-00063I-3E; Thu, 31 Dec 2015 19:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bBC5Fq1FAyjnGKz3ihQQs5dH/zqE+mzRqNZsavMhMeg=;
	b=TP5IeV9WmV34/FHC2WCQuEQR3GSpMBvo5MNp5Dj3MiHvT/7AeXyDWe5pvtSogi21dVSgx5iz1bSzrXCwqxq8dw5WwyUAZhL5PBKSi5hcwkLqU+KTlORHUmqyFZ6e4GLknMfxFb/FRxPrFWuP4pnl+GYvsIFNweoHalirIJwhAmo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:48 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:29 -0800
Message-ID: <1451608294-16432-3-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:O62eXRu7dzWVlD95D2Dc/jsfWmMWXD8VAYW9kDEHztNNJhyqlsOxV5yvuOqgrBUqycqEzYDckCv/SCp6LDj9zbRCVasOCoG3UswYCkAzfW2GyKdNtOUwALZhyeyMroDkQo/L0CVcs5DJqxp2lU2Luw==;
	3:JeJ8N2yT8ILSUZaMghAxkcSOkfzNxs3NblhRlXnOE4TzFHbT295srEOqsSNX54YFrhCNq9plxf08L67WPrP/zcya6UVMobWNlu2DoDuADZxZdw+aiQTf5x0+4/tO8DDA;
	25:pr9hP33NAbt0MIo0w82gU7VnK3UcuHtmRI1fAJvq8BnR82VDx6yV0yf2ovFrXYU2XugmRF+YgsUOH4+AulS03oDqlU5ZwlaIJe0PH6PRPk/Y0O5PUf+f1kjYEUcynXZOAz16PR4nu0b3g2Yop1D1rTZqlq68xO4NsNg7NFIdUeNJGSmXRX50VmmrV/bsO2EgKzoZi77nyIg5Hkw0SbYzRiPL2xTIpIzbF/K9A6AHSGWaI82Cj74gO8Pqv3q7vBLzfxQbLSFqS/2x+vK91P6sObV8BMulBORBa9vcCfr5drk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:Et3IzA8je3j7pqLUH5rZkSM6pPT0Dm/Hq2fCxSDvJvg3GmaEvvX0Rrksig8/h8BEJiVY0KpZFDLrwcHloGo2Zuf+IoY3mD3I6lvaeLQEhcfAUuu6wliyrXYFB615Cy56q5hVoNzf9cpmBiZjU0IrRxee1LMRZVa89f9qIdfJCy1iLZBy7Of/QY+GfylkEnbpdpru0YC2SJH2H5HQuOFcuvhipRuEcR6XhCIIZm2LoDnhMo8te7fVdDPRdresbuV3yJ+1bWRX0T93Pd6Nc69w1hhcLUn8H3OmzCJvUWvibfovredph/q4zikGWtKCB5W/hodU+PvoWBg0IHSj6hE29sWGTvFnyE4wB4nbCCAq5Bw9oE3IHp0pfWKiTTyOV15M3nvrD8lmTniJZDe8ygv8aKVM0/xPxPrp/xJYKtTx8GNaeS2nSlaY2xSL9zF9cs1i7Km+p1S/Z4+0T0NCJbuBoXd3q6TirrmzA+wfX9NnryXPsoqDBk0qCVpn3YGloda4;
	4:YFxI5lpmedN/0PO29KMIe2UULbwGXaqUDPjuP96nfEp2w7qATdwMMENEyjCsQxp0uUaqw6n2Vufy4iwn0NCLyRXI4k0Ixke+QN5EYALpThj5Mj6IGBbxbo/9VvPiqPr0QQr/kg+ubFEjZe+/OmCkeciTvJhTuNOZxU2NNoZ17GHM5qsJPobtYEIfOWUXNPe6ig+9JbNx6UepyRcU6G+51tOeU9Tn5FfQnTLJqV3MV/D0e1i06Kfoc2EFOVqKyb8IyjxwF2pzqfel+6sCcFPf0LQk2eS+C/251gB3pp4OBVOgbZWwWjm9+Jb7lYj8I8M5QOs7c5KEl3rlLF8crRPyw0oAwDqqGxDWFO/rtEDL39vyH9gIvkafaRoLZe7F0dPw
X-Microsoft-Antispam-PRVS: <CY1PR0301MB204383EF5ED6A6022FECFD4A9EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(575784001)(15975445007)(5001960100002)(50226001)(107886002)(76176999)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(2950100001)(19580405001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:lvDrwttQXxOOOHjZXuKgHhL9VKEb/E96zbbVmns?=
	=?us-ascii?Q?MvEzf/KlddaGMPyLWBhi3KmXj6qPkspor0uD35CD9vuN0O7PznAXGLbG0a3H?=
	=?us-ascii?Q?lusqhjIl7hXtE4lDP9m9g7+ZWndjRau4/RAMvLdwHtLbIVuVyq/+jXqEIr3k?=
	=?us-ascii?Q?1mpk5S/k2hx6iE2+kKYXnXOieQ9ij9n7sCnPPSCSD4pG3OyXp58rmaCRzmmV?=
	=?us-ascii?Q?6+63NLLespXfeWLcUmhNk9Ya8UAZyo3Jn8brbH7dnHGilEXNJoRR41xsqqWn?=
	=?us-ascii?Q?Y7hD8N7uws6g1P8CRctCxxNPQni1pkqiMGAo1KerGg+/AldrmIeX4/dOb9ak?=
	=?us-ascii?Q?hv8pST5rn+XxWQ8mX80KMpHx7T1FOnmSkjfk5xoqrbpr/V7XmbpW2qVU2kmC?=
	=?us-ascii?Q?/2w6/I1vemm4PD6zWO2aHyr+RabeTwSPR1PdmuDei6xR+irdhws6gBvRtfhb?=
	=?us-ascii?Q?meqVLP9EU9OBQkd0rXBJKfVEbWQN3juQuTjKqRF5mEEGjH+mlxdLKBA9HN6N?=
	=?us-ascii?Q?NQx8jWIauYZHoFBuSZeY4RUBIh4w6JxQsseIyRK4n56rtILFC50EvF+axVHR?=
	=?us-ascii?Q?hgTTYVecsb1YPUtH1aqPRSLxxobQfE9vZ+7Kl0JOshlLaBgFFURDKZgAvQqw?=
	=?us-ascii?Q?jyW+89pqwkzx41hJngTE9U3gDUO+Y34Y2V0LTXXHj/Q5wM7DR46aZnCq0Mi7?=
	=?us-ascii?Q?lJI9Kqa8V6HWH4+8o43pbYgdAsxs+6Xz31KJnboAr5nYMdniKtXm8EqP1Mk0?=
	=?us-ascii?Q?rAtt2LXYR2vBidD6keHlpY+ZRBfXsOehvgwDwa9a1J3aDtDUqFRNIw3ccWYh?=
	=?us-ascii?Q?pOVoMRECeXPP3tEQmFHA3qKwM1MzIgT+EqWKktuGagd/al9h2hz/DWfeD4nt?=
	=?us-ascii?Q?iOA4hzG5m8ws7YXetIN1+3z1rNn+6qrB9vC9pNSIJghVexeVQDSO7gnaQzh9?=
	=?us-ascii?Q?0vnHhDcDBvsMDlRBpMaceFmsP/674TuHgNpVsD5nmMQBIeg9zWC5M/q5LaeT?=
	=?us-ascii?Q?A5M1Kxzg7NNf5wzpmh5sQiOfC7kQR3/urT4QujCaQnrxeHBE5RnCwDR6X6K7?=
	=?us-ascii?Q?0BTIwfZGlmIwjjob3JzXPyNrq3bI3zZuTW2CDPex88kYKnPwKGJ6Tkco7X9k?=
	=?us-ascii?Q?PA6QTsaJiZS4rzi35DHLetwMQrT97fvIAH7UgjR35PL+9R2RApS/YmjMDFKb?=
	=?us-ascii?Q?FC6ttP1d6DWuTkBLMf6YZBW4ljmHpxtAuhgGeVF3mdoGDBrtTCCUU6/M3wA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:kGeFUJ2PldI0jDYq1068DBTTJh7yjYk1D9u9AAvAlbsp9RzAPqH2tJv+Zvly/oNKWO3KMrOrnB+5wGEyZgcaRqj7fbxjFNEC99WBr3vccm4cwQB8ayCyJRXiF6okaS+V3f2/YOU/DOiQqPO/Px5osw==;
	24:e1SbY9ctuy+roh5uchFgKkXHH/SBfK9vD96taxa9/giffufRu3Z0wQkUib0Gt73kb7WNvuq/6TXfpykJCk9MYwKn2LOs452wR1yfsnJ/Xbo=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:48.9195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.137
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 2/7] bcm2835_property: add bcm2835 property
	channel
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
X-TUID: ZGDntcOI96fe

This sits behind the mailbox interface, and implements
request/response queries for system properties. The
framebuffer-related properties will be added in a later patch.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/misc/Makefile.objs              |   1 +
 hw/misc/bcm2835_property.c         | 277 +++++++++++++++++++++++++++++++++++++
 include/hw/misc/bcm2835_property.h |  29 ++++
 3 files changed, 307 insertions(+)
 create mode 100644 hw/misc/bcm2835_property.c
 create mode 100644 include/hw/misc/bcm2835_property.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index d0ea105..ea6cd3c 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -37,6 +37,7 @@ obj-$(CONFIG_OMAP) += omap_l4.o
 obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
 obj-$(CONFIG_RASPI) += bcm2835_mbox.o
+obj-$(CONFIG_RASPI) += bcm2835_property.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
new file mode 100644
index 0000000..2385be4
--- /dev/null
+++ b/hw/misc/bcm2835_property.c
@@ -0,0 +1,277 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "hw/misc/bcm2835_property.h"
+#include "hw/misc/bcm2835_mbox_defs.h"
+
+/* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
+
+static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
+{
+    uint32_t tag;
+    uint32_t bufsize;
+    uint32_t tot_len;
+    size_t resplen;
+    uint32_t tmp;
+
+    value &= ~0xf;
+
+    s->addr = value;
+
+    tot_len = ldl_phys(&s->dma_as, value);
+
+    /* @(addr + 4) : Buffer response code */
+    value = s->addr + 8;
+    while (value + 8 <= s->addr + tot_len) {
+        tag = ldl_phys(&s->dma_as, value);
+        bufsize = ldl_phys(&s->dma_as, value + 4);
+        /* @(value + 8) : Request/response indicator */
+        resplen = 0;
+        switch (tag) {
+        case 0x00000000: /* End tag */
+            break;
+        case 0x00000001: /* Get firmware revision */
+            stl_phys(&s->dma_as, value + 12, 346337);
+            resplen = 4;
+            break;
+
+        case 0x00010001: /* Get board model */
+            resplen = 4;
+            break;
+        case 0x00010002: /* Get board revision */
+            resplen = 4;
+            break;
+        case 0x00010003: /* Get board MAC address */
+            /* write the first four bytes of the 6-byte MAC */
+            stl_phys(&s->dma_as, value + 12, 0xB827EBD0);
+            /* write the last two bytes, avoid any write past the buffer end */
+            stb_phys(&s->dma_as, value + 16, 0xEE);
+            stb_phys(&s->dma_as, value + 17, 0xDF);
+            resplen = 6;
+            break;
+        case 0x00010004: /* Get board serial */
+            resplen = 8;
+            break;
+        case 0x00010005: /* Get ARM memory */
+            /* base */
+            stl_phys(&s->dma_as, value + 12, 0);
+            /* size */
+            stl_phys(&s->dma_as, value + 16, s->ram_size);
+            resplen = 8;
+            break;
+        case 0x00028001: /* Set power state */
+            /* Assume that whatever device they asked for exists,
+             * and we'll just claim we set it to the desired state */
+            tmp = ldl_phys(&s->dma_as, value + 16);
+            stl_phys(&s->dma_as, value + 16, (tmp & 1));
+            resplen = 8;
+            break;
+
+        /* Clocks */
+
+        case 0x00030001: /* Get clock state */
+            stl_phys(&s->dma_as, value + 16, 0x1);
+            resplen = 8;
+            break;
+
+        case 0x00038001: /* Set clock state */
+            resplen = 8;
+            break;
+
+        case 0x00030002: /* Get clock rate */
+        case 0x00030004: /* Get max clock rate */
+        case 0x00030007: /* Get min clock rate */
+            switch (ldl_phys(&s->dma_as, value + 12)) {
+            case 1: /* EMMC */
+                stl_phys(&s->dma_as, value + 16, 50000000);
+                break;
+            case 2: /* UART */
+                stl_phys(&s->dma_as, value + 16, 3000000);
+                break;
+            default:
+                stl_phys(&s->dma_as, value + 16, 700000000);
+                break;
+            }
+            resplen = 8;
+            break;
+
+        case 0x00038002: /* Set clock rate */
+        case 0x00038004: /* Set max clock rate */
+        case 0x00038007: /* Set min clock rate */
+            resplen = 8;
+            break;
+
+        /* Temperature */
+
+        case 0x00030006: /* Get temperature */
+            stl_phys(&s->dma_as, value + 16, 25000);
+            resplen = 8;
+            break;
+
+        case 0x0003000A: /* Get max temperature */
+            stl_phys(&s->dma_as, value + 16, 99000);
+            resplen = 8;
+            break;
+
+
+        case 0x00060001: /* Get DMA channels */
+            /* channels 2-5 */
+            stl_phys(&s->dma_as, value + 12, 0x003C);
+            resplen = 4;
+            break;
+
+        case 0x00050001: /* Get command line */
+            resplen = 0;
+            break;
+
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "bcm2835_property: unhandled tag %08x\n", tag);
+            break;
+        }
+
+        if (tag == 0) {
+            break;
+        }
+
+        stl_phys(&s->dma_as, value + 8, (1 << 31) | resplen);
+        value += bufsize + 12;
+    }
+
+    /* Buffer response code */
+    stl_phys(&s->dma_as, s->addr + 4, (1 << 31));
+}
+
+static uint64_t bcm2835_property_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    BCM2835PropertyState *s = opaque;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        res = MBOX_CHAN_PROPERTY | s->addr;
+        s->pending = false;
+        qemu_set_irq(s->mbox_irq, 0);
+        break;
+
+    case MBOX_AS_PENDING:
+        res = s->pending;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    return res;
+}
+
+static void bcm2835_property_write(void *opaque, hwaddr offset,
+                                   uint64_t value, unsigned size)
+{
+    BCM2835PropertyState *s = opaque;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        if (!s->pending) {
+            s->pending = true;
+            bcm2835_property_mbox_push(s, value);
+            qemu_set_irq(s->mbox_irq, 1);
+        }
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return;
+    }
+
+}
+
+static const MemoryRegionOps bcm2835_property_ops = {
+    .read = bcm2835_property_read,
+    .write = bcm2835_property_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_property = {
+    .name = TYPE_BCM2835_PROPERTY,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_UINT32(addr, BCM2835PropertyState),
+        VMSTATE_BOOL(pending, BCM2835PropertyState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_property_init(Object *obj)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
+    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
+                          TYPE_BCM2835_PROPERTY, 0x10);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
+}
+
+static void bcm2835_property_reset(DeviceState *dev)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(dev);
+
+    s->pending = false;
+}
+
+static void bcm2835_property_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(dev);
+    Object *obj;
+    Error *err = NULL;
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
+    bcm2835_property_reset(dev);
+}
+
+static Property bcm2835_property_props[] = {
+    DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void bcm2835_property_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->props = bcm2835_property_props;
+    dc->realize = bcm2835_property_realize;
+    dc->vmsd = &vmstate_bcm2835_property;
+}
+
+static TypeInfo bcm2835_property_info = {
+    .name          = TYPE_BCM2835_PROPERTY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835PropertyState),
+    .class_init    = bcm2835_property_class_init,
+    .instance_init = bcm2835_property_init,
+};
+
+static void bcm2835_property_register_types(void)
+{
+    type_register_static(&bcm2835_property_info);
+}
+
+type_init(bcm2835_property_register_types)
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
new file mode 100644
index 0000000..d7a9856
--- /dev/null
+++ b/include/hw/misc/bcm2835_property.h
@@ -0,0 +1,29 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_PROPERTY_H
+#define BCM2835_PROPERTY_H
+
+#include "hw/sysbus.h"
+#include "exec/address-spaces.h"
+
+#define TYPE_BCM2835_PROPERTY "bcm2835-property"
+#define BCM2835_PROPERTY(obj) \
+        OBJECT_CHECK(BCM2835PropertyState, (obj), TYPE_BCM2835_PROPERTY)
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
+    MemoryRegion iomem;
+    qemu_irq mbox_irq;
+    uint32_t ram_size;
+    uint32_t addr;
+    bool pending;
+} BCM2835PropertyState;
+
+#endif
-- 
2.5.3

