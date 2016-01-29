Received: by 10.25.159.19 with SMTP id i19csp1203406lfe;
        Fri, 29 Jan 2016 14:53:20 -0800 (PST)
X-Received: by 10.140.99.53 with SMTP id p50mr13708939qge.97.1454108000665;
        Fri, 29 Jan 2016 14:53:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65si8469606qhj.112.2016.01.29.14.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHuq-0004D6-5s
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:53:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsj-0000QV-N7
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsg-0003P9-SB
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:09 -0500
Received: from mail-by2on0114.outbound.protection.outlook.com
	([207.46.100.114]:52096
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHsg-0003N9-JG; Fri, 29 Jan 2016 17:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=5KzWrkbGbKsfqST5rbs1heG1771IojHS64F05kcQtdU=;
	b=gIJ4qQmFuJUalDlWJyyvLODJu17np1miFk8af+ZOhkd1saIcfJlGBayfK49ctzkQAtR9o5FFoZtv1zaKS5eh/iXK7AueRqE4VddUcT4UcEfIoBFaWqxFx+Jqp+SW/mU0n0F0lSLf/lfkex7RiubPUlHD4j3KllYo8kwgG5MoIh0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:51:03 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:39 -0800
Message-ID: <1454107844-15704-4-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: 6479ce68-7632-42f5-8d60-08d328feab0d
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:+DytUNAlw6c2i8ZXaoRyR4ZHvtlPI7Li9B8Dl3uwSekg2sHB0h0/Wj0iXFULeLwOOxgm/p46jDP5mOFKpjLhbAs1S8rjbzTAV2J+6DTdA79bGwmsJLByOb1iC4dssT7znXDr7x0C9rWL7Gayp9eyuynwACXJBH/n9Vw01V2NS8oP8DFnOddDC9b97433EpN4;
	3:hI6LDFXdd/EA5HDSFhuTmRMxFCwM7Z4thTZiSo7GimTG9rWWVA8Qa/OTG9GUlJiVkv95yVuJcoKJwGTUOCg7sFS+ZLxcPvRymeJ8fABQPaF2FhvcRBlDaPEK/jOncS5U;
	25:/mYc+n/1zGkiffP+TNr9coKGGNZSHeyAxpdkF6AwOGQK2PuZnN8ALvFM6khur0ngY8QkC5A2DA6HmQnHt+BPTEG5NvAvrDiWlmAYbvAjLVwCRO43z+jlGN5kuq58XcIRQPSzZFEOS76gWeXLizmZttNIDHp36xsR2Ap+fxfqgmHkcFZuWYf4WR3lqFxSQNyTckUu9Zkc1cVpcPP0j+49APaMk3ummfozpTB7rzM9Az6HjRYlVqvrrBqyrJHHtNRy4vk9Okufs5kT+FvPZaAX4B5GVthlc5lUWalC2Wv7umw=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:MgloidX+PRLm+CHXNyfP6HJ5vKSUMIfRFWMxJ0njKqKgpm+cVJGQdMwbk1hY5av5WyvNC20EzZq0BuV7yEZVjRrdGDZcY2zSttRlcBzYw0XjX2mBLrpSCE7c8+uw+Efj1T1c1ygUmbvf3YnatDCz0jenMGtdCJWi/rZMMXrWOF/8o5PynX5rQRf4OaKkDPBhZJSg5qO3EckFOxfn72C0SPsSg9QedI48hXRLFuCOKMGuj8HAVlL6c37yipSoPKq0I9UtuU4bIJcorkMnTF0VTkkuVm2Wkf3t/FUIKCIwodQ/bLQBb7RfSr+e0RuQwFxgYb363o5w6z7C4k+VnI18R7+6n9Nd+p0FMGGP1YY0vYI3rO04aXnP9eEXUcCfM8MDwZt7LS9srcEraZBQGdaXKOpYW1w4PJ1Zf4hyvf87cYPx43sVY+T4dhvAHuAC5drpTfnxTkBQaQWLlmZxffCUliuFEkc5UelvbMHh9oywNtC4B4b8KvsJ8gsIzak4oTq5;
	4:GENIMxXSMIB0E7rFQ2QYZl0tmSEA0IjqRUrM6gDRrRgBHXgEvi2B4RuYQTsCFdayC0VRCI0dtAJqhWmTCcQY/b0tEMnkmXQY2ifgAcqNtwUjS3oXm6XGvFVOUGVpxqfxex06ap4LfvLZf3KAVvZS0YvrKHL8GCwGR61pJuo1mcs9wDaEPPWfJGv/ZdFJolNjvySXz0EPMynt1RW4ZbiKTjYKVVDCJxw2NHHCaRsyd4+NXkPiO88Wdli8uzC2pZ2Lh92q8dpqUnALNhve3FQp/3gwoAcmTZVcFakXsCe0TNxeQTpzkxRy59jYz3rLrYdSXBTAS4y0dUJ6QveYial+nqNV0BwCF7ZwRDy9MoEO8/vncZ0i7TcWXlbyYbOy3x/J
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2034DEF998959DDCEAD372EF9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 083691450C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(229853001)(2950100001)(1096002)(6116002)(3470700001)(122386002)(107886002)(5003940100001)(110136002)(5001960100002)(40100003)(48376002)(47776003)(86612001)(575784001)(86362001)(50986999)(4001430100002)(189998001)(76176999)(586003)(92566002)(10290500002)(5008740100001)(87976001)(4326007)(50226001)(2351001)(10090500001)(50466002)(36756003)(5005710100001)(5004730100002)(77096005)(19580405001)(2906002)(19580395003)(42186005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:epMt/qBNxvl3dMxz8P9I9+nALJOZLPB3h7HcFO5?=
	=?us-ascii?Q?Fn+DCJ/S5dDuP7ERlByH/FL87PAQUF7Q/CWe//3a6waHJ9TzidrxSF/+sFob?=
	=?us-ascii?Q?nJRFSdk+bJjYpgbo5RNzwAyGJaE1Qg7DCsAoAfdP9ggZPf13pytdobtWMj5j?=
	=?us-ascii?Q?5mvlM+NbXPX2GHFAxHKYPALU0IKPB4Sis1Igxb6z3Jk2ViQ2/YPuKw1tjHVD?=
	=?us-ascii?Q?A0Z43DaL2A3NxSCMvc94zK/hZKwmMtIZXOO46M1uJGQKDDdfNkm45o7bP9ed?=
	=?us-ascii?Q?S+FA8+TjJLznc0fTIKCA697CM6rb3LotZ8pJ8KoPNCDNb8VvINSK93he6pEJ?=
	=?us-ascii?Q?8vZhYUQhQfIneYPiXcv/TZ/gU2It1XJwyKa5Js7LbdLc4D4pOnibA3saanIq?=
	=?us-ascii?Q?+dO6iRaE1/qzSuB53G9Ov4xV3WrUao8FZJiGn9SrjcXgM7g4vUanjPIZGcmp?=
	=?us-ascii?Q?aVbMAWhpFQxEUtaUqUcqxMg9YJ7v+TjIsAa6gh35x8kNSwtd3QjJnmzvY3RZ?=
	=?us-ascii?Q?kvxOEriciyTAnubG1uGjz/qvmxUJ5etn5NQiEptpfT2D/LzDFV8A4X/KXKlW?=
	=?us-ascii?Q?om4pMolSVGxWLjdTk7U8qOwhmj3/tXaKbre4N4P7eq5dQVr5ZOMlKDUkSwNr?=
	=?us-ascii?Q?Yq8NxFHYaSaekIojNATLjGQWwAmQNdPwRj1zTHGMvFsfOpNRjmQTUETCU4zr?=
	=?us-ascii?Q?2RI2VOxuTW8V9IXnazyysF2IaYetBsCEoL6Hwa8RCTqzWV6R/71uIrj3kMpv?=
	=?us-ascii?Q?tnm1vHY4u6u6IkJrdO5riStM4uzhfO147LHf9drCa8bHahhet9EIdNyTkHSj?=
	=?us-ascii?Q?IZc+l5H9QXTqN5bF67px3JYcJW0AosJ1AGWNOoHzSYXuFE2bBGvQcxoS/UER?=
	=?us-ascii?Q?hkIzIeyDJkdwG64QOw+bTprVHPiYX9dAeNIul7y2JvUKy75z/zosWFj6VHra?=
	=?us-ascii?Q?8Dpri5a8EiTn0GaitLB9+0dwROKJnD8BUiD1NX0udkRykrvPzDJy+zOHLjfc?=
	=?us-ascii?Q?ynBKAi2M9tZ6zkWW653qgeHqk4Vk8vLF77PPh0qUR8ptO9x+WNmpr6fqvupa?=
	=?us-ascii?Q?bGWLt0FVAH7ET/NqER0JMkR+o0bhy2s/9jgXm4ksqYNP/iQVFYg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:Ohp3D/WfSUnq4oZz0AWeBHr2FdzC+eCdNz21YVVUcpk5FlFvf+q3PlkV5jcP720PL2VHYnM+j1mbKyaUM4SNQ7E9QUzR//AE8h8Q969oO1keaYBGWp+nrdDAeRYV7h6c9JZbQb4iuuO4AhtyZDFk1g==;
	24:pNmMl42Hvez2sdVamEnF9slCjx5SlcSjsQTV1qUzdUeYz4o1lTlHJjKtx7dWAeJV2BeCbHPOZwFEWrbtO4NRkLL7IU1zdDMVs41RwtqdQds=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:51:03.7530 (UTC)
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
Subject: [Qemu-devel] [PATCH v5 3/8] bcm2835_ic: add bcm2835 interrupt
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
X-TUID: UOLn/aa4MrNE

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

