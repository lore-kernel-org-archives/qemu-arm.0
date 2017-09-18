Received: by 10.223.172.38 with SMTP id v35csp4114015wrc;
        Mon, 18 Sep 2017 12:25:47 -0700 (PDT)
X-Received: by 10.200.37.136 with SMTP id e8mr41818242qte.112.1505762746886;
        Mon, 18 Sep 2017 12:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505762746; cv=none;
        d=google.com; s=arc-20160816;
        b=DhcI+AWuMxi033EZFOoH3RQf2qE7o9te2pyOpB7tZDpSGVJ9HHy8G8oQhtbBiHCOMC
         lNFfDKFQb3Sj+VpmOOZvhW/zGO6pSaI6POki7onSt7ImKAfHOhkCYLxtvQ5L9zu/gP6C
         ScYjAMqbc1uzXN5DZ0VcErZjxnTOlbG7LYr7IEuwYI7CT8HK3S7q26NuMfccZbzt+LcI
         RT1o7fD7NTq/ZPzJ2Mfz1dva+lakPzk66Ry5QMWzgMFdqGUgQXYSqh01s840vP78aSm3
         P0dIpSB9Y1uWZhTYRVeDZJ4osgu4fX3T+y5V5Yf1MXNMVozR0erYZP8uUEEYqhyEz+b1
         SjUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aJMmESz0GVBAbZ4yzXe4Tkmg+s/Kq3Ou5uPOrYPrybQ=;
        b=g3gIRRBLviJm2dQXjmq8fCIzzDBCYTizqvAENdlql9Thqsveu5SvVNxkOfNeO63ks1
         vl8Wtb32oJ8ImM7W9x3Q0EKNmNCRMMhs1iJgnsfuHN8MIoFxFKdvkwQVdwiU5P0jQkpQ
         CXTXwHNacWYZ0KMASi0LdTm+7FUqGqitDOk51yIPPgdnCFiDLo1tbqoGBtMOTnrKfNdu
         VLdjfSURIEHXWWLazV5Y7HGYf5HzFLV2lUE4NmcmKhCEnVmFhWRd3e9j80wd9MjaUA4n
         V4j8VjLp6smq4VHtaW8l+W38+PcPIxikcYIRMcn593M12oC1dzdynLPiy2m5NDgt9cFn
         lanQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ewom0UCg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m81si7569585qkl.225.2017.09.18.12.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ewom0UCg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du1fs-0005xF-Da
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:25:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1dt-0004V3-0M
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1dr-000268-8y
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:23:41 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:37455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1du1dr-00025i-0Y; Mon, 18 Sep 2017 15:23:39 -0400
Received: by mail-pf0-x242.google.com with SMTP id e69so559162pfg.4;
	Mon, 18 Sep 2017 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aJMmESz0GVBAbZ4yzXe4Tkmg+s/Kq3Ou5uPOrYPrybQ=;
	b=ewom0UCgixfrtbepZ/V15AuzykJiZOF0eyW2NmE+dpWEjVrM0ov+SLPGagqpyXhPRi
	SHhqBpEV+wXfAJYFF/CcXp+S+3hehy/0mp7Z2S8dTtpGDiSjY+9chyPsatzEQzy9+YUu
	R1JGvcvuJib9gIVdYLRwEoKmmLmtf9I4zpFJevLeKBsFF6FEHBLwgZXLZy70Pmr33mXA
	cHQ3IGVp+8KoZKwVOCkVmjRu3l8pPsHQbko+SGITQb1fKi5xbPhhpzMYoNyZ1DVrpYXG
	enu2okIyhuPRcBMCo8sw5C4D3N+DBUwdKL9oIrn13RWK1gdYZ7QLDj6EBPeOPlO8NbeK
	HwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aJMmESz0GVBAbZ4yzXe4Tkmg+s/Kq3Ou5uPOrYPrybQ=;
	b=GfJqqx5syI+5xhogPiks793rzWiPvkivMCf9zhPxodK0P32Vvdx4cGajgDN3gEYlW0
	ORX5N/Vuum9DiPIPvXHEy2ymGfWqynxqxQiihdcFwAXYDJRQTrEmfe4I+o6SwmAQ7iT5
	55i3YCq6wlmrs7+y21AClEPMcvnCnXLR7MpEvTmq8fWkUlygUGxDByNXItBexdHBg/Ae
	NjIZKjpcjuqXktxPUwV3rVa2lDgZY3ia+0GkolM+ZUtFhth4/UNvtDB5d483dkjCehZq
	WH3tb52xxRt50uu1RuCydS8uSCA8eQR55PbTi5QS7HJsD1q8uCI0E7IkTKKmRoRu9juE
	qdQw==
