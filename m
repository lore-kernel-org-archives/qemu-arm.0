Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp302wrt;
        Tue, 16 Oct 2018 18:13:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63xbQP/lF7Mh1v2tvioEps1kbIz6BmrH3Q3NlCyHixtI2YfTMEIgDuB8QnNwMqh96ArFv8u
X-Received: by 2002:a37:6388:: with SMTP id x130-v6mr22071681qkb.118.1539738798764;
        Tue, 16 Oct 2018 18:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539738798; cv=none;
        d=google.com; s=arc-20160816;
        b=iNV32FoGasOjLAsY61/ZlO5ANyE870DbAXCzRVaRZ4MQ+s9+zWfvqCcntBeT2cE7Kn
         p1fV1ihXtuXjF5FIJ4oJKfxk3AKDrI8VDpQeKM0EngnZ8LvSaAiWivhAfsY/9nLh+GKu
         Fu2Ek9Baq5R5xOgelhOcCHOwPE95niMVy6iGlWz5fQs4g2+Ni1t4gEpI/9tba3anhuqI
         /pmma7hjFQrXs2TiNmmJhuD5Qx7Is2YU5pxQI+0KrNTeyMxwe/BQAL+cRQJ6vuFRd+At
         XbnukrD1w3yVP6lUaEc3yeu+la5VfyTkKsWw4mFl87URyFkqnsb0fpk/o2pKzIN1/RB6
         MtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=oTXVEhmp/dl/38FwuHabsivg9vgGUsef7HZP1qSW970=;
        b=jZXtT76/yurqbaxACJnk5GWCuSd1/roAhrBTwt6t8+AetEAuWrW6GwGPjsuPutRAIm
         uSGn+4ch0rqaQel2gqhENcwpluK3QHHTasqrBpJ5i5eJv8OOqKRT4tZCodKIcXuFxk6H
         i6H7c1n2nN8wfR/jvE4fniuy0x+hD1zKKJJ65oMZaYotYZRQsXabI7fw8m4MzOcd+K8s
         VfEOKHdbJSPwpIo3YQ0P1quQ2K+IhmfyG1bwWq9VqmffsGIPGDw4Upgg3lp20lSsHfhC
         NFwnuqTWXQG+nrM0cKDx5Nss4G6CSuuVmsTX4RwLEisJdKqLVz36eUDpMb5Kc1WFiiZd
         at9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 57-v6si4342528qtr.28.2018.10.16.18.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 18:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCaOj-0000J2-9A
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 21:13:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gCaNj-00083z-Du
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 21:12:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gCaNf-0001s3-Lw
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 21:12:14 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:41628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gCaNZ-0001kS-Ls; Tue, 16 Oct 2018 21:12:06 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id CF977B601CEFEB91874E;
	Wed, 17 Oct 2018 09:12:01 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9H1BuHQ025161;
	Wed, 17 Oct 2018 09:11:56 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018101709121548-4968574 ;
	Wed, 17 Oct 2018 09:12:15 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org
Date: Wed, 17 Oct 2018 17:23:27 +0800
Message-Id: <1539768207-18209-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-17 09:12:15,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-17 09:11:48,
	Serialize complete at 2018-10-17 09:11:48
X-MAIL: mse01.zte.com.cn w9H1BuHQ025161
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-devel] [PATCH]  target/arm : add pvpanic mmio device
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7HjXGNzQR9ae

Add pvpanic mmio device that is similar to x86's pvpanic device.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 default-configs/arm-softmmu.mak |  2 +-
 hw/arm/virt.c                   | 21 ++++++++++++
 hw/misc/Makefile.objs           |  1 +
 hw/misc/pvpanic-mmio.c          | 76 +++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h           |  1 +
 include/hw/misc/pvpanic-mmio.h  | 12 +++++++
 6 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/pvpanic-mmio.c
 create mode 100644 include/hw/misc/pvpanic-mmio.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2420491..4713c92 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -43,7 +43,7 @@ CONFIG_USB_MUSB=y
 CONFIG_USB_EHCI_SYSBUS=y
 CONFIG_PLATFORM_BUS=y
 CONFIG_VIRTIO_MMIO=y
