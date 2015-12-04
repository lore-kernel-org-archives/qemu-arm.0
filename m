Received: by 10.182.158.201 with SMTP id ww9csp414227obb;
        Thu, 3 Dec 2015 22:04:14 -0800 (PST)
X-Received: by 10.140.218.80 with SMTP id o77mr16245365qhb.22.1449209054765;
        Thu, 03 Dec 2015 22:04:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j64si12596832qgj.115.2015.12.03.22.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 22:04:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4jTa-0001vb-G5
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 01:04:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSh-0000cj-1R
	for qemu-devel@nongnu.org; Fri, 04 Dec 2015 01:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSd-0000CT-Ia
	for qemu-devel@nongnu.org; Fri, 04 Dec 2015 01:03:18 -0500
Received: from mail-bn1on0111.outbound.protection.outlook.com
	([157.56.110.111]:25728
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4jSd-0000CJ-CC; Fri, 04 Dec 2015 01:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iqhP8picJD2ktW3/u5eEVgIZm1Ld44Zd5JvHw6sE2sk=;
	b=aGHiuSte3UeOiJLMp2t5tWZCFCqPI+Ny3jZPaSBJOIaDfjijadQ2Nq11PncPTdVXI4b9e8RlVf3mm8EBkAppso2ZSpLWYBSlG6t6YktXZZvHRR5klDyLgdhXF6q8/05uLX7tp0eTbgFSZ+oOAbQo76qUOvxkumZb1LyA5bhIgtE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Fri, 4 Dec 2015 06:03:12 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 22:01:25 -0800
Message-ID: <1449208887-9564-6-git-send-email-Andrew.Baumann@microsoft.com>
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
	2:cg+tE8yKzQhLxJmdy2MED5MFQkg4qlIGId9/4nuZGbgq+VjjJAhZQIMfaq+fJ9oMbwMuShCTld0bU8YjDB8pVYCgzM9XmoPquOJpHhaUWFNdLbRsosUe1AIqoKIf9kKEhz24XcuqRrXoy4YshzNTYg==;
	3:J3aOL7v3jUDZW9gbe4TATN+L8GsYQR4s5gnB8L/cUdnGtTWQaJetJXeLALAsTUjpGA+YQmO5PZhMC+geVF9eEAh4G9DSYAZKMZ7ZISYDtevMJplq5voQiOhpc3IcZhsH;
	25:yFABhKMbSIPnh7v5JC9ifF2Ehuc0/UgShfOQBl4DlwaCuEIFHpyFk1s665FUBdMpCLUvnUOZg+qBx9TfuTnCjnroQI/0VuOVRhns82y2AU6g9NWH1WbcStptEGaftgri1T+HlRtyiYNNMvPlXzPAtSXTvMEnLqU0kqmDq/lVGqCw6DqkIdRe2VC3Sg9FZD0pIjxuiQogmfu1z4jfpBTK4qc+JGXPkihlrA1m+YzL9Q1TWSYv3LbUD0KQU1EIAFpq8qprMWs5PWxS0R3EI2aV8g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:mAU47NHINaq9NV66WtN32vLyYG89FUtnrdpOijF76IOlCWM/WoqIbgIraSJrg5tNQFk+WKjIS7mDLA90Bf4gufBNw+uOMWsCScsE4xx/e+JsSidcziK4t9a/RqyauSh6hSp7ENUUjm/EPt0UgtTKvosawj4HwXbTbb0n/5XVesidcWQsR8b/Q6/A8l87/XDeSNGOdKGiquCsx4azT/inh5aKQpWrkZBZniqRZo0Jq765IYwCbvU8+kC11+gtjF+NMkX+7MWoOJf0Ogwe6CaUAoSlrlyhsfke+NnnA15sOPuNhYplIYvOr95Cgv4WAA+BrGSwVvRC3XsS9+72s+ov+D5u9qVfcrkJQg+8DJqFHvAPqQ/Ml0JxgQKdFKLXpnTebCv+yE+CM5v6XRMucTlfSOjequwkGH0WU/gkjKRXs919/Eq8L5P0ac2hyIYMpmfEUFyrEtvlJ2o5mqLPK6eJzDlB+x59wB8+9OLAevN1sJGfhovp7aCjY5eyT7bb8ccb;
	4:ctlAHGWXnoAuFxZIV7dqIQ2uR+VV8KM2NQkjkCrTgrLhkcT0NHqNSkonhY1VVY+dYYQd09nMKpobUPvVAlUOKKlAJYlltAMpPp24RjrN+te7iB6/zspMD73r5BW8GBKvGhTPhgCQkQY8UBfV69z43ZUuHo6kMVQPP+piPMUP0BB2wASnuKsoIUHjueIOPskKiiDbGDiua8Hp6pFm3E5sPXSeuyj8bI0uHWLVZfitvhkQ4SY9t98vbllmUUoqqeM97hHdTuVVBgOl6VFlnvlXQVA5agxYjx7BSzhbWO6IDPLCgWqRjNYEpULKkofuC4SJwzEyiaJ9l2yhWoU8JEoz8cbM9H2/Fz9v7JMHIkSW5zMadfmT3o4wIGLSWYhPOQXG3Awx6221u2anxInYPsgTCguEUk+LPFSSKkO1znk1MCyERylpZ4vjsCt4KnKagvnj
X-Microsoft-Antispam-PRVS: <SN1PR0301MB2046F3FA49444820FCE448D69E0C0@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(52044002)(199003)(101416001)(5005710100001)(50226001)(4001430100002)(105586002)(6116002)(106356001)(42186005)(86612001)(77096005)(48376002)(36756003)(5008740100001)(15975445007)(5004730100002)(10090500001)(1096002)(10290500002)(2950100001)(189998001)(87976001)(586003)(92566002)(2351001)(81156007)(19580405001)(5003940100001)(122386002)(19580395003)(86362001)(50986999)(40100003)(50466002)(110136002)(47776003)(5001960100002)(107886002)(76176999)(229853001)(97736004)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:OTP7vrqp6wI++VZ3wnUoUQo3HhPEbOZBYNbyk4D?=
	=?us-ascii?Q?ipMdkZ8A9uUm8DShoYzdmxOv64Q0f7I925b/DpfJwLRlzkzz183Q+3LoN6CL?=
	=?us-ascii?Q?yaqg7igIDZJv4ynB7MR9TOO+2WOCW0vqhgyCB9/OHbljbX1nZEbmLok2c76L?=
	=?us-ascii?Q?keJXGtlzDuuk92tQ+hSTRZvuKuL/+gd/lVdXPNSwRZUy9wEkI9Krac44YjJD?=
	=?us-ascii?Q?AAjY56DPlrUgcgri7a0Vx57VfS7ik6qZOcdIkr4OmT6RMye3vUFiVrFNOdll?=
	=?us-ascii?Q?JHUOupG0r4pZwOz0qrzWCIZ1Qd7kJZqzpnVT4ZQ8UBaol+3dWkPNb6guQmas?=
	=?us-ascii?Q?NhusPbYppsXRX6X/jfDXVXQl809bTfA1au+P5grzsXspGy3w9Zqm6elnHj8y?=
	=?us-ascii?Q?WK6jaoRhcumo0Y3GPxzFKN27BGJ5ADywkqYFA4qR7aO9eQuDlDX2Rlk8e5+i?=
	=?us-ascii?Q?PUsI54bDPSQGMBmaoIn0q+0qwhbT+DIhhV3OQiwYhBwoPQn67lEVsqQ29U05?=
	=?us-ascii?Q?EZTUkCiTxkn731fY3IzoRfWNbiel2rmuQTaTx9GAGl4Ux9FnTQQ7KIoJtde7?=
	=?us-ascii?Q?GR+4VgK4tzTiPBa5jvrcEvQZ9BqAL0+mlDt2IxUjG5wMFaC7I4HFZGxx1viP?=
	=?us-ascii?Q?STBjwccmf5966BDPrXDeA39MTkkGzPuKkVYTUoY2ejxL6FLZ06xP4d30yf3P?=
	=?us-ascii?Q?bkVlaFwNJ1RtEl07k2v8HeKPrruFXncPENH3d/4CBNtqnRjbykitTNP6f52H?=
	=?us-ascii?Q?vjLuM2wlVlG0BbkjQwCt3fsknS2yxojuUK7tRb/gE+pCh9zfi1cMsKQPcBYU?=
	=?us-ascii?Q?o6tW+sbOcjeBPpo5XGZFbZLpAraEhJZQqKRTvFXoCDeSaDBIwjd1WpgxmZWd?=
	=?us-ascii?Q?gKebThieKceN5D055CDpAvYLChhXbARFMLe9FZwrA2Jmoz9xyC/eomE/6McV?=
	=?us-ascii?Q?ExCfs5d4MRD099B0GvwQJreIuArMXF1eHxjFicpyqOI72BaVevoSqKePnjZt?=
	=?us-ascii?Q?UL7a16lx9SBBle00OoeX14EOoKq7YybpI+EmfTaZ6mBkskdLNlpn7V51kLLX?=
	=?us-ascii?Q?8eEK2v/ino7RdZGdm2lC5AH6cqriN/EvHXqtQsDbZ/6OQMPuUXSHDR6efBJN?=
	=?us-ascii?Q?4wYVhykKSk/a8ab/3nsjnJZ9j7uKGEVDuZru7dozZaxsb7vKdCPPeb1aSD1T?=
	=?us-ascii?Q?vwXqRpLASi+gu3xpXEbzfsuA5+Ii1qCB863gwkBWgHWYBN5fjglzAmxb8lg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:EAa3MeFHjhzieHQJNme6Qt0hxRC0ImjKgYFKF5dgN46f8rrDihiuZry7IxP81CPoydRTRGuBooEL4Rg/HSoTi7BHKCuHDdCmPn5rtJ0K0CgcpOnAU5Df0smVNnNjcaUFCa1gvq+yLtx5xHRI4DTDGQ==;
	24:koksdVK/1FP246N5y+Oq855AQ5nH37qedDacgY6XMrQoKXSBitciSiVV+3rTTqs+viY0JLI/ebTaghNI1j3HCooDfojfaPBkT1+d7l6z79Y=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 06:03:12.7379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.111
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 6/8] bcm2836_control: add bcm2836 ARM control
	logic
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
X-TUID: R3F+OCJp/IEW