X-Gm-Message-State: AHPjjUiIDOkhI2HEenjXs/ERaTj+QpKe2Yd8QVcUXXKEMXwSlzcSYGGd
	z1j1W41ltmuV9HjS
X-Google-Smtp-Source: AOwi7QC7H1NIWNY7KaKRKgPWQVjU5893G5z2Ub0vGtQWO+3NKaNuDp81QBmWdFIf6G9nHb7zbfMmwg==
X-Received: by 10.159.216.145 with SMTP id s17mr2557688plp.35.1505762617922;
	Mon, 18 Sep 2017 12:23:37 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id w12sm169701pfk.83.2017.09.18.12.23.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:23:37 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 19 Sep 2017 00:53:18 +0530
Message-Id: <1505762601-27143-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
References: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [Qemu devel v10 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
X-TUID: UntXJ7J07uwc

Added Sytem register block of Smartfusion2.
This block has PLL registers which are accessed by guest.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/Makefile.objs         |   1 +
 hw/misc/msf2-sysreg.c         | 160 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   5 ++
 include/hw/misc/msf2-sysreg.h |  77 ++++++++++++++++++++
 4 files changed, 243 insertions(+)
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
index 0000000..6eb5011
--- /dev/null
+++ b/hw/misc/msf2-sysreg.c
@@ -0,0 +1,160 @@
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
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "hw/misc/msf2-sysreg.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+
+static inline int msf2_divbits(uint32_t div)
+{
+    int r = ctz32(div);
+
+    return (div < 8) ? r : r + 1;
+}
+
+static void msf2_sysreg_reset(DeviceState *d)
+{
+    MSF2SysregState *s = MSF2_SYSREG(d);
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
+        trace_msf2_sysreg_read(offset << 2, ret);
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
+    MSF2SysregState *s = opaque;
+    uint32_t newval = val;
+
+    offset >>= 2;
+
+    switch (offset) {
+    case MSSDDR_PLL_STATUS:
+        trace_msf2_sysreg_write_pll_status();
+        break;
+
+    case ESRAM_CR:
+    case DDR_CR:
+    case ENVM_REMAP_BASE_CR:
+        if (newval != s->regs[offset]) {
+            qemu_log_mask(LOG_UNIMP,
+                       TYPE_MSF2_SYSREG": remapping not supported\n");
+        }
+        break;
+
+    default:
+        if (offset < ARRAY_SIZE(s->regs)) {
+            trace_msf2_sysreg_write(offset << 2, newval, s->regs[offset]);
+            s->regs[offset] = newval;
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
+    DEFINE_PROP_UINT8("apb0divisor", MSF2SysregState, apb0div, 2),
+    DEFINE_PROP_UINT8("apb1divisor", MSF2SysregState, apb1div, 2),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void msf2_sysreg_realize(DeviceState *dev, Error **errp)
+{
+    MSF2SysregState *s = MSF2_SYSREG(dev);
+
+    if ((s->apb0div > 32 || !is_power_of_2(s->apb0div))
+        || (s->apb1div > 32 || !is_power_of_2(s->apb1div))) {
+        error_setg(errp, "Invalid apb divisor value");
+        error_append_hint(errp, "apb divisor must be a power of 2"
+                           " and maximum value is 32\n");
+    }
+}
+
+static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_msf2_sysreg;
+    dc->reset = msf2_sysreg_reset;
+    dc->props = msf2_sysreg_properties;
+    dc->realize = msf2_sysreg_realize;
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
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 3313585..616579a 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -61,3 +61,8 @@ mps2_scc_reset(void) "MPS2 SCC: reset"
 mps2_scc_leds(char led7, char led6, char led5, char led4, char led3, char led2, char led1, char led0) "MPS2 SCC LEDs: %c%c%c%c%c%c%c%c"
 mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config write: function %d device %d data 0x%" PRIx32
 mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config read: function %d device %d data 0x%" PRIx32
+
+# hw/misc/msf2-sysreg.c
+msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sysreg write: addr 0x%08" HWADDR_PRIx " data 0x%" PRIx32 " prev 0x%" PRIx32
+msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr 0x%08" HWADDR_PRIx " data 0x%08" PRIx32
+msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL status register"
diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.h
new file mode 100644
index 0000000..5993f67
--- /dev/null
+++ b/include/hw/misc/msf2-sysreg.h
@@ -0,0 +1,77 @@
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
+    uint8_t apb0div;
+    uint8_t apb1div;
+
+    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
+} MSF2SysregState;
+
+#endif /* HW_MSF2_SYSREG_H */
-- 
2.5.0

