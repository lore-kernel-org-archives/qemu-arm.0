Received: by 10.25.0.6 with SMTP id 6csp1935714lfa;
        Tue, 16 May 2017 08:43:52 -0700 (PDT)
X-Received: by 10.55.38.69 with SMTP id y66mr10377150qkg.204.1494949432651;
        Tue, 16 May 2017 08:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494949432; cv=none;
        d=google.com; s=arc-20160816;
        b=QtKUojcKzpZvSa8gKdzDynmTO6+LI+nXX1gMrrn34VORmoQBLVkjhMgcMQGTutqCKE
         9tY2D0WZIEqY0p8MhAp2+YSqua3jAr5hB6ErmWmmE/v3+/tTi3oNgygV7BrEMbYQF6xf
         n+yjE23j3F0HwcHnzSFg8p6Q0YB1BTjDFAptbkrFRK+5y/ZW2FPuCr5thRSGqTTYwYzb
         gTtED89FTGxJOcy/hoBNwYh3fn+mt3sPEHdWlEu5pjKl19LXlA2peRXtTCgHqSt5u/AW
         zMnhwjMBlTC4s1+c0T2u3D8eqKjfohxT6OZrPoYhsgRtPGOe6LCLGHnRrHDvIa3bFDNK
         ip2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ISWA1TqbRyQqQmE6EamIaok0CpLt3yDrkaMBwUYZc+w=;
        b=gSIhGrSzfL8Cc8Q6Ss6GX4P8B+0gI3X3hQUjd4qtETwXAkiYfYSckHpawefIxI892D
         WnqZGIOIeMOVgQm7qsXeOLzsK73kS8FxPRm4cscitoBjhoaow7u8RqYajrOm2yMYZQSM
         rtMERwitRrBNVKwvaS9C+6SqrblGf1ROeTUjENT7FevkbMQSxfg35KRCSEJNqCUyzw8+
         oj1SrB+c1SWe5ViK+L0wxKUVGzOy0X7n90MwDaF/qO4NE61UExfPfKzM82N6b6939j7e
         uR2WVgrEN75wDT2hs3oF7s2EJn0rY49n1PqtSQqdmUKpDqB6R6GBIL0pc+E1k0XNAZiF
         rd6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c37si13915930qta.209.2017.05.16.08.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 08:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAedc-0006Cz-3B
	for alex.bennee@linaro.org; Tue, 16 May 2017 11:43:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZP-0002UM-Gt
	for qemu-devel@nongnu.org; Tue, 16 May 2017 11:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZN-0001WP-MV
	for qemu-devel@nongnu.org; Tue, 16 May 2017 11:39:31 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dAeZN-0001WI-EZ; Tue, 16 May 2017 11:39:29 -0400
Received: by mail-pg0-x244.google.com with SMTP id u187so21807687pgb.1;
	Tue, 16 May 2017 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ISWA1TqbRyQqQmE6EamIaok0CpLt3yDrkaMBwUYZc+w=;
	b=NGPXx/qdYdzHPaKSfcHseFsQ9EdFl4Pty4oXZO0yH3UZEPvz/qRH7hR85AYWYvjBXc
	OWKDlD5P1mmlOS6sd9l7kL6myqR2dhiCP67LiFJhYK2v5N6+udvCUenR/WsJHnzGPBnt
	X5JCsxjPlFl/mQw0JXZm9CdB6+7W/a0RotbeGWDvlVSMJ35oSdPan+4wBLKixFPYTR/4
	BVOi7rVv5nAXt+oaKS+h1N+etch7gVI3ZQYlFxFkwhg2IHzKOTsJwiJpo/ZWcu4DWEpM
	7CROkdzvMVU1ZXne2cHFgaAkAeFazHinkPVybK2CE80XKsL+XRy8UmJcRsQCg5crLfhN
	uYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ISWA1TqbRyQqQmE6EamIaok0CpLt3yDrkaMBwUYZc+w=;
	b=nFD9dnmZRjpuYVuuHWulasSKrNxzS0XDrnr2PLxTx5RUGq60ucJaFEdyMovdfA7Kl/
	Urjz25HCZ5OmGOWKBVVAU66Bozc5EC/fnaeQvkjMeSFBtR2vA+yqKCBgGWUyyUDFSLtp
	bfKJwmChQn50fLU71D9EJFls39i68C2xAKpkzZLlei34ia/f+rY7lyz6jDInDn/lXpat
	oh6XZw7L6iL7Frn8FB8WMNxUUcnW9/Y4HeHBlAmp7/ZOMwJ5+M62RD0QCaTLwBl6VwsG
	mLReyc4AVlxda6m6H+HBF5mtq9AHHZJPrdcwDbEC5blKcJphoBLPM6QK695IUXlEGI3I
	NnsA==
