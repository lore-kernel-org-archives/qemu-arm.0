Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1992ejb;
        Fri, 29 Sep 2023 17:21:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNhdWGU1JmGiWEVSXy8ZG8X2LCxmYA1pQF5tlMI7ruqxRqQiPYBTGng0lp3MziqZt1Rj0a
X-Received: by 2002:adf:fe02:0:b0:319:5677:f832 with SMTP id n2-20020adffe02000000b003195677f832mr4291374wrr.62.1696033288264;
        Fri, 29 Sep 2023 17:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033288; cv=none;
        d=google.com; s=arc-20160816;
        b=qyTMBNy9UweEQo0K44OVTIFmi0yIstjRlcfjn2vrlLyb3KBSECnBuklK5/dLwjn8na
         6ET4+EPlPY3oqrWDsjqZqXlKlXOgRGKTDycayh+RyAK1b+pu5aM1jKMSCLRdwfY4MRd1
         wy8cuwumRaLqRcI3l2d3Bwi5uMI0rQgtzpsaX7sWs1VJ7IuransQwcmI6tc7uQthg5BZ
         UTJSoIwDjeIYhHvUlXiaBNNjcQcvddKZWkBnVblmJa/vYd28f+i0wAy9ujNqwzXWovjU
         FjJejcrGJ/Tutv28MMH5Cv5lyEITmMfNSxcaENJsMI87FvOQIQ/8Ii3q0Cq/ofEmIjl4
         ONkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=skqEF02oIUjd6jS0L+UMyBoCEj3yWjk8RN2xWtJA4/s=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=MrUtqsvSZJHHD8eg7ETo+kVMtCtUfc0z4vLexkVcjt8TEiRjXtWo5qiJ7lKly2pnxU
         hgcPS6rJ5MW2sHWqf1ImMaK38QJ181mBAlhxPjagoBwTfhxtTEg9LW9ve0KcP4s84Fze
         OMiux9fFJg/RhtKhDqI95DSMcKvNtIfszaY5eJ70HPW2lpg5RM4mHCbgjCHLNjon8sQu
         KUuji3ejER0mU3VMEwvaBaoYyL8C/WR24jRojO0fpsJ2HxUAdy6v2CgEo5tekAza6Try
         6WgYR4OqZMBcBXu1hXTLspT53y8j8VOB9eV9ObojRBoRXuPMRKTk+gFpJ9SpRF1eoh8b
         bLFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id h8-20020a5d5488000000b00313e3d0a5basi7036930wrv.930.2023.09.29.17.21.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry79s0DfJz6HJFg;
	Sat, 30 Sep 2023 08:18:57 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:21:07 +0100
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
Subject: [PATCH V2 04/10] hw/acpi: Init GED framework with cpu hotplug events
Date: Sat, 30 Sep 2023 01:19:27 +0100
Message-ID: <20230930001933.2660-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: I8qkr3r7EEBF

ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACPI events
when OSPM/guest receives an interrupt listed in the _CRS object of GED. OSPM
then maps or demultiplexes the event by evaluating _EVT method.

This change adds the support of cpu hotplug event initialization in the
existing GED framework.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
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
