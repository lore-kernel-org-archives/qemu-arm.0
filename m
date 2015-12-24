Received: by 10.182.158.201 with SMTP id ww9csp4396131obb;
        Wed, 23 Dec 2015 16:29:34 -0800 (PST)
X-Received: by 10.140.86.85 with SMTP id o79mr43894797qgd.3.1450916974581;
        Wed, 23 Dec 2015 16:29:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a192si42374374qkb.70.2015.12.23.16.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:29:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtmg-0006x9-5P
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:29:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjJ-0000S3-Jn
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:26:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjH-0004yA-H0
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:26:05 -0500
Received: from mail-by2on0141.outbound.protection.outlook.com
	([207.46.100.141]:34504
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtjA-0004u5-Tz; Wed, 23 Dec 2015 19:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qJrIYq2uF3T8phHPhQ7U/nhPzMmOM/Ekmi4TpMdVx/M=;
	b=bq7Qmsnl3+C8MABa4fJN624XQn7qFEo0ZeYs+5GQDhIdNx/6DNooglrHJIStTPvEICGz3zuuF2uB92KCzLtJJyAhZkARh2FQU9QmlGlWpql6vcwfImgPL1Ppwm/ZY9hi7oQYTfa72La09+IhO9KWD/i1eFdRAE1HPo8xxvpF0xk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:52 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:29 -0800
Message-ID: <1450916731-5968-6-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:SBhAJlN7j8tyFEflMAke/iQYknPkNLZkN6SBgOI4A4ZXHx2by4r2HRkA2Ln4rCqzfvgQN+HaQT9a0GZacMUBljdPgduTIMzF0fMbvVspIa/axaAaOd/nDPhzPuCTrJp+TrTS22wpr1cAvkOsYK/YBg==;
	3:cb0y3f5Z5crw6jqpq2qxI2V1Svgv0lHlJz3CdcoGD8U1oJID8lDROVdD6iFvXebUZvbMpY2cvpGoKDoaNPp/F7offux5REBGPXvrvXpKZJbpG1mj4NGiXEvtaXdA47Sf;
	25:+Syjz7xcdcLZaVYYKm/KA59+7gV1ytVIvqsiQRH9qSPDZo255bSzrliBYZJgR6MKG30MhQCYh6WEKwWF1KApTcp5rPQgDSOHS/J9TNcyHAjOw6YUGI6mJmb+//z5xp0TevljeDLHJm1LYnJRvM3OpqQmiCAyWUIH0frXkjILbDpeDTWr56WlAp0+qvbqHUh+Y68b3nU8i4lLfJhnwMFxsu/RYT4sOZVaGagwEOMxkDCvVIqZzR3cUFhjUr5L4AlzP/uthBqDWG+I+HJCu8BDbUA901bbN9VohvOmmDQGifE=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:3wgJon6SHQg6AV63YPT1C9PQsIWRE1XwShGP+7sIZtVYl3xEROa+NVuiVUrHdVefx+5AeV5DojoTjhSbTlCmA4uvyefKd5xWi5wWzQLX+pUDzXMTEpOb5F+P6On7Aiwmxs5XvWrqaIQgyW/eCrWPnE6wr6ok6gwI7NlQn23oAVeEy/iyMr+qD6uqXeOmcX0suwvmeaeKNiydIV8wSRbtr1CBKDkaOsXb00a+RSC8RA46gn03lelnHSfsjfHNSsP+whTa2cpgdaCIWcBFDMX2MzZrdgSeNgRgNQlAGrqmpF7ckddLQMYGCVXp0w2zDs89i3kU5h6kWbNl9/gOwerfshdAzqY65QZ0Z17SAq7TogLtRHQqZLPYl1eQ57/e5XfadGKNGJe3tl01MtIV7vySxX9NWiqTopLSB7HU0n5pLu6xHH+CJ8Y4wkKqYRHhPesODBV0EBlrzPV+Xjz9MrhEpaC5EjMOGs1vJwnJfktNgmwNLTrkXOq0ssa/5X5L/cmb;
	4:R4nNgLs6nud1dL8Mwpmh/zN7OW8e143OQajm6B5+chWr0svAa0aqR7m/bZShCzW6LMyCkofdY3OwNT3/TKDPUZyR1K2rQHI3d/IZAeVpnjsEBSuOw8dlGA+qLyMaE/uZryEyrF+mWyw3wIIQnwDlHFUpV7DSdCfBsALs3JTAtk9dipwKcp0ihSRNW0A/osmC4I1aqdAqEGcmwPsG1QOntlunEv72JKsX8Knr2k7pnzN5KyaRBanIuhMnr6RQIcNagqVzQ3YUp8LuXQ2yoDaiozOliVBFvMCBu7H1KrQOgAQQzcpu2sO/3Xff/qw/56Ia2iRrYUPXx/Rl3LCpPW1HpkX3IA7xpXWSe4eTKFDWKOCE6YdeytUsIssHeE4nwpel
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033554390435998FEF2183A9EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(52044002)(199003)(19580405001)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(2950100001)(76176999)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(15975445007)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:EuHAz47pt8iFRvgYovAhGwXdTCLMHUgLDyZ7V7p?=
	=?us-ascii?Q?nKggaUOxgVgmJg7qfanUm6vMWD914eS2C6W3i3GWBbFgXzHlRcx8BCASpspy?=
	=?us-ascii?Q?lHvarlknwMyEVtqbPXEuLR+uCFUzemWAJ0qoxdlltMKI/CmzOcPexu+Z/Wx0?=
	=?us-ascii?Q?Toi72coejg4AeANYxBXTqAUarDDHLhkA0GoWaUJ+f15GBqclRz1L/R2EwA7y?=
	=?us-ascii?Q?j1ZzcP8W4Y/ENpD0BKERL6cCxCpvsD9ySM15WJaIaqIzVvh0IwbXHq4R6DC0?=
	=?us-ascii?Q?RnQ6KcGxGb44JjlJMQOUdfIK/N35YKJ+kdyL6WkcgsjwfRMeff5E+DnqpF05?=
	=?us-ascii?Q?KxGpUZHiseCRPwQwCZUPtlJf/iNApEHg8uhck5UYhCA0Td9Nm8nTwbMExPVX?=
	=?us-ascii?Q?rxI+o+ETUraD+UXU46eWhEz4/0Wz4cizl34pkQBtpeDyLAJVHfgFNV35d0dA?=
	=?us-ascii?Q?Fq+NES3m8oXh+GYY0+jwHKVb4BBCTaJYjwazEXjL7p73vg2MDxkiu4OS4sNN?=
	=?us-ascii?Q?vkAIYWPRpQF6AI3olMVHz5XeXUZvskcVQScEC5/pTmvlQpAy0REE3CWNeguG?=
	=?us-ascii?Q?pEOeatXd4x2iWQKUV9IW7SOiiSE8Ar3srCUxlMByPPZLLbZ4TFGD5MpSq55U?=
	=?us-ascii?Q?Eha2cIx+EePuhIG0/MCUb5aOVeRW+u3tB/pNANp+4d3jqrsaL4+QjNEunO5a?=
	=?us-ascii?Q?r42jxdLUPyvZlR7tziUL48NJiEVzZVLz2qM/4vxjIHpi/NS6GWcar2yNehvi?=
	=?us-ascii?Q?L2WAtOF4YiPgmtbayH/l8rlW0Haf69hbcsI33oVPVYDewpjGMFDaWBYXpxs2?=
	=?us-ascii?Q?zGeY7QPrrgpPQWY+t1vTy2NRamiSAMZnWzoVixvbRqtH9ts6MZ1IO275xhO2?=
	=?us-ascii?Q?5vaThYPzWSS0w/9aUdUd1GSMgs+OjmVwvzL/rPoBIpmiNquhs8BnNb0SDb8+?=
	=?us-ascii?Q?hvBf6UVOW8rGLpJYaHNmjronyk0U0Yvd83rlh/grZfdS+om/iFAFkRMLMK2F?=
	=?us-ascii?Q?KS0i7IlUVzQG4gL5ZS2tq0WfB3pR8JH1GOpIHF/oyy9ZPEVUvJQsX2YXMuwS?=
	=?us-ascii?Q?i65G0DvASRJS3+BK5kMhVSsGKjD51VTZhNtTLnbf/B/4sldBpguEiQ94bMJr?=
	=?us-ascii?Q?quedjneUtUG/AMuzD/qUhs9pCwuLWlWex9CNvLzp0OkZh9PtupI9yrT5euP2?=
	=?us-ascii?Q?Oqe50nUVfMRzbH53uWHPC0TNq/hW8mZ6TtYgpEKzmV9xX5vqYP87Otmg7qw?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:2a42tU7B/2Udz+f2LiDfeRthEJvAtUdYKp00wBf7X0k75gFS+RehQA+JhX/WQW9bIEWV3P/HCh4L7wWGImMJBDeunFmbKifJCerdwDCV/0b1Jy9E0xH0JkJcFiOyCrDCtY9Jlu/KkLd4CREMw0DXcQ==;
	24:BcC/caYwyZFGeo4Cqskftc6cUp4y/oMQSlpLgduapCeRYRuaGZgK1mWOTPvznfowsAJUOe9LpoXQmaV1403aaZahyg+UT5W8XDJ5eSQkcdY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:52.1025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.141
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 5/7] bcm2836_control: add bcm2836 ARM control
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
X-TUID: p5gOgDETLVTF

This module is specific to the bcm2836 (Pi2). It implements the top
level interrupt controller, and mailboxes used for inter-processor
synchronisation.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/intc/Makefile.objs             |   2 +-
 hw/intc/bcm2836_control.c         | 338 ++++++++++++++++++++++++++++++++++++++
 include/hw/intc/bcm2836_control.h |  51 ++++++
 3 files changed, 390 insertions(+), 1 deletion(-)
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
index 0000000..d68b4d9
--- /dev/null
+++ b/hw/intc/bcm2836_control.c
@@ -0,0 +1,338 @@
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
index 0000000..8a9a2f2
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
+#define TYPE_BCM2836_CONTROL "bcm2836_control"
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

