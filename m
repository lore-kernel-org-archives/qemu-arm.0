Received: by 10.182.158.201 with SMTP id ww9csp8831942obb;
        Thu, 31 Dec 2015 16:32:02 -0800 (PST)
X-Received: by 10.55.54.201 with SMTP id d192mr95428018qka.23.1451608322044;
        Thu, 31 Dec 2015 16:32:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c197si83476351qkb.66.2015.12.31.16.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEndR-0002zp-My
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:32:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndP-0002t6-0g
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:32:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndN-00065b-H9
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:31:58 -0500
Received: from mail-bl2on0137.outbound.protection.outlook.com
	([65.55.169.137]:60296
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndH-00063I-BZ; Thu, 31 Dec 2015 19:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Vnr6jNYf1aIlxC+I1n4CRGm0rV9QQuzxIKQXxLBRtUo=;
	b=lk5kf6QCqqSb3+ntZQ3uRAdTi14Y1/ckU8+hAezbFx39j88Om+qRIZmE95LYeNllqZXHXoqGp2t+fMFRNao8j4L6ohAnxcEZ3AHhdXGkvihb+muLgMeAZ+dzooEBr9qITnrUxuLhApNGqyRS7kiOlpU+sZrIADqG6zs41OHyL4M=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:49 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:30 -0800
Message-ID: <1451608294-16432-4-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:JYKlueNdFm9WMgb/ICtXWSKak9YmXQxJGw9uXoHk/xDdX/GM6BAKgezrTGRbcGAujKn6Q2jdg4SJOQ4z7mYQSbgIUwOY3UXgtMIUrwNT+QR+xgf8OLJnk0kJ+JmzYaHk/PQLQMQOvk7DLoD9dN3/6w==;
	3:uGRrhaiQQxEdTlwItOBg2311JcG6H/kcs4su06Yxkz2Sak2D0F6/oS6wYkJ85gvZcsFgMAsFKnRrKrAhxPp5GPEx2MTWNH4GZpU9byHsbeGr3VlXZaQ77OfsCoASvSDf;
	25:GQVFj2WNUKQhu6w1umuClwkiyGTfYW6G8/RaIDfqRw/6QgQGzPsjx0jNmDxn/z/p9wNjHTCV818xWArkx8KkKDwflTtXJIQ00Z6H8Cl+UH0DtNmITIb9qUjiTbTs1crRR8pe7gIG/nHTF+qfBrp+ZVeMGUBMrkW8w+1IGTEgZpVdIoUmpHACqsrDq4NE5jKp1bs6yj6SnYlrfIJv+fxsvx+vAMTWuTV6rPtLIr4CRJYjGVXCRAlEY3xE9UyTtWQMzaf5VTCrGdb53LmwX80cbYcimSpscar58cMaHsTPsMk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:UKbXXbeQfi2LSX69aAyTLBK7GDPdMhtPvEo2NuQ8VFVzb36HXYYVOOkB2vOBpiJ59lwDNKzix07JebsEg38ysk9gIWCj3BbI0cAJ/7Qjh54a1ddFV7L4+IhkXAaIzx0d8jtYucFTd6YG4H+o5JYivJuD82AfrEcCZf8cDhP7LJmNeAPG8yOf5oYctR5SzHRgC+VG6KxI39uI6KJSGaJD6l97+JfBxcleiT6uuJ++0TBNsBHHN1iX2mUaknWmZLqjWFOzo3b9DY1vFSaPjRD0y8vrbw/5aLd/gGdkv4L9XRPsXFsFeiqldZpmHuo9pWoU3m2o3JlInacis+d1HHy5PbxsCyGddiXQ8WoyAXQvCPMi46Hz/+KXAzwc39pSkVmL2rx7Qr52ZYIVWH8YvM/cjyUmze0FNY7J6qk3Pp0vXixQolyBjntwuU63eu8v1tL2vewV6Y+atnJKuwWEps/zEFMoSvYy+lO+whtiFmbK51sBeQ+PAfX1z4IPBXKJY9Ao;
	4:TbMiZIhHULjlrAenAz4rzrJkpysLC+RUKo33HTbjwZQqEnkmZvmD4sQG0A+2Zuvt9VctLgcqmuA7vQSm9kxoARgXhqeiIumjkUVVrEM1VdNbiRBWZAOl18gR0OYyaPJ3Q+rTv3iTPFgYtdmyHjOXbKD3CgV/oxpdBYaGrhQAW0TzumxZ29gWbqool0w5Dy/n8XU7cz3PDFaQ0PBVjkY/CH695ln0cOmbhWCsoL4FBWB5nduUvdF+/3gzlqrYMpZYEM7FiNTulIa0PcNGZUw/dTC98ZVOC4Ks793Wd9k/11Qrp/sBpWBTmeYPeTC6oTv7ca/5unQwRFrom2QQnCFwtW82VqBUfuMmaRS32hooWwmEuiTvVrMtE/lmZ1A0kiuP
X-Microsoft-Antispam-PRVS: <CY1PR0301MB20431C752CEB6DAB66AB97839EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(575784001)(5001960100002)(50226001)(107886002)(76176999)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(2950100001)(19580405001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:T2dBI+GRMQOvXbaMJVT7kpR9qNPqSQ4BCPAY+ys?=
	=?us-ascii?Q?A2GY+sKZMBkVoZIIu9NkNQrKUv1R+wmBTnO8fDe4SLM7jYZiD+k4prVS6T5E?=
	=?us-ascii?Q?l1ZThp3ItPHBQYWgpwre4GxB7G0FgGDDfKj2ZR2DgU7Ri3jaUIvNnfl0Xi0b?=
	=?us-ascii?Q?4JqJJsAK+5H2Y5eeFOlhJy6goiIabOgzHoFIV40beALR77PPww0ymGJ51iJ0?=
	=?us-ascii?Q?MHIEHX2CnOLCsGwLc3xMPUc0XcIf252FKT/BwlAch3CiuVlEpehmsXpqiQHb?=
	=?us-ascii?Q?4MIALEzlDnvuJ3+5Bx356P8q8ZEIsjM25zuYtu60nXK6mQNff9h2VgxG1c8l?=
	=?us-ascii?Q?mXlsaSpgOUCg9pXs6HUKBZ3ZpDcy25a2Go5vLfcJ6LyFzZ/Yufw6jd2kR3yH?=
	=?us-ascii?Q?ppU9vkgOUC9EgAC49Mfe+XMf3b3AuMEPonDzg0iwhptgLigOkFr1seOiUoEK?=
	=?us-ascii?Q?TGWlAj7UOtesmSLl1SOo8gT6hNtOTVe945gp4K/X89kcKBulgzUwVQwutEoo?=
	=?us-ascii?Q?Jc6Z6jcgXNb4Sk1OhmDm9ubY/5OGapJxbCdzQa/e5Oxfs4to8kCxuA66BLck?=
	=?us-ascii?Q?Kx63yoAaPOxLmQLD3dfLT+iqm6ybktumhpBEyT0UmCIELK8nUGSY3vijDssg?=
	=?us-ascii?Q?5o86VDza7bLJHaDlJLkvwA3tYYgIydc8ZdyDw4jzq/U5yvVB/GFpqSTO2LEw?=
	=?us-ascii?Q?IYucbZQZyOVOqOMMwEKfRO/gxcAHwoj+L6QBrU3xUZ7ypyc2MChLampaIasM?=
	=?us-ascii?Q?XmnCdCexNI3mH823qzFyPhtwi9rI9PLpWnA9OLOb/+D0/vQgD9YMM9Fo+uVm?=
	=?us-ascii?Q?xhfql/ArhXZxTTovqVMRHgI601jNdGhooJ2XETyx2EQgCW9MkT8ifyJgrheq?=
	=?us-ascii?Q?9KzGTWLJZ8sg7t4THssNx+Ip+CNkIYNA2+oDIMFbQPYlpeIlQuronuBYwCut?=
	=?us-ascii?Q?1sSwC9TBYAWPnzXC9sUcjXJGNyP30/bPCJggIXDpS/mN4v7JCR4by5CXRT0q?=
	=?us-ascii?Q?KQ8NetOE5zsbqChZGTlla1gYjOXiDGcnCqaP27Jw3m4D9LYmU2Y6s3H2rdIi?=
	=?us-ascii?Q?MUyF++kTNXhJRo2vJ1cjhuzf1qCgjD0aRWrWb0p9FZXAJ/NToBKkzOnJ8HCM?=
	=?us-ascii?Q?GBaVBy1An0H0EgO4foc7oNzgU6LdMACu1u0xMaH/uR9AXUmBzdDwloiizXDh?=
	=?us-ascii?Q?mJTN6XHu8ng0d0IqQomsWomz/B/b9IzjlFXa4?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:eQ079o42CR/E3RxFQB+cQzr7EAHhXLM2YowTBN5Fce9wFlbrFwyX3B1dZBk5YeckdSmw0egBN+ZI7/I+DRXxZ300EIFmU2rPCaG+ijZlI7vtYN0ZAOaq9UBSrjFhoypJWh3xl5kqBYZShEzlHxA81g==;
	24:ZSpgQNJBpDgRaCew6PuFWzHo4VMEMoSHVyfEpxjlJk3mvk/vAQrtAX0aqYHnkFflDSWWDawnDyIMitaOWBJ2OPZpV0XkkBykLrFkX/Umzyo=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:49.5289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.137
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v3 3/7] bcm2835_ic: add bcm2835 interrupt
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
X-TUID: NcxGZllKnXwD

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

Notes:
    v3:
     * minor style tweaks
     * use extract32 in place of manual shift/masking
    
    v2 changes:
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

