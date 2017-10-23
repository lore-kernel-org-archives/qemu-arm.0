Received: by 10.223.161.27 with SMTP id o27csp162823wro;
        Mon, 23 Oct 2017 11:48:56 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SJVjYKvbv+77eARMJxEQjJiEaPD74zCiP9Miqh+BCwuRCuPXz4Imjc+MAmYMRMfxF1E45k
X-Received: by 10.37.132.137 with SMTP id v9mr8681728ybk.88.1508784536808;
        Mon, 23 Oct 2017 11:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508784536; cv=none;
        d=google.com; s=arc-20160816;
        b=dmbf70myXtqHua3sd7ndpMVUsaqvht/9mUqcVTi6l6BJHMvOxRs3USFNZPCsfEOV9b
         W7j0WttYEfWC+qsg2QHqGs7GJ+TimHKeQOl3/yysVmtJwcfx1T6M1wH/cAB3UA013VR8
         eI0xmH65l1RGmo8hcGHVf3TQ+h2DKERhKuUr9lufuaorLR4SDNdTTZVropUor/Fl2rjl
         S1jmlkqc3Hef6oEoQloiWi7oklRDLTLyJ+ZwsQXWGLG/3KUqLgdQbEqiMH0fAQsrS/Vd
         WRiwplVPlLf/My7cwdoasY1BDANm5u+1ydrKO9yotetPQKkjfoqJk0MfSQZhf7T8gdJj
         8gWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=GTatjxyYgc9KsvCGl9tm2Una3oQWprdcxi6ZFi1ow40=;
        b=gKSyl39mL+gEGsQJnJ53hQitlU9JD1YveENFs76XM3mV8d+2tsaUyUN5UzqaqY8bsR
         Mhksbgp1s5PuYVMPd4z85o3mxfcyd4a/UeMfLx///UwKMxnqbb/kHhgvPe8qlx2OTsGm
         umNLqLfOnriunBINkwCxzVMZeUYhCHHyDd/YFm1Ex8G2AaU+MJmWQkZNB2+K/MJd4B9l
         tiQKpN+mFHHaX6Gk+yS4rr63wrhD6exZUk/K25w6C46FmRyd/AbHhORIWrUTlZHTgPzI
         rFqbTnIOStSYdN53ik7R9u5nYiiIQ6KLhd2GMD1HwdqygYnI/P1bROzVl1R0Qj+r5XYn
         pY6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si1377378ywb.533.2017.10.23.11.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 11:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6hmS-0004Lv-7P
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 14:48:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e6hmE-0004Jh-7C
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 14:48:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e6hm9-0002v2-VM
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 14:48:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e6hm9-0002u3-Jp; Mon, 23 Oct 2017 14:48:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE85D6A7D2;
	Mon, 23 Oct 2017 18:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AE85D6A7D2
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 702365D96F;
	Mon, 23 Oct 2017 18:48:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Date: Mon, 23 Oct 2017 20:48:29 +0200
Message-Id: <1508784509-29377-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 23 Oct 2017 18:48:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/ide/ahci: Move allwinner code into a separate
 file
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yOXfASH5SKJ0

The allwinner code is only needed for the allwinner board (for which
we also have a separate CONFIG_ALLWINNER_A10 config switch), so it
does not make sense that we compile this for all the other boards
that need AHCI, too. Let's move it to a separate file that is only
compiled when CONFIG_ALLWINNER_A10 is set.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/Makefile.objs    |   1 +
 hw/ide/ahci-allwinner.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/ide/ahci.c           |  95 ------------------------------------
 3 files changed, 128 insertions(+), 95 deletions(-)
 create mode 100644 hw/ide/ahci-allwinner.c

diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
index 729e9bd..f0edca3 100644
--- a/hw/ide/Makefile.objs
+++ b/hw/ide/Makefile.objs
@@ -10,3 +10,4 @@ common-obj-$(CONFIG_IDE_VIA) += via.o
 common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
 common-obj-$(CONFIG_AHCI) += ahci.o
 common-obj-$(CONFIG_AHCI) += ich.o
