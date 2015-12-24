Received: by 10.182.158.201 with SMTP id ww9csp4395773obb;
        Wed, 23 Dec 2015 16:28:29 -0800 (PST)
X-Received: by 10.140.81.112 with SMTP id e103mr42973722qgd.99.1450916909422;
        Wed, 23 Dec 2015 16:28:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 78si42277453qhb.120.2015.12.23.16.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:28:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtld-0004cG-2m
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:28:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjC-0000EJ-SM
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:26:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtj6-0004tb-BI
	for qemu-devel@nongnu.org; Wed, 23 Dec 2015 19:25:58 -0500
Received: from mail-by2on0146.outbound.protection.outlook.com
	([207.46.100.146]:4071
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtj5-0004tT-UB; Wed, 23 Dec 2015 19:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WegtViLN83TQET3ZtWKLYr2iBT06lv99Py+ua9E0/vs=;
	b=bGQMMmLIVwsZD0/OoHq9t8WscPFwmIzWbKKuOCjJYWwcoASvqoIrgvREyn0oc8xn5oLmbkmPLm6d5uKZcPRhRyhHrIo76KdTI/H3YFfM9Fc2xTT2ArinhNef+JpGpEMkAlsGR3xr39KWd8ROYoAzwoHijk4UgU4VJIoFLc6RTBk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:49 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:27 -0800
Message-ID: <1450916731-5968-4-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:9GGJho64SXD8GC7VnoDEFbRuv7r2XCEYiE9iwakHos3Iw53mVn/vDLBNtacWK3VIPKGLkvTlONp5+FkVRadtGrKsNG3N7i0Ljva7oiC2nmvZsKARQ+GvaYYAdsRe2MsyYk0nwhF+FnGObrEUVxmPFw==;
	3:OooqDODQB9kaGFjUKz8nHy7v5UKKXLoSN5/uJzU1zgLwCwZe/73nBR7TMisiFtVdk0m75fPMiiCfvbijvG+BHaIKuHvvQlmLZlxjlE9zaNw7PEKf4Rj/1S7mF4v69z9R;
	25:fKZ1RbfNzqbPFxeTFixfl6v86RMpvPSkb/JP1wTD+KuxczIuQlRr6GwP5gsYZ0FhydpULpAqQzD9YRxKugot+3tPzdDx145RgicdRqpqdCOUg65rMrWgSoQcj+L1VtQwR6IDgNLGps92sw6eDan9GcLS83EQvlj7pi05gvVW/oPUnCKmTJ1qnnaQPZS64JTsOwXPbtRDthmmZWugkdronQW9l/BFeL3vmT6W6uJyll3QX4gCyj7zmUVq5ThdLVlQdxeyuLPZtkcLASRt+Bh8/3VEybuTyGqC0atFN8Bi/JQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:8SRQaWyx7dqQ4qjyEUJ/niwxbHuX84qOEAgp+OFua+PgkjmSJdjgWTdRSdHr7koYgz48XxwYjZD/L66HgutHFXnJQw62VGyjzQ3BBswXVh70OgPEe0zGXC9EhK3Bi4BtJJfwA/CtnR1vO5Zo2ATrH8AedmxBXHHtJEzX6RWMMQVV0j6BzchGNeTpWZh9eyokFAb8DqXXqbTa7ay+1May028dEqPIEbf/JJNFNuaK5hJhY6pdjp0zcSYv8Id5qBZtoX9dzJB0R1LuVh3sRBmwI36kyz/12JRboMP9A3baI0xi8AjlpSNFM7GRghAnAZWiGnPc0I7AnK9Y0mkXuftk3w4i4040XXrGC20vEQ+y8ntzLLOPK6J1IEowswFJdbjuwW+YZmvBZZL4Ysrv+e88R6Az0JS11rWIY3U/arLPauTvp++WjRD6BG0B/Mb62fcNs1XbrGFmYYPxOTdMcSXfPR8EziLWDyz9ldYBcLXPLLaSPljAd68E6InE1mDV+iNE;
	4:GTnsJQaMbr45XEZtZZXKkAhZSEbJztIjiKYtXj1KbOnRInGGPEeMsnKTPyvvXfgv2vBdHR25AKAYRB7Axz6Z9MmhgsicclqpsgmZ8x4wtUlirXjcQsiNFkX3zS5eY0JBjMF26ppSIHSgh6AtHo5c6i31JI5bUjan/OG/+HsjR3HgEwr0QUZPsH6SGPZCoB0p9gcdAJ43bwjXCH5jfNg8YHXwOoENfY8cYhBU9/qvEGJHFfWvhtuKQAwIwDHusEZynAsfAlG6Qa5us7QS+0ZnFePylljkvhQMKWNS0iJX6pRYsBh9ej7CP57toS4inVH2dtmAxHbcZZu5hntNWzcmV33sUp50RSj3WxziSQhKZp+oFbunmPnQE4/nE/YrGjWx
X-Microsoft-Antispam-PRVS: <BLUPR0301MB20333E66A4967711F762AA679EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(19580405001)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(2950100001)(76176999)(575784001)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:XABu5RTFQ/wcw7sJGeqUre8S8gawF8XTpvMFguq?=
	=?us-ascii?Q?CvBr6w7jXUX533jZIlu1x/wrDSfjmTy0pw7lG/qMpHel4EGruHRd9Phm15Yz?=
	=?us-ascii?Q?nTZZ4a5zM40hDAj8n0rmdueoAg2q7dIVkaRLGmB/ALeXQxngwJDyxYO2KkMv?=
	=?us-ascii?Q?htHjLLJQebKGW8tc7OEo9X4nQCr+y2ZMj3nplw8EKxtHvfvx8eyVSkSq0Ccy?=
	=?us-ascii?Q?0mSEWH5R4k4nQ00UujCDXXMD4q01yoLZeHZKgNb3F961PwZrUlYJIBZpjdOB?=
	=?us-ascii?Q?hmTyE70AcXHo5dHhkjoC+oL7Lzq6X67MfJf8DB7fRpZsf12zG87j0oD58BDF?=
	=?us-ascii?Q?THyJGGIFsBa2cTHvreRHgIf1kscP9O6fJ5S9M1PrtwfwbfOp9tLPffFr5KXJ?=
	=?us-ascii?Q?u/NBzySdAX++jGhhlPAsMgnEhrBDS8H31xUjT+qgBRfA2I6/fbn+rlHBIX4W?=
	=?us-ascii?Q?r+YoUnZiT4xmhTlIkL87PMCfZYg3StnGCHAnQDi8egt4i24eLhTwQMQ6qu5G?=
	=?us-ascii?Q?HhGcGSdPycLK+yd98YdV8RfUGrauxKcvopwqdtdkeQYsSb64bmVFIMGXdP1i?=
	=?us-ascii?Q?qnAC/TLPwR/7hQHSPfU3gklbtnW2abqf8xMVP3cTK3zF+ys5FbZhxHzsrd2s?=
	=?us-ascii?Q?GYIng9W2YknnqlSFBmfW8Ej1cGcMbOoBBEcIeziSQuMvrYiD9lvpNRgNYb3l?=
	=?us-ascii?Q?ohHZH1119b4+vGO37VpXKks9N3PgKP/uhuEIAES93/Yl0JDR5comZD69jx51?=
	=?us-ascii?Q?3RffWLTJm8yRWI3RWN6q7R3gaCVPUHLrWBOciJ8GBl1mfZJLeoLQVyAtLRw1?=
	=?us-ascii?Q?un1Gup9RZSZoLo4Ur6wPiYjc3Q0JFmWTfRe1Tu1zqBmeEwk+yCzZ4b4wOWIr?=
	=?us-ascii?Q?H9jStcdypyw5XWM83ZoXafxzd5nTwsOgL+jFivo6x3V6j8UpAcI3ZFiALDgF?=
	=?us-ascii?Q?JgR1s4qaO1dSzkFucEsyRimiHV7Cly0SNDI8IE7rxGMoVi9Hnrbr50iIKoBP?=
	=?us-ascii?Q?KkPsN92wUknFC2nayGB8uOgx+2UG7jRB9VbFqaIGo15oMJmrd/tG6YJ99vWQ?=
	=?us-ascii?Q?nWyO+R4DOTZAsl5c4l1D8XMbwg+/I45NuHlmTlV65G0lwOxE3ed1DFWsnQoC?=
	=?us-ascii?Q?RgXTfgugO+DuVCc6GpLlKez3tgI65IlKEdZQQwphp3Im/w3Hr6OwbI0gTmPP?=
	=?us-ascii?Q?aIAkawrWoI62mzfo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:UgQcMhnr0/F3EIhzz+03TBtFRyymRKVDxVTvaKIT9srPdEg/TYweWSczr9Es8n8oqH3Tv9SnX1JbaEBL77B3VUxdXv84kFk5iEYkhoiAUi7d7OUjWOom8gGXRUAgqVKlmljoHAA06CpcZxdfeA7uqg==;
	24:pyd+1u9UNEoc8tdCIL7JH7rniq3bx9tv97M+7fLy5P0MpmADCUCmydbhbUie8gqgGHL7RR3UG6L3rxT9UITRXymDKuY4oQkOrgmRradPdLY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:49.2274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.146
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 3/7] bcm2835_ic: add bcm2835 interrupt
	controller
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
X-TUID: FEUdo/W20uaC

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v2 changes:
     * split inputs to named gpu_irq and arm_irq gpio inputs
     * use 64-bit gpu_irq and 8-bit arm_irq status rather than 3*32-bit bitfields
     * added defined names for register offsets
     * deleted nop realize method
     * other misc cleanup suggested in review

 hw/intc/Makefile.objs        |   1 +
 hw/intc/bcm2835_ic.c         | 233 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/bcm2835_ic.h |  33 ++++++
 3 files changed, 267 insertions(+)
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
index 0000000..9624e8b
--- /dev/null
+++ b/hw/intc/bcm2835_ic.c
@@ -0,0 +1,233 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
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
+    assert(irq >= 0 && irq < 64);
+    s->gpu_irq_level = deposit64(s->gpu_irq_level, irq, 1, level != 0);
+    bcm2835_ic_update(s);
+}
+
+static void bcm2835_ic_set_arm_irq(void *opaque, int irq, int level)
+{
+    BCM2835ICState *s = opaque;
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
+    case IRQ_PENDING_1:  /* IRQ pending 1 */
+        res = gpu_pending;
+        break;
+    case IRQ_PENDING_2:  /* IRQ pending 2 */
+        res = gpu_pending >> 32;
+        break;
+    case FIQ_CONTROL:  /* FIQ register */
+        res = (s->fiq_enable << 7) | s->fiq_select;
+        break;
+    case IRQ_ENABLE_1:  /* Interrupt enable register 1 */
+        res = s->gpu_irq_enable;
+        break;
+    case IRQ_ENABLE_2:  /* Interrupt enable register 2 */
+        res = s->gpu_irq_enable >> 32;
+        break;
+    case IRQ_ENABLE_BASIC:  /* Base interrupt enable register */
+        res = s->arm_irq_enable;
+        break;
+    case IRQ_DISABLE_1:  /* Interrupt disable register 1 */
+        res = ~s->gpu_irq_enable;
+        break;
+    case IRQ_DISABLE_2:  /* Interrupt disable register 2 */
+        res = ~s->gpu_irq_enable >> 32;
+        break;
+    case IRQ_DISABLE_BASIC:  /* Base interrupt disable register */
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
+        s->fiq_select = (val & 0x7f);
+        s->fiq_enable = (val >> 7) & 0x1;
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
index 0000000..d897f44
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
+#define TYPE_BCM2835_IC "bcm2835_ic"
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
+
+    /* 64 GPU IRQs + 8 ARM IRQs = 72 total (GPU first) */
+    uint64_t gpu_irq_level, gpu_irq_enable;
+    uint8_t arm_irq_level, arm_irq_enable;
+    bool fiq_enable;
+    uint8_t fiq_select;
+    qemu_irq irq;
+    qemu_irq fiq;
+} BCM2835ICState;
+
+#endif
-- 
2.5.3

