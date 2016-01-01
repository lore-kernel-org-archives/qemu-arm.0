Received: by 10.182.158.201 with SMTP id ww9csp8831988obb;
        Thu, 31 Dec 2015 16:32:08 -0800 (PST)
X-Received: by 10.140.136.145 with SMTP id 139mr32850045qhi.28.1451608328323;
        Thu, 31 Dec 2015 16:32:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f38si1191190qkf.48.2015.12.31.16.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:32:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEndX-0003CZ-QT
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:32:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndR-0002zI-EQ
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndP-00066N-EI
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:32:01 -0500
Received: from mail-bl2on0105.outbound.protection.outlook.com
	([65.55.169.105]:34976
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndI-00063m-Dk; Thu, 31 Dec 2015 19:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7wzYWmkB59pN1ET0bXx5fnA1ngbrWFQcAz/TSNHvTPw=;
	b=BMJe2j++02CaFA2Tsea//1qb80qmiO/ssjrm44bOQ4EFYBxF671HujxqvoG/wbr3GSPvNyDaJITzYkeEOLpoN1a/Ig5rdCJlAIODaRD49LFEaRUrYqjnfc2YP3yoE8NLioZN+Su8S8x/ykBUCBBjy6vBHiPKqz4Zwc7lRmgGA50=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:50 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:32 -0800
Message-ID: <1451608294-16432-6-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:EUe+xbYmOzAimo+YwxfY2wg2RmIxzkfDKDRgq/hSJC4hKNam76dJLe7Dx8yxfrr6kD2AGumgxJdAl+AkcmXvOXemMGsW8whFLFqMnQaPRKtuoLxJ2oPGqrhn+uk4v9ZCXkbgrpjLK2JywyoyK4z99w==;
	3:uCU3An3hKNfP8p7F6isGFgkGt+yokiblHdFWcXfWwrq/VToAv6Ru+8BOR8sdXmUfvE1h89TfIoRU1e6UNdn5Lmlui+Biw8GMHpPVqQnpRQpvBePcsCGgZatgJV71WRzT;
	25:8GEB8+0VHQEpbtr+qAhnYRudy+8itJtZUAERRIsiCRKrLZEEVWagFH6RvUPDvAsvGTTJaTFoq1CLe3udqfGYvzlpLiujWAHzj8QgxpFyOlAkxbr/cawIyicQy6TFwj169Rywu+4AbKvt4QzxEkCi9UkGtEIUloz1JRaw3+2lpgj3mJRuKh383zH8lJF0rIFLRZq1NSin5imlUSA94Z0CaZr1D6K2zZDONukuqK5dov7VXddh2+X1xeZUphmCqhDtJnDgFvVsqavWfakuay8FSjeNoNqWvcmU0hBmqPPQQxY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:hF5na00c/1Q/snVk/IvoOqfVoQ70szBGUgrCnwzYdDMM+QME5PkRssa8qOAwBw2V+vagtLrtVu6ORlRvhsonI8Nt0dE4E3J5bedtea0tKMvz1oLN6RsekZzORzMstWcy4FNEJw3MA1PmHzxm2DP1uKW1B30VY/ot4ikDmXnKCFRFZNenODR+2cWpClMI9jUSEHbYUv5ueu7CjPnZ5RyB8tUV72gZeWubi8sT7PCyByss986OI/GJulJ2k6YqWhX8gSu5kR59dmYJ1yGLakbhtVBjlMYhjMeEVhQLQQZAmSNv+Y1+eEjzVDRcmh5dqyGWjZntXKGUVeHbX77XSGf8zJ2BstGaiU/7tc7IWlw5QR1KLtCzoTWiHBOJ1ZC1kw2Ht1kYRJ/ZQq0snllF8FpsczHZ43niWWtSChadtdzoHcOotSNraCHwiApxTxEwWxCd/ETsjGI6gil/HOHEkawlrFt6cHcB60csecPT5pqyBhAOYeCpB8/H9J7Kv28VHMOZ;
	4:/lugwPOTiaHTuZQmF3FqcHb4uIpha7B215+7h+o+IiCf6PfsEnMdgW33Yb14YRWc6F3YKzyQEDy5rEehYEEmSiDpMXPX9J29CAzN8LfbAOKcR7Kd/gNX5O24AuiJ5b1J2XTgiRXBNAeO834jjBjFYwIaGOLt8K0a+uZCtJTqd6VkzaWFw35yf56qMUeP27e+tsFQn1dIx1S89tnW40xyjwJyoBs3ysvPzXvZLNADR0aTLboOgZAPe2ImuoTmi0qKiws6QGVWvnZ+J2dGFb7pbKKdcabX/DDmQeozZxQOZMDXYHypcc+r3ki6ctHqeWwfVoE7+OeTPE80bEzSx923hGX/+AgQ6HadSUKEclBJIfvvQ7QQBdQMX5ySFVzK8qjn
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2043E351509978E7C2008ED69EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(52044002)(199003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(15975445007)(5001960100002)(50226001)(107886002)(76176999)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(2950100001)(19580405001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:zcGqSG0zJLM+TsyrhiXFWFIocCR9UsBHjb/EOet?=
	=?us-ascii?Q?lcDYwwEQ/gH8aG5MWWoI/1fTnAo72t0hEWdjFXpXkpPjjoPRkMkZZV+Z7ta1?=
	=?us-ascii?Q?YJHi9cJukWnLFw01VZ69mlHXp7VF5IR3j1SgDu27bLxb05a4tofJueOzxl+w?=
	=?us-ascii?Q?ZAu6ECr1d8rT/f18mynSNFtA26YKUKokxaSDuwosarg0xV8laez6zvDi44sD?=
	=?us-ascii?Q?sntXIoEWtdmyVORa/Yb/iMXnqeG86+Q4ptHcfGqPyOtH8XuRXfhz4SMsc8uQ?=
	=?us-ascii?Q?axv5TrTyQwBFkr6+Lj5AyRDkQ+i3OCnU8nLRSJKx+w4LVNt00Nf16bEEtvha?=
	=?us-ascii?Q?asDPUWpfGnnXnDb3KJ1fdEnn4g+i3GiasDhXCwr0QjANqTnMP9+GnU2kxDb/?=
	=?us-ascii?Q?NUEKdqsH0g2s/zfRmdsio0HTGATpAvEHMlpOh4G0IV/+75AO0jwIwLM0T2it?=
	=?us-ascii?Q?OFsE0wFLFX7vrrfO24AdHzv0VKAsBDgwFMpraSXozEgvdROryZ9ZVm/kGe24?=
	=?us-ascii?Q?BllCdJiOkO5Yu9ya5qtOf3pPE3qSyajd2kLz4jv/a5zPHeNd+iVHmpNCp3S8?=
	=?us-ascii?Q?vLYpMMvQiea1emt7E+/tgK2SbFL5/2V9puy1NPM/Fm9dTe51EQkVEULJWmLP?=
	=?us-ascii?Q?MTMEmS05SzzJhT+8GG0LBVhDfFV0IaiNV7H3neVZtBa03E6q6Vho9AxZawZP?=
	=?us-ascii?Q?EKuLRx6xweGZWR1YrdBtT0MfdLvzdxVCYfWai/S1QmiCOu8VALI24FFD0NIe?=
	=?us-ascii?Q?WkQ5IV4HohZVhcGga7C882KEdj5ytqayRUZ+KjcD0DmwNKnPGULt7OQpXzjd?=
	=?us-ascii?Q?OBK7WYO2NC4I2WRQ3TRDs+IICV4ioyLGjjoLggPABQvIivYjwBeSXYlORDkn?=
	=?us-ascii?Q?A51xbgI0/krGrXIZ+UTfQeZ0Hj71NW6RdGD/FQTOWefXXzAiUk8jRZz5v7ja?=
	=?us-ascii?Q?cFnS5ieh6fiueDf+gxefQEhfoKEQ6AHxQmK2/e3ScoH2tKQ5zbiKiGtzrjwc?=
	=?us-ascii?Q?WFV9/pBPEiuFji8LZkAUrN+91Zxw3o4wu4UMuEnES5cCGIE611SC3iT3IMqO?=
	=?us-ascii?Q?E7H1XtZmdIg2wjLU1jRIpvAyyGFPwuVITYincC5ERIuKk8vEjJ9g3keVDhKh?=
	=?us-ascii?Q?VY5qBqE8Gd1AILnpdO6GavUOMbWYncg3j4/hi+mLq1GY5AjMTOxRu7hB9Y88?=
	=?us-ascii?Q?3qssl5dbKKQDRJ6hYAjo1Q9lGvJQGhTviXHLCHAyxkJw6mJZSZ1PTGjKkR9T?=
	=?us-ascii?Q?7NvwjwpayEe6SPzFLELo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:/b9kIzK1s+AGFmcQsuHWcwwzCPtma1Fze9WLeOy2YA7O3UjEalVkxPsiG6vbrPdjfUFOFUJOCEHwlUOS3ovqCJRVh9OH7RcLO2RtZP5N9XL7oYFopmi/lAsFxF9rFCgFsFaVeNaanvIS1/ej9oe9SA==;
	24:wL6C7i26yy6Dibrk1hkTxRf5VCiEOhCaqhZhLv78d1NAU0Zu2iSNVPhX28hvmaAwMnc18rYi5HdFa+VELUH/8X6IvGfWZyVY+NYzUoOC5kE=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:50.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.105
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v3 5/7] bcm2836_control: add bcm2836 ARM control
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
X-TUID: 59TRGI82rvm/

This module is specific to the bcm2836 (Pi2). It implements the top
level interrupt controller, and mailboxes used for inter-processor
synchronisation.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v3:
     * uint8 localirqs
     * style tweaks
     * add MR access size limits

 hw/intc/Makefile.objs             |   2 +-
 hw/intc/bcm2836_control.c         | 317 ++++++++++++++++++++++++++++++++++++++
 include/hw/intc/bcm2836_control.h |  51 ++++++
 3 files changed, 369 insertions(+), 1 deletion(-)
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
index 0000000..6c93333
--- /dev/null
+++ b/hw/intc/bcm2836_control.c
@@ -0,0 +1,317 @@
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
+        /* handle local interrupts for this core */
+        if (s->localirqs[i]) {
+            /* sanity check localirqs: mailboxes are handled below */
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
index 0000000..9dbfc9f
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
+    uint8_t localirqs[BCM2836_NCORES];
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