+common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
new file mode 100644
index 0000000..c3f1604
--- /dev/null
+++ b/hw/ide/ahci-allwinner.c
@@ -0,0 +1,127 @@
+/*
+ * QEMU Allwinner AHCI Emulation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "qemu/error-report.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/dma.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/ahci_internal.h"
+
+#include "trace.h"
+
+#define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTSR     ((0xac - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTDECR   ((0xb0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_DIAGNR0    ((0xb4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_DIAGNR1    ((0xb8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_OOBR       ((0xbc - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PHYCS0R    ((0xc0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PHYCS1R    ((0xc4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PHYCS2R    ((0xc8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_TIMER1MS   ((0xe0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_GPARAM1R   ((0xe8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_GPARAM2R   ((0xec - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PPARAMR    ((0xf0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_TESTR      ((0xf4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_VERSIONR   ((0xf8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_IDR        ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_RWCR       ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
+
+static uint64_t allwinner_ahci_mem_read(void *opaque, hwaddr addr,
+                                        unsigned size)
+{
+    AllwinnerAHCIState *a = opaque;
+    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
+    uint64_t val = a->regs[addr / 4];
+
+    switch (addr / 4) {
+    case ALLWINNER_AHCI_PHYCS0R:
+        val |= 0x2 << 28;
+        break;
+    case ALLWINNER_AHCI_PHYCS2R:
+        val &= ~(0x1 << 24);
+        break;
+    }
+    trace_allwinner_ahci_mem_read(s, a, addr, val, size);
+    return  val;
+}
+
+static void allwinner_ahci_mem_write(void *opaque, hwaddr addr,
+                                     uint64_t val, unsigned size)
+{
+    AllwinnerAHCIState *a = opaque;
+    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
+
+    trace_allwinner_ahci_mem_write(s, a, addr, val, size);
+    a->regs[addr / 4] = val;
+}
+
+static const MemoryRegionOps allwinner_ahci_mem_ops = {
+    .read = allwinner_ahci_mem_read,
+    .write = allwinner_ahci_mem_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void allwinner_ahci_init(Object *obj)
+{
+    SysbusAHCIState *s = SYSBUS_AHCI(obj);
+    AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
+
+    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
+                          "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
+    memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
+                                &a->mmio);
+}
+
+static const VMStateDescription vmstate_allwinner_ahci = {
+    .name = "allwinner-ahci",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AllwinnerAHCIState,
+                             ALLWINNER_AHCI_MMIO_SIZE / 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_allwinner_ahci;
+}
+
+static const TypeInfo allwinner_ahci_info = {
+    .name          = TYPE_ALLWINNER_AHCI,
+    .parent        = TYPE_SYSBUS_AHCI,
+    .instance_size = sizeof(AllwinnerAHCIState),
+    .instance_init = allwinner_ahci_init,
+    .class_init    = allwinner_ahci_class_init,
+};
+
+static void sysbus_ahci_register_types(void)
+{
+    type_register_static(&allwinner_ahci_info);
+}
+
+type_init(sysbus_ahci_register_types)
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 32d1296..373311f 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1737,104 +1737,9 @@ static const TypeInfo sysbus_ahci_info = {
     .class_init    = sysbus_ahci_class_init,
 };
 
-#define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTSR     ((0xac - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTDECR   ((0xb0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_DIAGNR0    ((0xb4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_DIAGNR1    ((0xb8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_OOBR       ((0xbc - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PHYCS0R    ((0xc0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PHYCS1R    ((0xc4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PHYCS2R    ((0xc8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_TIMER1MS   ((0xe0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_GPARAM1R   ((0xe8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_GPARAM2R   ((0xec - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PPARAMR    ((0xf0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_TESTR      ((0xf4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_VERSIONR   ((0xf8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_IDR        ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_RWCR       ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
-
-static uint64_t allwinner_ahci_mem_read(void *opaque, hwaddr addr,
-                                        unsigned size)
-{
-    AllwinnerAHCIState *a = opaque;
-    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
-    uint64_t val = a->regs[addr/4];
-
-    switch (addr / 4) {
-    case ALLWINNER_AHCI_PHYCS0R:
-        val |= 0x2 << 28;
-        break;
-    case ALLWINNER_AHCI_PHYCS2R:
-        val &= ~(0x1 << 24);
-        break;
-    }
-    trace_allwinner_ahci_mem_read(s, a, addr, val, size);
-    return  val;
-}
-
-static void allwinner_ahci_mem_write(void *opaque, hwaddr addr,
-                                     uint64_t val, unsigned size)
-{
-    AllwinnerAHCIState *a = opaque;
-    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
-
-    trace_allwinner_ahci_mem_write(s, a, addr, val, size);
-    a->regs[addr/4] = val;
-}
-
-static const MemoryRegionOps allwinner_ahci_mem_ops = {
-    .read = allwinner_ahci_mem_read,
-    .write = allwinner_ahci_mem_write,
-    .valid.min_access_size = 4,
-    .valid.max_access_size = 4,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-};
-
-static void allwinner_ahci_init(Object *obj)
-{
-    SysbusAHCIState *s = SYSBUS_AHCI(obj);
-    AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
-
-    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
-                          "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
-    memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
-                                &a->mmio);
-}
-
-static const VMStateDescription vmstate_allwinner_ahci = {
-    .name = "allwinner-ahci",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, AllwinnerAHCIState,
-                             ALLWINNER_AHCI_MMIO_SIZE/4),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->vmsd = &vmstate_allwinner_ahci;
-}
-
-static const TypeInfo allwinner_ahci_info = {
-    .name          = TYPE_ALLWINNER_AHCI,
-    .parent        = TYPE_SYSBUS_AHCI,
-    .instance_size = sizeof(AllwinnerAHCIState),
-    .instance_init = allwinner_ahci_init,
-    .class_init    = allwinner_ahci_class_init,
-};
-
 static void sysbus_ahci_register_types(void)
 {
     type_register_static(&sysbus_ahci_info);
-    type_register_static(&allwinner_ahci_info);
 }
 
 type_init(sysbus_ahci_register_types)
-- 
1.8.3.1

