Received: by 10.182.158.201 with SMTP id ww9csp414173obb;
        Thu, 3 Dec 2015 22:04:06 -0800 (PST)
X-Received: by 10.55.78.82 with SMTP id c79mr15683717qkb.44.1449209046247;
        Thu, 03 Dec 2015 22:04:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c92si6754239qgc.107.2015.12.03.22.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 22:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4jTR-0001eL-Tc
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 01:04:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSd-0000ZE-R1
	for qemu-devel@nongnu.org; Fri, 04 Dec 2015 01:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSa-00008o-FQ
	for qemu-devel@nongnu.org; Fri, 04 Dec 2015 01:03:15 -0500
Received: from mail-bn1on0116.outbound.protection.outlook.com
	([157.56.110.116]:59776
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4jSa-00007J-1r; Fri, 04 Dec 2015 01:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=P1QIEprF8rLOX0sfu88qdpaxiM2gizizuOD+tB9+KBg=;
	b=bIS4Ml3VWvcfCZ31Lvw+Tdr+V2tbhBf7c43IJf1JqJzNYl0u+tpbvx6XmwZVZhMAZRQQaVY2G//pmjNGN6MgsLkSsPTs5AbPa0XAckcgtEVdmvJWroK7o+Scgt0CSDeXE5DI+HeWuCe4cAJxex1Q8xFhaWRyKY4dCFRUv4B9otE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Fri, 4 Dec 2015 06:03:09 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 22:01:21 -0800
Message-ID: <1449208887-9564-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:6::724]
X-ClientProxiedBy: CY1PR21CA0026.namprd21.prod.outlook.com (25.161.247.36) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:tr/0SiqrtQley5Sj9hnPwl7wr0D8A2GqpCXNwpNXXlw4M6LJBUCtH8WuZu940UafsCiv1YEDQbuvpr1MTBV4HN4BeanvZSsf2NidbjtsJLKtcRbl8Ec4dhh2x6twoMB1DiT+s5kXPshN9S0XTW5lcA==;
	3:jh94sVwhi3I2cg3F/CyxryhM8nt3tLSpOvQSxF5dgzQzANYB7NvWfY07jqHz8SlHsqdpnkjN2daeZvcmjvQymwrS2xV3CXIfOGG40SFOk7VizAvpCtZVbmpJJqz2/p9h;
	25:n4vwxqkQCtRgo/OdcFrZDZ1Ov1MYJrdU38y5UkV/eMn1RcQa3oX9uwMfj0TCban2lEVG3vMlheYLyr/50QMn4Chv93fjT26fbdrdchzS2wYiWTPln+N4EymK0du0AoedzTzaaX2JMnu/cBxrGDN7Rz59iXtiAMLGksmSNG990pqJ4uutbqra4to/uwD+hu+tpsFzI7tsL+ABeLVWIeZcYAC02wBydCF60lVE6ecJm2W2yrOFCPUJsMhQLNWazrpg8dM/4mRwUxqkgm92hA5yJA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:TvcSrbqa+MVJRHonA0UK3LrIlPiTRQjniBWlsa8uCGAKRLXpj4lNJR/BthH/9o5o2ODpsL2WcNTtKlqYkxC+fuQpJb4afegX1UtY+2XgKhNZN/+F+BOoVpV3ejLcUugg52ZksNIOfPXL0o0nkeixKqCSpld+ryhLGqaEyFvFgEtPF7ZDokVKVfQJhcyg3lbQ1wvwcVsEy4cx8OYmDYBzmVlUderg/uhabnKWDEaVN0C1iHF3RqqguVwZYhOnl1XX9MJVPblVO+KbEqIAU1hSqwaVBR4qQH1EsnbyYmSNIhr0GPcFrv5sco+Ldt9L6phQwsfBXlkTau6gwT8nWgrquh/5eAWbf3qerNnF61G2IgvVf3/vtVKu0Q0vNYKmtYp9ws3TXSI7YjmZer3tjzhPVBun6fCiz+G52nYYfZtSzs09ngL1Og83y8cE+GCuDTiAzXlDVflte+JzxpDVrmwEU64RPON/NsCc7Lr3ZaYGPzmqDhbrZAIHfdNOoys/s+i/;
	4:M4d1oi4bZBZkj0Lymv/9kAYfJ94jsuwspjE/S0jZd6ZPivVvTHMB8wHj9N8HhKbz2j9Ao5A40uCZ52vLAd7mRjHhb7/0H+oyI9/aMZMfk8zzHH2EolYAbCroy45CUglagiibjkjQtwx2IiTQvyIZ+pIG/E0b6JEapL1fYKlh/NueRfzv19dzKqhifFvrlAAmGLn6iCwwbQwcqZUbq4xlZhPDROhZPuWc2dl4dlKdkyaWbhrZD21W3Lm4PnmiMsDmVLAaEsYswtRZki3ZSh9KLf6SnaznxyWi09Yp6KDpPWeAlNHY7RPQ18lJQb5IFjYiNM3MSzJsZ2jPGJFUZXY8U8B/Hzhlpz3yPD0O/S0OUC6pq9ZTvYGXInEwdWcDBxgWj2TX/S6tV0MprShrGN/k5f1poGgsLkGPzbGW2jkCA4NWRpOf35uIJphsbzcKAdh6
