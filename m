Received: by 10.182.158.201 with SMTP id ww9csp413866obb;
        Thu, 3 Dec 2015 22:03:24 -0800 (PST)
X-Received: by 10.55.31.214 with SMTP id n83mr15862880qkh.50.1449209003990;
        Thu, 03 Dec 2015 22:03:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v28si2254340qkl.123.2015.12.03.22.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 22:03:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4jSl-0000lV-L6
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 01:03:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSh-0000e0-Pt
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSf-0000Dx-IY
	for qemu-arm@nongnu.org; Fri, 04 Dec 2015 01:03:19 -0500
Received: from mail-bn1on0116.outbound.protection.outlook.com
	([157.56.110.116]:59776
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4jSa-00007J-P4; Fri, 04 Dec 2015 01:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vgN7JOt71qa2x7VtEujlr4x5e4K4E+Zu8kReVBqub/k=;
	b=YBXUmE3GU/bBpHx+8W1itkGX68KPZsyjDj940z6G4gggAtDY5WI8y94dLGPvpmobsD2tAhjUqyi3ZAvJUD0o21ztPtjxJOfrkSUu+WDoCH0HDPD3iJFrtb5GeXJRyYGijJfXZHtZjpAm7mNbD/BXOaUUGQhSn9qWNUEyyrxtfho=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Fri, 4 Dec 2015 06:03:10 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 22:01:22 -0800
Message-ID: <1449208887-9564-3-git-send-email-Andrew.Baumann@microsoft.com>
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
	2:36cU8mJ+yfY25V2KCbzv+Fn7D4Ye24F4dEqfnykbiQ6ScWhIpNJsQU71fVZ39Z7SM64frT732W7dD5Oqx1X1UWUBY7ECUPHW4wGfLgpNC7hzmHHDYj4GfL9KDdGE5Q7IPBBtsvkcE2JRs+bj9UjqkQ==;
	3:3g6kGlRFr1P8pWFl0yBQr0ZAvAhhrvGhdRyIJMNf1qznYPvx2ZogOErmPPMu8vAcwrPb0QOA963OZJrZem4aJRIzI8utmJscd/QYAB6IEpIE5B0oVU+/66JG6bAj4T8t;
	25:U/Tg84YZuFpU101px5V4+8Yzf9c07hbwX+B9fOzhBx7wNlBBK+pobLEdMgb+tf7IV5Rp2gO1WOATiJl6S8jknHvnI24mEzVtSsk8+NYZvAI6zr8OQeFpHc762c6FkV069dPL7Ktyyu43njDyxdwzbl6MmCzKgwKNfnKg/0di7ovIyKf5WQLYOTC8W2qUoEQe86tZqSosLkhnnF7j8qHz6UBw4vWFSPp28b+sUAIH94yTRdP/y/btJkEfRF9worlFqlQoqMIznn1ZQInTFWNFQA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:63JX2FRVxoVITq/sJqWe0Pp8cN1E4J5TuoQApeDzTjDqQLRdHPRFOkPRS2yfRd3TBKV5JS2TZSUb7kbyYPYClwITt0xzIeDiypTEhHxHTgO3mwIrJ17/gMu7sluM0atcCZC1WriSxEhPRL+x0a7Bwtp0GVwqw3myrXHdBXdSZJN7/IduhUcDHEqTnzUYBWdSz4iO5xC4yRxTkH8Owh4N8Ul9rcUXP3gyKfqPG02H3YIBog89LvRTnn7Lb88kZ//dokFcrt4HkYD1bj+sG0u6YT6tb7z5gGtRVW1Guu4Sib7zrMNKch2FbhuJmUsbc7slKYk21CUssDFdD0RezD2gdmJwawLYQDGjxWEvt7l1Nd0N8VU1VhQJCE9vYGcyihErkhnnDEF0KgdkqT+f7+pHIDKiG/8JZy1NfSM4kNhkM4Sayq5GvNJ54/DirKuL00Qw4dEWk7Mp5XFyHScb0LKZP3LzeoNPwkYs2Vr10NoCL7p7Rz1iGlAU61//qQBl/II3;
	4:A1d6Fxoo0R9WN4N+oB09RmBvg72E7WrMbV4ZvqIhjlW7xjwR7nMK6elFPhBcqqLGEm2WEY+4eGuzBu+k3jacv/cIqRFEvMXof0uL7s6SQ+gUYdjMH26HWG8KgeGqdcqEI85RBE1nmPJ/Gw4/LTXMIkVreF/GkYzxarff/ZGZHsz1WO2FJ89OJLlfMQGn4JE7rKWX+rv7MC6ILvBzqSqL6x7tIPlJkI5IUqbbdrjGuwTiFMGUBU3nmdTap3eszh2tQ+y7CX2JVuFeqgJaCXE/MF7vYacZpqx+KiLEe6UwWdxRH9bTsTknMQG3dWWbWBT3Z2xiPFr+Hx713Rmif12XlxZ2iB2tlM4xOvokqc/uPdy+VeEqBNgQgIIHHdYZPtU8bdR20lmBgKquZBbZzrrfEOFHYVAOzYZZL3WyvrvDF9rmp+qpj2BkSTlq4SCN24zn
X-Microsoft-Antispam-PRVS: <SN1PR0301MB2046F908C4E41FF38ACC39189E0C0@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(5005710100001)(50226001)(4001430100002)(105586002)(6116002)(106356001)(42186005)(86612001)(77096005)(48376002)(575784001)(36756003)(5008740100001)(5004730100002)(10090500001)(1096002)(10290500002)(2950100001)(189998001)(87976001)(586003)(92566002)(2351001)(81156007)(19580405001)(5003940100001)(122386002)(19580395003)(86362001)(50986999)(40100003)(50466002)(110136002)(47776003)(5001960100002)(107886002)(76176999)(229853001)(97736004)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:UBkhc7zSMGUnR6G3j/GaLgiFFn/Yj3Q8BwNxXk4?=
	=?us-ascii?Q?fVMpqI4cGy6pZc6iCgO0KTOK6bentUSvj3MJ8yL40mdmgpTzvjd8MBKvyH7O?=
	=?us-ascii?Q?7vPaA2nwUsXIGvupb/4OkP9n8ZTTzwCYiZTgy8QZuOTJR5axw0o5DePENr5k?=
	=?us-ascii?Q?8pKVw61w7S5ztFHEVCgOB+fgukc05EUuLajYgfPabEeO2kVV97EoH0JRDfRl?=
	=?us-ascii?Q?kzGD4FiNt1adYUP9gIc+MRTHRSzdRzjPugAwODd4ZCfJ1TFWuKMx+nElPkrN?=
	=?us-ascii?Q?Oq3qIgbQMn1FIl67ICANiEBQXsbU9E3kBBcH9cc7IclHijIfclZPSvaXtp4R?=
	=?us-ascii?Q?X+2LMZiao9/Sj6r5gYFrCyNPwRt7VqPvHDph0X8aEOz6mc884xlXtwU1X/Nl?=
	=?us-ascii?Q?7FyVszsNMlZqJ7Ef0gG1f0OMSK9rX8sF9jDwi9A0AIeVOP2YmhRHHmny0Rt6?=
	=?us-ascii?Q?wI7dIvenUBvTvR9urLrnzqik60440o5EtgIh5ANGzInFRUa58kKJRUm6456j?=
	=?us-ascii?Q?9D7MdOGWreX3vYe8Vf6f7ib3l5o8DA2c3+FpyzMhxlJH9YD7Tz01FzpQPalF?=
	=?us-ascii?Q?Nd+wYypkHVEl+GbOA3eoJx6IVp7aMpr3Ie+JTBsIIrUrMmOOH0zi/d/DFII2?=
	=?us-ascii?Q?bTDA0lFrXQE0waKn/n6SoxEwEPeVU63k6arHhB+0Es8V5Q0SGAsxoXTDpEpe?=
	=?us-ascii?Q?HJJW4ko9ppwMxC5LhIBAflgH0Yw2LkeapEND4uhHasRWk73OHLvvk8F3P2WP?=
	=?us-ascii?Q?nhastgRhAx6brx3Y7wjir+qxYOnmzX0Chdambav1zt3ZIboUx/OHcpBP2GGo?=
	=?us-ascii?Q?sa4ncoV03jXLt+Zp6QzhGTfG9x+RSj834LjRqIMhjFkIhSlYuxMXHk+vPncB?=
	=?us-ascii?Q?ZeiOfmyb7y1bnbndQrJVHP2fGCDlnX6eXW8oV890dNUn6qtiJFSimepN8EGC?=
	=?us-ascii?Q?yzb1qMY5ehiqp92a0deNZgvgjo3+RMnnJDKeNOKsUEa5fxy5lW/QkyZ4f64r?=
	=?us-ascii?Q?CcXnSb9n8aPFhLCFZ+Ye4+1tQraqnyESw3eOsmMzVucpCTNMBCUNUTdIUsZl?=
	=?us-ascii?Q?xjvXKncZ5waDvSZ+uA+5s0LZYGNOpNQkcalDYA5f6uN373VDDeTgpCa4Pyd9?=
	=?us-ascii?Q?zwVA2/G/FxzQykRiK/6ogh3OhMJ+1c7kCr3NzRtj7rO3mlSS/wysSFswEsLZ?=
	=?us-ascii?Q?FdHN/WbBm1y80s8k=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:LMpsvnyIDCwKOPgJ2/UfhX5IUtBLHHhxVqVCpoOr/ZdpyhOt7l9Y+hk73q9cXSnz+GndLlGjzsj2PZrlBZiW0SJM03ra0q4NoeefWvMgxrHF7OT/BkvGFP32ABp6SHALMkrUKFlHJfevf8XxF9eevw==;
	24:tEs/ZV4r8Ak/5sQspVBu1u6WfUvjrNOoARJFpPF4I8yK2dYfK3SO0TmZvWvGOG1ADAXtRSnkJ2Z6qJIPfjAximsi8h1uc+Jg6dOm4tmkDTk=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 06:03:10.0972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.116
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH 3/8] bcm2835_ic: add bcm2835 interrupt controller
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
X-TUID: HDFZDrFAVZs+

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/intc/Makefile.objs        |   1 +
 hw/intc/bcm2835_ic.c         | 234 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/bcm2835_ic.h |  26 +++++
 3 files changed, 261 insertions(+)
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
index 0000000..2419575
--- /dev/null
+++ b/hw/intc/bcm2835_ic.c
@@ -0,0 +1,234 @@
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
+#include "hw/intc/bcm2835_ic.h"
+
+#define IR_B 2
+#define IR_1 0
+#define IR_2 1
+
+/* Update interrupts.  */
+static void bcm2835_ic_update(BCM2835IcState *s)
+{
+    int set;
+    int i;
+
+    set = 0;
+    if (s->fiq_enable) {
+        set = s->level[s->fiq_select >> 5] & (1u << (s->fiq_select & 0x1f));
+    }
+    qemu_set_irq(s->fiq, set);
+
+    set = 0;
+    for (i = 0; i < 3; i++) {
+        set |= (s->level[i] & s->irq_enable[i]);
+    }
+    qemu_set_irq(s->irq, set);
+
+}
+
+static void bcm2835_ic_set_irq(void *opaque, int irq, int level)
+{
+    BCM2835IcState *s = (BCM2835IcState *)opaque;
+
+    if (irq >= 0 && irq <= 71) {
+        if (level) {
+                s->level[irq >> 5] |= 1u << (irq & 0x1f);
+        } else {
+                s->level[irq >> 5] &= ~(1u << (irq & 0x1f));
+        }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_ic_set_irq: Bad irq %d\n", irq);
+    }
+
+    bcm2835_ic_update(s);
+}
+
+static const int irq_dups[] = { 7, 9, 10, 18, 19, 53, 54, 55, 56, 57, 62, -1 };
+
+static uint64_t bcm2835_ic_read(void *opaque, hwaddr offset,
+    unsigned size)
+{
+    BCM2835IcState *s = (BCM2835IcState *)opaque;
+    int i;
+    int p = 0;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case 0x00:  /* IRQ basic pending */
+        /* bits 0-7 - ARM irqs */
+        res = (s->level[IR_B] & s->irq_enable[IR_B]) & 0xff;
+        for (i = 0; i < 64; i++) {
+            if (i == irq_dups[p]) {
+                /* bits 10-20 - selected GPU irqs */
+                if (s->level[i >> 5] & s->irq_enable[i >> 5]
+                    & (1u << (i & 0x1f))) {
+                    res |= (1u << (10 + p));
+                }
+                p++;
+            } else {
+                /* bits 8-9 - one or more bits set in pending registers 1-2 */
+                if (s->level[i >> 5] & s->irq_enable[i >> 5]
+                    & (1u << (i & 0x1f))) {
+                    res |= (1u << (8 + (i >> 5)));
+                }
+            }
+        }
+        break;
+    case 0x04:  /* IRQ pending 1 */
+        res = s->level[IR_1] & s->irq_enable[IR_1];
+        break;
+    case 0x08:  /* IRQ pending 2 */
+        res = s->level[IR_2] & s->irq_enable[IR_2];
+        break;
+    case 0x0C:  /* FIQ register */
+        res = (s->fiq_enable << 7) | s->fiq_select;
+        break;
+    case 0x10:  /* Interrupt enable register 1 */
+        res = s->irq_enable[IR_1];
+        break;
+    case 0x14:  /* Interrupt enable register 2 */
+        res = s->irq_enable[IR_2];
+        break;
+    case 0x18:  /* Base interrupt enable register */
+        res = s->irq_enable[IR_B];
+        break;
+    case 0x1C:  /* Interrupt disable register 1 */
+        res = ~s->irq_enable[IR_1];
+        break;
+    case 0x20:  /* Interrupt disable register 2 */
+        res = ~s->irq_enable[IR_2];
+        break;
+    case 0x24:  /* Base interrupt disable register */
+        res = ~s->irq_enable[IR_B];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_ic_read: Bad offset %x\n", (int)offset);
+        return 0;
+    }
+
+    return res;
+}
+
+static void bcm2835_ic_write(void *opaque, hwaddr offset,
+    uint64_t val, unsigned size)
+{
+    BCM2835IcState *s = (BCM2835IcState *)opaque;
+
+    switch (offset) {
+    case 0x0C:  /* FIQ register */
+        s->fiq_select = (val & 0x7f);
+        s->fiq_enable = (val >> 7) & 0x1;
+        break;
+    case 0x10:  /* Interrupt enable register 1 */
+        s->irq_enable[IR_1] |= val;
+        break;
+    case 0x14:  /* Interrupt enable register 2 */
+        s->irq_enable[IR_2] |= val;
+        break;
+    case 0x18:  /* Base interrupt enable register */
+        s->irq_enable[IR_B] |= (val & 0xff);
+        break;
+    case 0x1C:  /* Interrupt disable register 1 */
+        s->irq_enable[IR_1] &= ~val;
+        break;
+    case 0x20:  /* Interrupt disable register 2 */
+        s->irq_enable[IR_2] &= ~val;
+        break;
+    case 0x24:  /* Base interrupt disable register */
+        s->irq_enable[IR_B] &= (~val & 0xff);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_ic_write: Bad offset %x\n", (int)offset);
+        return;
+    }
+    bcm2835_ic_update(s);
+}
+
+static const MemoryRegionOps bcm2835_ic_ops = {
+    .read = bcm2835_ic_read,
+    .write = bcm2835_ic_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void bcm2835_ic_reset(DeviceState *d)
+{
+    BCM2835IcState *s = BCM2835_IC(d);
+    int i;
+
+    for (i = 0; i < 3; i++) {
+        s->irq_enable[i] = 0;
+    }
+    s->fiq_enable = 0;
+    s->fiq_select = 0;
+}
+
+static void bcm2835_ic_init(Object *obj)
+{
+    BCM2835IcState *s = BCM2835_IC(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_ic_ops, s, TYPE_BCM2835_IC,
+                          0x200);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+
+    qdev_init_gpio_in(DEVICE(s), bcm2835_ic_set_irq, 72);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->irq);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->fiq);
+}
+
+static void bcm2835_ic_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static const VMStateDescription vmstate_bcm2835_ic = {
+    .name = TYPE_BCM2835_IC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(level, BCM2835IcState, 3),
+        VMSTATE_UINT32_ARRAY(irq_enable, BCM2835IcState, 3),
+        VMSTATE_INT32(fiq_enable, BCM2835IcState),
+        VMSTATE_INT32(fiq_select, BCM2835IcState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_ic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2835_ic_realize;
+    dc->reset = bcm2835_ic_reset;
+    dc->vmsd = &vmstate_bcm2835_ic;
+}
+
+static TypeInfo bcm2835_ic_info = {
+    .name          = TYPE_BCM2835_IC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835IcState),
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
index 0000000..428139d
--- /dev/null
+++ b/include/hw/intc/bcm2835_ic.h
@@ -0,0 +1,26 @@
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
+#define BCM2835_IC(obj) OBJECT_CHECK(BCM2835IcState, (obj), TYPE_BCM2835_IC)
+
+typedef struct BCM2835IcState {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    uint32_t level[3];
+    uint32_t irq_enable[3];
+    int fiq_enable;
+    int fiq_select;
+    qemu_irq irq;
+    qemu_irq fiq;
+} BCM2835IcState;
+
+#endif
-- 
2.5.3

