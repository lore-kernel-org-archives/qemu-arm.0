Received: by 10.182.158.201 with SMTP id ww9csp415861obb;
        Thu, 3 Dec 2015 22:07:47 -0800 (PST)
X-Received: by 10.140.159.206 with SMTP id f197mr16960971qhf.72.1449209267969;
        Thu, 03 Dec 2015 22:07:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u84si4443924qhu.124.2015.12.03.22.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 22:07:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4jX1-0007Ql-OH
	for alex.bennee@linaro.org; Fri, 04 Dec 2015 01:07:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSe-0000ZI-Eg
	for qemu-devel@nongnu.org; Fri, 04 Dec 2015 01:03:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4jSa-00008z-NT
	for qemu-devel@nongnu.org; Fri, 04 Dec 2015 01:03:16 -0500
Received: from mail-bn1on0116.outbound.protection.outlook.com
	([157.56.110.116]:59776
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4jSa-00007J-H7; Fri, 04 Dec 2015 01:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=svUrNfCtNJsKkp/mAJ4LjBOk4cq4E4Ds1gnbkSWXP/M=;
	b=FzNlWN6fg+HwK84S0RwDxrKUrRvAreOzwh4i4C0ivIW1m5rNksCvfGM5td1rgnQOeS5mUlb8mSNeMkGKHeoDXO3Wg+ROhxK7UhTt5dG8LcLBFNrde2Xg0Ga9tA9ZV67fVVQ911sMODwCSitCDnjhC28c+QxqlQrjfyfPPpizC9U=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Fri, 4 Dec 2015 06:03:08 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 22:01:20 -0800
Message-ID: <1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:6::724]
X-ClientProxiedBy: CY1PR21CA0026.namprd21.prod.outlook.com (25.161.247.36) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:L4cGa5K4cl5DZGl+jrJfO/0rGnAdsK3bqLNIkiWTG457sOEWQ72BHxF7ctDR0/mTmwLYGO4ucXlCDFn5edbY/E4danBrdrNygR69AjghhrUTsW2Jfq8fEmU+AuZSiAdHhvsXG2k+gQqB8gUmoAcKVQ==;
	3:cGYhPv3zeH8NFwZqpiCoSRsiQwcs8XOQ0MIoECZoqVpmCu03uexb1H8QhywVu1pS5RrqUbZriQE5eRL9jWdub8ZAo6Jr0IiPC3h3TpoNtj1KR4GTHlGuKddmlO1qu8+Y;
	25:zwjyaHKOBbFrDiPX3EEAeTKIl8WqS3dMunOXY+ueeNkgy3o35Bo6YQZiKPMCLwzt44H3y74wzypIrQBSI7NrpoCP96DkD5uLDm5B6QlHtsaN2uZrAoBgb1jZ3mA1UEjZar9c5j16Ttwsxik7Q4XDR8GkX8D2YqNbwXG/HE0gmDxWQP57e1hH47T7mgtdwdCZqT80rcpm4qD6fyp2FgP/poHPHS1CFENlWtM5VFj3vguI1L6c8j8a8Kar+QSOG7fWDDidC3pKoMFBbTZ/BZN8qg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:SznV6phgUfgyXXdt3ydJmPDtiik9MY7YXtljFEPfIvb2uYNu7kujk+uh/jqGX74n04RW8HSRKrrZLgQK0cL7OXh0vwtrL4TegON7ZqHHBT5LOSn0EjvWRPEdngrCCJuOfT0IypZTFkvMzqQ8yhE5Acz9gkXDODjmm9xthrs30h9nJMRHmq6WB4tLLi1Qxtd6M7G2FTQOkYAWbp9xa+berSaBXpLzU1/sd/tQGXa9k1N1hcboeh0mrm7M8jGZnoA3N5/GNqaL9QTefMmDIHRuZ6dXToxtRZvx8g5/QaUWH+nT3lp+Wicr/8xJvVslSAzHiQKx58XfxcSy7+YpnhJTbXcqeTpx4kSughFHGHyZvjSrGIXgdtqaNmk8Q/3Y7eaM8MNmZrQBMet+bH+IxWDXWBqeEsPtVnbzgZYTvk5UaNkiSFSrFF4tx8YDPEWQaQesOGsj0E83LteeroEdJodf11IIL0jbhPqhsqfwnyEGBwTkMotKE6NaFJCAqFyHZkr0;
	4:wPwCIdWHGumTOxDhJjAB8YTWkBfxJBGXTex80oThZFhZLiW2bEmYT7nFm0X276tt11y4vTp+GyFXC815gLRAbiNcyCfBYg+QNvx+rpt0IPHZldRJfudm+SNW0UhJKpKXpQanM+hg6szMsSKapQGhGTg9FNmQe/Ydtpt5iIe/nEHS5M4UUsdgBBOC6Qr4RmHoMtF3A044oJ5UZMxrUyv3EguOTTg0d/f5fdVA8tJnAVTzi0aLNFzG5kPN3ZtFthkns5sI/R79SNh1VF5aMCiub+1X8KnfKTPu5l60ELwXhnceaD/3PhrWArFkW0hZDVxsVIwiKJ1gK0ulY68qfaHrNRtVLUyMpLKhOLrib0nnyaakfaEPnBT/jBKsqqtn9zgfO+6IVLboY700xMC3YlY7g/Z7wAjFR+h3CxYfxarE5ADH9YpN9zEW+6eReLTaF5I/