X-Microsoft-Antispam-PRVS: <SN1PR0301MB204600B851C3394E5BE2F04D9E0C0@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(5005710100001)(50226001)(4001430100002)(105586002)(6116002)(106356001)(42186005)(86612001)(77096005)(48376002)(36756003)(5008740100001)(15975445007)(5004730100002)(10090500001)(1096002)(10290500002)(2950100001)(189998001)(87976001)(586003)(92566002)(2351001)(81156007)(19580405001)(5003940100001)(122386002)(19580395003)(86362001)(50986999)(40100003)(50466002)(110136002)(47776003)(5001960100002)(107886002)(76176999)(229853001)(97736004)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:levNDBD8pwwbvzIL1KZ942iT1baIwwg9u5s1OKx?=
	=?us-ascii?Q?CxKT718NyZe+B2ytJhqTp8oqNJoglpWmszB6sfF/czL+1tq1PG0YTX8Q/Jdh?=
	=?us-ascii?Q?+D88LFTVKBMv+TM3YCWlu1PTs/cBAupu4iPX7E1POlbNAFyXFDR80mugbWFR?=
	=?us-ascii?Q?Ka3HUQMjEJwSOTVrTJXy9c6C/74yZDgv8StpCHOLpwDYyyc0uiCouZ0lfUlq?=
	=?us-ascii?Q?/hOq2ZvalyezVxFqdKQMnXiyBa6wLaHDxex5kjse7XQMrXl6VRr14VsbJ7eb?=
	=?us-ascii?Q?Zvii+TJRTvIijn38I0Mo6GKFfbWQyCC1GIvKzmT9xpA1T55j0vi4Nbhtnh9x?=
	=?us-ascii?Q?x3fJxlHil/j03V0M8cqjiCXTjJsCIq6C44W0BXfywW2qF0g0G5Y1wvQEBe2j?=
	=?us-ascii?Q?PB1s7SMh53PyBU09VDtBtmDpHlfDB8bqOszrZ7JpGEnjPSe7Dh0AQ7MfRFyb?=
	=?us-ascii?Q?uqw8wZdcaaWk2HyrxrjCR8bLrgOOjN7Rwj3TBv8Upop3qOGrxjqLu+hBH8Gr?=
	=?us-ascii?Q?kzSSysSlhiO/tXz8dY2wSgwxbLig1ZYLn5zCFNK9vECN8esoSDeorVPAu1JQ?=
	=?us-ascii?Q?3Mw45koZbNnwIuZz5R5qIrqbhAQ4dDQQtM8PYZ8gCN5QtWAkc+UB7v83Spb5?=
	=?us-ascii?Q?RwJI02TusjGwRMuz5tB2gK4HnQcOwqbotKBpp+ITbdd/D8QSrZR70sHShS+X?=
	=?us-ascii?Q?KHrv5SXDO59ZHIzYUZVpLbsYgjhJIMhJh5+Bg5TM02C8a76Ur8c3UdMlwRuh?=
	=?us-ascii?Q?7nQ7UfTR3GsP6yCdU4t76RqWXX03mQn9mFCaTHFsMxWFUQosAJALx/mIbWCl?=
	=?us-ascii?Q?AmAN3OAUXCdRguRSSmQNyg+MbvLGTsooNKJgFqQ/7dQLV+gdHwwagBuPvvHz?=
	=?us-ascii?Q?B+o269X0W6PvGrW8xegZy3YcTtRIw+bxLHXn9E2QToCiwEePn/UO4EZp9/qq?=
	=?us-ascii?Q?0L2VgmbjSi6x62Pwr6GvcV1BPa7ZeFVbuu/rkuHxo2i2R93LmFFiE9rN5XC/?=
	=?us-ascii?Q?T9FXpWtSRh3b15qm9Dgsexh4ZD9glfRt74FQsXVnr8XTowYoeyYXt7Dsm9QB?=
	=?us-ascii?Q?z1sTqeOegtlzj+mdDPQPzRxSoWL/nqfvgaQDHnjevMnLyAChwsPlWXCtl7Y5?=
	=?us-ascii?Q?EkhuIYG+VybTGy03O3XtgXcZQW2YVOZYIl52QRcSKiTeH1uPDdARkbI+o7pV?=
	=?us-ascii?Q?X1Fg2uysAlTaWi0s=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:vCaNeW0B03OcBpUTpokZ399/R403RHDGN1oNU61T9q4EslFTIS29DWRXiTTdN+317+bypVAssveclApTWETv4xo/4bcleXsbYTIzCS8NPCnTv7jCwRk6KR6nnopQf8z0X4ftzIj/KUG5P2f0t54fZg==;
	24:0Ya5kjoWz+cfq+Vwohox5YNMd6kM9VfbXqmRhbhz5LP8cIlRBKlUiVPNpbyMU6tHFszWH7lwCi5OCQtWwhUIZ/nJIdj6SuDmGWfsxybnsWk=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 06:03:09.2534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.116
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 2/8] bcm2835_property: add bcm2835 property
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
X-TUID: SPGYSsnoscn5

