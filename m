Received: by 10.25.0.144 with SMTP id 138csp485401lfa;
        Sun, 9 Apr 2017 04:23:10 -0700 (PDT)
X-Received: by 10.55.103.199 with SMTP id b190mr24074251qkc.90.1491736990055;
        Sun, 09 Apr 2017 04:23:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h10si10988349qta.54.2017.04.09.04.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Apr 2017 04:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxAw1-0006GW-GL
	for alex.bennee@linaro.org; Sun, 09 Apr 2017 07:23:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cxAsi-000499-Vx
	for qemu-devel@nongnu.org; Sun, 09 Apr 2017 07:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cxAsh-0000wM-HW
	for qemu-devel@nongnu.org; Sun, 09 Apr 2017 07:19:44 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:32863)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1cxAsh-0000vv-9j; Sun, 09 Apr 2017 07:19:43 -0400
Received: by mail-pg0-x242.google.com with SMTP id 79so22364549pgf.0;
	Sun, 09 Apr 2017 04:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2LXzrz4cgQu6WzcsJefcG3lM9UkAhI/TREgT2tN0nTM=;
	b=rKVqtZbzUtvrAR3/LpgHtdRizbPH9SUqcoHRCXrER3H6jW6nclnhiUvPsPC/CfXs/H
	PI3MhcEgmPv4jMK5G+nvvb4GK6CzCULYL0t4V2tROPHkjcwWuLxz7E1OGbLaDyHPBhcM
	9tkoTkBV09ZCVOtO6M63i+FKll1KE3JtqPzIAa/wn0bZq134sMHFJ6mBEWbRSB8aI8aP
	4sE2siA96nL0/bLzKbspMSgbN68WHUZ8AUa9AQpeV5jFypeyyfzSci+OCT3854LAcX+c
	SChfBTBTB1UMr4SG2yFT7bRXsrKqFD8pwWCm0sdj+QrN3blmegNK9R9XBtYSFUoUA1oM
	RHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2LXzrz4cgQu6WzcsJefcG3lM9UkAhI/TREgT2tN0nTM=;
	b=GXnJtuxxfADNAGhFR66YlobaYxHKVVqanPS5Qc87W6QbK3xcinz1KnWjpuHmNDwTkO
	mdps/uvFednuUIf0yJKG2Y16A57F2B+Wa2+Hva5JLnQUNV/1yGc7pAyxBhsOIsE550R0
	b9auyRfKmpLh7ipV0TdwJ4dqnzAPvyFo0b4tAj8+MQ+lxyovrNs7rNRBOO9b/TNx1xNK
	h+qBrXp3ZMaDzSLB6YozsLpT/68rW2xCBumMJIxTF9vWU7uCBhRC0Vaq7gC3Ar7LQ6zL
	QjxODxRpGRv+pzH/k4plFEzhsxj+qn8DWZKu8iM/C456FwVzfk7FEwSaB1x/AWAbOVUc
	bNqA==
X-Gm-Message-State: AFeK/H3TngAwhKDEn89Zz2BnJx0vI9gXfvd+msPxqwhr4gv58kUyRopq7FPn/FAD7kEsCQ==
X-Received: by 10.84.218.138 with SMTP id r10mr60706022pli.165.1491736782267; 
	Sun, 09 Apr 2017 04:19:42 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	g5sm18914139pgn.38.2017.04.09.04.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Apr 2017 04:19:41 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun,  9 Apr 2017 16:49:16 +0530
Message-Id: <1491736758-19540-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [Qemu-devel RFC v2 2/4] msf2: Microsemi Smartfusion2
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
	crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B/XOShOiHriM

Added Sytem register block of Smartfusion2.
This block has PLL registers which are accessed by guest.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/misc/Makefile.objs |   1 +
 hw/misc/msf2_sysreg.c | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 hw/misc/msf2_sysreg.c

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index c8b4893..aee53df 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) += edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
 obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
+obj-$(CONFIG_MSF2) += msf2_sysreg.o
diff --git a/hw/misc/msf2_sysreg.c b/hw/misc/msf2_sysreg.c
new file mode 100644
index 0000000..4873463
--- /dev/null
+++ b/hw/misc/msf2_sysreg.c
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
+#include "hw/hw.h"
+#include "qemu/timer.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+
+#ifndef MSF2_SYSREG_ERR_DEBUG
+#define MSF2_SYSREG_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT(...) do { \
+        if (MSF2_SYSREG_ERR_DEBUG) { \
+            fprintf(stderr,  ": %s: ", __func__); \
+            fprintf(stderr, ## __VA_ARGS__); \
+        } \
+    } while (0);
+
+#define R_PSS_RST_CTRL_SOFT_RST 0x1
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
+#define MSF2_SYSREG(obj)  OBJECT_CHECK(Sf2SysregState, (obj), TYPE_MSF2_SYSREG)
+
+typedef struct Sf2SysregState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    uint32_t regs[MSF2_SYSREG_NUM_REGS];
+} Sf2SysregState;
+
+static void msf2_sysreg_reset(DeviceState *d)
+{
+    Sf2SysregState *s = MSF2_SYSREG(d);
+
+    DB_PRINT("RESET\n");
+
+    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x02420041;
+    s->regs[MSSDDR_FACC1_CR] = 0x0A482124;
+    s->regs[MSSDDR_PLL_STATUS] = 0x3;
+}
+
+static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
+    unsigned size)
+{
+    Sf2SysregState *s = opaque;
+    offset /= 4;
+    uint32_t ret = s->regs[offset];
+
+    DB_PRINT("addr: %08" HWADDR_PRIx " data: %08" PRIx32 "\n", offset * 4, ret);
+
+   return ret;
+}
+
+static void msf2_sysreg_write(void *opaque, hwaddr offset,
+                          uint64_t val, unsigned size)
+{
+    Sf2SysregState *s = (Sf2SysregState *)opaque;
+    offset /= 4;
+
+    DB_PRINT("addr: %08" HWADDR_PRIx " data: %08" PRIx64 "\n", offset * 4, val);
+
+    switch (offset) {
+    case MSSDDR_PLL_STATUS:
+        break;
+
+    default:
+        s->regs[offset] = val;
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
+    Sf2SysregState *s = MSF2_SYSREG(obj);
+
+    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s, "sysreg",
+                          MSF2_SYSREG_MMIO_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+}
+
+static const VMStateDescription vmstate_msf2_sysreg = {
+    .name = "msf2_sysreg",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, Sf2SysregState, MSF2_SYSREG_NUM_REGS),
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
+    .class_init = msf2_sysreg_class_init,
+    .name  = TYPE_MSF2_SYSREG,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(Sf2SysregState),
+    .instance_init = msf2_sysreg_init,
+};
+
+static void msf2_sysreg_register_types(void)
+{
+    type_register_static(&msf2_sysreg_info);
+}
+
+type_init(msf2_sysreg_register_types)
-- 
2.5.0

