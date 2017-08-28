Received: by 10.223.188.70 with SMTP id a6csp4713355wrh;
        Mon, 28 Aug 2017 09:38:42 -0700 (PDT)
X-Received: by 10.55.72.6 with SMTP id v6mr1546817qka.254.1503938322207;
        Mon, 28 Aug 2017 09:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503938322; cv=none;
        d=google.com; s=arc-20160816;
        b=pQM7fSveqYsX0kFXUKf0O3kguzjqV/BxrjS2aAHSvqu8BvDdS59f/KjdqIhGgx9v6w
         Gq5rtyTnbMnrHqxnVURiacEu4uKxGEQml9vlX0cPYdpHDX6ElwuV2n+TIk0MQ50H0vPc
         fPvPgO5BVT4JuR5+rPpBQizKylXX8AOmGj/pYMbUFo8SCudbU5QywuKMLhudZmevNbaF
         yUq/QqXHCXj/QozaWCxVDGHt6EHvsohantUUe0gPbEGe/hXdky9j+eBdJbRhf03OiJCG
         f3YgZZAdLqlYqmCpoYiQWp0L1oMoWzbmkbwbhQR0qecNIlbovjNzenuiKOKobz4EqhkQ
         sj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BQAgqzIMWsJa3UCJkaq93RV6GILFbBbQfxQBdsI78B0=;
        b=GiGtzG6tuQQRL4EXN16aXYoDaxSt/j+c20f5F6KmQSLHSBGrvF0wh/VHSDqRqcf4q6
         G5mBv07RuaDmzeqeiM0RgHiDM+rcYSKydQNyScAOo6I3SauQIr9vUO2rwhPBdkUOaCZ1
         qY2bSWvrKy2U3s3Pt36Hz1JbDobjqljg1ilRXEoZOCY4yhST2MDo4Fp02ZiWzcs3tUno
         6B+KPu7XuS1JetRzbHf5qiSDwBGQsBpCxp14PKIANytWiEO/g2NnrrP+Dm6rpBUjDHnH
         GF6FNXh/Nd8u6yyxQYBdVE0PJ7NLcT4Ememw1vTqIDZflOARMKeDjECv6xV6yiFTUl0W
         duMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CXW0FBZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si737760qti.57.2017.08.28.09.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 09:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CXW0FBZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmN3f-000268-RC
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 12:38:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3V-00020g-5c
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 12:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3T-0003Pi-BT
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 12:38:29 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:35399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dmN3P-00035t-8N; Mon, 28 Aug 2017 12:38:23 -0400
Received: by mail-pf0-x243.google.com with SMTP id g13so639906pfm.2;
	Mon, 28 Aug 2017 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BQAgqzIMWsJa3UCJkaq93RV6GILFbBbQfxQBdsI78B0=;
	b=CXW0FBZ6NVdhp4q4Uwdk+n/IofJnByK2bgtsH896G51nkwXj+8oednGPEYODnCiHdk
	EpUg2LLqG89cqiGNf8qyrXcH6fo4+f+gTbhpoTMlgeaja3JbWuQdNPm+xzplwKnhOIdT
	I41bQdlTWMb/lnFmbAzfnmwKpMDWu+tnruqlZpdB94RmeCNx3u39APqS0dNQlRFYQTCj
	NuE2t+315Flsg5C1dtRbC+PNM1+ouK4JNQUOIrGZ788b+j3BTj3MYcmODJnKe1+H0N0z
	V7vsqd5Bnbc/kPxkFf785TjqlR9uwFMSgw/9n/0CFEPaQJGZGCI6qDtxdZyqZ0l8jxr9
	pRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BQAgqzIMWsJa3UCJkaq93RV6GILFbBbQfxQBdsI78B0=;
	b=eV2+4y3I24ZStURMVXQMHJ87IehY0/ljqfWunxApKJLvwnTUeofdQeOywTwKLK93e0
	d6WexjBH9IJcsniekPP4C8HZxWSGNIy0n/REpSYXp3/j2HX+xLNvu2APA0k/1uEuqYxy
	v9S6xdeWLAZh/Wt4ToFxMWwsHtK28cl5UfcE6FymuqafoWbP1Q9EzX4sYBo/Ta+4DNca
	tcfh/grkYoZDFSZ6rF45og5jFML5CJFn6BzBkh+mU6rS7dwfnEr/1V1qNC5aAFLTjkXN
	tonCHqsC3aknWBKEyNw9/v2X9wm7BC8gsRq1S7Vr/APexMxhlnzQq8CbFjGQt28/Z4FS
	pJAA==
X-Gm-Message-State: AHYfb5joMJ1qi/2kDxqlJHUnZWvUmU8T7YRraADNqx1Vv9yoIgkS55Uf
	KkB2MP5m3B6ZB+p/
