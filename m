Received: by 10.25.227.6 with SMTP id a6csp1806051lfh;
        Sun, 2 Jul 2017 21:47:47 -0700 (PDT)
X-Received: by 10.55.214.209 with SMTP id p78mr14895154qkl.144.1499057267813;
        Sun, 02 Jul 2017 21:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499057267; cv=none;
        d=google.com; s=arc-20160816;
        b=FBOoH7wYVpoyPNdL8fbJ5R8IF1Wm9yEfOMkbCn7hcNUbPtIznrkut43hzi/4R/lL2T
         QriZkLbOPgbUPem+/UOJIDvWZrHMW5/N5vU3jAydT0YcpGBke8A3x9C3/G68VETWgKYp
         OOslB/lTq3f+ISOpaakDgBCi7O30DM/iHtLxOs/5+lKJ6kNJQqgrNuduQhVJh+sVgcg6
         Z8r7bypKFpVjiRCaus3hZI5YpfCgwimu0Ys6ZpryKmrB4nmgNBUgogle8HNSSn4t+VxN
         aGerdF+C67F6+4qCfW2bUqu7yVAsUf1mJ09KDiTncp+gc0E76+ypIzR1HDw2ExNnwUXP
         qybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OqXMkBUH52FmNKe5HvzWlGpK1snINHjJqqzB1aL+3YU=;
        b=CI5pG/M7t9QQr56ocTiCl9/SM8hefgTewpha4zsSuOG1v8qqUaFucprDtGG8RuI6Ux
         aU3eVhYXGyfAcVkRv/EEYqdrGSx0a3FKqdgB38XkjI3E4SWqc6vI2UGaeAiX4qXCvdXE
         xIt+LKizWnfSy37S5BNxoG0gkb9L/8KRATKBX9I5rhYPgrfo/z793mLw80WVPqjzu0Z0
         elXz0vhZF5iGXCJ7Doq8ko4T+hKakIqgVX5GLl4DHSyWjxORunlerkXi0UTXI5EKjRtq
         HFkN9FbQGvRAw4pzzVibAcEUpRVWT5MUN7VIZo6D+CegPEFDZpCPbRw0S6b65rRQOnpb
         7CNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lOY9/BtC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m139si13756785qke.76.2017.07.02.21.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jul 2017 21:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lOY9/BtC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRtGw-0000ar-EH
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 00:47:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFE-00080R-8I
	for qemu-devel@nongnu.org; Mon, 03 Jul 2017 00:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFC-00080N-H4
	for qemu-devel@nongnu.org; Mon, 03 Jul 2017 00:45:56 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:35831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dRtFC-0007y9-7g; Mon, 03 Jul 2017 00:45:54 -0400
Received: by mail-pg0-x242.google.com with SMTP id d193so3474248pgc.2;
	Sun, 02 Jul 2017 21:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OqXMkBUH52FmNKe5HvzWlGpK1snINHjJqqzB1aL+3YU=;
	b=lOY9/BtCoSCx/MIqS+y28Q1U9q/D5sG3QNzg7TfRXxbY8qT4piEaiVbId2/meaCdqk
	Yu+eTaxaFgfiqfoflMg8YZD2DSI7CCjayK/TnoZsVZdM4q3dq1R8G7ca3XzJciqJkGKj
	KZekSO1P/iBPZCjNh/RI/9MituX8ITR6qnoJCn6/57vVz6Zt9w7W+J+suRR/tbKF+waw
	Qt2NTBiFQyRfVpa6F++CIeCSd8SNCSkeljLNwNVU6oCVyM8c0EGtLHx+yCHM/2wolHNX
	+YhfuK/xesBgqfo4X7yTgRE6kAA3V+hqgbIKtPq3wbRsk+w6o5QZgMbMFkUtXAQENvaj
	DRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OqXMkBUH52FmNKe5HvzWlGpK1snINHjJqqzB1aL+3YU=;
	b=QLLl4+rkhV4dtXECUzi9N5ILHNaxZRTeYut/jfYmEyWZP96b8vsg+p59dNxvhAyRj8
	cu2If3YK1SR+KUlTBfI+0o+6zSQKv2GfCRbOy6A2jfDIZQo9CvrS7/6dYxWL7KXwgKl1
	L76BxTQMQojPsQkR0dkKPcrEqYqCtNQngECpOvoZwBGIfawSbi4oumaMtmTr5uTn4OzK
	O1r+on+f2JF/phHWoa8hXUJrrVczXyvZFAbBSjU3gF07xwwtIImc1Cs58fOHces/9YX+
	gn06y4Xpvc4QjhvjSoiu4cJrb+KXKekCVd2g+B7+sA8RmnxumVBtmamqWFar6zyHuwx7
	F1Fw==
X-Gm-Message-State: AIVw111XSdwX1pcO0ijyHxkJJckOdW2MLaV9hlLHMwSlbjTXeq5h/x8i
	xZIxtsJ00NCx+9HG
X-Received: by 10.84.232.15 with SMTP id h15mr8560376plk.168.1499057153023;
	Sun, 02 Jul 2017 21:45:53 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	v70sm9324145pfi.110.2017.07.02.21.45.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Jul 2017 21:45:52 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon,  3 Jul 2017 10:15:12 +0530
Message-Id: <1499057115-6773-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [Qemu devel v6 PATCH 2/5] msf2: Microsemi Smartfusion2
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
X-TUID: H05+ApYi3/qH

Added Sytem register block of Smartfusion2.
This block has PLL registers which are accessed by guest.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/misc/Makefile.objs         |   1 +
 hw/misc/msf2-sysreg.c         | 200 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/msf2-sysreg.h |  82 +++++++++++++++++
 3 files changed, 283 insertions(+)
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
index 0000000..64ee141
--- /dev/null
+++ b/hw/misc/msf2-sysreg.c
@@ -0,0 +1,200 @@
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
+    offset /= 4;
+    uint32_t ret = 0;
+
+    if (offset < ARRAY_SIZE(s->regs)) {
+        ret = s->regs[offset];
+        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
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
+    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
+            offset, val);
+
+    offset /= 4;
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
index 0000000..5e9ea99
--- /dev/null
+++ b/include/hw/misc/msf2-sysreg.h
@@ -0,0 +1,82 @@
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

