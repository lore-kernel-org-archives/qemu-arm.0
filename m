Received: by 10.25.159.19 with SMTP id i19csp769550lfe;
        Fri, 15 Jan 2016 16:01:45 -0800 (PST)
X-Received: by 10.55.15.139 with SMTP id 11mr16693644qkp.50.1452902505365;
        Fri, 15 Jan 2016 16:01:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 130si16026729qhw.52.2016.01.15.16.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:01:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEJM-0000GM-SM
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:01:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHF-0004do-Iv
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHD-00014f-Mv
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:33 -0500
Received: from mail-bl2on0104.outbound.protection.outlook.com
	([65.55.169.104]:36506
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEH6-00011T-SB; Fri, 15 Jan 2016 18:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=5KzWrkbGbKsfqST5rbs1heG1771IojHS64F05kcQtdU=;
	b=Bx9HCXl6HpWcOKFO8SyAAUCe5It6QxyKqBP75f5hTprT4WnrlLEzCQc9rv/lzdorW2ekYPWNSNc596nt83R12xHF/uwZ2Z0vevhSmlujeR1ZLOB80CDENCIhb4Jw7F3brC8ZmZ7XnEYZZL4AR6TOsdwE/8uIOIG+U3VSnOtJA6w=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:22 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:52 -0800
Message-ID: <1452902337-13844-4-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: e073b124-9e97-493e-ca86-08d31e07e46f
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:CC8LKmq8RQL9+qdfXNz23IdTZFnReX5W3CA4TRFsdtkPCtxLp6rWk3EJIxdUcWNXAi9Iacrv5/2Rcvww3OKw9KGGBQ4qvp20igSAqbyvt4gNWbKUOdqVmZiSed+JrZ1LNsOOU1NWJOL7NGvJj+4+HIJuhGFlog2hUR8iU0H4aWjoySiuB6m+fhyuMeqoQPFg;
	3:yt2yeorLdYnIVpehQx8AvylZ+ZYOUSQqNiziu8WrfGIPwxh920H0CWHaTBHU5xN1MaFnLJ+Mc/SHrkxKvDLcp99bzXj4U/p03Fr9jjCH14mcK0sZR/7GU+9sbAr6Oba+;
	25:KT5Cccghx/RACLJsTSGLe2/OpH8ON8QdtLCrv2B/iDbqjx0Neg6XBJg7j99BFjFomvOSkoXOEHVms1VhTnyRD8EB0B2rfVMu9+PuNFEkQMTN77Vquw/85k04w+3qDE4MTkvHemo5hVKlZiz83f7kFDU45ofdCURkFM4CDWzspuIWQsspZGQ7hkZaH39E5DbRu3GW7mBtYxV9AWnXDc+Z+sgVoMBdSEb6GsEgI0FnJ/A7ZHx/2qT84EV9e3wG4MqYEMTFzV2kCZhCMFxTrwGa/ohi3FcXcGXZsTX7UY5lBK8=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:O/edZfUVIRnGpbGVqHN6Fst1CIQAJI3Sx6AC2SaVdJeFAqPoOYRMo2jqSmuoIMOxunIc/Y7VBQ+ZV8MfeDd7HoX6RBWS7fojOPFpW8Z52FdxiSM/Uw94pcd5GBmPqtToaScMBlCbkrQXDadyjadlAQ/QNj42EUH6kmLptDB9rBSZ1gQAY3iRIl0VT/P9ogzZc8KqLX6hy0NHJeWagGgjfHReJ6SQPCGzGC5E9j4mgkzO135CBDSqXJvAAuRo/XDhuVGx2DO9pFrUmHsdO4TCQgRvkTY3wa3EBaaniZdn8QaQHXTQi2TnAmE7frHony3e84VAaFeYke5Z0xOtJcceVa/R0/O26Wt6+mqr2iTfa8f0+NeZfApLnVFoIdXtVBNI1KpGieykZu8U/P2B6siWWt9WIzvAGa8LLQqMgJa/SNWgH6LzTePRzW8a0GfCIPsw+wXbHr6Ojx5B4LGikaIJaskZUWSv73T2tEUJFDtMHAERV5mY0lQlb62MB47W7EjU;
	4:jXwtN6LdXlbIYTlljQpRvqvT8rPotuOhjoDpdor6IxFWJoR5+6yBUL5yD7AmRL1rOtc9/AFmwb/0fdxMogqX4FkQRxtt0SQsDOWJ/uHFZGLo9UuRYLG+mJM2NoYtreCLxBb63r11Meq/Tbx7XIQBVy+ImPoMiHfQ+oorotmRur9W/xFPNZ6R5IkqyWE6XvyGicfIVg81V1hhrFyhb+YboeT3Efh+PVtG+QO1R8T+FoGZHCWcp+6Ng83letzlpvR7TSADQdHu/G5ekbj3Q3a/9Bazd/vQYcteYDHIB+mVeWPPpUpQkjKFxJJ4CXzIuXRI33PO8rRT7RF+b0zRgVIGAzoZzFIbrQlwa4lYI+9fF1UCtyDCDehvmFADfeZLE82N
X-Microsoft-Antispam-PRVS: <BLUPR0301MB20333AE9D764F71CAD0285FA9ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 08220FA8D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(4001430100002)(575784001)(106356001)(86362001)(2351001)(2950100001)(2906002)(586003)(77096005)(189998001)(42186005)(5008740100001)(229853001)(50986999)(1096002)(47776003)(4326007)(6116002)(87976001)(48376002)(76176999)(5004730100002)(92566002)(122386002)(5005710100001)(86612001)(40100003)(101416001)(50466002)(107886002)(50226001)(10090500001)(110136002)(5001960100002)(81156007)(5003940100001)(97736004)(19580395003)(105586002)(36756003)(19580405001)(10290500002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:OOX6d382vpnIhYg1EhnQDpk5e/l/aMsxedrfCmO?=
	=?us-ascii?Q?k80ZdqOTNAH8/pFHLrIZhZNHFO0priaeVRqpr+P1HfpIFNeAWnxDLYxz8gBm?=
	=?us-ascii?Q?KyhgIpT9joDA+KKqxB1BzNTt7jksE7Y1W5ApUWrBS0Mhxp+i5o3+wVMR1YGQ?=
	=?us-ascii?Q?midtK8f0+d6BAD7XfgBicuZtz1VWLPjElBbtLdzx+/zI0/Muo2r8aer0iEjd?=
	=?us-ascii?Q?zNEMVrME714rFTq9q9p0G0c5yzKnl0Y1DNBebZhI4PHc4LzaHB2qz9d6I2Wz?=
	=?us-ascii?Q?xHPbs8SuuY4DrPvVijP0BWRaw1tKlbIK5aIbrE6HR2KfGfJVqQpH6vmHG1R1?=
	=?us-ascii?Q?aPEEBI3dMAqk2qkPD5xY/TYLnWxcAnwK0f1fEkIZsvoQR2K7H2C4m8N7NES1?=
	=?us-ascii?Q?PWKlonDy4V3cZE3f9tgbb5yrco5LVS9TesQSt2ZpHONykYDcpwFXrQqadRDw?=
	=?us-ascii?Q?fjMZieNPOioQ9ew1/fcyxRK318zmBYeJiPLOjzoiYE0CWRoosMz0bFajFGbX?=
	=?us-ascii?Q?QKyktnl2u/jGz8Tq+4mNizaBSUgCXhSsSXzhO3ae+ZjU4uKf6q+8RzQtrSbl?=
	=?us-ascii?Q?87d/TUItIFlRLnSxOdgV6KzyUM5IOaTdu6S79MuCgFZv8a/m2INZiwgJeQrf?=
	=?us-ascii?Q?nstOhEN/J4eiJpMHsjEe3CZ019trQzHnAwCiV0Qa9RwF9thnh1RnykQ7rlgp?=
	=?us-ascii?Q?0Sb/ZtaMZr9m7iNii1KwaiJhSJ1LCbUtXQm8w4q9y1X/exE5NeFFA2IN4lgc?=
	=?us-ascii?Q?jorCtGLW1wR+jrLEWuF5kEwqM0Oo5g7GtC2MPbXIfbHKYzF1ItV5gS/bVizQ?=
	=?us-ascii?Q?VREXqCmuwCVxAUPkbcNsRb/RA16+Xi9o8vIDy+b9fmqRKeUABp+JOR9GTgAb?=
	=?us-ascii?Q?DZUiHxZLByO7pinIvdHWn+KnoteliynKix46NXzusmJ3NYrLGFIHlmif1Mxx?=
	=?us-ascii?Q?DddPUa7X+ZI8XrmDkKH7dAYcY+TDn/tVW/gj+2fv8wRV1INqG0fW9QIK/Q3A?=
	=?us-ascii?Q?KUvgugNEajCC/bb8eZidBY5nFtckqYIiCdCnifIQXR5jONF2OAiStlCG/B9Z?=
	=?us-ascii?Q?sVcewGmczmBcgWRC5EgUBaaWYmoGeBmlZVqG5vjct+ZguxW9o6TvdpsTBs0p?=
	=?us-ascii?Q?SsyUT49Kwn/ceDzeTEwwnDcdOegN+3cIitLBOfmjwnDvPJEX5Ft3ZskJIRmX?=
	=?us-ascii?Q?OEwv+tGdkY13IVzOszUrqkoXbDFGT9sd5913cgZN+BcOwEgXhASfK/xZopg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:I7Tb5Q9bobRynSon9byYckWKrvc7PBcUVYOV/RhS8ITH85WtuxCgB7ZIoSA32nYkjbF2+QJBIcpB6MqVWPsfi84HkvXiIlnJs9Y8RBtDCsavhd2fX+NqBy91FKVKLtaDUF+m3/QVvizr1EB8Pb95hw==;
	24:adiw0AalfFtnAUkn340rK8Pg1Mchu9xGJaXr+FVlREDZOIwNpYSP//N5bBO4lLC42xzsEiMTFCFH66/EYw8swEP42RaQ+wD3ZuSigouROzI=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:22.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.104
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-arm] [PATCH v4 3/8] bcm2835_ic: add bcm2835 interrupt
	controller
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
X-TUID: vekXETAPPD75

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v3:
     * minor style tweaks
     * use extract32 in place of manual shift/masking
    
    v2:
     * split inputs to named gpu_irq and arm_irq gpio inputs
     * use 64-bit gpu_irq and 8-bit arm_irq status rather than 3*32-bit bitfields
     * added defined names for register offsets
     * deleted nop realize method
     * other misc cleanup suggested in review

 hw/intc/Makefile.objs        |   1 +
 hw/intc/bcm2835_ic.c         | 236 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/bcm2835_ic.h |  33 ++++++
 3 files changed, 270 insertions(+)
 create mode 100644 hw/intc/bcm2835_ic.c
 create mode 100644 include/hw/intc/bcm2835_ic.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 004b0c2..2ad1204 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -24,6 +24,7 @@ obj-$(CONFIG_GRLIB) += grlib_irqmp.o
 obj-$(CONFIG_IOAPIC) += ioapic.o
 obj-$(CONFIG_OMAP) += omap_intc.o
 obj-$(CONFIG_OPENPIC_KVM) += openpic_kvm.o
+obj-$(CONFIG_RASPI) += bcm2835_ic.o
 obj-$(CONFIG_SH4) += sh_intc.o
 obj-$(CONFIG_XICS) += xics.o
 obj-$(CONFIG_XICS_KVM) += xics_kvm.o
diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
new file mode 100644
index 0000000..005a72b
--- /dev/null
+++ b/hw/intc/bcm2835_ic.c
@@ -0,0 +1,236 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Refactoring for Pi2 Copyright (c) 2015, Microsoft. Written by Andrew Baumann.
+ * This code is licensed under the GNU GPLv2 and later.
+ * Heavily based on pl190.c, copyright terms below:
+ *
+ * Arm PrimeCell PL190 Vector Interrupt Controller
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#include "hw/intc/bcm2835_ic.h"
+
+#define GPU_IRQS 64
+#define ARM_IRQS 8
+
+#define IRQ_PENDING_BASIC       0x00 /* IRQ basic pending */
+#define IRQ_PENDING_1           0x04 /* IRQ pending 1 */
+#define IRQ_PENDING_2           0x08 /* IRQ pending 2 */
+#define FIQ_CONTROL             0x0C /* FIQ register */
+#define IRQ_ENABLE_1            0x10 /* Interrupt enable register 1 */
+#define IRQ_ENABLE_2            0x14 /* Interrupt enable register 2 */
+#define IRQ_ENABLE_BASIC        0x18 /* Base interrupt enable register */
+#define IRQ_DISABLE_1           0x1C /* Interrupt disable register 1 */
+#define IRQ_DISABLE_2           0x20 /* Interrupt disable register 2 */
+#define IRQ_DISABLE_BASIC       0x24 /* Base interrupt disable register */
+
+/* Update interrupts.  */
+static void bcm2835_ic_update(BCM2835ICState *s)
+{
+    bool set = false;
+
+    if (s->fiq_enable) {
+        if (s->fiq_select >= GPU_IRQS) {
+            /* ARM IRQ */
+            set = extract32(s->arm_irq_level, s->fiq_select - GPU_IRQS, 1);
+        } else {
+            set = extract64(s->gpu_irq_level, s->fiq_select, 1);
+        }
+    }
+    qemu_set_irq(s->fiq, set);
+
+    set = (s->gpu_irq_level & s->gpu_irq_enable)
+        || (s->arm_irq_level & s->arm_irq_enable);
+    qemu_set_irq(s->irq, set);
+
+}
+
+static void bcm2835_ic_set_gpu_irq(void *opaque, int irq, int level)
+{
+    BCM2835ICState *s = opaque;
+
+    assert(irq >= 0 && irq < 64);
+    s->gpu_irq_level = deposit64(s->gpu_irq_level, irq, 1, level != 0);
+    bcm2835_ic_update(s);
+}
+
+static void bcm2835_ic_set_arm_irq(void *opaque, int irq, int level)
+{
+    BCM2835ICState *s = opaque;
+
+    assert(irq >= 0 && irq < 8);
+    s->arm_irq_level = deposit32(s->arm_irq_level, irq, 1, level != 0);
+    bcm2835_ic_update(s);
+}
+
+static const int irq_dups[] = { 7, 9, 10, 18, 19, 53, 54, 55, 56, 57, 62 };
+
+static uint64_t bcm2835_ic_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2835ICState *s = opaque;
+    uint32_t res = 0;
+    uint64_t gpu_pending = s->gpu_irq_level & s->gpu_irq_enable;
+    int i;
+
+    switch (offset) {
+    case IRQ_PENDING_BASIC:
+        /* bits 0-7: ARM irqs */
+        res = s->arm_irq_level & s->arm_irq_enable;
+
+        /* bits 8 & 9: pending registers 1 & 2 */
+        res |= (((uint32_t)gpu_pending) != 0) << 8;
+        res |= ((gpu_pending >> 32) != 0) << 9;
+
+        /* bits 10-20: selected GPU IRQs */
+        for (i = 0; i < ARRAY_SIZE(irq_dups); i++) {
+            res |= extract64(gpu_pending, irq_dups[i], 1) << (i + 10);
+        }
+        break;
+    case IRQ_PENDING_1:
+        res = gpu_pending;
+        break;
+    case IRQ_PENDING_2:
+        res = gpu_pending >> 32;
+        break;
+    case FIQ_CONTROL:
+        res = (s->fiq_enable << 7) | s->fiq_select;
+        break;
+    case IRQ_ENABLE_1:
+        res = s->gpu_irq_enable;
+        break;
+    case IRQ_ENABLE_2:
+        res = s->gpu_irq_enable >> 32;
+        break;
+    case IRQ_ENABLE_BASIC:
+        res = s->arm_irq_enable;
+        break;
+    case IRQ_DISABLE_1:
+        res = ~s->gpu_irq_enable;
+        break;
+    case IRQ_DISABLE_2:
+        res = ~s->gpu_irq_enable >> 32;
+        break;
+    case IRQ_DISABLE_BASIC:
+        res = ~s->arm_irq_enable;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    return res;
+}
+
+static void bcm2835_ic_write(void *opaque, hwaddr offset, uint64_t val,
+                             unsigned size)
+{
+    BCM2835ICState *s = opaque;
+
+    switch (offset) {
+    case FIQ_CONTROL:
+        s->fiq_select = extract32(val, 0, 7);
+        s->fiq_enable = extract32(val, 7, 1);
+        break;
+    case IRQ_ENABLE_1:
+        s->gpu_irq_enable |= val;
+        break;
+    case IRQ_ENABLE_2:
+        s->gpu_irq_enable |= val << 32;
+        break;
+    case IRQ_ENABLE_BASIC:
+        s->arm_irq_enable |= val & 0xff;
+        break;
+    case IRQ_DISABLE_1:
+        s->gpu_irq_enable &= ~val;
+        break;
+    case IRQ_DISABLE_2:
+        s->gpu_irq_enable &= ~(val << 32);
+        break;
+    case IRQ_DISABLE_BASIC:
+        s->arm_irq_enable &= ~val & 0xff;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return;
+    }
+    bcm2835_ic_update(s);
+}
+
+static const MemoryRegionOps bcm2835_ic_ops = {
+    .read = bcm2835_ic_read,
+    .write = bcm2835_ic_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static void bcm2835_ic_reset(DeviceState *d)
+{
+    BCM2835ICState *s = BCM2835_IC(d);
+
+    s->gpu_irq_enable = 0;
+    s->arm_irq_enable = 0;
+    s->fiq_enable = false;
+    s->fiq_select = 0;
+}
+
+static void bcm2835_ic_init(Object *obj)
+{
+    BCM2835ICState *s = BCM2835_IC(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_ic_ops, s, TYPE_BCM2835_IC,
+                          0x200);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+
+    qdev_init_gpio_in_named(DEVICE(s), bcm2835_ic_set_gpu_irq,
+                            BCM2835_IC_GPU_IRQ, GPU_IRQS);
+    qdev_init_gpio_in_named(DEVICE(s), bcm2835_ic_set_arm_irq,
+                            BCM2835_IC_ARM_IRQ, ARM_IRQS);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->irq);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->fiq);
+}
+
+static const VMStateDescription vmstate_bcm2835_ic = {
+    .name = TYPE_BCM2835_IC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(gpu_irq_level, BCM2835ICState),
+        VMSTATE_UINT64(gpu_irq_enable, BCM2835ICState),
+        VMSTATE_UINT8(arm_irq_level, BCM2835ICState),
+        VMSTATE_UINT8(arm_irq_enable, BCM2835ICState),
+        VMSTATE_BOOL(fiq_enable, BCM2835ICState),
+        VMSTATE_UINT8(fiq_select, BCM2835ICState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_ic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = bcm2835_ic_reset;
+    dc->vmsd = &vmstate_bcm2835_ic;
+}
+
+static TypeInfo bcm2835_ic_info = {
+    .name          = TYPE_BCM2835_IC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835ICState),
+    .class_init    = bcm2835_ic_class_init,
+    .instance_init = bcm2835_ic_init,
+};
+
+static void bcm2835_ic_register_types(void)
+{
+    type_register_static(&bcm2835_ic_info);
+}
+
+type_init(bcm2835_ic_register_types)
diff --git a/include/hw/intc/bcm2835_ic.h b/include/hw/intc/bcm2835_ic.h
new file mode 100644
index 0000000..fb75fa0
--- /dev/null
+++ b/include/hw/intc/bcm2835_ic.h
@@ -0,0 +1,33 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_IC_H
+#define BCM2835_IC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_BCM2835_IC "bcm2835-ic"
+#define BCM2835_IC(obj) OBJECT_CHECK(BCM2835ICState, (obj), TYPE_BCM2835_IC)
+
+#define BCM2835_IC_GPU_IRQ "gpu-irq"
+#define BCM2835_IC_ARM_IRQ "arm-irq"
+
+typedef struct BCM2835ICState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+    qemu_irq fiq;
+
+    /* 64 GPU IRQs + 8 ARM IRQs = 72 total (GPU first) */
+    uint64_t gpu_irq_level, gpu_irq_enable;
+    uint8_t arm_irq_level, arm_irq_enable;
+    bool fiq_enable;
+    uint8_t fiq_select;
+} BCM2835ICState;
+
+#endif
-- 
2.5.3

