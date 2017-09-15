Received: by 10.223.172.38 with SMTP id v35csp947923wrc;
        Fri, 15 Sep 2017 10:01:44 -0700 (PDT)
X-Received: by 10.200.47.24 with SMTP id j24mr38870567qta.147.1505494904723;
        Fri, 15 Sep 2017 10:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505494904; cv=none;
        d=google.com; s=arc-20160816;
        b=cGFEQpQl26qQWSJrqsViP2rSr72DeXbzD6t54KV02icAne95TI0E+ck/w8chIGL30Y
         aS3oji7MEfw1HuhaBjUqarEtPKkqDKSpb/ADhrBertodSnt3EOYAVh0dCP1IBYKvvnTR
         Uma5N7ADg7r7ewvOPQrPQ3MBDE654jahGT6tTxkaWy4ZPHMI7/9/R5LbD/AZtqsBlmoN
         HoBhiCtxTK1++PYUSQcmiLReq4gUXMnCvR7pZFlghATKQ+1GN11QqHBcGrzPBLAQ2Kx0
         9gJLbmwTD7DisGB0QizOGshTPhtIkpKrN2kthoGcJElzKbwd8F7Dc18Kf9vT6rE5EMFJ
         XqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=1WAwVPtpZXqZZ15+91n4L5JPOoERq2cMzHEIWB+S184=;
        b=G/WyRxcEP7Aadg+iV/qkje1mJJe+cEK9B04cVsWjpL3ThXC8v4bRQA6Bsfcq+8dDmV
         K4xiEu2d5F4QGmjlSPGwgWF3so8gwNi+dRGgtPnZJztC4WfoRA/LmbDOhygy3DZ+0uhw
         Trd8eIHRpM1rx+LxpjYQuTD0zSmkgoZfTGeKbh2qGA0wnzwSzPb2NDa/MBZcn94FrKpY
         rx1UZLXOmDsn6t/sR1r50D9rJqhIYA15ehUtp2NxoXS3RiZ7I1h2K2atlheJIr6vMSSs
         mlYM93GDo3xAW10Np8iX9Ne/kZgz+1I6QipTRXch+CIQH9sCf7X7SFEQL7vR+ns0qS+/
         3CTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nC+yu+Rx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y15si1374696qtb.300.2017.09.15.10.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 10:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nC+yu+Rx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dstzq-0006bS-Dj
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 13:01:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxo-0005Lh-0q
	for qemu-devel@nongnu.org; Fri, 15 Sep 2017 12:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxm-00040o-AZ
	for qemu-devel@nongnu.org; Fri, 15 Sep 2017 12:59:36 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:37155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dstxm-00040S-1U; Fri, 15 Sep 2017 12:59:34 -0400
Received: by mail-pg0-x241.google.com with SMTP id v5so1604506pgn.4;
	Fri, 15 Sep 2017 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1WAwVPtpZXqZZ15+91n4L5JPOoERq2cMzHEIWB+S184=;
	b=nC+yu+Rxgd7iu72D674VzaJDwgdTdKuFK2oHgIW1XFKPvO1BHiFX4pCPIFmo8DDSb2
	GWJm8BAwIbpXIhK0Pf2taGvh1VygGKj0smKw8riyPzKy9PoZHqAuSxiziKuhjHX/bRLC
	4lwonNNWSh2Tsh0+mq7fkDMZPvWnyN9GCWkxObKpnDDXE6o83hIoB2iUTcp3NFaCpTgB
	/G2OsoOVuqGT0YpikmXOjJQqmPqv6Irn/BE0l/r5l5zZOq8vZO3h5ljXKvxorxVJMoA1
	mcXCr+/9QgVSWHTa0MeUqtdDRJF8Sd5cK2cgEtWednQBv8gLgzfFTqHlEd6Zeo+7aiKi
	cJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1WAwVPtpZXqZZ15+91n4L5JPOoERq2cMzHEIWB+S184=;
	b=b3VChdt7z7K1Jvp6RX4PLUWoK+XFpZi6W/lQlyw9ZUfJ1rkAMtMsrPe7A84LJ2bXL0
	UcJPBW1V3Eaqtk/lVQdwrrKa/QKXuPiVmy32OCBmW2vOUJzRHbPrDoNEfMSX6kYmwJB9
	f3hS1j3RgQdecC2zO948POLANy/fNuqs3A/Ol/XFo1JQ2AtbLcGBFuign6BSbseo+Qy6
	eRE1pFvk3o/4JFQ9WSEo6rO1+G/uXnsW/TMa4DSJ6Z9EN7uPBe2t8aqZttryKw+wjgGq
	/wg0F6ZIZqjocoqzEBAxNQZ73lnTuMRRXwVuhd7A4zSevXqtiOSuIvTFzEGFJBamQC9H
	MKNA==
X-Gm-Message-State: AHPjjUhyFPcq+wYB28ZkKcLoncNWDpElqgzDCsEtP0rbiIkvPZyy2kCv
	LSXkKjXu6py8PRWu
X-Google-Smtp-Source: ADKCNb6Et92bB5Biv793pKprQSCacJ8Lb+kGr2tvAmDsiCxwLfq3j6RkWy/sF2bS+CYggJTiKbB2Gg==
X-Received: by 10.98.62.93 with SMTP id l90mr25228765pfa.32.1505494772858;
	Fri, 15 Sep 2017 09:59:32 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	s17sm3111350pgq.25.2017.09.15.09.59.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 09:59:32 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Sep 2017 22:29:10 +0530
Message-Id: <1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [Qemu devel v9 PATCH 2/5] msf2: Microsemi Smartfusion2
 System Register block
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
X-TUID: w3wSr0gswDzY

Added Sytem register block of Smartfusion2.
This block has PLL registers which are accessed by guest.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/misc/Makefile.objs         |   1 +
 hw/misc/msf2-sysreg.c         | 168 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   5 ++
 include/hw/misc/msf2-sysreg.h |  77 +++++++++++++++++++
 4 files changed, 251 insertions(+)
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
index 0000000..dc3597b
--- /dev/null
+++ b/hw/misc/msf2-sysreg.c
@@ -0,0 +1,168 @@
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
+#include "trace.h"
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
index 0000000..231f827
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
+    uint32_t apb0div;
+    uint32_t apb1div;
+
+    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
+} MSF2SysregState;
+
+#endif /* HW_MSF2_SYSREG_H */
-- 
2.5.0

