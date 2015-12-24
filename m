Received: by 10.182.158.201 with SMTP id ww9csp4395308obb;
        Wed, 23 Dec 2015 16:27:09 -0800 (PST)
X-Received: by 10.140.32.53 with SMTP id g50mr44418390qgg.47.1450916829769;
        Wed, 23 Dec 2015 16:27:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d7si30503927qgf.88.2015.12.23.16.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:27:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtkL-00025n-CI
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:27:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtj9-0000CX-Rd
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:25:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtj4-0004tM-Vl
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:25:55 -0500
Received: from mail-by2on0101.outbound.protection.outlook.com
	([207.46.100.101]:47862
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtj4-0004tF-JU; Wed, 23 Dec 2015 19:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9E7TEnesiUZ1ebEFmOf919NlA2s5gMhs0lUKQLgS/0I=;
	b=Wu7KLtjJIwe9yKrkAxTCH39+uaV/ooCqU+TAV91Dm3qDl/1oWXxI28FnpiZFCJXda8+5B2Br24713mlv7BwvPI5MwwB2HN1CcY7+LcDIKupmyICQQsp12sh7MBNbvPiE1Y53mvBVDN5bO9wHMwZ9eswWinBcSqMuvG8Go5tsXHE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:47 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:26 -0800
Message-ID: <1450916731-5968-3-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:IaUO71mB4gQVFFcBU6WOKbFU2w2CogvTB/PdPW4jpxQWOVftSviAvt6zQgTuCBjraLpRbQA8Dh7zUb6Bzuy5MHVDcfVsdoaEBqsWq2Z5G3/XZEaSfSEerrkKvpb+DxurDrd55AXRFzRBjz4mYrBfKQ==;
	3:ukzEwaPJtl6gvaC8EMsO+OqVt6xD6GfFhfygtga4Pfk9Gal81aiRwJ26QEDYCjtL2GOaHBKJz13tbkYeLwhqyXW+vRxC5agHDWaG8HM2298exxHT+ZY4QMdUXdFIcX/6;
	25:+caDkwRkI+EpxnfJg/osgDiYLiRh2DxYLbdxXXvvBvGMqG+sDkopxT8Hf71R4qxXsYOZUSHsY3SLyJtlAWy0Myj1sZEkwewAE7els9WcDStmswuf9L5dUgYF7TfeubvxtTNgBc0klW+KzjYF/BBIizaog9+WJbuuQSLOHfOz5OERx2ZieZpCIsccObM6UE4WA5oFCalMSr/T9J5p+Pa/eqCsRxUMFRJDArRed5hhWrnEXyRBMZZmGZJYr6hd87j1ZIKSavXTtgm2ld+2ByNCIKV1jg7VTNXgda6mbIi/NV0=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:bIMxp5wne0DyCuvHuQdK7PrxzVmZ2VlWoUNSbjdLpgtqTwNgTOhV8JJoJ+tLD/ZQt5TWFzEI2mKxwR6IAuv8nLiP7iHwC8s8DhGcZjZw/LK6EKLVXPCoZKm5Wawr9oul8DlKqix+I9Zw33SwA/DPbskytYkGWQfTXsT+tO4HxqD8CZndC2BF6B96gix8LvPDKTR7P735vyHnKOnfyTfU75arHZkZHRP/bbOg+k4curWmALLaT+rEiOqDVSK5cgUf/yBZO+wi8Ql9Ugpj38DvMpdvl4j9I/bleBJXv+9hE9+Rhq9M+9LL5x5P0DTM9PjvzcQjKZiMqU6K7dqq0//SkO57SsKYBpU8Btzc+uFHnpCo58zLi8bEjd/zaFamwOXHkqzpUgGigomPLB3EJS2mLcP69sGW4QI+VwJnseJoydaEGQnb6wocgeXuic3JGeqRcnoTUUNn7CrTiFCSdw308SfzXBIwhLkAWgtUry54YXG/lG8ZguWP9ciQdReKnOhg;
	4:DR+r+p/283vkOwgTDcXON4yZaCH3rXrXvCntc/y1OnnhO6pjFt1RmektUFKPrIhL/R44FQ2uQo3jHr9tko/1aF7X1i1sM2C1+JTOGBp91RWaMHIh1Neyd+mDHqtOZoDmZqCzh9tjVf7BfQ05tnLKtsqNa+LJcbG+V1gsclQhpekEvdmIBg8PFgdaHqjDDBs8axHwPSSRQFNUvIC3vLOJrorQDo8YcuHdx/KYo21Nv9H+cv65K4j+xqpdBebmp9W6PgJw1UDCC59nFdwU44o5p9GIL3yOOr+9SfUMA4qn12lB+mbzv/H9e9a2WW/lqYuuIP8q0Py7rX+MPj71jWemSqn+NAgJXf/+ucQWGozXILSvVggNGU19l7HEkNLKlJ33
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033C5FA10182341117CC9509EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(19580405001)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(2950100001)(76176999)(575784001)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(15975445007)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:dN3zXmNl3gTDuDeoyc1rB9upo8mysaliwN+qM5W?=
	=?us-ascii?Q?eUD5+w7pIyGDQwyiIu6fxSrfFOvoOYJfXFkJ0nHCqF1zhDeaE6MQyz6a1Fja?=
	=?us-ascii?Q?avNYRcgeMEcfSHTlN7IPLvbmA2ely4Cb39feJOAbq+SD1jzKGAYWgpPnM7H+?=
	=?us-ascii?Q?4bHwkDiwHV3Xcqh21KG9OAnpHuvLjn4Gncra8UCDt6wx/bHvDELHU6g8974O?=
	=?us-ascii?Q?1YIn0cFHEzr42PoE3obTmMwBEtudtQ5zgjg80u49m4/8NFrxoXbSpmVdtHwn?=
	=?us-ascii?Q?l/yJAWbUHySi4E8OmjaRoWdq9ReAWow6/FWN73gi5vaeTSTgkhcvyR1HFjUM?=
	=?us-ascii?Q?5Hmm69LPOvu8KAi3qocpMmG+hyqFWLaY2eE6i/FXWygdguD04IDUZ5ygd2SG?=
	=?us-ascii?Q?ZImYUWvP/2Y5svA+2/AdyGbKG/1kZOd5cao9DRt9TyAyjl3hsjmfi4+vhRf7?=
	=?us-ascii?Q?2ud8HskztNvvXWQddmLh5oLs4phTLNbjuG/R1kkU/kGMeDzI3r/qyGhhqumc?=
	=?us-ascii?Q?ORqap+SD6FgJrA4b6rz+4W2uTjF4jrb2KufOKB2SYaNsnxTz3rRU7bH3zx+X?=
	=?us-ascii?Q?IP6vRhgMGgfpeksZp+ptfzIcoT0C6AmtDC9a3bApmdUj7WBpJ1YOrl/vflM4?=
	=?us-ascii?Q?Dvz5K7GZSEdwu772NPWpFVo/+9ASaQ8fi5d/2yV+tBH4bZEuYcivldpQXKfv?=
	=?us-ascii?Q?5dVS9zAfed8roy6AO8Sg9aP0rYWfZc8Hg0nr3Px2SnJvfcDMWEOwLt4tc+Kn?=
	=?us-ascii?Q?Ccelb8amcIzLa3zgHFvUPV5V2SO/jRvwC/2Cyw3XCfDzi/5M5s+2/5sbTW7N?=
	=?us-ascii?Q?y1Sm5xwS6o84X2Gk2OGeogJCI6rjjlG++mSmP6IZ2034hPYL3rTnWeF5sXjt?=
	=?us-ascii?Q?ML3qQ4fYscVXFNLb24LvREGP/NxEx/8l7a545CiE7vWNnNz33I8XHSxTeKbb?=
	=?us-ascii?Q?2X3ukGG1LyWYJXP0Zz4BX7sJoJBldEepJVFXBIAYtTYev4yjepeE3zjrGIzY?=
	=?us-ascii?Q?2l172cDRwgkTldEtodsnK3U2udMboqkioKMRb4EOBAkAARg3AY2Vdn7t15NS?=
	=?us-ascii?Q?zciH9PD6XCfdIWBq2IN4hZ97FPABO3RNKB5pSSFSqieuqagICFm0VXL6+xCI?=
	=?us-ascii?Q?FhauBMHYDBAXkUymlziKQc8O+/vNzghhqwdVCzEYASw7njeW53QiFgoFH2zK?=
	=?us-ascii?Q?c1G/5aaXkWb03SinWbk8YtlZUchAf0pN09dpR?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:gjxjj98sfs6uhnLZ/rRi3WCtDd2ZgVcVbvXwE/QgbhUOuULTmK6iYB7CHf6b3iGl1lfv4Btg2GDlzdUdr9FwfInAljEvF8IrpIrP84NnsN2RaoGvFtXCRq/phyjK8n7IwIwRCberKuoT2mMbpGZ6oQ==;
	24:ceu1pIebvq6zuup3zrF6AaselkA5jybCTONC2439k3xEUhcfxzO92k6bUGMlFlgaBZTFlIiw7Vb7jKyPOsBMgr4jFmkpXBwDkIhlX3HVrpg=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:47.8992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.101
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 2/7] bcm2835_property: add bcm2835 property
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
X-TUID: KDO2s/c/8emx

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
index e36f2ee..b9d94de 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -35,6 +35,7 @@ obj-$(CONFIG_OMAP) += omap_l4.o
 obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
 obj-$(CONFIG_RASPI) += bcm2835_mbox.o
+obj-$(CONFIG_RASPI) += bcm2835_property.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
new file mode 100644
index 0000000..8a6eb0e
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
+    obj = object_property_get_link(OBJECT(dev), "dma_mr", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required dma_mr link not found: %s",
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
index 0000000..f71bf8c
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
+#define TYPE_BCM2835_PROPERTY "bcm2835_property"
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
+    uint32_t addr;
+    bool pending;
+    qemu_irq mbox_irq;
+    uint32_t ram_size;
+} BCM2835PropertyState;
+
+#endif
-- 
2.5.3

