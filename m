Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp324090ejc;
        Wed, 11 Oct 2023 12:45:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7uZEHNctp9HJAAsj3jw/ZKSkAIV+wuO3bD0bzrOM6fpfvwwBI0MksG3pKUUVXGWbfAG5t
X-Received: by 2002:a5d:4d8e:0:b0:324:7bdd:678e with SMTP id b14-20020a5d4d8e000000b003247bdd678emr17995488wru.60.1697053554973;
        Wed, 11 Oct 2023 12:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697053554; cv=none;
        d=google.com; s=arc-20160816;
        b=tVsliXjqcXCrP1oiXLyohefDYMws6vz0U+EJm1JrAy1NxFTlAm9sazCGgSWVO9fCbr
         AaQukFrhg/0Dfshk2pBd9lSY91a58q4cx5VP/jrijdeLTfdzon30hOoUyXjG5Std/UdQ
         OeRcXqvENZG1i3XCmsb6lAauToVPoo0iX9dqnZzobGBhN917qirXWlKZtZ3DX6vkudd9
         esaJF4kq2oqxgdI2yBuIS2+k5ag8EQ/2I/Xx9QKyOV+SJeu/sJmvpoFo9XyexsSDiH8P
         Gct7+ey/T5UXTlm0Y7rU3otZr+QG0i3ZIai2T/9I2+M2LZFVyLXxfHtwrh4dOje2tPGc
         3WZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ed1A4qjQ9zJUAQjcH/lIifDvzsZqzD2kWpE3P/Kw5yw=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=rApIQN97h2vf8nIVmiEub1EtTSAz5ZDE7So6OHy/07DtLydl12nLYWT9XvFJI0CMqZ
         STrUnaLN+DWfzVT+qwXJ9LnC0L4nmE2DZWHT0bDNE86UqRDPnVSoB+776yIceWLKaGfy
         /RGAQny0lMkojAfF0vmiJ5iP6Gto135RFzrwtDuJZXLIHuVlI9/pVMKxXZ9ViMRo9o1s
         JVfAALLQ2dqGwqg7DUC9Zj7bv0RBoqsA0+xR9zrgC7c1yjmfZFPoVvEue1xdOLIVAtZ5
         7Vc6r+J3I6Wkq9oPFIt0qOqyTfN4ELXuDfT80BdVlyfhgsKJpkUw1VDLDqGzeTB96IFM
         r9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id cc5-20020a5d5c05000000b003296bae9b99si6189157wrb.529.2023.10.11.12.45.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 12:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5NXr0Hpnz687PR;
	Thu, 12 Oct 2023 03:45:32 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.169.226) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 20:45:35 +0100
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
	<linuxarm@huawei.com>
Subject: [PATCH V5 4/9] hw/acpi: Init GED framework with CPU hotplug events
Date: Wed, 11 Oct 2023 20:43:50 +0100
Message-ID: <20231011194355.15628-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231011194355.15628-1-salil.mehta@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.169.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: +VyUAoUXRFdg

ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACPI events
when OSPM/guest receives an interrupt listed in the _CRS object of GED. OSPM
then maps or demultiplexes the event by evaluating _EVT method.

This change adds the support of CPU hotplug event initialization in the
existing GED framework.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
---
 hw/acpi/generic_event_device.c         | 8 ++++++++
 include/hw/acpi/generic_event_device.h | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index a3d31631fe..d2fa1d0e4a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -25,6 +25,7 @@ static const uint32_t ged_supported_events[] = {
     ACPI_GED_MEM_HOTPLUG_EVT,
     ACPI_GED_PWR_DOWN_EVT,
     ACPI_GED_NVDIMM_HOTPLUG_EVT,
+    ACPI_GED_CPU_HOTPLUG_EVT,
 };
 
 /*
@@ -400,6 +401,13 @@ static void acpi_ged_initfn(Object *obj)
     memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
                           TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
     sysbus_init_mmio(sbd, &ged_st->regs);
+
+    s->cpuhp.device = OBJECT(s);
+    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
+                       ACPI_CPU_HOTPLUG_REG_LEN);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
+    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
+                        &s->cpuhp_state, 0);
 }
 
 static void acpi_ged_class_init(ObjectClass *class, void *data)
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d831bbd889..d0a5a43abf 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -60,6 +60,7 @@
 #define HW_ACPI_GENERIC_EVENT_DEVICE_H
 
 #include "hw/sysbus.h"
+#include "hw/acpi/cpu_hotplug.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/ghes.h"
 #include "qom/object.h"
@@ -97,6 +98,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
 #define ACPI_GED_PWR_DOWN_EVT      0x2
 #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
+#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
 
 typedef struct GEDState {
     MemoryRegion evt;
@@ -108,6 +110,9 @@ struct AcpiGedState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
     MemoryRegion container_memhp;
+    CPUHotplugState cpuhp_state;
+    MemoryRegion container_cpuhp;
+    AcpiCpuHotplug cpuhp;
     GEDState ged_state;
     uint32_t ged_event_bitmap;
     qemu_irq irq;
-- 
2.34.1
