Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp100036njk;
        Tue, 16 Jul 2024 04:16:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVfCOJPazkSxqZNSob0jxx64SSxtkLPmL3Ggod761pRZeJ8IQS7+5xQkfYFyRvzlnGnzkwVyCnk8Fa+0/mGfPMet39lR5C
X-Google-Smtp-Source: AGHT+IHKkraDPdHGn98zdMl4kMfZ1oHG3BD/MllnCpjaY6E44IhXOjpKl0Sa7HVooII00wcQ7FQk
X-Received: by 2002:a05:6000:d86:b0:365:8547:90b1 with SMTP id ffacd0b85a97d-368260d91b9mr1170981f8f.39.1721128590812;
        Tue, 16 Jul 2024 04:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721128590; cv=none;
        d=google.com; s=arc-20160816;
        b=uQ2qZdSeaXQv2SbRqJtSRQ5kwYtfEQset6LAsOg+26KLneAKdVj/1nJ/2XtwQpytIz
         1stXHrQVpF9Y0hJRufqIF3u6l6gqOPeZJU+Yjajgn1UmBpuNE8oGR17rgJnYEQouLOmy
         +8g3xRxYtAABhIXa9ab/u5b7qR0K6lB8B8vdIGtI50nEKrmFpLu0ikU1+cqPj0c3JmTd
         DSKNF80ndG4kbzHIhKM0FnojccaYrOoxcDPwoYQAJlUn28d6Y04HapkaaUx6WEjpuXNd
         okBkweiR7OZXWNDU7uGm10EdZoMbLcdGp/xssCC/j6gC1/V+D5KBsJDRXwoKM0Pxb9VI
         Dk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=nQo3hyeSL6xm6zExAARbgydvzGcRXVi0FxkzJ/sTueA=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=apMuoBqfDcgL40hIyIJ3HElPCe7RpqAegH9jY1Dy3uvb/XeL6VznAwRTuB/Dtr/WRO
         4itTEhldP/6zaLa0JJV+yUMqW+Gu1uBlpDjQWNqvitG4X28a4x2JERJbyhBEBawA7mq0
         /reIunYGTnkTx1ZTyIjnlk2ZoJqtx8uN7r2CTFruLeTx/3y+fyqHj/gIivqSiPxiJBth
         h+x79QwTeQbJnNs+ldsX0n7TRVQjoHH3KnARlkocWpp+a+fAB/9SzMA/r0RrLntl0F03
         0DTSKDqBd4yZ9ARe/3NXsdJJIJyN/R/cF3uJ+U2b16rjFqnXzvvc3UkjYcq3S6rZ0SfJ
         jfmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3680db01ae4si4065061f8f.659.2024.07.16.04.16.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2024 04:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WNc0j2R7bz6K6Xp;
	Tue, 16 Jul 2024 19:14:45 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id A9BFC140136;
	Tue, 16 Jul 2024 19:16:29 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.92) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 12:16:10 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Shaoqin Huang <shahuang@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH V16 3/7] hw/acpi: Update ACPI GED framework to support vCPU Hotplug
Date: Tue, 16 Jul 2024 12:14:58 +0100
Message-ID: <20240716111502.202344-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716111502.202344-1-salil.mehta@huawei.com>
References: <20240716111502.202344-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.170.92]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: BovtkVbxMTSZ

ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed in the
_CRS object of GED to intimate OSPM about an event. Later then demultiplexes the
notified event by evaluating ACPI _EVT method to know the type of event. Use
ACPI GED to also notify the guest kernel about any CPU hot(un)plug events.

Note, GED interface is used by many hotplug events like memory hotplug, NVDIMM
hotplug and non-hotplug events like system power down event. Each of these can
be selected using a bit in the 32 bit GED IO interface. A bit has been reserved
for the CPU hotplug event.

ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
stub to avoid compilation break.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++
 hw/acpi/generic_event_device.c         | 47 ++++++++++++++++++++++++++
 include/hw/acpi/generic_event_device.h |  4 +++
 4 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