-
+CONFIG_PVPANIC_MMIO=y
 CONFIG_ARM11MPCORE=y
 CONFIG_A9MPCORE=y
 CONFIG_A15MPCORE=y
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a472566..ab41128 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -140,6 +140,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_UART] =               { 0x09000000, 0x00001000 },
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
+    [VIRT_PVPANIC_MMIO] =       { 0x09020018, 0x00000002 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
@@ -798,6 +799,24 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
     g_free(nodename);
 }
 
+static void create_pvpanic_device(const VirtMachineState *vms)
+{
+    char *nodename;
+    hwaddr base = vms->memmap[VIRT_PVPANIC_MMIO].base;
+    hwaddr size = vms->memmap[VIRT_PVPANIC_MMIO].size;
+
+    sysbus_create_simple("pvpanic-mmio", base, NULL);
+
+    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename,
+                            "compatible", "pvpanic,mmio");
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    g_free(nodename);
+
+}
+
 static void create_virtio_devices(const VirtMachineState *vms, qemu_irq *pic)
 {
     int i;
@@ -1544,6 +1563,8 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms, pic);
 
+    create_pvpanic_device(vms);
+
     create_gpio(vms, pic);
 
     /* Create mmio transports, so the user can create virtio backends
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 6d50b03..6326260 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -71,6 +71,7 @@ obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
 obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
 
 obj-$(CONFIG_PVPANIC) += pvpanic.o
+obj-$(CONFIG_PVPANIC_MMIO) += pvpanic-mmio.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
 obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
new file mode 100644
index 0000000..c7f373e
--- /dev/null
+++ b/hw/misc/pvpanic-mmio.c
@@ -0,0 +1,76 @@
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+#include "hw/misc/pvpanic-mmio.h"
+
+#define PVPANIC_MMIO_FEAT_CRASHED      0
+
+#define PVPANIC_MMIO_CRASHED        (1 << PVPANIC_MMIO_FEAT_CRASHED)
+
+static void handle_mmio_event(int event)
+{
+    static bool logged;
+
+    if (event & ~PVPANIC_MMIO_CRASHED && !logged) {
+        qemu_log_mask(LOG_GUEST_ERROR, "pvpanic-mmio: unknown event %#x.\n", event);
+        logged = true;
+    }
+
+    if (event & PVPANIC_MMIO_CRASHED) {
+        qemu_system_guest_panicked(NULL);
+        return;
+    }
+}
+
+static uint64_t pvpanic_mmio_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return -1;
+}
+
+static void pvpanic_mmio_write(void *opaque, hwaddr addr, uint64_t value,
+                                 unsigned size)
+{
+   handle_mmio_event(value);
+}
+
+static const MemoryRegionOps pvpanic_mmio_ops = {
+    .read = pvpanic_mmio_read,
+    .write = pvpanic_mmio_write,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 2,
+    },
+};
+
+
+static void pvpanic_mmio_initfn(Object *obj)
+{
+    PVPanicState *s = PVPANIC_MMIO_DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &pvpanic_mmio_ops, s,
+                          "pvpanic-mmio", 2);
+    sysbus_init_mmio(sbd, &s->mmio);
+}
+
+static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_mmio_info = {
+    .name          = TYPE_PVPANIC_MMIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PVPanicState),
+    .instance_init = pvpanic_mmio_initfn,
+    .class_init    = pvpanic_mmio_class_init,
+};
+
+static void pvpanic_mmio_register_types(void)
+{
+    type_register_static(&pvpanic_mmio_info);
+}
+
+type_init(pvpanic_mmio_register_types)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7..61cc310 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -70,6 +70,7 @@ enum {
     VIRT_MMIO,
     VIRT_RTC,
     VIRT_FW_CFG,
+    VIRT_PVPANIC_MMIO,
     VIRT_PCIE,
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
diff --git a/include/hw/misc/pvpanic-mmio.h b/include/hw/misc/pvpanic-mmio.h
new file mode 100644
index 0000000..2e6bec3
--- /dev/null
+++ b/include/hw/misc/pvpanic-mmio.h
@@ -0,0 +1,12 @@
+#ifndef HW_MISC_PVPANIC_H
+#define HW_MISC_PVPANIC_H
+#include "hw/sysbus.h"
+#define TYPE_PVPANIC_MMIO "pvpanic-mmio"
+#define PVPANIC_MMIO_DEVICE(obj)    \
+    OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC_MMIO)
+#endif
+
+typedef struct PVPanicState {
+    SysBusDevice parent_obj;
+    MemoryRegion mmio;
+} PVPanicState;
-- 
1.8.3.1