X-Gm-Message-State: AODbwcC9ZOGT3i0OMp9QNuCNeSEVWBMr4MzNLG9KsYBpeZhc+5ABl/uX
	HaDBETBA5TnpCw==
X-Received: by 10.99.104.136 with SMTP id d130mr13004134pgc.27.1494949168437; 
	Tue, 16 May 2017 08:39:28 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	d86sm27874895pfj.75.2017.05.16.08.39.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 08:39:27 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 16 May 2017 21:08:50 +0530
Message-Id: <1494949133-2202-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [Qemu devel v5 PATCH 2/5] msf2: Microsemi Smartfusion2
 System Register block.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S+3f+aaZ/o/h

Added Sytem register block of Smartfusion2.
This block has PLL registers which are accessed by guest.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/misc/Makefile.objs         |   1 +
 hw/misc/msf2-sysreg.c         | 161 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/msf2-sysreg.h |  80 +++++++++++++++++++++
 3 files changed, 242 insertions(+)
 create mode 100644 hw/misc/msf2-sysreg.c
 create mode 100644 include/hw/misc/msf2-sysreg.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index c8b4893..0f52354 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) += edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
 obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
+obj-$(CONFIG_MSF2) += msf2-sysreg.o
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
new file mode 100644
index 0000000..8d3118f
--- /dev/null
+++ b/hw/misc/msf2-sysreg.c
@@ -0,0 +1,161 @@
+/*
+ * System Register block model of Microsemi SmartFusion2.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "hw/misc/msf2-sysreg.h"
+
+#ifndef MSF2_SYSREG_ERR_DEBUG
+#define MSF2_SYSREG_ERR_DEBUG  0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do { \
+    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
+        qemu_log("%s: " fmt, __func__, ## args); \
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+static void msf2_sysreg_reset(DeviceState *d)
+{
+    MSF2SysregState *s = MSF2_SYSREG(d);
+
+    DB_PRINT("RESET\n");
+
+    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
+    s->regs[MSSDDR_FACC1_CR] = 0x0B800124;
+    s->regs[MSSDDR_PLL_STATUS] = 0x3;
+}
+
+static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
+    unsigned size)
+{
+    MSF2SysregState *s = opaque;
+    offset /= 4;
+    uint32_t ret = 0;
+
+    if (offset < ARRAY_SIZE(s->regs)) {
+        ret = s->regs[offset];
+        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32 "\n",
+                    offset * 4, ret);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
+                    offset * 4);
+    }
+
+    return ret;
+}
+
+static void msf2_sysreg_write(void *opaque, hwaddr offset,
+                          uint64_t val, unsigned size)
+{
+    MSF2SysregState *s = (MSF2SysregState *)opaque;
+    uint32_t newval = val;
+    uint32_t oldval;
+
+    offset /= 4;
+
+    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64 "\n",
+            offset * 4, val);
+
+    switch (offset) {
+    case MSSDDR_PLL_STATUS:
+        break;
+
+    case ESRAM_CR:
+        oldval = s->regs[ESRAM_CR];
+        if (oldval ^ newval) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                       TYPE_MSF2_SYSREG": eSRAM remapping not supported\n");
+            abort();
+        }
+        break;
+
+    case DDR_CR:
+        oldval = s->regs[DDR_CR];
+        if (oldval ^ newval) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                       TYPE_MSF2_SYSREG": DDR remapping not supported\n");
+            abort();
+        }
+        break;
+
+    case ENVM_REMAP_BASE_CR:
+        oldval = s->regs[ENVM_REMAP_BASE_CR];
+        if (oldval ^ newval) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                       TYPE_MSF2_SYSREG": eNVM remapping not supported\n");
+            abort();
+        }
+        break;
+
+    default:
+        if (offset < ARRAY_SIZE(s->regs)) {
+            s->regs[offset] = val;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
+                        offset * 4);
+        }
+        break;
+    }
+}
+
+static const MemoryRegionOps sysreg_ops = {
+    .read = msf2_sysreg_read,
+    .write = msf2_sysreg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void msf2_sysreg_init(Object *obj)
+{
+    MSF2SysregState *s = MSF2_SYSREG(obj);
+
+    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s, TYPE_MSF2_SYSREG,
+                          MSF2_SYSREG_MMIO_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+}
+
+static const VMStateDescription vmstate_msf2_sysreg = {
+    .name = TYPE_MSF2_SYSREG,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState, MSF2_SYSREG_NUM_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_msf2_sysreg;
+    dc->reset = msf2_sysreg_reset;
+}
+
+static const TypeInfo msf2_sysreg_info = {
+    .name  = TYPE_MSF2_SYSREG,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .class_init = msf2_sysreg_class_init,
+    .instance_size  = sizeof(MSF2SysregState),
+    .instance_init = msf2_sysreg_init,
+};
+
+static void msf2_sysreg_register_types(void)
+{
+    type_register_static(&msf2_sysreg_info);
+}
+
+type_init(msf2_sysreg_register_types)
diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.h
new file mode 100644
index 0000000..a485ed6
--- /dev/null
+++ b/include/hw/misc/msf2-sysreg.h
@@ -0,0 +1,80 @@
+/*
+ * Microsemi SmartFusion2 SYSREG
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_MSF2_SYSREG_H
+#define HW_MSF2_SYSREG_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+
+enum {
+    ESRAM_CR        = 0x00 / 4,
+    ESRAM_MAX_LAT,
+    DDR_CR,
+    ENVM_CR,
+    ENVM_REMAP_BASE_CR,
+    ENVM_REMAP_FAB_CR,
+    CC_CR,
+    CC_REGION_CR,
+    CC_LOCK_BASE_ADDR_CR,
+    CC_FLUSH_INDX_CR,
+    DDRB_BUF_TIMER_CR,
+    DDRB_NB_ADDR_CR,
+    DDRB_NB_SIZE_CR,
+    DDRB_CR,
+
+    SOFT_RESET_CR  = 0x48 / 4,
+    M3_CR,
+
+    GPIO_SYSRESET_SEL_CR = 0x58 / 4,
+
+    MDDR_CR = 0x60 / 4,
+
+    MSSDDR_PLL_STATUS_LOW_CR = 0x90 / 4,
+    MSSDDR_PLL_STATUS_HIGH_CR,
+    MSSDDR_FACC1_CR,
+    MSSDDR_FACC2_CR,
+
+    MSSDDR_PLL_STATUS = 0x150 / 4,
+
+};
+
+#define MSF2_SYSREG_MMIO_SIZE     0x300
+#define MSF2_SYSREG_NUM_REGS      (MSF2_SYSREG_MMIO_SIZE / 4)
+
+#define TYPE_MSF2_SYSREG          "msf2-sysreg"
+#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj), TYPE_MSF2_SYSREG)
+
+typedef struct MSF2SysregState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    uint32_t regs[MSF2_SYSREG_NUM_REGS];
+} MSF2SysregState;
+
+#endif /* HW_MSF2_SYSREG_H */
-- 
2.5.0