index 0bd3f9399f..3acd6fcd8b 100644
--- a/docs/specs/acpi_hw_reduced_hotplug.rst
+++ b/docs/specs/acpi_hw_reduced_hotplug.rst
@@ -64,7 +64,8 @@ GED IO interface (4 byte access)
        0: Memory hotplug event
        1: System power down event
        2: NVDIMM hotplug event
-    3-31: Reserved
+       3: CPU hotplug event
+    4-31: Reserved
 
 **write_access:**
 
diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
index 3fc4b14c26..c6c61bb9cd 100644
--- a/hw/acpi/acpi-cpu-hotplug-stub.c
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
     return;
 }
 
+void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
+                         CPUHotplugState *state, hwaddr base_addr)
+{
+    return;
+}
+
 void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
 {
     return;
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 2d6e91b124..4641933a0f 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -25,6 +25,7 @@ static const uint32_t ged_supported_events[] = {
     ACPI_GED_MEM_HOTPLUG_EVT,
     ACPI_GED_PWR_DOWN_EVT,
     ACPI_GED_NVDIMM_HOTPLUG_EVT,
+    ACPI_GED_CPU_HOTPLUG_EVT,
 };
 
 /*
@@ -234,6 +235,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
         } else {
             acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
         }
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -248,6 +251,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
     if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
                        !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
         acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -261,6 +266,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -272,6 +279,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
     AcpiGedState *s = ACPI_GED(adev);
 
     acpi_memory_ospm_status(&s->memhp_state, list);
+    acpi_cpu_ospm_status(&s->cpuhp_state, list);
 }
 
 static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
@@ -286,6 +294,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
         sel = ACPI_GED_PWR_DOWN_EVT;
     } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
         sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
+    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
+        sel = ACPI_GED_CPU_HOTPLUG_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
@@ -371,6 +381,42 @@ static const VMStateDescription vmstate_acpi_ged = {
     }
 };
 
+static void acpi_ged_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AcpiGedState *s = ACPI_GED(dev);
+    uint32_t ged_events;
+    int i;
+
+    ged_events = ctpop32(s->ged_event_bitmap);
+
+    for (i = 0; i < ARRAY_SIZE(ged_supported_events) && ged_events; i++) {
+        uint32_t event = s->ged_event_bitmap & ged_supported_events[i];
+
+        if (!event) {
+            continue;
+        }
+
+        switch (event) {
+        case ACPI_GED_CPU_HOTPLUG_EVT:
+            /* initialize CPU Hotplug related regions */
+            memory_region_init(&s->container_cpuhp, OBJECT(dev),
+                                "cpuhp container",
+                                ACPI_CPU_HOTPLUG_REG_LEN);
+            sysbus_init_mmio(sbd, &s->container_cpuhp);
+            cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
+                                &s->cpuhp_state, 0);
+            break;
+        }
+        ged_events--;
+    }
+
+    if (ged_events) {
+        error_report("Unsupported events specified");
+        abort();
+    }
+}
+
 static void acpi_ged_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
@@ -411,6 +457,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
     dc->desc = "ACPI Generic Event Device";
     device_class_set_props(dc, acpi_ged_properties);
     dc->vmsd = &vmstate_acpi_ged;
+    dc->realize = acpi_ged_realize;
 
     hc->plug = acpi_ged_device_plug_cb;
     hc->unplug_request = acpi_ged_unplug_request_cb;
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index ba84ce0214..e091ac2108 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -62,6 +62,7 @@
 #include "hw/sysbus.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/cpu.h"
 #include "qom/object.h"
 
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
 #define ACPI_GED_PWR_DOWN_EVT      0x2
 #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
+#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
 
 typedef struct GEDState {
     MemoryRegion evt;
@@ -106,6 +108,8 @@ struct AcpiGedState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
     MemoryRegion container_memhp;
+    CPUHotplugState cpuhp_state;
+    MemoryRegion container_cpuhp;
     GEDState ged_state;
     uint32_t ged_event_bitmap;
     qemu_irq irq;
-- 
2.34.1
