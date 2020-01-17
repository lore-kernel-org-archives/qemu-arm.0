Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10118804lff;
        Fri, 17 Jan 2020 09:52:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMQwsan3+jGNKlfN4JgpgdI/nidF3d2NMP83Rf5NfTOJc6eqgVuNVEjtnI5Plg9FM7DBLM
X-Received: by 2002:a50:8326:: with SMTP id 35mr4950017edh.235.1579283555012;
        Fri, 17 Jan 2020 09:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579283555; cv=none;
        d=google.com; s=arc-20160816;
        b=sBtyBqB8qZf7LU9nRMk/FsMR8TuSRHRulf8FPyTv4jNNM1V/G8xnFx5dcU0ZFtBKLD
         9r0xpqKVUlp1OvxscNJLt64ZgZK2WhaRg5hIIOPHGnSi0UCIez4ZxeAETk40cAnDDlHU
         vrKfQCfwqKinVlbuYdraR1UzO+6ufFejQHCTma+jYMCllpFhpsi047XqEboTRxyb6sZC
         AjjfqkSbglMybyE2c2v6iTXquIscIyAkb+L+rn+3ZojHpZjOkRF6X2Cecz4Kkk9LFAlG
         1+1dumdpHNxiuP4KZk/HLfT4sFNWzSokOnb5rQVe2tDRhGn6z9NxZf372j6F/WXfo/YZ
         X12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=IuIuk8ekEYIUyjhEeUTFMbxCxDmbLOlJPwRxow9DgXc=;
        b=KyT8brhU4H+AF7CljZrw12FYUAN6yo6rzrt16zUUmCSCyq6OSwcr2cffcZcgnV2kKZ
         h+veZZJroW3Y6Pklr5rmmZuFnt0PSyBv77DWEZ90mxBWlHNFo6brYdk5jS9DN08JjdkN
         ZJnby808NkO8mnE4BOt/KpOpiFzflcD4BghIDHtrMLK0vl3tl8Cq1RGJ3kh3N8xhV7Mr
         5faexZeaqVOlfRubdB2DOMNGUIR6tfBuFP8JBD974XQ6CbCYkmA2p1TBiYPP3bwjQiGr
         KqXKLDhCPmstKr+a7I8+alwKuNyqHCyuhkfKmDuJwd43LBzfQrC8zNAXAMjQCJNYZyOL
         B9sA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si2987637ejs.169.2020.01.17.09.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 09:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isVnN-0000F7-PB
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 12:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isViA-0002Pv-FU
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:47:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVi9-0007p8-3R
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:47:10 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:47276 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVi3-0007hZ-MN; Fri, 17 Jan 2020 12:47:03 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B9288ADAA69314790517;
 Sat, 18 Jan 2020 01:47:01 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Sat, 18 Jan 2020 01:46:54 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v2 5/7] hw/arm/virt: Add nvdimm hotplug support
Date: Fri, 17 Jan 2020 17:45:20 +0000
Message-ID: <20200117174522.22044-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xiCIuuJoLEW+

This adds support for nvdimm hotplug events through GED
and enables nvdimm for the arm/virt. Now Guests with ACPI
can have both cold and hot plug of nvdimms.

Hot removal functionality is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_hw_reduced_hotplug.rst |  1 +
 hw/acpi/generic_event_device.c         | 13 +++++++++++++
 hw/arm/virt.c                          | 16 +++++++++++-----
 include/hw/acpi/generic_event_device.h |  1 +
 4 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
index 911a98255b..e3abe975bf 100644
--- a/docs/specs/acpi_hw_reduced_hotplug.rst
+++ b/docs/specs/acpi_hw_reduced_hotplug.rst
@@ -63,6 +63,7 @@ GED IO interface (4 byte access)
     bits:
        0: Memory hotplug event
        1: System power down event
+       2: NVDIMM hotplug event
     2-31: Reserved
 
 **write_access:**
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 9cee90cc70..ad1b684304 100644
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
+        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
+            nvdimm_acpi_plug_cb(hotplug_dev, dev);
+        } else {
             acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
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
index 7987c8f5b8..5ea2584491 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -543,6 +543,10 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
     }
 
+    if (ms->nvdimms_state->is_enabled) {
+        event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
+    }
+
     dev = qdev_create(NULL, TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
 
@@ -1928,19 +1932,20 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
+        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
+        return;
+    }
+
     pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
 }
 
@@ -2071,6 +2076,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported = true;
+    mc->nvdimm_supported = true;
     mc->auto_enable_numa_with_memhp = true;
 }
 
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


