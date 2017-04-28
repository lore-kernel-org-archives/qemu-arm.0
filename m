Received: by 10.25.0.144 with SMTP id 138csp288802lfa;
        Fri, 28 Apr 2017 09:54:34 -0700 (PDT)
X-Received: by 10.55.143.129 with SMTP id r123mr8771830qkd.98.1493398474398;
        Fri, 28 Apr 2017 09:54:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t64si6311200qkc.61.2017.04.28.09.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 09:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d49A9-00052b-Oa
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 12:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498M-0003r7-LM
	for qemu-devel@nongnu.org; Fri, 28 Apr 2017 12:52:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498K-000685-W1
	for qemu-devel@nongnu.org; Fri, 28 Apr 2017 12:52:42 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d498K-00067J-Nl; Fri, 28 Apr 2017 12:52:40 -0400
Received: by mail-pf0-x242.google.com with SMTP id i4so4767324pfc.2;
	Fri, 28 Apr 2017 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/3ENvz4jhrTBD/mO9IOgkUU5S7jO+DjGPfaUm9BwM3k=;
	b=NylMpfRbrOAHjsCQJTS9RXYoFYKkksIiINj4lEXigbn7xZ2CP/iAmq3hdPlZNlSQzX
	nnNCpVvL5i/FTIO26P/FhGhWaXGOuc/AdOfmwttRCyvkY6Pvru+zwFr0I+a3rEONl68D
	TzxRNIVDpDoLuDuJIzRRSMIiYMaIwBK+iDWLjWFDFWvofvL8bDzCe+dV62VlbbqVn7VU
	Kq0ll2Mt90Dw1vxYERa0hizIvQgFu6iH4gi1411TbVJqNewDBBvECUqhVk+qCOYFT3+W
	kXmsmuCXDi3igDKk6/RAa9wrnkHtamF/1qnbi1DkxApO5nG/xhPd14j2G7yfadsNvkY9
	ccHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/3ENvz4jhrTBD/mO9IOgkUU5S7jO+DjGPfaUm9BwM3k=;
	b=cN/Q7W1d3Cq/O4jdBULwPpt3iylUrxiCk9zcr/rucSkK/3cTl5LFhs9Zb8zrl4B9TC
	33MMD4l+D8oN+0uO8d634ubuXhkqBksITzF8AGxRMlfDIdRipx4lJw0Hp77F6udWFrRm
	V65sWbtkQK3GgsZ6pWHQwuO6jqufmoeit0JnlooQfnZ66hJ2E4XZcGSoyHnLidNoVEUs
	eREigvuaOGpXGy6+NlX/d0TWa4sr3K3sNorzcpqh3+74ooe3uBDLWGejFAbOqwVWEtgu
	4JEEI400tVSSV2uvycAZzzbadVnS3P1aZHNRpQ+g+Jkz/uOIW+3KOmFqcOLyWghsCP0F
	NuRQ==
X-Gm-Message-State: AN3rC/5FfnK3QRK9dbc75nI606EkW/uPGcuRdCG0hn8u8YNJ+CoFhWb2
	51pYxWBnhoAxqxg1
X-Received: by 10.99.117.19 with SMTP id q19mr12660253pgc.106.1493398359180;
	Fri, 28 Apr 2017 09:52:39 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	r86sm11383528pfb.24.2017.04.28.09.52.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Apr 2017 09:52:38 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 28 Apr 2017 22:21:50 +0530
Message-Id: <1493398313-6673-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
References: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [Qemu-devel RFC v3 2/5] msf2: Microsemi Smartfusion2
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
	alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X4JWBbvavl7s

Added Sytem register block of Smartfusion2.
This block has PLL registers which are accessed by guest.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/misc/Makefile.objs         |   1 +
 hw/misc/msf2_sysreg.c         | 127 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/msf2_sysreg.h |  77 +++++++++++++++++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 hw/misc/msf2_sysreg.c
 create mode 100644 include/hw/misc/msf2_sysreg.h

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
index 0000000..6386953
--- /dev/null
+++ b/hw/misc/msf2_sysreg.c
@@ -0,0 +1,127 @@
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
+#include "hw/misc/msf2_sysreg.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
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
+    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x02420041;
+    s->regs[MSSDDR_FACC1_CR] = 0x0A482124;
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
+        DB_PRINT("addr: %08" HWADDR_PRIx " data: %08" PRIx32 "\n",
+                    offset * 4, ret);
+    } else {
+        DB_PRINT("addr: %08" HWADDR_PRIx " not valid\n", offset * 4);
+    }
+
+    return ret;
+}
+
+static void msf2_sysreg_write(void *opaque, hwaddr offset,
+                          uint64_t val, unsigned size)
+{
+    MSF2SysregState *s = (MSF2SysregState *)opaque;
+    offset /= 4;
+
+    DB_PRINT("addr: %08" HWADDR_PRIx " data: %08" PRIx64 "\n", offset * 4, val);
+
+    switch (offset) {
+    case MSSDDR_PLL_STATUS:
+        break;
+
+    default:
+        if (offset < ARRAY_SIZE(s->regs)) {
+            s->regs[offset] = val;
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
diff --git a/include/hw/misc/msf2_sysreg.h b/include/hw/misc/msf2_sysreg.h
new file mode 100644
index 0000000..03c5773
--- /dev/null
+++ b/include/hw/misc/msf2_sysreg.h
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
+#include "hw/hw.h"
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