This sits behind the mailbox interface, and implements
request/response queries for system properties. The
framebuffer-related properties will be added in a later patch.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/misc/Makefile.objs              |   1 +
 hw/misc/bcm2835_property.c         | 262 +++++++++++++++++++++++++++++++++++++
 include/hw/misc/bcm2835_property.h |  27 ++++
 3 files changed, 290 insertions(+)
 create mode 100644 hw/misc/bcm2835_property.c
 create mode 100644 include/hw/misc/bcm2835_property.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index b9379f2..f4286f2 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -34,6 +34,7 @@ obj-$(CONFIG_OMAP) += omap_gpmc.o
 obj-$(CONFIG_OMAP) += omap_l4.o
 obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
+obj-$(CONFIG_RASPI) += bcm2835_property.o
 obj-$(CONFIG_RASPI) += bcm2835_sbm.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
new file mode 100644
index 0000000..d25c056
--- /dev/null
+++ b/hw/misc/bcm2835_property.c
@@ -0,0 +1,262 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "hw/misc/bcm2835_property.h"
+#include "hw/arm/bcm2835_mbox.h"
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
+                "bcm2835_property: unhandled tag %08x\n", tag);
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
+    unsigned size)
+{
+    BCM2835PropertyState *s = (BCM2835PropertyState *)opaque;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case 0:
+        res = MBOX_CHAN_PROPERTY | s->addr;
+        s->pending = 0;
+        qemu_set_irq(s->mbox_irq, 0);
+        break;
+    case 4:
+        res = s->pending;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_property_read: Bad offset %x\n", (int)offset);
+        return 0;
+    }
+    return res;
+}
+
+static void bcm2835_property_write(void *opaque, hwaddr offset,
+    uint64_t value, unsigned size)
+{
+    BCM2835PropertyState *s = (BCM2835PropertyState *)opaque;
+    switch (offset) {
+    case 0:
+        if (!s->pending) {
+            s->pending = 1;
+            bcm2835_property_mbox_push(s, value);
+            qemu_set_irq(s->mbox_irq, 1);
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_property_write: Bad offset %x\n", (int)offset);
+        return;
+    }
+
+}
+
+
+static const MemoryRegionOps bcm2835_property_ops = {
+    .read = bcm2835_property_read,
+    .write = bcm2835_property_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+
+static const VMStateDescription vmstate_bcm2835_property = {
+    .name = TYPE_BCM2835_PROPERTY,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_property_init(Object *obj)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
+    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
+        TYPE_BCM2835_PROPERTY, 0x10);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
+}
+
+static void bcm2835_property_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(dev);
+    Object *obj;
+    Error *err = NULL;
+
+    obj = object_property_get_link(OBJECT(dev), "dma_mr", &err);
+    if (err || obj == NULL) {
+        error_setg(errp, "bcm2835_property: required dma_mr link not found");
+        return;
+    }
+
+    s->dma_mr = MEMORY_REGION(obj);
+    address_space_init(&s->dma_as, s->dma_mr, NULL);
+
+    s->pending = 0;
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
index 0000000..c952165
--- /dev/null
+++ b/include/hw/misc/bcm2835_property.h
@@ -0,0 +1,27 @@
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
+#define TYPE_BCM2835_PROPERTY "bcm2835_property"
+#define BCM2835_PROPERTY(obj) \
+        OBJECT_CHECK(BCM2835PropertyState, (obj), TYPE_BCM2835_PROPERTY)
+
+typedef struct {
+    SysBusDevice busdev;
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
+    MemoryRegion iomem;
+    uint32_t addr;
+    int pending;
+    qemu_irq mbox_irq;
+    uint32_t ram_size;
+} BCM2835PropertyState;
+
+#endif
-- 
2.5.3

