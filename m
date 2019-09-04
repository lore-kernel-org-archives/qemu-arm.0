Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp439842wrp;
        Wed, 4 Sep 2019 01:59:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwELm7vc8hj7uyY3tFH52krCF4ymXELt0dEo6dmP4LAEpdlHIsIMXv+1Ko8YDrpvP51fZcU
X-Received: by 2002:a37:886:: with SMTP id 128mr35210618qki.469.1567587551838;
        Wed, 04 Sep 2019 01:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587551; cv=none;
        d=google.com; s=arc-20160816;
        b=dB8/t0HHRBtztzC5NsfH4MPClfLw3SAwWZUEgBNJMhcmFol592091JWVk/KZVEIFOu
         eJmCHeD4LlkbSptejP5E2NPrWp5n/C/TJIJBFhM1D7xWmL8nm8IEfAwR6nY8tmVJXtVk
         HkhqRwJmzAkA11UAlP/qufkr2DW3bo36wmTshyWp7vk9Ly/pDJRp/AgAJUh40miZXh7F
         962J6X9ZQ2MDaFy+QYPQL4F0k6j7FOVNHU4mFe1ByKRlfM9YbUwEwebSLcRUNYUn87EW
         GRc2pTufYCRLbFv/WwbNPIe/r6vEgZvbEMj1EWxdo7jkvX4eFCzi+JqFxlomkDcoR43p
         RH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=B+4wOK+d4YRZWNj7xcPZHXcBjqrPtbt/7Mm4Z7IFDxM=;
        b=a8LcwUKtapcfBCe5d5SWIZc7DMMF1A+gurue07ZEEoRQz8j4x760Sz709CbKiYkMxw
         U1uG/IUPnpJvYrmeeYt1iCmisGlluvGfJgKvs0rZwy/cK3C6m7em6ZD/SCI3WVDB34XA
         CZbLT1CWkYSKk6Jn+SBKdm0F8dciY6i3JtGO9UeSKfLOH52zwuaVRtxvDNDTVjIwti1C
         2ZtXHriHIroX03hBuhUAytpWLFhs5wGwmNdWdlGA422soewGzIFFe5je7UKpL+SvYCl6
         63rcydXOklxhCYwt+THMdsE4NxpCLWNrxubFAGAPko3n78dX8/6HlhBs3ciMRJ7tiSvv
         TH5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si13362250qkg.92.2019.09.04.01.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 01:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5R8A-0007dP-Hn
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 04:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6y-0007Dt-Az
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:57:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6w-0007BX-TB
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:57:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2192 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6t-00078t-NQ; Wed, 04 Sep 2019 04:57:52 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CEB90424BEB734B7E874;
 Wed,  4 Sep 2019 16:57:48 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:40 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:22 +0100
Message-ID: <20190904085629.13872-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH-for-4.2 v10 04/11] hw/arm/virt: Add memory
 hotplug framework
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sC7KF2ygkEfm

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
v8 --> v9
 -Added error propagation.
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
index 0d1629ccb3..7c492c31a0 100644
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
@@ -1875,6 +1877,42 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
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
@@ -1886,12 +1924,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
 
@@ -1955,7 +2004,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


