Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6469448wrp;
        Wed, 18 Sep 2019 06:09:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzLQ9lAXk6LHUlDyIXkTQw/GPU2MKlAJnTsfoHgUenvOxDhWKEEGb/J7u5JkdqK5aG172ZG
X-Received: by 2002:a17:907:111b:: with SMTP id qu27mr9491395ejb.10.1568812142532;
        Wed, 18 Sep 2019 06:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568812142; cv=none;
        d=google.com; s=arc-20160816;
        b=hAcX1hecl3pEtjquRkQVoDnu8qy17zoRtpubHQfobdnXS6nfUdO/HFdoP1yL/S5o22
         Yv5k1tneSVyYkU4zMBkgE5VtgH/p0H6+4MH9bthXQ0iyPoDiv7YrhvymxCyzqvC5vxIq
         XHrGd/zkNW5zACHCcuWs0Wwahgp25tFjaIGvDs72c5Reh0GWSlu88nZ4MWSZv1AHrnuU
         gtqouX/VTj3eZM5k6sbl00zyQpTtDJ5860G5y4Dx6f/ehsTrZyKOsTWP4TK6A+y8iGkv
         iMJFOXIBKm2fTU7EmlCau18UcH5ypsf8ehaQPpJe2RjjY6LbysBLcwjOkjB7M9/MH8zM
         Vmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=7RvU2VUxOAezFk4K9QmdGViWfYWL3BUnKsu8RhqKkwY=;
        b=pzjuSdAi7ddifeJzYXqosP31Nkl2KxNHyRhoVs83cXZK3Drou3TBG8SGAZRQOM8vPj
         WnHkb1K9JvSe2I3sa5NbRI6vqOO1FFO1Uu2a2SwbCXfEV5x71yQawaj3Xvnt2uAvqmVd
         i7idRpp9BkEMgQFsOhPHLeCbTBxQGKWe9haSVwsQ4JzyWbdZQakPB6dZfaEkfvqIx1Dl
         sTrNyvCbkqgfK7QaLWI8qkosuq7PhTDdEHf0HBjGgFck047m2wINTWswyN0yp0fQ9A6k
         qPEu2V9Qn0SsrR09rTGzk6lHgrb13W3M3hh2Zo4BbrYZs6BiLtIwgMN7Z/mucAEhMlBW
         T2HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si3237676edd.431.2019.09.18.06.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 06:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAZhc-0004eF-Ga
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 09:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgw-0004EA-Mm
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgt-0003HG-7j
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2173 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZgs-0003G3-TQ; Wed, 18 Sep 2019 09:08:15 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 08EFA3504AE8B495D21B;
 Wed, 18 Sep 2019 21:08:13 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Sep 2019 21:08:03 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 18 Sep 2019 14:06:26 +0100
Message-ID: <20190918130633.4872-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH-for-4.2 v11 04/11] hw/arm/virt: Add memory
 hotplug framework
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3ygP92Du8da

From: Eric Auger <eric.auger@redhat.com>

This patch adds the memory hot-plug/hot-unplug infrastructure
in machvirt. The device memory is not yet exposed to the Guest
either through DT or ACPI and hence both cold/hot plug of memory
is explicitly disabled for now.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/Kconfig |  2 ++
 hw/arm/virt.c  | 53 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 76a2a6bcbf..39d285ad3d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -20,6 +20,8 @@ config ARM_VIRT
     select SMBIOS
     select VIRTIO_MMIO
     select ACPI_PCI
+    select MEM_DEVICE
+    select DIMM
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d74538b021..1c967e3fee 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -68,6 +68,8 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1876,6 +1878,42 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                                 Error **errp)
+{
+
+    /*
+     * The device memory is not yet exposed to the Guest either through
+     * DT or ACPI and hence both cold/hot plug of memory is explicitly
+     * disabled for now.
+     */
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        error_setg(errp, "memory cold/hot plug is not yet supported");
+        return;
+    }
+
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+}
+
+static void virt_memory_plug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    Error *local_err = NULL;
+
+    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
+
+    error_propagate(errp, local_err);
+}
+
+static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                            DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_pre_plug(hotplug_dev, dev, errp);
+    }
+}
+
 static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                         DeviceState *dev, Error **errp)
 {
@@ -1887,12 +1925,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_plug(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    error_setg(errp, "device unplug request for unsupported device"
+               " type: %s", object_get_typename(OBJECT(dev)));
 }
 
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
 
@@ -1956,7 +2005,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
+    hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
+    hc->unplug_request = virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported = true;
 }
 
-- 
2.17.1