X-Google-Smtp-Source: ADKCNb4vl0bVTTSfJ71wvmOaNPGwjYVWwcos+CRt6v/GaOtPeV2SJseWkG8RC/+Op33lzugxjvQ/3g==
X-Received: by 10.84.129.47 with SMTP id 44mr1480087plb.40.1503938302107;
	Mon, 28 Aug 2017 09:38:22 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	n66sm1935015pfi.44.2017.08.28.09.38.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Aug 2017 09:38:21 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 28 Aug 2017 22:08:00 +0530
Message-Id: <1503938283-12404-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [Qemu devel v7 PATCH 2/5] msf2: Microsemi Smartfusion2
 System Register block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPlaJGtGs8IH

Added Sytem register block of Smartfusion2.
This block has PLL registers which are accessed by guest.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/misc/Makefile.objs         |   1 +
 hw/misc/msf2-sysreg.c         | 199 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/msf2-sysreg.h |  78 +++++++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 hw/misc/msf2-sysreg.c
 create mode 100644 include/hw/misc/msf2-sysreg.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 29fb922..e8f0a02 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
 obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
 obj-y += mmio_interface.o
+obj-$(CONFIG_MSF2) += msf2-sysreg.o
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
new file mode 100644
index 0000000..2aeb555
--- /dev/null
+++ b/hw/misc/msf2-sysreg.c
@@ -0,0 +1,199 @@
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
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/misc/msf2-sysreg.h"
+
+#ifndef MSF2_SYSREG_ERR_DEBUG
+#define MSF2_SYSREG_ERR_DEBUG  0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do { \
+    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
+        qemu_log("%s: " fmt "\n", __func__, ## args); \
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+static inline int msf2_divbits(uint32_t div)
+{
+    int ret = 0;
+
+    switch (div) {
+    case 1:
+        ret = 0;
+        break;
+    case 2:
+        ret = 1;
+        break;
+    case 4:
+        ret = 2;
+        break;
+    case 8:
+        ret = 4;
+        break;
+    case 16:
+        ret = 5;
+        break;
+    case 32:
+        ret = 6;
+        break;
+    default:
+        break;
+    }
+
+    return ret;
+}
+
+static void msf2_sysreg_reset(DeviceState *d)
+{
+    MSF2SysregState *s = MSF2_SYSREG(d);
+
+    DB_PRINT("RESET");
+
+    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
+    s->regs[MSSDDR_PLL_STATUS] = 0x3;
+    s->regs[MSSDDR_FACC1_CR] = msf2_divbits(s->apb0div) << 5 |
+                               msf2_divbits(s->apb1div) << 2;
+}
+
+static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
+    unsigned size)
+{
+    MSF2SysregState *s = opaque;
+    uint32_t ret = 0;
+
+    offset >>= 2;
+    if (offset < ARRAY_SIZE(s->regs)) {
+        ret = s->regs[offset];
+        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
+                    offset << 2, ret);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
+                    offset << 2);
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
+    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
+            offset, val);
+
+    offset >>= 2;
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
+        }
+        break;
+
+    case DDR_CR:
+        oldval = s->regs[DDR_CR];
+        if (oldval ^ newval) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                       TYPE_MSF2_SYSREG": DDR remapping not supported\n");
+        }
+        break;
+
+    case ENVM_REMAP_BASE_CR:
+        oldval = s->regs[ENVM_REMAP_BASE_CR];
+        if (oldval ^ newval) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                       TYPE_MSF2_SYSREG": eNVM remapping not supported\n");
+        }
+        break;
+
+    default:
+        if (offset < ARRAY_SIZE(s->regs)) {
+            s->regs[offset] = val;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
+                        offset << 2);
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
+        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState, MSF2_SYSREG_MMIO_SIZE / 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property msf2_sysreg_properties[] = {
+    /* default divisors in Libero GUI */
+    DEFINE_PROP_UINT32("apb0divisor", MSF2SysregState, apb0div, 2),
+    DEFINE_PROP_UINT32("apb1divisor", MSF2SysregState, apb1div, 2),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_msf2_sysreg;
+    dc->reset = msf2_sysreg_reset;
+    dc->props = msf2_sysreg_properties;
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
index 0000000..f39cc41
--- /dev/null
+++ b/include/hw/misc/msf2-sysreg.h
@@ -0,0 +1,78 @@
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
+#include "hw/sysbus.h"
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
+
+#define TYPE_MSF2_SYSREG          "msf2-sysreg"
+#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj), TYPE_MSF2_SYSREG)
+
+typedef struct MSF2SysregState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    uint32_t apb0div;
+    uint32_t apb1div;
+
+    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
+} MSF2SysregState;
+
+#endif /* HW_MSF2_SYSREG_H */
-- 
2.5.0