This module is specific to the bcm2836 (Pi2). It implements the top
level interrupt controller, and mailboxes used for inter-processor
synchronisation.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/intc/Makefile.objs             |   2 +-
 hw/intc/bcm2836_control.c         | 344 ++++++++++++++++++++++++++++++++++++++
 include/hw/intc/bcm2836_control.h |  49 ++++++
 3 files changed, 394 insertions(+), 1 deletion(-)
 create mode 100644 hw/intc/bcm2836_control.c
 create mode 100644 include/hw/intc/bcm2836_control.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 2ad1204..6a13a39 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -24,7 +24,7 @@ obj-$(CONFIG_GRLIB) += grlib_irqmp.o
 obj-$(CONFIG_IOAPIC) += ioapic.o
 obj-$(CONFIG_OMAP) += omap_intc.o
 obj-$(CONFIG_OPENPIC_KVM) += openpic_kvm.o
-obj-$(CONFIG_RASPI) += bcm2835_ic.o
+obj-$(CONFIG_RASPI) += bcm2835_ic.o bcm2836_control.o
 obj-$(CONFIG_SH4) += sh_intc.o
 obj-$(CONFIG_XICS) += xics.o
 obj-$(CONFIG_XICS_KVM) += xics_kvm.o
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
new file mode 100644
index 0000000..c47b36f
--- /dev/null
+++ b/hw/intc/bcm2836_control.c
@@ -0,0 +1,344 @@
+/*
+ * Rasperry Pi 2 emulation ARM control logic module.
+ * Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * At present, only implements interrupt routing, and mailboxes (i.e.,
+ * not local timer, PMU interrupt, or AXI counters).
+ *
+ * Ref:
+ * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf
+ *
+ * Based on bcm2835_ic.c, terms below...
+ */
+
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+/* Heavily based on pl190.c, copyright terms below. */
+
+/*
+ * Arm PrimeCell PL190 Vector Interrupt Controller
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#include "hw/intc/bcm2836_control.h"
+
+#define ROUTE_CORE(x) ((x) & 0x3)
+#define ROUTE_FIQ(x)  (((x) & 0x4) != 0)
+
+#define IRQ_BIT(cntrl, num) (((cntrl) & (1 << (num))) != 0)
+#define FIQ_BIT(cntrl, num) (((cntrl) & (1 << ((num) + 4))) != 0)
+
+#define IRQ_CNTPSIRQ    0
+#define IRQ_CNTPNSIRQ   1
+#define IRQ_CNTHPIRQ    2
+#define IRQ_CNTVIRQ     3
+#define IRQ_MAILBOX0    4
+#define IRQ_MAILBOX1    5
+#define IRQ_MAILBOX2    6
+#define IRQ_MAILBOX3    7
+#define IRQ_GPU         8
+#define IRQ_PMU         9
+#define IRQ_AXI         10
+#define IRQ_TIMER       11
+#define IRQ_MAX         IRQ_TIMER
+
+/* Update interrupts.  */
+static void bcm2836_control_update(BCM2836ControlState *s)
+{
+    int i, j;
+
+    /*
+     * reset pending IRQs/FIQs
+     */
+
+    for (i = 0; i < BCM2836_NCORES; i++) {
+        s->irqsrc[i] = s->fiqsrc[i] = 0;
+    }
+
+    /*
+     * apply routing logic, update status regs
+     */
+
+    if (s->gpu_irq) {
+        assert(s->route_gpu_irq < BCM2836_NCORES);
+        s->irqsrc[s->route_gpu_irq] |= (uint32_t)1 << IRQ_GPU;
+    }
+
+    if (s->gpu_fiq) {
+        assert(s->route_gpu_fiq < BCM2836_NCORES);
+        s->fiqsrc[s->route_gpu_fiq] |= (uint32_t)1 << IRQ_GPU;
+    }
+
+    for (i = 0; i < BCM2836_NCORES; i++) {
+        /* handle local interrupts for this core */
+        if (s->localirqs[i]) {
+            assert(s->localirqs[i] < (1 << IRQ_MAILBOX0));
+            for (j = 0; j < IRQ_MAILBOX0; j++) {
+                if ((s->localirqs[i] & (1 << j)) != 0) {
+                    /* local interrupt j is set */
+                    if (FIQ_BIT(s->timercontrol[i], j)) {
+                        /* deliver a FIQ */
+                        s->fiqsrc[i] |= (uint32_t)1 << j;
+                    } else if (IRQ_BIT(s->timercontrol[i], j)) {
+                        /* deliver an IRQ */
+                        s->irqsrc[i] |= (uint32_t)1 << j;
+                    } else {
+                        /* the interrupt is masked */
+                    }
+                }
+            }
+        }
+
+        /* handle mailboxes for this core */
+        for (j = 0; j < BCM2836_MBPERCORE; j++) {
+            if (s->mailboxes[i * BCM2836_MBPERCORE + j] != 0) {
+                /* mailbox j is set */
+                if (FIQ_BIT(s->mailboxcontrol[i], j)) {
+                    /* deliver a FIQ */
+                    s->fiqsrc[i] |= (uint32_t)1 << (j + IRQ_MAILBOX0);
+                } else if (IRQ_BIT(s->mailboxcontrol[i], j)) {
+                    /* deliver an IRQ */
+                    s->irqsrc[i] |= (uint32_t)1 << (j + IRQ_MAILBOX0);
+                } else {
+                    /* the interrupt is masked */
+                }
+            }
+        }
+    }
+
+    /*
+     * call set_irq appropriately for each output
+     */
+
+    for (i = 0; i < BCM2836_NCORES; i++) {
+        qemu_set_irq(s->irq[i], s->irqsrc[i] != 0);
+        qemu_set_irq(s->fiq[i], s->fiqsrc[i] != 0);
+    }
+}
+
+static void bcm2836_control_set_local_irq(void *opaque, int core, int local_irq,
+                                          int level)
+{
+    BCM2836ControlState *s = (BCM2836ControlState *)opaque;
+
+    assert(core >= 0 && core < BCM2836_NCORES);
+    assert(local_irq >= 0 && local_irq <= IRQ_CNTVIRQ);
+
+    if (level) {
+        s->localirqs[core] |= 1 << local_irq;
+    } else {
+        s->localirqs[core] &= ~((uint32_t)1 << local_irq);
+    }
+
+    bcm2836_control_update(s);
+}
+
+/* XXX: the following wrapper functions are a kludgy workaround,
+ * needed because I can't seem to pass useful information in the "irq"
+ * parameter when using named interrupts. Feel free to clean this up!
+ */
+
+static void bcm2836_control_set_local_irq0(void *opaque, int core, int level)
+{
+    bcm2836_control_set_local_irq(opaque, core, 0, level);
+}
+
+static void bcm2836_control_set_local_irq1(void *opaque, int core, int level)
+{
+    bcm2836_control_set_local_irq(opaque, core, 1, level);
+}
+
+static void bcm2836_control_set_local_irq2(void *opaque, int core, int level)
+{
+    bcm2836_control_set_local_irq(opaque, core, 2, level);
+}
+
+static void bcm2836_control_set_local_irq3(void *opaque, int core, int level)
+{
+    bcm2836_control_set_local_irq(opaque, core, 3, level);
+}
+
+static void bcm2836_control_set_gpu_irq(void *opaque, int irq, int level)
+{
+    BCM2836ControlState *s = (BCM2836ControlState *)opaque;
+
+    s->gpu_irq = level;
+
+    bcm2836_control_update(s);
+}
+
+static void bcm2836_control_set_gpu_fiq(void *opaque, int irq, int level)
+{
+    BCM2836ControlState *s = (BCM2836ControlState *)opaque;
+
+    s->gpu_fiq = level;
+
+    bcm2836_control_update(s);
+}
+
+static uint64_t bcm2836_control_read(void *opaque, hwaddr offset,
+    unsigned size)
+{
+    BCM2836ControlState *s = (BCM2836ControlState *)opaque;
+
+    if (offset == 0xc) {
+        /* GPU interrupt routing */
+        assert(s->route_gpu_fiq < BCM2836_NCORES
+               && s->route_gpu_irq < BCM2836_NCORES);
+        return ((uint32_t)s->route_gpu_fiq << 2) | s->route_gpu_irq;
+    } else if (offset >= 0x40 && offset < 0x50) {
+        /* Timer interrupt control registers */
+        return s->timercontrol[(offset - 0x40) >> 2];
+    } else if (offset >= 0x50 && offset < 0x60) {
+        /* Mailbox interrupt control registers */
+        return s->mailboxcontrol[(offset - 0x50) >> 2];
+    } else if (offset >= 0x60 && offset < 0x70) {
+        /* IRQ source registers */
+        return s->irqsrc[(offset - 0x60) >> 2];
+    } else if (offset >= 0x70 && offset < 0x80) {
+        /* FIQ source registers */
+        return s->fiqsrc[(offset - 0x70) >> 2];
+    } else if (offset >= 0xc0 && offset < 0x100) {
+        /* Mailboxes */
+        return s->mailboxes[(offset - 0xc0) >> 2];
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2836_control_read: Bad offset %x\n", (int)offset);
+        return 0;
+    }
+}
+
+static void bcm2836_control_write(void *opaque, hwaddr offset,
+    uint64_t val, unsigned size)
+{
+    BCM2836ControlState *s = (BCM2836ControlState *)opaque;
+
+    if (offset == 0xc) {
+        /* GPU interrupt routing */
+        s->route_gpu_irq = val & 0x3;
+        s->route_gpu_fiq = (val >> 2) & 0x3;
+    } else if (offset >= 0x40 && offset < 0x50) {
+        /* Timer interrupt control registers */
+        s->timercontrol[(offset - 0x40) >> 2] = val & 0xff;
+    } else if (offset >= 0x50 && offset < 0x60) {
+        /* Mailbox interrupt control registers */
+        s->mailboxcontrol[(offset - 0x50) >> 2] = val & 0xff;
+    } else if (offset >= 0x80 && offset < 0xc0) {
+        /* Mailbox set registers */
+        s->mailboxes[(offset - 0x80) >> 2] |= val;
+    } else if (offset >= 0xc0 && offset < 0x100) {
+        /* Mailbox clear registers */
+        s->mailboxes[(offset - 0xc0) >> 2] &= ~val;
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2836_control_write: Bad offset %x\n", (int)offset);
+        return;
+    }
+
+    bcm2836_control_update(s);
+}
+
+static const MemoryRegionOps bcm2836_control_ops = {
+    .read = bcm2836_control_read,
+    .write = bcm2836_control_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void bcm2836_control_reset(DeviceState *d)
+{
+    BCM2836ControlState *s = BCM2836_CONTROL(d);
+    int i;
+
+    s->route_gpu_irq = s->route_gpu_fiq = 0;
+
+    for (i = 0; i < BCM2836_NCORES; i++) {
+        s->timercontrol[i] = 0;
+        s->mailboxcontrol[i] = 0;
+    }
+
+    for (i = 0; i < BCM2836_NCORES * BCM2836_MBPERCORE; i++) {
+        s->mailboxes[i] = 0;
+    }
+}
+
+static void bcm2836_control_init(Object *obj)
+{
+    BCM2836ControlState *s = BCM2836_CONTROL(obj);
+    DeviceState *dev = DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2836_control_ops, s,
+                          TYPE_BCM2836_CONTROL, 0x100);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+
+    /* inputs from each CPU core */
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq0, "cntpsirq",
+                            BCM2836_NCORES);
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq1, "cntpnsirq",
+                            BCM2836_NCORES);
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq2, "cnthpirq",
+                            BCM2836_NCORES);
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_local_irq3, "cntvirq",
+                            BCM2836_NCORES);
+    /* qdev_init_gpio_in_named(dev, bcm2836_control_set_pmu_irq, "pmuirq",
+                            BCM2836_NCORES); */
+
+    /* IRQ and FIQ inputs from upstream bcm2835 controller */
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_irq, "gpu_irq", 1);
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_fiq, "gpu_fiq", 1);
+
+    /* outputs to CPU cores */
+    qdev_init_gpio_out_named(dev, s->irq, "irq", BCM2836_NCORES);
+    qdev_init_gpio_out_named(dev, s->fiq, "fiq", BCM2836_NCORES);
+}
+
+static void bcm2836_control_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static const VMStateDescription vmstate_bcm2836_control = {
+    .name = TYPE_BCM2836_CONTROL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(mailboxes, BCM2836ControlState,
+                             BCM2836_NCORES * BCM2836_MBPERCORE),
+        VMSTATE_UINT8(route_gpu_irq, BCM2836ControlState),
+        VMSTATE_UINT8(route_gpu_fiq, BCM2836ControlState),
+        VMSTATE_UINT32_ARRAY(timercontrol, BCM2836ControlState, BCM2836_NCORES),
+        VMSTATE_UINT32_ARRAY(mailboxcontrol, BCM2836ControlState,
+                             BCM2836_NCORES),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2836_control_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2836_control_realize;
+    dc->reset = bcm2836_control_reset;
+    dc->vmsd = &vmstate_bcm2836_control;
+}
+
+static TypeInfo bcm2836_control_info = {
+    .name          = TYPE_BCM2836_CONTROL,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2836ControlState),
+    .class_init    = bcm2836_control_class_init,
+    .instance_init = bcm2836_control_init,
+};
+
+static void bcm2836_control_register_types(void)
+{
+    type_register_static(&bcm2836_control_info);
+}
+
+type_init(bcm2836_control_register_types)
diff --git a/include/hw/intc/bcm2836_control.h b/include/hw/intc/bcm2836_control.h
new file mode 100644
index 0000000..b6345cc
--- /dev/null
+++ b/include/hw/intc/bcm2836_control.h
@@ -0,0 +1,49 @@
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
+#ifndef BCM2836_CONTROL_H
+#define BCM2836_CONTROL_H
+
+#include "hw/sysbus.h"
+
+/* 4 mailboxes per core, for 16 total */
+#define BCM2836_NCORES 4
+#define BCM2836_MBPERCORE 4
+
+#define TYPE_BCM2836_CONTROL "bcm2836_control"
+#define BCM2836_CONTROL(obj) \
+    OBJECT_CHECK(BCM2836ControlState, (obj), TYPE_BCM2836_CONTROL)
+
+typedef struct BCM2836ControlState {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    /* interrupt status registers (not directly visible to user) */
+    bool gpu_irq, gpu_fiq;
+    uint32_t localirqs[BCM2836_NCORES];
+
+    /* mailboxes */
+    uint32_t mailboxes[BCM2836_NCORES * BCM2836_MBPERCORE];
+
+    /* interrupt routing/control registers */
+    uint8_t route_gpu_irq, route_gpu_fiq;
+    uint32_t timercontrol[BCM2836_NCORES];
+    uint32_t mailboxcontrol[BCM2836_NCORES];
+
+    /* interrupt source registers, post-routing (visible) */
+    uint32_t irqsrc[BCM2836_NCORES];
+    uint32_t fiqsrc[BCM2836_NCORES];
+
+    /* outputs to CPU cores */
+    qemu_irq irq[BCM2836_NCORES];
+    qemu_irq fiq[BCM2836_NCORES];
+} BCM2836ControlState;
+
+#endif
-- 
2.5.3

