Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1139162wrv;
        Tue, 16 Jul 2019 08:41:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrdAGkI4YnapMgl1cQuhOoRnma4cxgua2JyQn59QBykebl/ooUXwoi+Wmcv4CuM5rIJuda
X-Received: by 2002:a50:ac46:: with SMTP id w6mr31194429edc.238.1563291678369;
        Tue, 16 Jul 2019 08:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563291678; cv=none;
        d=google.com; s=arc-20160816;
        b=XCTq+LY18BgRKY3RRadbFmnCK+A+06bDikqKSBVTf+/iPNDPIRauDpwwnooOv2Qt73
         kOFSMwMV4oVrC6rz6fn/0Jl7CUXBTnXrDi0LZJnc9rroy+EtayL+FaM9f9U2rQy6VymZ
         K4Iu2/eJytRqmWdlKzdyD9i6D9zb1RclP6tRteSWq0E0ZZ2PkF85MQHPCiOBd8y318JD
         LHI4VzqzZh0HYqIT5xj2o/nbolZRL7xSVpG64s0FbhAcwfWsARqUg2nPno3bG+MQ85TD
         usIUho4W9QoT7bp9NiuD3TNFATnB8xf92QcymdxY65kjW36idWiHwPMVoGgLoHirkbir
         iS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=EZlzML/HEtJNX+0GVs2Gr8RyePyeJ60hRlRZDqkbd9I=;
        b=l8xivxJYnPTQc4ThO1pKT+At13wLsF2gWmN0xFD5yDTfbt05Q70YJtGkmpCrsQ+0ML
         O3ye0f47N4Of8Zgd2qXcsNB3IztbKUYtjP+G6ctLbMRccFN4UWLlx5E2cDuNe7ihRVIa
         YywYyenMmTFLWKa+KCaEZ6xfDj4H19hh2xq+hmvV/naDWCFpW8LeGh4MqffS8GDfPyRR
         x4ciajY63hM9AlD/QV5+IItOv4K/++IXNoObh24SNSb4Y694Ovvf55I/zThoKLnkqwfg
         Vdi8Rw9966POl0025uEy0mHTS1pIa9QNkfrU2mP1F6sH4lsjNmspK+sKiGLSd4m6ECN2
         R8aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f30si12512403edb.390.2019.07.16.08.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnPZs-0007Sf-Rl
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 11:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36539)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZn-0007Rz-Nt
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZm-0004Mc-I0
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2175 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZl-0004ES-Pc; Tue, 16 Jul 2019 11:41:10 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3BA8317A01BE4BF1A2A8;
 Tue, 16 Jul 2019 23:40:59 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 23:40:50 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 16 Jul 2019 16:38:10 +0100
Message-ID: <20190716153816.17676-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH-for-4.2 v7 04/10] hw/arm/virt: Add memory hotplug
 framework
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
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PLdNo8tGGO+/

From: Eric Auger <eric.auger@redhat.com>

This patch adds the memory hot-plug/hot-unplug infrastructure
in machvirt. The device memory is not yet exposed to the Guest
either through DT or ACPI and hence both cold/hot plug of memory
is explicitly disabled for now.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig |  2 ++
 hw/arm/virt.c  | 51 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ab65ecd216..84961c17ab 100644
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
index d9496c9363..907fb64bb9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -64,6 +64,8 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1871,6 +1873,40 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
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
+
+    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);
+
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
@@ -1882,12 +1918,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
 
@@ -1951,7 +1998,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


