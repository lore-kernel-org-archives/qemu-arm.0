Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1897367ejb;
        Mon, 9 Oct 2023 04:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6aXeMf6PEoKPdyEmkmmSFnYT59sxqvLwaJRRzlOZPcNgtwDGfyyMsT0AFs5x/Pgdyx4Db
X-Received: by 2002:a7b:cc15:0:b0:401:b2c7:34a8 with SMTP id f21-20020a7bcc15000000b00401b2c734a8mr13338102wmh.7.1696851045344;
        Mon, 09 Oct 2023 04:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696851045; cv=none;
        d=google.com; s=arc-20160816;
        b=QjHnLS4Zfp6UK2HUen6lLF0P2P5nUnGX6MYw1qBSldh9HtgEHfAJfZLruZJzkJ2+VE
         Qg3icsHQZJ6aP9nzxqCPe5zq+4lGw+DMQw+M4wwgiNRyHP5Fd/QxZQrJDiew+7sPflvu
         tuusO/9hVhD0wcW+JtUFvXbzpeqC5E32vfzn+zEzRz35pQT9Qb1KU2qnYVc4+zjA7y1y
         8oBoHqkY0Sdutzt0yxVD8qxESmGm8JZGE+ktZZhApUoATZUEwnGPVsNLsAvzzzluNROC
         FBzefJ42AZFQEZQ3D16a7C8WTOyXR3nQQ6Is6BU+XnSP5BWx5qfrf+TFF0uOppz+vE0t
         tAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=T32ZNe0cJ+fs4O4XTL2SGgBVaooGjYjfzRLa6xOaveE=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=Geoiqu2391o5+AoxvTurPcOYQR7P4NgSUIiY8hVH+HXKJauRQoirKosH4xFFzUIVVR
         l/JUfyx8ag6q9iRe7SvJWct+w2C/vyI5esEAeIJBfNkQZBxaan80wAZiRL7H/tTfEbQj
         4IJQOecWRRH1UtYLN2kS81WduJF3qwAU3YtIMoWwkN7MwBq4Ynh3UVzulHvye0mjx0KA
         Kes6nd2rp0PjyeKs7W1B08Q8B7GCq0LU2v8f7/VxLiIk6BlavvG9vARSEq06G4GC7xdN
         cLBv2ErU4Mc3YsPMx/AYW+UVpmMFCDsqcAX8WuqNrf7YoQd+eX1vA/AdrqcjN5zwd4Js
         rBnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id c17-20020a056000105100b003231e558596si3792481wrx.348.2023.10.09.04.30.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3xcd242tz6K5lV;
	Mon,  9 Oct 2023 19:28:49 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.154.91) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 12:30:25 +0100
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
Subject: [PATCH V3 04/10] hw/acpi: Init GED framework with cpu hotplug events
Date: Mon, 9 Oct 2023 12:28:06 +0100
Message-ID: <20231009112812.10612-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009112812.10612-1-salil.mehta@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.154.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: IFyBGhUTRhAD

ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACPI events
when OSPM/guest receives an interrupt listed in the _CRS object of GED. OSPM
then maps or demultiplexes the event by evaluating _EVT method.

This change adds the support of cpu hotplug event initialization in the
existing GED framework.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
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
