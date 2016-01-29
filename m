Received: by 10.25.159.19 with SMTP id i19csp1202979lfe;
        Fri, 29 Jan 2016 14:51:56 -0800 (PST)
X-Received: by 10.140.195.136 with SMTP id q130mr14820081qha.45.1454107915982;
        Fri, 29 Jan 2016 14:51:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si19895102qge.102.2016.01.29.14.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:51:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHtT-0001V4-FB
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:51:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsj-0000QU-M6
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsg-0003OJ-C5
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:09 -0500
Received: from mail-by2on0114.outbound.protection.outlook.com
	([207.46.100.114]:52096
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHsf-0003N9-UJ; Fri, 29 Jan 2016 17:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lZbTlq4dMeYjxaXzts4N9iGqwQHu6sYT2xRbbT7LHXs=;
	b=lBL/bbhXXfZ6zMu1jgCJ1Gve8PryZFW3hYzdQ2i93biyHdfxxWSvuDkaODPIhGoV1cwRXuKrMT/egNfbGdCNnUBCR4ZpH5wq737qzy6CIOfLKICJ7EWw/uWkuo1Od2LdJSwj/GbkpP9YXRI1plxowjXuWFXkguRhY9oXgQJoCIA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:51:02 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:38 -0800
Message-ID: <1454107844-15704-3-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: 5a04f6e1-8162-4d21-58d9-08d328feaa58
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:cs617Oubf2xTKb53pQTkN6mSn3tut4qtFI5MR/c3hu7gBZ8QmsmuZfEuZmwaVmUCTP6SMnWb0kOSJh2ICTr1HrerRWBq087zMg5u2s12svKz7wbNWjaQGy6dQkKzvmwkjfRQI09Gv4enJiZch2XN3J2o8GP3TUKn5sXPFuI73SkelgxhuqgE+By3tvXCqI7F;
	3:5lx+PUnBjWQQQoSZy3KYzoSS7tuw+pgfFtLqOdVHPzs8Ua9UdOAM6gXM9DHdM02T7yY8BYeBqRp/3t8wJvf4k2xkmpJ0iTD0pSsM4SykL46wPLoqj7D+bONnmq/ND1/p;
	25:cw1uP63VLtU/TZTDq6NHbD6SuXAr6YkO68oIbjpdN2yKtNJQ+d0VF2CcNWoUCKLqaOo4jqKe628vSHgwQ4YGj0Mc/o31RB+JhfugvLjc3gq+d074wEkG/+A8x4ioVgOdI952/PT+9E4xFZ6Wel87rgrWPW4rnEEN1JtlfCCESMx/f4MvRPRUz6gn9Jlunz2UDH9kMVjzIFc/asYQ2qLcgtY9pQQwukBDU0VxNmOD/MQ2ji7YFojmUiwi3pHeChJBPolXGMR8pCRt3kYqDhOC25AU1XNUQzYsk6UDSYUCmVo=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:aAbdvj9w5SWURJPodFjGJVn6awIUNzWHBnWRNrBaOsCUD6roctl562O/rpS7bSvhOTXtVHtR5QNbRrPA4Daw0NeFGlpWmOmSlO2ZkM+4dAH4uhxCzOtGpXYnqvsT/gf0c2kDIcQXw8/OaXyfm33+I4aynqVOFnb76saf2BN/9kqLX4qT6MbPKuVMOaZJqkrj3Q1eAmpFPtho3jE9quHJ0P1j5hPVJlmPq+o/wJooHAEVSzMSmiGYm5ZzHxQ1sYPhNFjyjEeq+3QeWKqDU6m7e+8M26oBLUnAcVTgb7elfJWbN+1f9i567cDzXDcTWgRb6edsBIsdM7q3xggSVuEWpS5jTVPHHBFbxRa2QUhUnerKmGakDw6it7URnykrq3crOWYJn3ZQ7MecaV5eB0tPK8evoZ0d29cy7qWFC+Eb3BtnCxqLhmt4ez4uUh7xe0acqwBpg7H42WuixrRmD0Sv2P86XeJQ4sxALm0j/l0vsclM+uk/9toKp8A21Q52Leq2;
	4:BPg1d+NkfLX8mQukaxV42F4kEzZsxsNymxNf2alpGPBXS9ER4COm6TdLZjzHp0uYUJZX0436Dkr+PCBIWdQ4Z0juYQiaOXwiGJomUhfAIVvqIt68QfrEV25EqxQK0sgFeKTETK7+r6TqI7h5eOeYvU6a6x4kI66/ZA8irnOgMAzGMsF1n+9s1ZbP/n+dc0dRqrk2vxw+gVbWpGBu6O4M9OJdwtNDCu8q8+KZw0N0vdgQCDLhtJt6QRFtLLBDt3lckshrhYP5fCBOq6bwwY0i9gkuMOndJffTQZEpZ9hmGKkaDtm47dFz3bwTbNodfVFZDnLXfZiJM1cq2SBiZwsl0iY2MBQ7ivcbN1O6bx92t7teb6cs2isxwmmMriLwgdfL
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2034CAC43B9D6EDCB56B26919EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 083691450C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(229853001)(2950100001)(1096002)(6116002)(15975445007)(3470700001)(122386002)(107886002)(5003940100001)(110136002)(5001960100002)(40100003)(48376002)(47776003)(86612001)(575784001)(86362001)(50986999)(4001430100002)(189998001)(76176999)(586003)(92566002)(10290500002)(5008740100001)(87976001)(4326007)(50226001)(2351001)(10090500001)(50466002)(36756003)(5005710100001)(5004730100002)(77096005)(19580405001)(2906002)(19580395003)(42186005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:yR6ZVGM6pGPu1F+lL74Yxr1Ty7hkHrNWz7ipQ3g?=
	=?us-ascii?Q?022iDb9cj5vwddbjgBQxe9F2a6Zqs8DUNexjdmCnAAt1HklO6+jYjZiz7vZt?=
	=?us-ascii?Q?1Rw+QWRWmhCLm2t+pE9uqJJiYv5iMxJBItqlvZP80o/Xtfhq2LETdRmCTdE5?=
	=?us-ascii?Q?KuwMu31w4kvKiqfXCSGdXDuXfdGRvatmTp/xuEo4Tsh7SThk77O+aC3nURFo?=
	=?us-ascii?Q?KDjaECrEOG46Femdiqn2ccVKLOF9xBuxr6dnk2LG5wbrkXkaIU+qoKcCep4Y?=
	=?us-ascii?Q?CHWONQRYoHslNJwzvWOZxNq9k6o8aaUfGIJ4mjcXuheHNLZOnDSzxeXZGiIo?=
	=?us-ascii?Q?cRtnS3gKFsVNOvwx1gs5r9672nKE6N4FVu5rnYh7c8ah7iDHbouFKeo3MOmF?=
	=?us-ascii?Q?lo8adTRg/hK1BH/dNyDEyZeyTEIi3n+1lDZtrKO+AhLopp3SI+a9I2Myaxj3?=
	=?us-ascii?Q?gMs05G+qPdFXOhkslv/025Amr4CVgq4Qzs2TROct4dCr8Jbr11gLbkGAY8t/?=
	=?us-ascii?Q?KDjkqdADXIw1g7185Di+0wdVe2xHKy/mXa5umE+DK3hp7sOkfN2eraTzhP8v?=
	=?us-ascii?Q?2ISX7t2uPEZ/Im8Y8RfuGV/oOAJ+wGmVisL7VietfabAFccRmyQFBRo8FCjH?=
	=?us-ascii?Q?OH81wVdxolnfixngFjZXmP5nWWdcbTt8bkhpdmz7urosuH7ATnbsgoxH6s7r?=
	=?us-ascii?Q?XApg5ziU1oNGfbX7Lbe6mOfLLZIZoXOdEiRkio++fAzvMVF0ezHIV2JBw/1d?=
	=?us-ascii?Q?TLaCNHxTj2MJE1OGKZhg4YmoeKFGgdFJv4/qmLG9LJ7swKUZ2/R0DIdc73X3?=
	=?us-ascii?Q?fVHHoTiNsfqy027h0KalWwnS/Gp6CP0VS/5DeCuzt1tSkDZuc7ljt9fCT6Zb?=
	=?us-ascii?Q?ALuhRmRu+Fv99v0ne9HWQcmHaGydmTZ30BdH2LftA9lc75L21aogUMwsTcGn?=
	=?us-ascii?Q?caRq3yMNcLyzyz1Sd9gJ8iautZwGUMhCbQD/6qxwj8iN3D9uLtwGn4rlyzYT?=
	=?us-ascii?Q?YAUkBRaPmYyqtc6hA6/0ofIyfeFuIrKS5Ev+/fl3RARuJcgJzXkCHqLb4th7?=
	=?us-ascii?Q?EUfVrxagE6tvKWW7qdgDMcVKwc7DywvVlwBUXmE4OvY+oqgz++k1MLG+EjFP?=
	=?us-ascii?Q?ipkp2UP66HzA7s0YPj0TufDTnTGhWI4QQ?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:AymvS/0aFI61JbZ+tyKpta358PjpuAfM4bHne6T3j8Kvr7jBYHYYuk+6cWi2r+6UQvoO6FfpSTogeQIX2MOLZVWpoQz7wWXCc32s74LAfcWltUsM0nqjFGGjIuBj89OHTqeEqplmJ059ahucZe26Og==;
	24:pRMh4jmgcZbBJOPv9/b5/+XmoC9QxYqQp5LBY2YLPjEekmHzGOY01mnu+gDiKYfXQ9/qaUPPxq6WfEjg32otx7FG21AMb9avRf8WU/oSozg=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:51:02.5498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.114
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v5 2/8] bcm2835_property: add bcm2835 property
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
X-TUID: 58G0skn8qQzt

This sits behind the mailbox interface, and implements
request/response queries for system properties. The
framebuffer-related properties will be added in a later patch.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v5:
     * minor style tweak
    
    v4:
    * added LOG_UNIMP as appropriate
    * use qemu_macaddr_default_if_unset to allocate a MAC address, and dma_memory_write to write it
    * assert that we're not pending, rather than dropping a request on the floor

 hw/misc/Makefile.objs              |   1 +
 hw/misc/bcm2835_property.c         | 287 +++++++++++++++++++++++++++++++++++++
 include/hw/misc/bcm2835_property.h |  31 ++++
 3 files changed, 319 insertions(+)
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
index 0000000..e42b43e
--- /dev/null
+++ b/hw/misc/bcm2835_property.c
@@ -0,0 +1,287 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "hw/misc/bcm2835_property.h"
+#include "hw/misc/bcm2835_mbox_defs.h"
+#include "sysemu/dma.h"
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
+        case 0x00010001: /* Get board model */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x get board model NYI\n", tag);
+            resplen = 4;
+            break;
+        case 0x00010002: /* Get board revision */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x get board revision NYI\n", tag);
+            resplen = 4;
+            break;
+        case 0x00010003: /* Get board MAC address */
+            resplen = sizeof(s->macaddr.a);
+            dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, resplen);
+            break;
+        case 0x00010004: /* Get board serial */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x get board serial NYI\n", tag);
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
+             * and we'll just claim we set it to the desired state
+             */
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
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x set clock state NYI\n", tag);
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
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x set clock rates NYI\n", tag);
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
+        /* bcm2835_mbox should check our pending status before pushing */
+        assert(!s->pending);
+        s->pending = true;
+        bcm2835_property_mbox_push(s, value);
+        qemu_set_irq(s->mbox_irq, 1);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return;
+    }
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
+    .fields      = (VMStateField[]) {
+        VMSTATE_MACADDR(macaddr, BCM2835PropertyState),
+        VMSTATE_UINT32(addr, BCM2835PropertyState),
+        VMSTATE_BOOL(pending, BCM2835PropertyState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_property_init(Object *obj)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
+
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
+    /* TODO: connect to MAC address of USB NIC device, once we emulate it */
+    qemu_macaddr_default_if_unset(&s->macaddr);
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
index 0000000..fcf5f3d
--- /dev/null
+++ b/include/hw/misc/bcm2835_property.h
@@ -0,0 +1,31 @@
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
+#include "net/net.h"
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
+    MACAddr macaddr;
+    uint32_t ram_size;
+    uint32_t addr;
+    bool pending;
+} BCM2835PropertyState;
+
+#endif
-- 
2.5.3

