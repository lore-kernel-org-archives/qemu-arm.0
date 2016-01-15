Received: by 10.25.159.19 with SMTP id i19csp769709lfe;
        Fri, 15 Jan 2016 16:02:13 -0800 (PST)
X-Received: by 10.55.81.70 with SMTP id f67mr16762422qkb.28.1452902532992;
        Fri, 15 Jan 2016 16:02:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a197si16084153qkb.6.2016.01.15.16.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:02:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEJo-0000nR-HN
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:02:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHF-0004cx-4J
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEH9-00013D-Vv
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:33 -0500
Received: from mail-bn1bon0133.outbound.protection.outlook.com
	([157.56.111.133]:28389
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEH9-00012t-P6; Fri, 15 Jan 2016 18:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=69NfeZIifPfVTzz9xpJRMB0R3vYl+3uld6W5uzh2xQk=;
	b=To8kOMGiN80fh6DdCL9NGFQaCDovB2BKQbpeqAh+qREvPkot3mKY85x/xfU0mZOhM9Gf2Q2aExnSXHv2fBGSgppwhozIDeSV54hNHeM1bNB/Gqd1w55LQpEEw/ulQRoDXD47vHb9AbL/GiNYg2bGyS113lBel4sEbRD+aTQ9mrw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:25 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:54 -0800
Message-ID: <1452902337-13844-6-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: 7598aaa5-abb0-4c1d-6daa-08d31e07e5f4
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:iFAEPESo8aiFu41U+OWdL3V0MuBh/QqaOwOWIwLekilmtKr9wcY7A3w+l+NwtbaNZYHgOwgumfrvUEBi+9A3QVU+wajiGnlyBtPKkVtmOf5hTP/D/diMpDELxrbo53bPj2i7r/tWI43OJtRr4TNAY4iNUVscrnPzfvBe3n+cgzCf9ho60StoF+kskIo2BMX+;
	3:42UbwJsOAQfS1IV2j7lTT0eWHno43cogcfglVpmSsKcabfhQRwD83NB/dxmLDRotD6VwzrzPyqVvTYMwlLYQ4CLRNXZ0DCC2rg8Mrr72M8F1uSmUOBcdnu9q3P+96wsY;
	25:LKg9gmkfEKb+1B+wVyrRpVt7Ve0rOUKn7Sh+lt+VunbeVCIacZWW4husNZ2yF6wwZI6jTnn0ubKa+YBL02R35EgSADxbFHoKsRjFdwLa+XLuqwd9s+v7FeLv6OIcDw3zFaFkXZBOsA7ypVqHdm+ntRMlmOFteasPPAQPoFtTY/bs4jYZ1ubrWyNJ+UGDfn9URb/fidHr7Qm4GgyAR3iSLRX0OyfepMIJL8p29br79BLCAxHyMo0JXb6rpryPZFZGHzqS22itEIJJHrKuVw9BKVdrnVLLqW8JXOOlI8fi4UQ=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:zFBKuL01qVVlWEGAlg8P5s0UMNmnvvWJiN4aKaSm/kOFZvRbvhZH3xJQhtuWhrgiGWytAUJv9t+7Q8hjW5fhzM8v8DOSvbVCp3VTDJIWT6nWXGYvTEe18ub+cTMqPk7tJv9XVtTeV302pTRz3in06tyNHM/IHmpVKawK7Ye4nx1r1aOx8gwQjHcErGFzjzy6is/WPpAFimRywaHnWToC3ujo5Y/WIIfNAf+YotYb3rcrs93O+ylmhHnyMYnOGWCwMjuuhIgrkvr9/FB7JT32QPHgJN83gyiQsSSM34/L+ofrEFCsQRf1+WzMS9HoK57TGZJJKXAjuYvVHT2E89uVEb4JqYaTKcJrNOe7yMomYW31HWUfPrm17bi6ZWgBcK3nmj0k6WKrDbkwiHCfmc1EoGn2v1kE0lK+n2Ryf5ZtZxukulknSFs9HxTVWRuwer3Mw9G/EnFgY3l6S4OlceZQQ6j5KpNTJY7RAdox/ufTsK2XhHs8+jXVTRLkTZc5c6x1;
	4:fL3Se/iRJYVX+jv5F0aGO2GXdJ6w4QDEYy3VlBMg2IoYlyOc3NZVGJg6M0uG6/wkNeRfP19dOb25hhl94/4mMfV9/9tOhxCHqaqMFZoxnvsnkWY34AaaG2FG2YyLCA0DttMLya6i+hPhcJEw6V2f+hMFebncMVyiGHHbYzRMocX1VMfecytYZMm0/PzufxzduKyaEh2yP5cVaS0/i5d5gm3bFjhvJfWNVWn/JClNB70s16nJcZCVDtbJSJAcoYfpfk3jf36XfhweibLIoA5pwwz0H/53+7o7qxjOnFnVoNRRRnYcbLLs0rtNAS7loBkcOD1D6NCG/FjbE2oo1FMERmT9BPdB6nbRfmFD7ehzraIxe7dKOCeUP1TqoceWORi3
X-Microsoft-Antispam-PRVS: <BLUPR0301MB20333EEC5F33E47D2BF070879ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 08220FA8D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(52044002)(4001430100002)(575784001)(106356001)(15975445007)(86362001)(2351001)(2950100001)(2906002)(586003)(77096005)(189998001)(42186005)(5008740100001)(229853001)(50986999)(1096002)(47776003)(4326007)(6116002)(87976001)(48376002)(76176999)(5004730100002)(92566002)(122386002)(5005710100001)(86612001)(40100003)(101416001)(50466002)(107886002)(50226001)(10090500001)(110136002)(5001960100002)(81156007)(5003940100001)(97736004)(19580395003)(105586002)(36756003)(19580405001)(10290500002)(21314002)(3826002)(309714004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:ZsYgtcFv3Blekap6dwqCDZN+M6rDfW+SfDNyDgG?=
	=?us-ascii?Q?9LJcYs2X6NNj+Xups16XDdllg/DRfbWdiketPm1XNhzKGclgbi5UfvDNrlr2?=
	=?us-ascii?Q?eSevvJckMT/dE2iRADBqY7APfICTJqvZRry8az35WAmko23fpJdFczUhYtFy?=
	=?us-ascii?Q?deVQDH3Y+3XgKsUdN+Nxj487nbFWFMPkcxftYD9DXpfIi0n6pHn7rsy9gXIf?=
	=?us-ascii?Q?SOgC8dvPqA0u2POYLY4sKzcCtON4Pr3iKOQCxt42aRO55GY7VB6kqFwYRT4m?=
	=?us-ascii?Q?DpT79SBG8a6puVpOqPXrR/oDziabos9ydz8J3qOA5eOVZeL7Jru9hdQQagKZ?=
	=?us-ascii?Q?SBD6ZvqJZt7aV4YgUNypkzB8oP2ptOk5oMd+QdUSdrYvCr6Tt6kQGq3KHtZj?=
	=?us-ascii?Q?/CnhfKPD71rOnbj1PjgrFmhLWsXr0uJWOKTcECdfXZcnXXtzzhUTPZUpsCoL?=
	=?us-ascii?Q?m7cJItHKlyP/gAXgiueezLk99PF0MQKlcdn1HbBv+HAafaUh8l0PFsHkRgPg?=
	=?us-ascii?Q?/+2lKZfwPk+yPGEj+KUmzgXh5bTZoBl6ZKKvz/KbVFwLHE0X9XcUsVECgeof?=
	=?us-ascii?Q?OeLLrY8OFu/YAf8ZPWvUauoaVRtqVH3o4skr/0l9B9aCyLCmMsLzeYq9a40X?=
	=?us-ascii?Q?WeXV6S96mvTiv8W+9d5R0tHjpq40yfWT7GBJEyEbNhKBFShlMyOIhosZ8CMT?=
	=?us-ascii?Q?l1BLxaB9J4bNnX6FJmWnHkzrlrijl2OiLfOq5uB9gtP9dICK+XmV7UY2O/NI?=
	=?us-ascii?Q?fMrx0u9yeJ3xGRFasgWXvH+J8FylY3ACB/OEeSFiDh25XvHgZSUrUK1ODAn/?=
	=?us-ascii?Q?ylUG29mdiYf7iCKeew1xt89xuZuvCXU8mq42ttbBnYqKZbG52t9+PcrSrBD0?=
	=?us-ascii?Q?3tLezaS7mnB0QeV5sF6bMDZh0JZ7RG3ckgcnu/GddFAj9Qs/9vHQ9ec7cirV?=
	=?us-ascii?Q?w98vqZc53sldUVg4EUrlCIhdD3jC7+A7VUY/CPArdvUqe7NHqVRfdIr26vps?=
	=?us-ascii?Q?fl0X8SgUCldWYF7263FQ8MqnS3NftxBVbQUSCK16cCGQL8QQN4g+lmts4/tV?=
	=?us-ascii?Q?FB6b5Q6jYKaJnSzJH2RicNbnxIJJxAkLSjd1GizjxseLDqLWujwkb+cv1nB9?=
	=?us-ascii?Q?qBjnxKbyBZEPzPWjwkIm+7mtExUIrVSrn9sdAfVWJJ4nRMijnUps6xxUKP/i?=
	=?us-ascii?Q?u7hcI9IrhJ/RUWsYPrE6gSf7fuAgUstsmTVzE1zIfMQBeMZtxk2VlhBuxcAr?=
	=?us-ascii?Q?DtJTRm4FlL6ESxCvWD+UIQz2rUAwW9nCK2gZw9FZyBoX43q1VPSAkZ6Fu7gu?=
	=?us-ascii?Q?ccKsDVgDst5LZquoeIsdGO4o=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:zs/ODIJhXuLa0416gVbQ+M0+fZYE8btz5/GbCDUdrvvLiCOt1SNLcmcR19/vh3hGKz2cw2ZDpgIWEd/V16ETZhbykxDdxujJYLIB1pJvftEG+gkFvJEw1V90DqNROj7MegbFfA8MzxUVApel7vhQCA==;
	24:VmC8b69mMKezcqSpWW/kpAn3J+S4MBHxVte2wonn0wuMk1X+J0DvHqzI56YdlkZNuv2pIZHgyCCanVTpSIQVJ45xJ9kkL5C7QUibZ6WPYQw=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:25.1445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.133
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v4 5/8] bcm2836_control: add bcm2836 ARM
	control logic
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
X-TUID: 9l9NZf+m9kbh

This module is specific to the bcm2836 (Pi2). It implements the top
level interrupt controller, and mailboxes used for inter-processor
synchronisation.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
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
index 0000000..f0b7b0a
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
+            assert(s->timerirqs[i] < (1 << IRQ_MAILBOX0)); /* sanity check */
+            for (j = 0; j < IRQ_MAILBOX0; j++) {
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
index 0000000..144c42f
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
+    /* interrupt status registers (not directly visible to user) */
+    bool gpu_irq, gpu_fiq;
+    uint8_t timerirqs[BCM2836_NCORES];
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