X-Microsoft-Antispam-PRVS: <SN1PR0301MB2046E07A9B7A2EAEC0A390D39E0C0@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(5005710100001)(50226001)(4001430100002)(105586002)(6116002)(106356001)(42186005)(86612001)(77096005)(48376002)(575784001)(36756003)(5008740100001)(5004730100002)(10090500001)(1096002)(10290500002)(2950100001)(189998001)(87976001)(586003)(92566002)(2351001)(81156007)(19580405001)(5003940100001)(122386002)(19580395003)(86362001)(50986999)(40100003)(50466002)(110136002)(47776003)(5001960100002)(107886002)(76176999)(229853001)(97736004)(2004002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:b6LAZHeZsDgsaSRVUMRd+iIlsiKJgbpR019EPzY?=
	=?us-ascii?Q?hkVE3xuTbK5swClsNbdO9I9wjFCN0P8pHNWGGR0fm8R33V0gcGdlRUQVm/WK?=
	=?us-ascii?Q?THvmbtnjzNacHG+G6xSEb46EMyaZJ9acH+kJWy7GxXkxnDmGMVwXJYgZ7n5d?=
	=?us-ascii?Q?qnwNF1Z67HRuOhxVJrEPxT3cS0lNz1fax9e4HG1z+mDhaFc+3zwRm7u8YP8B?=
	=?us-ascii?Q?kOPTI9wPiILlJele3i2Hpakj7Sy4d7L3CxAEhJu0l2XJtPaAfLkz0lIyhdcR?=
	=?us-ascii?Q?eVVLIV3vgaUltUfqHYhmdKJC5K5KJaqNN2x5CmFS96VqZr17k8LrDTHwkehT?=
	=?us-ascii?Q?W4D85lPlKx2FyNQ3fqp9bx8v9Ud8O8xS8yTpZm9kYL32V/7tt1a62/kLre8H?=
	=?us-ascii?Q?21kT1cyYujGH4si9ah1TIPQUyB1orhyoi1qscWfDTqp5LC00okufc/ygkPbL?=
	=?us-ascii?Q?tpbKeG5BfkRHuz8+UOkPwzmt0iyLEQHCpsj3lb06k9uxRjc/1HeGF96diPZv?=
	=?us-ascii?Q?/AdrYQcMepl9TiA3Mr8hsdEWzGju4exgFw/RF0CDuL1jwtB+pR+cPgLRi/l1?=
	=?us-ascii?Q?25aUbzqYjr8+W7gBEyOpAeTmm3emK0Ng/2rIRXQGj+RFsllpKsPeTdD0zsnL?=
	=?us-ascii?Q?Xi0yYSPoD9a89W6rTF3h2VCF5mHsfplBKfhn8adNZ3R5NMR1T4M1j7Kw/x7O?=
	=?us-ascii?Q?yTrpwlOVAM3LjA3EljFvq/zNKWU+iAVvSvLUH9p618BWekbpVHf7kDro+Dcu?=
	=?us-ascii?Q?a5CDFm4EAsGqckSJsaX4C/L9JPXzAgZEfxtJdqAolH+Lsf5IKCRXCsAJKr10?=
	=?us-ascii?Q?eiLa0lIOz/ddL9fzBBS2FdptezMoKz9+Gn4sB2TW6VkIUmxYZ7g6fWknJ5pE?=
	=?us-ascii?Q?LaGKzEMnpRBHTIJrsOy32j1DvjP6XJFxO62dYPsURKJzGqToRDRV8I8REjVt?=
	=?us-ascii?Q?+NQCYOMo4YCsoQDd/Vfc9tHCGD8RnxlMIqvPTGx9AvrPctGg2uj/8NAXH24v?=
	=?us-ascii?Q?5Wwq/4y5oovIqvrI6RMsHBe4MzsWQnOcfJ03x/20AvmYteDgEgUsbLnWcAwV?=
	=?us-ascii?Q?K/xEVzV1CnZ8W4Dj5e/6tyQXdLcsr1ZQbwwlvDIYmeQdtDUPaCH0VlDyymCd?=
	=?us-ascii?Q?9YJFmC9kE9MAsJahtT3gwK6YbDOQqThMFp18098C8LcMZ6yvGoTw4/T23AOd?=
	=?us-ascii?Q?1g5dvD2AcFLI+e3rkbTO+eTK22H6hMas0Fj5y?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:Ufwn1ZsHgaCdtwGMNJNN/9ClvvbHA1IMZdctYAWuShS2v9EGT9dt0Vc086QGKOOM7LKujYQf8sy3Rn7qpJDOa7aFHlOLbMhSoNdd6aHuY5nbGZd8ILoCgfQNuDzxVEzCMexsqTWQ5uWvp39VGON5MA==;
	24:UY7/5HXJifjOpR0M9zlJAFRrlPuRP1c8hzZ7LZpheA/kME163gVpa5CCG/v4RPszwSnmcaHk0sMAk6GknP0c0mZY5Vh5KsibN0PBNqTP8Ns=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2015 06:03:08.2534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.116
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
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
X-TUID: 1QMlAtaG6dyL

This adds the system mailboxes which are used to communicate with a
number of GPU peripherals on Pi/Pi2.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 default-configs/arm-softmmu.mak      |   1 +
 hw/misc/Makefile.objs                |   1 +
 hw/misc/bcm2835_sbm.c                | 280 ++++++++++++++++++++
 include/hw/arm/bcm2835_arm_control.h | 481 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_mbox.h        |  19 ++
 include/hw/misc/bcm2835_sbm.h        |  37 +++
 6 files changed, 819 insertions(+)
 create mode 100644 hw/misc/bcm2835_sbm.c
 create mode 100644 include/hw/arm/bcm2835_arm_control.h
 create mode 100644 include/hw/arm/bcm2835_mbox.h
 create mode 100644 include/hw/misc/bcm2835_sbm.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index d9b90a5..a9f82a1 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -79,6 +79,7 @@ CONFIG_TUSB6010=y
 CONFIG_IMX=y
 CONFIG_MAINSTONE=y
 CONFIG_NSERIES=y
+CONFIG_RASPI=y
 CONFIG_REALVIEW=y
 CONFIG_ZAURUS=y
 CONFIG_ZYNQ=y
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index aeb6b7d..b9379f2 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -34,6 +34,7 @@ obj-$(CONFIG_OMAP) += omap_gpmc.o
 obj-$(CONFIG_OMAP) += omap_l4.o
 obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
+obj-$(CONFIG_RASPI) += bcm2835_sbm.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_sbm.c b/hw/misc/bcm2835_sbm.c
new file mode 100644
index 0000000..a5c9324
--- /dev/null
+++ b/hw/misc/bcm2835_sbm.c
@@ -0,0 +1,280 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "hw/misc/bcm2835_sbm.h"
+#include "hw/arm/bcm2835_arm_control.h"
+
+static void mbox_update_status(BCM2835Mbox *mb)
+{
+    if (mb->count == 0) {
+        mb->status |= ARM_MS_EMPTY;
+    } else {
+        mb->status &= ~ARM_MS_EMPTY;
+    }
+    if (mb->count == MBOX_SIZE) {
+        mb->status |= ARM_MS_FULL;
+    } else {
+        mb->status &= ~ARM_MS_FULL;
+    }
+}
+
+static void mbox_init(BCM2835Mbox *mb)
+{
+    int n;
+    mb->count = 0;
+    mb->config = 0;
+    for (n = 0; n < MBOX_SIZE; n++) {
+        mb->reg[n] = MBOX_INVALID_DATA;
+    }
+    mbox_update_status(mb);
+}
+
+static uint32_t mbox_pull(BCM2835Mbox *mb, int index)
+{
+    int n;
+    uint32_t val;
+
+    assert(mb->count > 0);
+    assert(index < mb->count);
+
+    val = mb->reg[index];
+    for (n = index + 1; n < mb->count; n++) {
+        mb->reg[n - 1] = mb->reg[n];
+    }
+    mb->count--;
+    mb->reg[mb->count] = MBOX_INVALID_DATA;
+
+    mbox_update_status(mb);
+
+    return val;
+}
+
+static void mbox_push(BCM2835Mbox *mb, uint32_t val)
+{
+    assert(mb->count < MBOX_SIZE);
+    mb->reg[mb->count++] = val;
+    mbox_update_status(mb);
+}
+
+static void bcm2835_sbm_update(BCM2835SbmState *s)
+{
+    int set;
+    int done, n;
+    uint32_t value;
+
+    /* Avoid unwanted recursive calls */
+    s->mbox_irq_disabled = 1;
+
+    /* Get pending responses and put them in the vc->arm mbox */
+    done = 0;
+    while (!done) {
+        done = 1;
+        if (s->mbox[0].status & ARM_MS_FULL) {
+            /* vc->arm mbox full, exit */
+        } else {
+            for (n = 0; n < MBOX_CHAN_COUNT; n++) {
+                if (s->available[n]) {
+                    value = ldl_phys(&s->mbox_as, n<<4);
+                    if (value != MBOX_INVALID_DATA) {
+                        mbox_push(&s->mbox[0], value);
+                    } else {
+                        /* Hmmm... */
+                    }
+                    done = 0;
+                    break;
+                }
+            }
+        }
+    }
+
+    /* Try to push pending requests from the arm->vc mbox */
+    /* TODO (?) */
+
+    /* Re-enable calls from the IRQ routine */
+    s->mbox_irq_disabled = 0;
+
+    /* Update ARM IRQ status */
+    set = 0;
+    if (s->mbox[0].status & ARM_MS_EMPTY) {
+        s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQPEND;
+    } else {
+        s->mbox[0].config |= ARM_MC_IHAVEDATAIRQPEND;
+        if (s->mbox[0].config & ARM_MC_IHAVEDATAIRQEN) {
+            set = 1;
+        }
+    }
+    qemu_set_irq(s->arm_irq, set);
+}
+
+static void bcm2835_sbm_set_irq(void *opaque, int irq, int level)
+{
+    BCM2835SbmState *s = (BCM2835SbmState *)opaque;
+    s->available[irq] = level;
+    if (!s->mbox_irq_disabled) {
+        bcm2835_sbm_update(s);
+    }
+}
+
+static uint64_t bcm2835_sbm_read(void *opaque, hwaddr offset,
+                           unsigned size)
+{
+    BCM2835SbmState *s = (BCM2835SbmState *)opaque;
+    uint32_t res = 0;
+
+    offset &= 0xff;
+
+    switch (offset) {
+    case 0x80:  /* MAIL0_READ */
+    case 0x84:
+    case 0x88:
+    case 0x8c:
+        if (s->mbox[0].status & ARM_MS_EMPTY) {
+            res = MBOX_INVALID_DATA;
+        } else {
+            res = mbox_pull(&s->mbox[0], 0);
+        }
+        break;
+    case 0x90:  /* MAIL0_PEEK */
+        res = s->mbox[0].reg[0];
+        break;
+    case 0x94:  /* MAIL0_SENDER */
+        break;
+    case 0x98:  /* MAIL0_STATUS */
+        res = s->mbox[0].status;
+        break;
+    case 0x9c:  /* MAIL0_CONFIG */
+        res = s->mbox[0].config;
+        break;
+    case 0xb8:  /* MAIL1_STATUS */
+        res = s->mbox[1].status;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_sbm_read: Bad offset %x\n", (int)offset);
+        return 0;
+    }
+
+    bcm2835_sbm_update(s);
+
+    return res;
+}
+
+static void bcm2835_sbm_write(void *opaque, hwaddr offset,
+                        uint64_t value, unsigned size)
+{
+    int ch;
+
+    BCM2835SbmState *s = (BCM2835SbmState *)opaque;
+
+    offset &= 0xff;
+
+    switch (offset) {
+    case 0x94:  /* MAIL0_SENDER */
+        break;
+    case 0x9c:  /* MAIL0_CONFIG */
+        s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQEN;
+        s->mbox[0].config |= value & ARM_MC_IHAVEDATAIRQEN;
+        break;
+    case 0xa0:
+    case 0xa4:
+    case 0xa8:
+    case 0xac:
+        if (s->mbox[1].status & ARM_MS_FULL) {
+            /* Guest error */
+        } else {
+            ch = value & 0xf;
+            if (ch < MBOX_CHAN_COUNT) {
+                if (ldl_phys(&s->mbox_as, (ch<<4) + 4)) {
+                    /* Push delayed, push it in the arm->vc mbox */
+                    mbox_push(&s->mbox[1], value);
+                } else {
+                    stl_phys(&s->mbox_as, ch<<4, value);
+                }
+            } else {
+                /* Invalid channel number */
+            }
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_sbm_write: Bad offset %x\n", (int)offset);
+        return;
+    }
+
+    bcm2835_sbm_update(s);
+}
+
+static const MemoryRegionOps bcm2835_sbm_ops = {
+    .read = bcm2835_sbm_read,
+    .write = bcm2835_sbm_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_bcm2835_sbm = {
+    .name = TYPE_BCM2835_SBM,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_sbm_init(Object *obj)
+{
+    BCM2835SbmState *s = BCM2835_SBM(obj);
+    memory_region_init_io(&s->iomem, obj, &bcm2835_sbm_ops, s,
+                          TYPE_BCM2835_SBM, 0x400);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->arm_irq);
+    qdev_init_gpio_in(DEVICE(s), bcm2835_sbm_set_irq, MBOX_CHAN_COUNT);
+}
+
+static void bcm2835_sbm_realize(DeviceState *dev, Error **errp)
+{
+    int n;
+    BCM2835SbmState *s = BCM2835_SBM(dev);
+    Object *obj;
+    Error *err = NULL;
+
+    obj = object_property_get_link(OBJECT(dev), "mbox_mr", &err);
+    if (err || obj == NULL) {
+        error_setg(errp, "bcm2835_sbm: required mbox_mr link not found");
+        return;
+    }
+
+    s->mbox_mr = MEMORY_REGION(obj);
+    address_space_init(&s->mbox_as, s->mbox_mr, NULL);
+
+    mbox_init(&s->mbox[0]);
+    mbox_init(&s->mbox[1]);
+    s->mbox_irq_disabled = 0;
+    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
+        s->available[n] = 0;
+    }
+}
+
+static void bcm2835_sbm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2835_sbm_realize;
+    dc->vmsd = &vmstate_bcm2835_sbm;
+}
+
+static TypeInfo bcm2835_sbm_info = {
+    .name          = TYPE_BCM2835_SBM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835SbmState),
+    .class_init    = bcm2835_sbm_class_init,
+    .instance_init = bcm2835_sbm_init,
+};
+
+static void bcm2835_sbm_register_types(void)
+{
+    type_register_static(&bcm2835_sbm_info);
+}
+
+type_init(bcm2835_sbm_register_types)
diff --git a/include/hw/arm/bcm2835_arm_control.h b/include/hw/arm/bcm2835_arm_control.h
new file mode 100644
index 0000000..28acba8
--- /dev/null
+++ b/include/hw/arm/bcm2835_arm_control.h
@@ -0,0 +1,481 @@
+/*
+ *  linux/arch/arm/mach-bcm2708/arm_control.h
+ *
+ *  Copyright (C) 2010 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#ifndef BCM2708_ARM_CONTROL_H_
+#define BCM2708_ARM_CONTROL_H_
+
+/*
+ * Definitions and addresses for the ARM CONTROL logic
+ * This file is manually generated.
+ */
+
+#define ARM_BASE  0x7E00B000
+
+/* Basic configuration */
+#define ARM_CONTROL0  HW_REGISTER_RW(ARM_BASE+0x000)
+#define ARM_C0_SIZ128M   0x00000000
+#define ARM_C0_SIZ256M   0x00000001
+#define ARM_C0_SIZ512M   0x00000002
+#define ARM_C0_SIZ1G     0x00000003
+#define ARM_C0_BRESP0    0x00000000
+#define ARM_C0_BRESP1    0x00000004
+#define ARM_C0_BRESP2    0x00000008
+#define ARM_C0_BOOTHI    0x00000010
+#define ARM_C0_UNUSED05  0x00000020 /* free */
+#define ARM_C0_FULLPERI  0x00000040
+#define ARM_C0_UNUSED78  0x00000180 /* free */
+#define ARM_C0_JTAGMASK  0x00000E00
+#define ARM_C0_JTAGOFF   0x00000000
+#define ARM_C0_JTAGBASH  0x00000800 /* Debug on GPIO off */
+#define ARM_C0_JTAGGPIO  0x00000C00 /* Debug on GPIO on */
+#define ARM_C0_APROTMSK  0x0000F000
+#define ARM_C0_DBG0SYNC  0x00010000 /* VPU0 halt sync */
+#define ARM_C0_DBG1SYNC  0x00020000 /* VPU1 halt sync */
+#define ARM_C0_SWDBGREQ  0x00040000 /* HW debug request */
+#define ARM_C0_PASSHALT  0x00080000 /* ARM halt passed to debugger */
+#define ARM_C0_PRIO_PER  0x00F00000 /* per priority mask */
+#define ARM_C0_PRIO_L2   0x0F000000
+#define ARM_C0_PRIO_UC   0xF0000000
+
+#define ARM_C0_APROTPASS  0x0000A000 /* Translate 1:1 */
+#define ARM_C0_APROTUSER  0x00000000 /* Only user mode */
+#define ARM_C0_APROTSYST  0x0000F000 /* Only system mode */
+
+
+#define ARM_CONTROL1  HW_REGISTER_RW(ARM_BASE+0x440)
+#define ARM_C1_TIMER     0x00000001 /* re-route timer IRQ  to VC */
+#define ARM_C1_MAIL      0x00000002 /* re-route Mail IRQ   to VC */
+#define ARM_C1_BELL0     0x00000004 /* re-route Doorbell 0 to VC */
+#define ARM_C1_BELL1     0x00000008 /* re-route Doorbell 1 to VC */
+#define ARM_C1_PERSON    0x00000100 /* peripherals on */
+#define ARM_C1_REQSTOP   0x00000200 /* ASYNC bridge request stop */
+
+#define ARM_STATUS    HW_REGISTER_RW(ARM_BASE+0x444)
+#define ARM_S_ACKSTOP    0x80000000 /* Bridge stopped */
+#define ARM_S_READPEND   0x000003FF /* pending reads counter */
+#define ARM_S_WRITPEND   0x000FFC00 /* pending writes counter */
+
+#define ARM_ERRHALT   HW_REGISTER_RW(ARM_BASE+0x448)
+#define ARM_EH_PERIBURST  0x00000001 /* Burst write seen on peri bus */
+#define ARM_EH_ILLADDRS1  0x00000002 /* Address bits 25-27 error */
+#define ARM_EH_ILLADDRS2  0x00000004 /* Address bits 31-28 error */
+#define ARM_EH_VPU0HALT   0x00000008 /* VPU0 halted & in debug mode */
+#define ARM_EH_VPU1HALT   0x00000010 /* VPU1 halted & in debug mode */
+#define ARM_EH_ARMHALT    0x00000020 /* ARM in halted debug mode */
+
+#define ARM_ID_SECURE HW_REGISTER_RW(ARM_BASE+0x00C)
+#define ARM_ID        HW_REGISTER_RW(ARM_BASE+0x44C)
+#define ARM_IDVAL        0x364D5241
+
+/* Translation memory */
+#define ARM_TRANSLATE HW_REGISTER_RW(ARM_BASE+0x100)
+/* 32 locations: 0x100.. 0x17F */
+/* 32 spare means we CAN go to 64 pages.... */
+
+
+/* Interrupts */
+#define ARM_IRQ_PEND0 HW_REGISTER_RW(ARM_BASE+0x200)        /* Top IRQ bits */
+#define ARM_I0_TIMER    0x00000001 /* timer IRQ */
+#define ARM_I0_MAIL     0x00000002 /* Mail IRQ */
+#define ARM_I0_BELL0    0x00000004 /* Doorbell 0 */
+#define ARM_I0_BELL1    0x00000008 /* Doorbell 1 */
+#define ARM_I0_BANK1    0x00000100 /* Bank1 IRQ */
+#define ARM_I0_BANK2    0x00000200 /* Bank2 IRQ */
+
+#define ARM_IRQ_PEND1 HW_REGISTER_RW(ARM_BASE+0x204) /* All bank1 IRQ bits */
+/* todo: all I1_interrupt sources */
+#define ARM_IRQ_PEND2 HW_REGISTER_RW(ARM_BASE+0x208) /* All bank2 IRQ bits */
+/* todo: all I2_interrupt sources */
+
+#define ARM_IRQ_FAST  HW_REGISTER_RW(ARM_BASE+0x20C) /* FIQ control */
+#define ARM_IF_INDEX    0x0000007F     /* FIQ select */
+#define ARM_IF_ENABLE   0x00000080     /* FIQ enable */
+#define ARM_IF_VCMASK   0x0000003F     /* FIQ = (index from VC source) */
+#define ARM_IF_TIMER    0x00000040     /* FIQ = ARM timer */
+#define ARM_IF_MAIL     0x00000041     /* FIQ = ARM Mail */
+#define ARM_IF_BELL0    0x00000042     /* FIQ = ARM Doorbell 0 */
+#define ARM_IF_BELL1    0x00000043     /* FIQ = ARM Doorbell 1 */
+#define ARM_IF_VP0HALT  0x00000044     /* FIQ = VPU0 Halt seen */
+#define ARM_IF_VP1HALT  0x00000045     /* FIQ = VPU1 Halt seen */
+#define ARM_IF_ILLEGAL  0x00000046     /* FIQ = Illegal access seen */
+
+#define ARM_IRQ_ENBL1 HW_REGISTER_RW(ARM_BASE+0x210) /* Bank1 enable bits */
+#define ARM_IRQ_ENBL2 HW_REGISTER_RW(ARM_BASE+0x214) /* Bank2 enable bits */
+#define ARM_IRQ_ENBL3 HW_REGISTER_RW(ARM_BASE+0x218) /* ARM irqs enable bits */
+#define ARM_IRQ_DIBL1 HW_REGISTER_RW(ARM_BASE+0x21C) /* Bank1 disable bits */
+#define ARM_IRQ_DIBL2 HW_REGISTER_RW(ARM_BASE+0x220) /* Bank2 disable bits */
+#define ARM_IRQ_DIBL3 HW_REGISTER_RW(ARM_BASE+0x224) /* ARM irqs disable bits */
+#define ARM_IE_TIMER    0x00000001     /* Timer IRQ */
+#define ARM_IE_MAIL     0x00000002     /* Mail IRQ */
+#define ARM_IE_BELL0    0x00000004     /* Doorbell 0 */
+#define ARM_IE_BELL1    0x00000008     /* Doorbell 1 */
+#define ARM_IE_VP0HALT  0x00000010     /* VPU0 Halt */
+#define ARM_IE_VP1HALT  0x00000020     /* VPU1 Halt */
+#define ARM_IE_ILLEGAL  0x00000040     /* Illegal access seen */
+
+/* Timer */
+/* For reg. fields see sp804 spec. */
+#define ARM_T_LOAD    HW_REGISTER_RW(ARM_BASE+0x400)
+#define ARM_T_VALUE   HW_REGISTER_RW(ARM_BASE+0x404)
+#define ARM_T_CONTROL HW_REGISTER_RW(ARM_BASE+0x408)
+#define ARM_T_IRQCNTL HW_REGISTER_RW(ARM_BASE+0x40C)
+#define ARM_T_RAWIRQ  HW_REGISTER_RW(ARM_BASE+0x410)
+#define ARM_T_MSKIRQ  HW_REGISTER_RW(ARM_BASE+0x414)
+#define ARM_T_RELOAD  HW_REGISTER_RW(ARM_BASE+0x418)
+#define ARM_T_PREDIV  HW_REGISTER_RW(ARM_BASE+0x41c)
+#define ARM_T_FREECNT HW_REGISTER_RW(ARM_BASE+0x420)
+
+#define TIMER_CTRL_ONESHOT  (1 << 0)
+#define TIMER_CTRL_32BIT    (1 << 1)
+#define TIMER_CTRL_DIV1     (0 << 2)
+#define TIMER_CTRL_DIV16    (1 << 2)
+#define TIMER_CTRL_DIV256   (2 << 2)
+#define TIMER_CTRL_IE       (1 << 5)
+#define TIMER_CTRL_PERIODIC (1 << 6)
+#define TIMER_CTRL_ENABLE   (1 << 7)
+#define TIMER_CTRL_DBGHALT  (1 << 8)
+#define TIMER_CTRL_ENAFREE  (1 << 9)
+#define TIMER_CTRL_FREEDIV_SHIFT 16)
+#define TIMER_CTRL_FREEDIV_MASK  0xff
+
+/* Semaphores, Doorbells, Mailboxes */
+#define ARM_SBM_OWN0  (ARM_BASE+0x800)
+#define ARM_SBM_OWN1  (ARM_BASE+0x900)
+#define ARM_SBM_OWN2  (ARM_BASE+0xA00)
+#define ARM_SBM_OWN3  (ARM_BASE+0xB00)
+
+/* MAILBOXES
+ * Register flags are common across all
+ * owner registers. See end of this section
+ *
+ * Semaphores, Doorbells, Mailboxes Owner 0
+ *
+ */
+
+#define ARM_0_SEMS       HW_REGISTER_RW(ARM_SBM_OWN0+0x00)
+#define ARM_0_SEM0       HW_REGISTER_RW(ARM_SBM_OWN0+0x00)
+#define ARM_0_SEM1       HW_REGISTER_RW(ARM_SBM_OWN0+0x04)
+#define ARM_0_SEM2       HW_REGISTER_RW(ARM_SBM_OWN0+0x08)
+#define ARM_0_SEM3       HW_REGISTER_RW(ARM_SBM_OWN0+0x0C)
+#define ARM_0_SEM4       HW_REGISTER_RW(ARM_SBM_OWN0+0x10)
+#define ARM_0_SEM5       HW_REGISTER_RW(ARM_SBM_OWN0+0x14)
+#define ARM_0_SEM6       HW_REGISTER_RW(ARM_SBM_OWN0+0x18)
+#define ARM_0_SEM7       HW_REGISTER_RW(ARM_SBM_OWN0+0x1C)
+#define ARM_0_BELL0      HW_REGISTER_RW(ARM_SBM_OWN0+0x40)
+#define ARM_0_BELL1      HW_REGISTER_RW(ARM_SBM_OWN0+0x44)
+#define ARM_0_BELL2      HW_REGISTER_RW(ARM_SBM_OWN0+0x48)
+#define ARM_0_BELL3      HW_REGISTER_RW(ARM_SBM_OWN0+0x4C)
+/* MAILBOX 0 access in Owner 0 area */
+/* Some addresses should ONLY be used by owner 0 */
+#define ARM_0_MAIL0_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0x80)  /* .. 0x8C (4 locations) */
+#define ARM_0_MAIL0_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0x80)  /* .. 0x8C (4 locs) Normal read */
+#define ARM_0_MAIL0_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0x90)  /* none-pop read */
+#define ARM_0_MAIL0_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0x94)  /* Sender read (only LS 2 bits) */
+#define ARM_0_MAIL0_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0x98)  /* Status read */
+#define ARM_0_MAIL0_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0x9C)  /* Config read/write */
+/* MAILBOX 1 access in Owner 0 area */
+/* Owner 0 should only WRITE to this mailbox */
+#define ARM_0_MAIL1_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xA0)   /* .. 0xAC (4 locations) */
+/*#define ARM_0_MAIL1_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xA0) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_0_MAIL1_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xB0) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_0_MAIL1_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xB4) */ /* DO NOT USE THIS !!!!! */
+#define ARM_0_MAIL1_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xB8)   /* Status read */
+/*#define ARM_0_MAIL1_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xBC) */ /* DO NOT USE THIS !!!!! */
+/* General SEM, BELL, MAIL config/status */
+#define ARM_0_SEMCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xE0)  /* semaphore clear/debug register */
+#define ARM_0_BELLCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xE4)  /* Doorbells clear/debug register */
+#define ARM_0_ALL_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xF8)  /* ALL interrupts */
+#define ARM_0_MY_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN0+0xFC)  /* IRQS pending for owner 0 */
+
+/* Semaphores, Doorbells, Mailboxes Owner 1 */
+#define ARM_1_SEMS       HW_REGISTER_RW(ARM_SBM_OWN1+0x00)
+#define ARM_1_SEM0       HW_REGISTER_RW(ARM_SBM_OWN1+0x00)
+#define ARM_1_SEM1       HW_REGISTER_RW(ARM_SBM_OWN1+0x04)
+#define ARM_1_SEM2       HW_REGISTER_RW(ARM_SBM_OWN1+0x08)
+#define ARM_1_SEM3       HW_REGISTER_RW(ARM_SBM_OWN1+0x0C)
+#define ARM_1_SEM4       HW_REGISTER_RW(ARM_SBM_OWN1+0x10)
+#define ARM_1_SEM5       HW_REGISTER_RW(ARM_SBM_OWN1+0x14)
+#define ARM_1_SEM6       HW_REGISTER_RW(ARM_SBM_OWN1+0x18)
+#define ARM_1_SEM7       HW_REGISTER_RW(ARM_SBM_OWN1+0x1C)
+#define ARM_1_BELL0      HW_REGISTER_RW(ARM_SBM_OWN1+0x40)
+#define ARM_1_BELL1      HW_REGISTER_RW(ARM_SBM_OWN1+0x44)
+#define ARM_1_BELL2      HW_REGISTER_RW(ARM_SBM_OWN1+0x48)
+#define ARM_1_BELL3      HW_REGISTER_RW(ARM_SBM_OWN1+0x4C)
+/* MAILBOX 0 access in Owner 0 area */
+/* Owner 1 should only WRITE to this mailbox */
+#define ARM_1_MAIL0_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0x80)  /* .. 0x8C (4 locations) */
+/*#define ARM_1_MAIL0_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0x80) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_1_MAIL0_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0x90) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_1_MAIL0_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0x94) */ /* DO NOT USE THIS !!!!! */
+#define ARM_1_MAIL0_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0x98)  /* Status read */
+/*#define ARM_1_MAIL0_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0x9C) */ /* DO NOT USE THIS !!!!! */
+/* MAILBOX 1 access in Owner 0 area */
+#define ARM_1_MAIL1_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xA0)  /* .. 0xAC (4 locations) */
+#define ARM_1_MAIL1_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xA0)  /* .. 0xAC (4 locs) Normal read */
+#define ARM_1_MAIL1_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xB0)  /* none-pop read */
+#define ARM_1_MAIL1_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xB4)  /* Sender read (only LS 2 bits) */
+#define ARM_1_MAIL1_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xB8)  /* Status read */
+#define ARM_1_MAIL1_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xBC)
+/* General SEM, BELL, MAIL config/status */
+#define ARM_1_SEMCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xE0)  /* semaphore clear/debug register */
+#define ARM_1_BELLCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xE4)  /* Doorbells clear/debug register */
+#define ARM_1_MY_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xFC)  /* IRQS pending for owner 1 */
+#define ARM_1_ALL_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN1+0xF8)  /* ALL interrupts */
+
+/* Semaphores, Doorbells, Mailboxes Owner 2 */
+#define ARM_2_SEMS       HW_REGISTER_RW(ARM_SBM_OWN2+0x00)
+#define ARM_2_SEM0       HW_REGISTER_RW(ARM_SBM_OWN2+0x00)
+#define ARM_2_SEM1       HW_REGISTER_RW(ARM_SBM_OWN2+0x04)
+#define ARM_2_SEM2       HW_REGISTER_RW(ARM_SBM_OWN2+0x08)
+#define ARM_2_SEM3       HW_REGISTER_RW(ARM_SBM_OWN2+0x0C)
+#define ARM_2_SEM4       HW_REGISTER_RW(ARM_SBM_OWN2+0x10)
+#define ARM_2_SEM5       HW_REGISTER_RW(ARM_SBM_OWN2+0x14)
+#define ARM_2_SEM6       HW_REGISTER_RW(ARM_SBM_OWN2+0x18)
+#define ARM_2_SEM7       HW_REGISTER_RW(ARM_SBM_OWN2+0x1C)
+#define ARM_2_BELL0      HW_REGISTER_RW(ARM_SBM_OWN2+0x40)
+#define ARM_2_BELL1      HW_REGISTER_RW(ARM_SBM_OWN2+0x44)
+#define ARM_2_BELL2      HW_REGISTER_RW(ARM_SBM_OWN2+0x48)
+#define ARM_2_BELL3      HW_REGISTER_RW(ARM_SBM_OWN2+0x4C)
+/* MAILBOX 0 access in Owner 2 area */
+/* Owner 2 should only WRITE to this mailbox */
+#define ARM_2_MAIL0_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0x80)   /* .. 0x8C (4 locations) */
+/*#define ARM_2_MAIL0_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0x80)  */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_2_MAIL0_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0x90)  */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_2_MAIL0_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0x94)  */ /* DO NOT USE THIS !!!!! */
+#define ARM_2_MAIL0_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0x98)   /* Status read */
+/*#define ARM_2_MAIL0_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0x9C)  */ /* DO NOT USE THIS !!!!! */
+/* MAILBOX 1 access in Owner 2 area */
+/* Owner 2 should only WRITE to this mailbox */
+#define ARM_2_MAIL1_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xA0)   /* .. 0xAC (4 locations) */
+/*#define ARM_2_MAIL1_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xA0) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_2_MAIL1_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xB0) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_2_MAIL1_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xB4) */ /* DO NOT USE THIS !!!!! */
+#define ARM_2_MAIL1_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xB8)   /* Status read */
+/*#define ARM_2_MAIL1_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xBC) */ /* DO NOT USE THIS !!!!! */
+/* General SEM, BELL, MAIL config/status */
+#define ARM_2_SEMCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xE0)  /* semaphore clear/debug register */
+#define ARM_2_BELLCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xE4)  /* Doorbells clear/debug register */
+#define ARM_2_MY_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xFC)  /* IRQS pending for owner 2 */
+#define ARM_2_ALL_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN2+0xF8)  /* ALL interrupts */
+
+/* Semaphores, Doorbells, Mailboxes Owner 3 */
+#define ARM_3_SEMS       HW_REGISTER_RW(ARM_SBM_OWN3+0x00)
+#define ARM_3_SEM0       HW_REGISTER_RW(ARM_SBM_OWN3+0x00)
+#define ARM_3_SEM1       HW_REGISTER_RW(ARM_SBM_OWN3+0x04)
+#define ARM_3_SEM2       HW_REGISTER_RW(ARM_SBM_OWN3+0x08)
+#define ARM_3_SEM3       HW_REGISTER_RW(ARM_SBM_OWN3+0x0C)
+#define ARM_3_SEM4       HW_REGISTER_RW(ARM_SBM_OWN3+0x10)
+#define ARM_3_SEM5       HW_REGISTER_RW(ARM_SBM_OWN3+0x14)
+#define ARM_3_SEM6       HW_REGISTER_RW(ARM_SBM_OWN3+0x18)
+#define ARM_3_SEM7       HW_REGISTER_RW(ARM_SBM_OWN3+0x1C)
+#define ARM_3_BELL0      HW_REGISTER_RW(ARM_SBM_OWN3+0x40)
+#define ARM_3_BELL1      HW_REGISTER_RW(ARM_SBM_OWN3+0x44)
+#define ARM_3_BELL2      HW_REGISTER_RW(ARM_SBM_OWN3+0x48)
+#define ARM_3_BELL3      HW_REGISTER_RW(ARM_SBM_OWN3+0x4C)
+/* MAILBOX 0 access in Owner 3 area */
+/* Owner 3 should only WRITE to this mailbox */
+#define ARM_3_MAIL0_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0x80)   /* .. 0x8C (4 locations) */
+/*#define ARM_3_MAIL0_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0x80)  */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_3_MAIL0_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0x90)  */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_3_MAIL0_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0x94)  */ /* DO NOT USE THIS !!!!! */
+#define ARM_3_MAIL0_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0x98)    /* Status read */
+/*#define ARM_3_MAIL0_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0x9C)  */ /* DO NOT USE THIS !!!!! */
+/* MAILBOX 1 access in Owner 3 area */
+/* Owner 3 should only WRITE to this mailbox */
+#define ARM_3_MAIL1_WRT \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xA0)   /* .. 0xAC (4 locations) */
+/*#define ARM_3_MAIL1_RD \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xA0) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_3_MAIL1_POL \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xB0) */ /* DO NOT USE THIS !!!!! */
+/*#define ARM_3_MAIL1_SND \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xB4) */ /* DO NOT USE THIS !!!!! */
+#define ARM_3_MAIL1_STA \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xB8)   /* Status read */
+/*#define ARM_3_MAIL1_CNF \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xBC) */ /* DO NOT USE THIS !!!!! */
+/* General SEM, BELL, MAIL config/status */
+#define ARM_3_SEMCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xE0)  /* semaphore clear/debug register */
+#define ARM_3_BELLCLRDBG \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xE4)  /* Doorbells clear/debug register */
+#define ARM_3_MY_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xFC)  /* IRQS pending for owner 3 */
+#define ARM_3_ALL_IRQS \
+        HW_REGISTER_RW(ARM_SBM_OWN3+0xF8)  /* ALL interrupts */
+
+/*  Mailbox flags. Valid for all owners */
+
+/* Mailbox status register (...0x98) */
+#define ARM_MS_FULL       0x80000000
+#define ARM_MS_EMPTY      0x40000000
+#define ARM_MS_LEVEL      0x400000FF /* Max. value depends on mailbox depth */
+
+/* MAILBOX config/status register (...0x9C) */
+/* ANY write to this register clears the error bits! */
+#define ARM_MC_IHAVEDATAIRQEN    0x00000001 /* mbox irq enable:  has data */
+#define ARM_MC_IHAVESPACEIRQEN   0x00000002 /* mbox irq enable:  has space */
+#define ARM_MC_OPPISEMPTYIRQEN   0x00000004 /* mbox irq enable: Opp is empty */
+#define ARM_MC_MAIL_CLEAR        0x00000008 /* mbox clear write 1, then  0 */
+#define ARM_MC_IHAVEDATAIRQPEND  0x00000010 /* mbox irq pending:  has space */
+#define ARM_MC_IHAVESPACEIRQPEND 0x00000020 /* mbox irq pending: Opp is empty */
+#define ARM_MC_OPPISEMPTYIRQPEND 0x00000040 /* mbox irq pending */
+/* Bit 7 is unused */
+#define ARM_MC_ERRNOOWN   0x00000100 /* error : none owner read from mailbox */
+#define ARM_MC_ERROVERFLW 0x00000200 /* error : write to fill mailbox */
+#define ARM_MC_ERRUNDRFLW 0x00000400 /* error : read from empty mailbox */
+
+/* Semaphore clear/debug register (...0xE0) */
+#define ARM_SD_OWN0      0x00000003  /* Owner of sem 0 */
+#define ARM_SD_OWN1      0x0000000C  /* Owner of sem 1 */
+#define ARM_SD_OWN2      0x00000030  /* Owner of sem 2 */
+#define ARM_SD_OWN3      0x000000C0  /* Owner of sem 3 */
+#define ARM_SD_OWN4      0x00000300  /* Owner of sem 4 */
+#define ARM_SD_OWN5      0x00000C00  /* Owner of sem 5 */
+#define ARM_SD_OWN6      0x00003000  /* Owner of sem 6 */
+#define ARM_SD_OWN7      0x0000C000  /* Owner of sem 7 */
+#define ARM_SD_SEM0      0x00010000  /* Status of sem 0 */
+#define ARM_SD_SEM1      0x00020000  /* Status of sem 1 */
+#define ARM_SD_SEM2      0x00040000  /* Status of sem 2 */
+#define ARM_SD_SEM3      0x00080000  /* Status of sem 3 */
+#define ARM_SD_SEM4      0x00100000  /* Status of sem 4 */
+#define ARM_SD_SEM5      0x00200000  /* Status of sem 5 */
+#define ARM_SD_SEM6      0x00400000  /* Status of sem 6 */
+#define ARM_SD_SEM7      0x00800000  /* Status of sem 7 */
+
+/* Doorbells clear/debug register (...0xE4) */
+#define ARM_BD_OWN0      0x00000003  /* Owner of doorbell 0 */
+#define ARM_BD_OWN1      0x0000000C  /* Owner of doorbell 1 */
+#define ARM_BD_OWN2      0x00000030  /* Owner of doorbell 2 */
+#define ARM_BD_OWN3      0x000000C0  /* Owner of doorbell 3 */
+#define ARM_BD_BELL0     0x00000100  /* Status of doorbell 0 */
+#define ARM_BD_BELL1     0x00000200  /* Status of doorbell 1 */
+#define ARM_BD_BELL2     0x00000400  /* Status of doorbell 2 */
+#define ARM_BD_BELL3     0x00000800  /* Status of doorbell 3 */
+
+/* MY IRQS register (...0xF8) */
+#define ARM_MYIRQ_BELL   0x00000001  /* This owner has a doorbell IRQ */
+#define ARM_MYIRQ_MAIL   0x00000002  /* This owner has a mailbox  IRQ */
+
+/* ALL IRQS register (...0xF8) */
+#define ARM_AIS_BELL0 0x00000001  /* Doorbell 0 IRQ pending */
+#define ARM_AIS_BELL1 0x00000002  /* Doorbell 1 IRQ pending */
+#define ARM_AIS_BELL2 0x00000004  /* Doorbell 2 IRQ pending */
+#define ARM_AIS_BELL3 0x00000008  /* Doorbell 3 IRQ pending */
+#define ARM_AIS0_HAVEDATA 0x00000010  /* MAIL 0 has data IRQ pending */
+#define ARM_AIS0_HAVESPAC 0x00000020  /* MAIL 0 has space IRQ pending */
+#define ARM_AIS0_OPPEMPTY 0x00000040  /* MAIL 0 opposite is empty IRQ */
+#define ARM_AIS1_HAVEDATA 0x00000080  /* MAIL 1 has data IRQ pending */
+#define ARM_AIS1_HAVESPAC 0x00000100  /* MAIL 1 has space IRQ pending */
+#define ARM_AIS1_OPPEMPTY 0x00000200  /* MAIL 1 opposite is empty IRQ */
+/* Note   that bell-0, bell-1 and MAIL0 IRQ go only to the ARM */
+/* Whilst that bell-2, bell-3 and MAIL1 IRQ go only to the VC */
+/* */
+/* ARM JTAG BASH */
+/* */
+#define AJB_BASE 0x7e2000c0
+
+#define AJBCONF HW_REGISTER_RW(AJB_BASE+0x00)
+#define   AJB_BITS0    0x000000
+#define   AJB_BITS4    0x000004
+#define   AJB_BITS8    0x000008
+#define   AJB_BITS12   0x00000C
+#define   AJB_BITS16   0x000010
+#define   AJB_BITS20   0x000014
+#define   AJB_BITS24   0x000018
+#define   AJB_BITS28   0x00001C
+#define   AJB_BITS32   0x000020
+#define   AJB_BITS34   0x000022
+#define   AJB_OUT_MS   0x000040
+#define   AJB_OUT_LS   0x000000
+#define   AJB_INV_CLK  0x000080
+#define   AJB_D0_RISE  0x000100
+#define   AJB_D0_FALL  0x000000
+#define   AJB_D1_RISE  0x000200
+#define   AJB_D1_FALL  0x000000
+#define   AJB_IN_RISE  0x000400
+#define   AJB_IN_FALL  0x000000
+#define   AJB_ENABLE   0x000800
+#define   AJB_HOLD0    0x000000
+#define   AJB_HOLD1    0x001000
+#define   AJB_HOLD2    0x002000
+#define   AJB_HOLD3    0x003000
+#define   AJB_RESETN   0x004000
+#define   AJB_CLKSHFT  16
+#define   AJB_BUSY     0x80000000
+#define AJBTMS HW_REGISTER_RW(AJB_BASE+0x04)
+#define AJBTDI HW_REGISTER_RW(AJB_BASE+0x08)
+#define AJBTDO HW_REGISTER_RW(AJB_BASE+0x0c)
+
+#endif
diff --git a/include/hw/arm/bcm2835_mbox.h b/include/hw/arm/bcm2835_mbox.h
new file mode 100644
index 0000000..78ab814
--- /dev/null
+++ b/include/hw/arm/bcm2835_mbox.h
@@ -0,0 +1,19 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_MBOX_H
+#define BCM2835_MBOX_H
+
+/* Constants shared with the ARM identifying separate mailbox channels */
+#define MBOX_CHAN_POWER    0 /* for use by the power management interface */
+#define MBOX_CHAN_FB       1 /* for use by the frame buffer */
+#define MBOX_CHAN_VCHIQ    3 /* for use by the VCHIQ interface */
+#define MBOX_CHAN_PROPERTY 8 /* for use by the property channel */
+#define MBOX_CHAN_COUNT    9
+
+#define MBOX_SIZE          32
+#define MBOX_INVALID_DATA  0x0f
+
+#endif /* BCM2835_MBOX_H */
diff --git a/include/hw/misc/bcm2835_sbm.h b/include/hw/misc/bcm2835_sbm.h
new file mode 100644
index 0000000..da36fbe
--- /dev/null
+++ b/include/hw/misc/bcm2835_sbm.h
@@ -0,0 +1,37 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_SBM_H
+#define BCM2835_SBM_H
+
+#include "hw/sysbus.h"
+#include "exec/address-spaces.h"
+#include "hw/arm/bcm2835_mbox.h"
+
+#define TYPE_BCM2835_SBM "bcm2835_sbm"
+#define BCM2835_SBM(obj) \
+        OBJECT_CHECK(BCM2835SbmState, (obj), TYPE_BCM2835_SBM)
+
+typedef struct {
+    MemoryRegion *mbox_mr;
+    AddressSpace mbox_as;
+    uint32_t reg[MBOX_SIZE];
+    int count;
+    uint32_t status;
+    uint32_t config;
+} BCM2835Mbox;
+
+typedef struct {
+    SysBusDevice busdev;
+    MemoryRegion *mbox_mr;
+    AddressSpace mbox_as;
+    MemoryRegion iomem;
+    int mbox_irq_disabled;
+    qemu_irq arm_irq;
+    int available[MBOX_CHAN_COUNT];
+    BCM2835Mbox mbox[2];
+} BCM2835SbmState;
+
+#endif
-- 
2.5.3

