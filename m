Received: by 10.25.159.19 with SMTP id i19csp1203690lfe;
        Fri, 29 Jan 2016 14:54:12 -0800 (PST)
X-Received: by 10.55.78.75 with SMTP id c72mr13806348qkb.97.1454108050639;
        Fri, 29 Jan 2016 14:54:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v10si19930926qge.63.2016.01.29.14.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHve-0005yz-57
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:54:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsq-0000ce-PR
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:51:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHso-0003VD-Mm
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:51:16 -0500
Received: from mail-by2on0102.outbound.protection.outlook.com
	([207.46.100.102]:41329
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHsj-0003Pv-6g; Fri, 29 Jan 2016 17:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BqyR/++/q5K3DRbP4DMUyJu0r8qkuz3luxhDyfrK3vY=;
	b=dVxXh4QIAMSWP9wMzqSeNsvlAm4ILHtp8ZuMaGkfYAeZPdU4OXwsmId0Bu4mFYiHXnRzqZEBQbW3ZokeNZMs/bwX/EvapD7vSik3ILPL4S7W6JNS0f2gL0SxHY0g4eAu9gJkJeqAHNbawl5zFJSTJmLX3xTBeC/4d2ixXvx+tIQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:51:06 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:41 -0800
Message-ID: <1454107844-15704-6-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: 8d1db1c5-1383-4b28-92d5-08d328feac94
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:4hj4NFcSvtoXE5hRWW+OAy8vrRucDDuZraO8tcskj1Z6UwgegrTepDRriOFDLVHHjIs50Nuhs1htgaDvFr64Mtd/EnmGFWNc/HX83y1MfZ03qI7ZNsNqxyf/DLlNSMA/9tXLcIqtIZgFmI+ZMjBUIEY+/EUggfOTXCtj3lD56FSgeBs+vhDQAuXP+BfpEKup;
	3:RVUu2mIB2wyJrQkrtbreyQV+C0BUoUiGgeM5iST1l9l3OhRmlwVZL2prbpLbRaBiizkMChCf25clOU32hHto1C4lY2zmy2YV17hzG8jWJBnjYjCnngdG7HScW7CTXZhu;
	25:5XMURayFi6Y8dqCv88v8rgu1Hab5TqT7Ynzi8pIijVGN8YTSp+ZWmhJTk91vwYtFwNf0tDkBL5vQf49IjoB3Jp/s1NLSFIe1t/sFM1CZQgUWA6Sn2N+reK18xAE8W3pdEmWU/kps5b7PNCh8v6mtaVwBNXgPV1gKXviSequ2Gt1VIVSYBQUOdBd16nuh6noNlaWSgyAGLOTQa89AFG/MwkNQmGkG4O7KNnSU+NaO5Gw1xyzY5PwU9fqKkwA0+q4uD/Ct8VeDgpZRzHTs9ygxPWN/532cgC32DppVh8x/9PQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:rUzPl0hYWGaThJEfw21UMeZrZitpHV8j0IKERkdvpudNdBjJgpzWKbUfYRoLj7ehnjbFBInI2hojM+4QukW6sGhIkCEHotCZ5CJ902/x4fhxltwZuwmTkosxZIlih+PZHH6UyRx/sQbz4Yv3DaNC8ZNEYiq8tvFLUzF9TijsWHOS39+jrujOU8dzj5Up5ZZdyDfNOrUQ4YjqdPiFee1FRGfST1fzOrnxAr2B6ZqVJx64OQPniJlvR5ey0ZYyjQLjfgFcaZx1yvf9ZbV7lmLOU2Sy4TvwQah57XjKDBjDCV2Aiek5LrMWnJOkhjurPWq0JTfIsZWO3Z0dbkQJFLzO5dCQiGiH9MjszuHAkb2YmFwfpa1ulcy85Pn8y0iDCDzJQk0p+yWrFDdGZtjR30OQu6esfhSIZLMRsTJgx7Fv1fZz69QvaakDYjrdchPG2r+SF2fpZv4mcfVdJYnZsdpz357+PRXTu8BQpGBxpZ0eE5YqEY5q2AhXsagGiBnThj50;
	4:s3WF1b0BeytHgqWmw/8eici17qoOCBEoUly8uYqAWfUH9OLVkrHQGGzDXXS1/2dzGhEBdsNEpi+oBqDty1Ljqwbk5+CDBIAc+ol2bFJYn9XL0a88dQDTEif8lzLfDLwUxyQV9vTJwr8E3/TRAaZCartRuvnlhTR8uHwrxTNIokYVfsXu22/mZGCf9MR1ubadb889aqoXQnerP5zjPI9O5YNiEjWs9EgtI8fXxt5ko1hRZ/t34vmIgBwyR1f5NoyzcioMHoCEZ5p3/zVpoHtAfvhpce4DpEkZZR8vVhEJs4uPoA0nl3NpAxRkcJK8G8qBGZzkxiTBJl//ZY7l90N6yzTEo6V5Y/Fkj6FrWNs1sxGgjgt86TiHSUdTaZ+Nn/xJ
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2034551CAA90D6726FD20CF79EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 083691450C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(52044002)(229853001)(2950100001)(1096002)(6116002)(15975445007)(3470700001)(122386002)(107886002)(5003940100001)(110136002)(5001960100002)(40100003)(48376002)(47776003)(86612001)(575784001)(86362001)(50986999)(4001430100002)(189998001)(76176999)(586003)(92566002)(10290500002)(5008740100001)(87976001)(4326007)(50226001)(2351001)(10090500001)(50466002)(36756003)(5005710100001)(5004730100002)(77096005)(19580405001)(2906002)(19580395003)(42186005)(21314002)(3826002)(309714004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:iWXHtBacgfGU8jo6/5XR0VWDbdftHgUaDmQQZYz?=
	=?us-ascii?Q?3/k0Vd9baaidI+w4ub+y7XYVHUbRSHqslGziIH939NjLFE5m8Af6N1tB5WuB?=
	=?us-ascii?Q?ztdg2rT+8yuSfthyP/oBnv1El5NpHVPDWYVlPpAxyQ5sTm1N6108W9VhL+le?=
	=?us-ascii?Q?nai17I2NF0FmskAzQQ7VMBFAZl+QlNKNPvpaWmsWZgnQrXMe3RVc0Ja0i2Sb?=
	=?us-ascii?Q?5UX+vcmVY1kiejeHP3nIDMbBxAgKx8dpO2r0WQ5gB19IB1jJNqc3Hn2QmtCf?=
	=?us-ascii?Q?8icC62fHV02Nu/PWM4p+pZPazSIt+Y8hW+99lA5yLINzaLP0lXp0+mYRnCHd?=
	=?us-ascii?Q?hOLrGlvG03f0Mibk8izcY/04s6Zs65iDMA1ndAAY5pc3+jnhflmYh+aexD4j?=
	=?us-ascii?Q?WzHMLViIyq62lGDHg+3tLWuW5jq5IoUO3bhF1jhiUb8nwWlj7P98o5BYdyYo?=
	=?us-ascii?Q?Nfd/JAS4lXIN8XZ/W0iScOtuThuCEFLGGjSHgfOPjkFfl6D5fM4xNV/unPZO?=
	=?us-ascii?Q?oAv7IPTGICx55QOnKAIVyyE7ylvv3yT8QhosNQK/dT47/kvelZTU4mScpDdv?=
	=?us-ascii?Q?OwjlemcYpLbwdxgohG5PZkkrB4nI8YrxZr7ic/fo+XHqXSqC6u1giSQfX6Ru?=
	=?us-ascii?Q?LoXl7iukRPSyhvTl8G5fJIsFSbvPydUHiXUCz3elNZfn3DXtYuzrO/g9BlBB?=
	=?us-ascii?Q?hHc0J/9b1zwz1dXNT2AfmByOcLsZZkbHniADVRYMIO5G0Kp+IbO8zDxKpKvs?=
	=?us-ascii?Q?zzbvLjTMg4TF7h5wqioGkcPP/qmCRezkThiUyWJwEQzd9C2zYVP7UlmywdGJ?=
	=?us-ascii?Q?7PTA+Grvilt6fuaLz9aj8gjpLnilLaSQ0j36fna6eudVTlFhYvzas9cnUg1O?=
	=?us-ascii?Q?24AMYGGYhCWjxjdVqY1tilY38hJ+c+0LRyK878crE6iC/UUT887qukAOuKAk?=
	=?us-ascii?Q?9tfzyIbFCiJ2Nv3Rtwj7lqJCsAySwFcuIHisiGGik55vmEr121zVxFYEsBW9?=
	=?us-ascii?Q?vmZPgUL+n4LuRHIZSk6iT+WFXq9HhsfxMBQHriZzWhYiwEud0rfMEfkPpROK?=
	=?us-ascii?Q?bPc0uUx2iZ8570/LHS/3zFvuJLazM9O3LvNBKWQkVIbzbJDU9W4au/mGQ9kS?=
	=?us-ascii?Q?2X5aYwI08ySJWVAYG8eduZjV8nIhka3GW6bSxj9e8fwvxuHBJ3tuxZ31MNjZ?=
	=?us-ascii?Q?MSpt6YCr8kUIgvtkrnSR2LbrMPB6ioUd4+yGq?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:lPOfW+uxMWk+XJ5ckApzQZ7br7uEBE8E6ysgSNB0er9Q11pOH9z4gS2XUV+dJlzz5ogSxoD4wVpqX5E0E11oJH3uQK4PkWMDYsLFa0c6Ezu3HTdOP2ZbycwrqzUQPk1JHpimBxmBfPfHr0m5jUlVEA==;
	24:tJTUVWQb7M1Yi1zLHSzUZtibK7isel3THbk6ytLlExCft+TsNeDP7GYkc7IsRbI1eMwLf/3+rgxAsmUJdT2IXqm0JXM5PMoHrBNVtPBwaGM=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:51:06.2843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.102
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-arm] [PATCH v5 5/8] bcm2836_control: add bcm2836 ARM control
	logic
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
X-TUID: t4VnfnVr1LWU

This module is specific to the bcm2836 (Pi2). It implements the top
level interrupt controller, and mailboxes used for inter-processor
synchronisation.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v5:
    * <= IRQ_CNTVIRQ rather than < IRQ_MAILBOX0 for clarity
    * refactor state struct to keep derived state separate from migrated state
    
    v4:
    * delete unused defs
    * s/localirqs/timerirqs/
    * factor out deliver_local() from bcm2836_control_update
    * use deposit32 in place of bit manipulation in set_local_irq
    * introduced register offset defs, and reduced comments in read/write handlers
    * delete commented code
    * s/_/-/ rename GPIOs
    
    v3:
     * uint8 localirqs
     * style tweaks
     * add MR access size limits

 hw/intc/Makefile.objs             |   2 +-
 hw/intc/bcm2836_control.c         | 303 ++++++++++++++++++++++++++++++++++++++
 include/hw/intc/bcm2836_control.h |  51 +++++++
 3 files changed, 355 insertions(+), 1 deletion(-)
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
index 0000000..ad622aa
--- /dev/null
+++ b/hw/intc/bcm2836_control.c
@@ -0,0 +1,303 @@
+/*
+ * Rasperry Pi 2 emulation ARM control logic module.
+ * Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * Based on bcm2835_ic.c (Raspberry Pi emulation) (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ *
+ * At present, only implements interrupt routing, and mailboxes (i.e.,
+ * not local timer, PMU interrupt, or AXI counters).
+ *
+ * Ref:
+ * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf
+ */
+
+#include "hw/intc/bcm2836_control.h"
+
+#define REG_GPU_ROUTE           0x0c
+#define REG_TIMERCONTROL        0x40
+#define REG_MBOXCONTROL         0x50
+#define REG_IRQSRC              0x60
+#define REG_FIQSRC              0x70
+#define REG_MBOX0_WR            0x80
+#define REG_MBOX0_RDCLR         0xc0
+#define REG_LIMIT              0x100
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
+static void deliver_local(BCM2836ControlState *s, uint8_t core, uint8_t irq,
+                          uint32_t controlreg, uint8_t controlidx)
+{
+    if (FIQ_BIT(controlreg, controlidx)) {
+        /* deliver a FIQ */
+        s->fiqsrc[core] |= (uint32_t)1 << irq;
+    } else if (IRQ_BIT(controlreg, controlidx)) {
+        /* deliver an IRQ */
+        s->irqsrc[core] |= (uint32_t)1 << irq;
+    } else {
+        /* the interrupt is masked */
+    }
+}
+
+/* Update interrupts.  */
+static void bcm2836_control_update(BCM2836ControlState *s)
+{
+    int i, j;
+
+    /* reset pending IRQs/FIQs */
+    for (i = 0; i < BCM2836_NCORES; i++) {
+        s->irqsrc[i] = s->fiqsrc[i] = 0;
+    }
+
+    /* apply routing logic, update status regs */
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
+        /* handle local timer interrupts for this core */
+        if (s->timerirqs[i]) {
+            assert(s->timerirqs[i] < (1 << (IRQ_CNTVIRQ + 1))); /* sane mask? */
+            for (j = 0; j <= IRQ_CNTVIRQ; j++) {
+                if ((s->timerirqs[i] & (1 << j)) != 0) {
+                    /* local interrupt j is set */
+                    deliver_local(s, i, j, s->timercontrol[i], j);
+                }
+            }
+        }
+
+        /* handle mailboxes for this core */
+        for (j = 0; j < BCM2836_MBPERCORE; j++) {
+            if (s->mailboxes[i * BCM2836_MBPERCORE + j] != 0) {
+                /* mailbox j is set */
+                deliver_local(s, i, j + IRQ_MAILBOX0, s->mailboxcontrol[i], j);
+            }
+        }
+    }
+
+    /* call set_irq appropriately for each output */
+    for (i = 0; i < BCM2836_NCORES; i++) {
+        qemu_set_irq(s->irq[i], s->irqsrc[i] != 0);
+        qemu_set_irq(s->fiq[i], s->fiqsrc[i] != 0);
+    }
+}
+
+static void bcm2836_control_set_local_irq(void *opaque, int core, int local_irq,
+                                          int level)
+{
+    BCM2836ControlState *s = opaque;
+
+    assert(core >= 0 && core < BCM2836_NCORES);
+    assert(local_irq >= 0 && local_irq <= IRQ_CNTVIRQ);
+
+    s->timerirqs[core] = deposit32(s->timerirqs[core], local_irq, 1, !!level);
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
+    BCM2836ControlState *s = opaque;
+
+    s->gpu_irq = level;
+
+    bcm2836_control_update(s);
+}
+
+static void bcm2836_control_set_gpu_fiq(void *opaque, int irq, int level)
+{
+    BCM2836ControlState *s = opaque;
+
+    s->gpu_fiq = level;
+
+    bcm2836_control_update(s);
+}
+
+static uint64_t bcm2836_control_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2836ControlState *s = opaque;
+
+    if (offset == REG_GPU_ROUTE) {
+        assert(s->route_gpu_fiq < BCM2836_NCORES
+               && s->route_gpu_irq < BCM2836_NCORES);
+        return ((uint32_t)s->route_gpu_fiq << 2) | s->route_gpu_irq;
+    } else if (offset >= REG_TIMERCONTROL && offset < REG_MBOXCONTROL) {
+        return s->timercontrol[(offset - REG_TIMERCONTROL) >> 2];
+    } else if (offset >= REG_MBOXCONTROL && offset < REG_IRQSRC) {
+        return s->mailboxcontrol[(offset - REG_MBOXCONTROL) >> 2];
+    } else if (offset >= REG_IRQSRC && offset < REG_FIQSRC) {
+        return s->irqsrc[(offset - REG_IRQSRC) >> 2];
+    } else if (offset >= REG_FIQSRC && offset < REG_MBOX0_WR) {
+        return s->fiqsrc[(offset - REG_FIQSRC) >> 2];
+    } else if (offset >= REG_MBOX0_RDCLR && offset < REG_LIMIT) {
+        return s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2];
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return 0;
+    }
+}
+
+static void bcm2836_control_write(void *opaque, hwaddr offset,
+                                  uint64_t val, unsigned size)
+{
+    BCM2836ControlState *s = opaque;
+
+    if (offset == REG_GPU_ROUTE) {
+        s->route_gpu_irq = val & 0x3;
+        s->route_gpu_fiq = (val >> 2) & 0x3;
+    } else if (offset >= REG_TIMERCONTROL && offset < REG_MBOXCONTROL) {
+        s->timercontrol[(offset - REG_TIMERCONTROL) >> 2] = val & 0xff;
+    } else if (offset >= REG_MBOXCONTROL && offset < REG_IRQSRC) {
+        s->mailboxcontrol[(offset - REG_MBOXCONTROL) >> 2] = val & 0xff;
+    } else if (offset >= REG_MBOX0_WR && offset < REG_MBOX0_RDCLR) {
+        s->mailboxes[(offset - REG_MBOX0_WR) >> 2] |= val;
+    } else if (offset >= REG_MBOX0_RDCLR && offset < REG_LIMIT) {
+        s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2] &= ~val;
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
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
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
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
+                          TYPE_BCM2836_CONTROL, REG_LIMIT);
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
+
+    /* IRQ and FIQ inputs from upstream bcm2835 controller */
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_irq, "gpu-irq", 1);
+    qdev_init_gpio_in_named(dev, bcm2836_control_set_gpu_fiq, "gpu-fiq", 1);
+
+    /* outputs to CPU cores */
+    qdev_init_gpio_out_named(dev, s->irq, "irq", BCM2836_NCORES);
+    qdev_init_gpio_out_named(dev, s->fiq, "fiq", BCM2836_NCORES);
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
index 0000000..613f3c4
--- /dev/null
+++ b/include/hw/intc/bcm2836_control.h
@@ -0,0 +1,51 @@
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
+#define TYPE_BCM2836_CONTROL "bcm2836-control"
+#define BCM2836_CONTROL(obj) \
+    OBJECT_CHECK(BCM2836ControlState, (obj), TYPE_BCM2836_CONTROL)
+
+typedef struct BCM2836ControlState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+    MemoryRegion iomem;
+
+    /* mailbox state */
+    uint32_t mailboxes[BCM2836_NCORES * BCM2836_MBPERCORE];
+
+    /* interrupt routing/control registers */
+    uint8_t route_gpu_irq, route_gpu_fiq;
+    uint32_t timercontrol[BCM2836_NCORES];
+    uint32_t mailboxcontrol[BCM2836_NCORES];
+
+    /* interrupt status regs (derived from input pins; not visible to user) */
+    bool gpu_irq, gpu_fiq;
+    uint8_t timerirqs[BCM2836_NCORES];
+
+    /* interrupt source registers, post-routing (also input-derived; visible) */
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

