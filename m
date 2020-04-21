Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5073000lfm;
        Tue, 21 Apr 2020 06:08:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypIgYseEgptYqPZq9w3gb4CYxZiFbZs7cSoFFiKnQtNt42L5W0ST9yiFIlMOWxZ+ij+dP2z0
X-Received: by 2002:a05:6214:4f:: with SMTP id c15mr18781599qvr.8.1587474494708;
        Tue, 21 Apr 2020 06:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587474494; cv=none;
        d=google.com; s=arc-20160816;
        b=ChXlEvxFe9msu/5HEVyiFsJnj3sVvSduBAMe6reh2CdDxk1V90kBNWEhrqO2hRNzci
         Wn0c2JguYtnW8HTrqFCxQWHk59b7+9UVV9BRTk1kzfQYx2WLtEp1iy+RXazYSCE3vXZY
         JtibmaypGofUScH8HXXYafVeyna5VSUJ8kEfR1o60DW+005XOAwuqC+MSeyQde6zC/zr
         sVpxAnmyxuoVEZvbSpk7gVQn4tTAJhrLh36S21NmawqS/VJZCHkroT1WMlpQHFqNnhAJ
         KdMtFNGbZwgdw6mG+Qw2Vbk+XqPFZ2Vp0CHb8c7/btQB9Gxh7YgLiu+VlHvdv1h3BcME
         uYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=R6VtZI5YaIAbYmLsrBW/N19hMCLimUF/3/12Ol1ptKg=;
        b=mrtjgfKGdvQf6xEp9plqagx4CAjwhiaLi4BHMTu0mjeYCZmlWtxwieP5Qd5CnXVsIR
         o7IW/PbK96VdaVgF1Hho1gOUFeInVHlXunT5UZ0x0i3U9F85tGQuqvJu0q1lKZNls6rp
         lyJg6QQmn0jObztBEq5OGpUrfZKl3Q+SR+grIMEtaFD/xp/WMUaT38VcGNm4BRaGfAUX
         GJl4WqH9SdCn01+aQL1Kr19HD2tII2XPSD76s8JM0PQLPcFcIbDnY6qwIkNT56mzYAsK
         YjDR8afWhzdIsJPPC2FfeIuBZSG+lT60uD288J033ftSe4mwJHTCZy/NyML/xh6j4DuM
         eJcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si1367754qtt.331.2020.04.21.06.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsdJ-0001C9-4Z
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXd-00087f-MT
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXc-0002Ir-MR
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3675 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXb-00025M-V8; Tue, 21 Apr 2020 09:02:20 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 626ED2F3EE0BC60B7043;
 Tue, 21 Apr 2020 21:02:14 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.91.160) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 21:02:05 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v4 4/7] hw/arm/virt: Add nvdimm hotplug support
Date: Tue, 21 Apr 2020 13:59:31 +0100
Message-ID: <20200421125934.14952-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.91.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 09:01:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 prime.zeng@hisilicon.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xkWSDj/JchDu

This adds support for nvdimm hotplug events through GED
and enables nvdimm for the arm/virt. Now Guests with ACPI
can have both cold and hot plug of nvdimms.

Hot removal functionality is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 docs/specs/acpi_hw_reduced_hotplug.rst |  3 ++-
 hw/acpi/generic_event_device.c         | 15 ++++++++++++++-
 hw/arm/virt.c                          | 16 +++++++++++-----
 include/hw/acpi/generic_event_device.h |  1 +
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
index 911a98255b..0bd3f9399f 100644
--- a/docs/specs/acpi_hw_reduced_hotplug.rst
+++ b/docs/specs/acpi_hw_reduced_hotplug.rst
@@ -63,7 +63,8 @@ GED IO interface (4 byte access)
     bits:
        0: Memory hotplug event
        1: System power down event
-    2-31: Reserved
+       2: NVDIMM hotplug event
+    3-31: Reserved
 
 **write_access:**
 
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 021ed2bf23..5d17f78a1e 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -16,6 +16,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
@@ -23,6 +24,7 @@
 static const uint32_t ged_supported_events[] = {
     ACPI_GED_MEM_HOTPLUG_EVT,
     ACPI_GED_PWR_DOWN_EVT,
+    ACPI_GED_NVDIMM_HOTPLUG_EVT,
 };
 
 /*
@@ -110,6 +112,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
                                       aml_int(0x80)));
                 break;
+            case ACPI_GED_NVDIMM_HOTPLUG_EVT:
+                aml_append(if_ctx,
+                           aml_notify(aml_name("\\_SB.NVDR"),
+                                      aml_int(0x80)));
+                break;
             default:
                 /*
                  * Please make sure all the events in ged_supported_events[]
@@ -175,7 +182,11 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
     AcpiGedState *s = ACPI_GED(hotplug_dev);
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
+        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
+            nvdimm_acpi_plug_cb(hotplug_dev, dev);
+        } else {
+            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
+        }
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -192,6 +203,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
         sel = ACPI_GED_MEM_HOTPLUG_EVT;
     } else if (ev & ACPI_POWER_DOWN_STATUS) {
         sel = ACPI_GED_PWR_DOWN_EVT;
+    } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
+        sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8a2beaf650..da4994c55a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -549,6 +549,10 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
     }
 
+    if (ms->nvdimms_state->is_enabled) {
+        event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
+    }
+
     dev = qdev_create(NULL, TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
 
@@ -2070,19 +2074,20 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    const MachineState *ms = MACHINE(hotplug_dev);
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
 
-    if (is_nvdimm) {
-        error_setg(errp, "nvdimm is not yet supported");
-        return;
-    }
-
     if (!vms->acpi_dev) {
         error_setg(errp,
                    "memory hotplug is not enabled: missing acpi-ged device");
         return;
     }
 
+    if (is_nvdimm && !ms->nvdimms_state->is_enabled) {
+        error_setg(errp, "nvdimm is not enabled: add 'nvdimm=on' to '-M'");
+        return;
+    }
+
     pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
 }
 
@@ -2227,6 +2232,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported = true;
+    mc->nvdimm_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->default_ram_id = "mach-virt.ram";
 
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d157eac088..9eb86ca4fd 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -82,6 +82,7 @@
  */
 #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
 #define ACPI_GED_PWR_DOWN_EVT      0x2
+#define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
 
 typedef struct GEDState {
     MemoryRegion io;
-- 
2.17.1


