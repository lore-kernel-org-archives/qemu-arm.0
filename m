Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595687njl;
        Tue, 8 Oct 2024 20:23:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDGzwlXJc+srcqVFrTr6lwF3fZ76vG2l0LH/U6HiWQ5W0R/UFpqqtElfN6Sq4tHujoeN30vHZogrcHWw==@linaro.org
X-Google-Smtp-Source: AGHT+IE+AP0WShrzC9OJvZapFcYZvliGuBikPEnY9WX4JLdJW4oZaNT4KF6APlNKI88SUISaG/cQ
X-Received: by 2002:a05:600c:4fc6:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-430ccf28421mr5163425e9.10.1728444194315;
        Tue, 08 Oct 2024 20:23:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444194; cv=none;
        d=google.com; s=arc-20240605;
        b=l3YfJWlL/kfrAHiWILWj5HDEfuHxEjsMFRveLGh1BHB3k73vfmq6JIdwVDwG/ak3o2
         4fBZ7DJNgo5SllJuYuJHNiaGorc2g94MJJxgjXCylNTiqSRx9T82k6uaQ74FBHybpnDl
         cAj34O/1absZQYue5QJtnFo50o9roXqgK5Zkajx0EA9ykAQceZwswzJvX1pUAIv9c0GV
         HpFZjHxHW3/w3cr5j8ErtFsUjlP34+13IIjJxgvNSf/N8QuqKVbvKNz4gBTPjLcOTcIk
         9EIF09s6olwzE1Ay6nRsX6Yvb9AU3zYD2yD/SQwgutA+3PkvWqKyIucPe0Ed1Er6MiUO
         3cyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AaSdwHJ+H731GXsPatxfleCPkXMZ9xldzu3fh0DT/+k=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=Arc1bCynTSp8vjv/mcEVS9uNHB5srUxosep/S1TXti4AgoOqtI/egfpnJJVXqfpbz1
         ol64fBhnrZI3DpG/8ypGImiOzE7N1HkPtnF9u6AEHgT+QHVxUb43WSxQyR2S10096KAv
         GXQ5HeZQ2asF1bu1M8QwkSHWwUbicjuD9mTLkxvju4A28kZ/Urs7Ie1csblFLNjG8GEX
         VtKQMAW+0wLih91TK0w0ZRSG+EM5lrQA+U1si4MZlMbNYuQI/4vuDRBtnMFn7iLGy2cy
         Tg4f7aahDR3F4shFUb28ykDmTloP8ZE1EKcccD3MmAI99vg+z8dWGjM6Al3DVkO08OA+
         hHdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d32f53ddesi957284f8f.539.2024.10.08.20.23.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:23:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdW46900z6K98k;
	Wed,  9 Oct 2024 11:22:56 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EB2B140A34;
	Wed,  9 Oct 2024 11:23:13 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:22:54 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 11/33] arm/virt: Enhance GED framework to handle vCPU hotplug events
Date: Wed, 9 Oct 2024 04:17:53 +0100
Message-ID: <20241009031815.250096-12-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 4tFKxKiuht1y

During GED device creation at Virt Machine initialization, add a new vCPU
hotplug event to the existing set of supported GED device events. Additionally,
initialize the memory map for the vCPU hotplug *control device*, which will
provide an interface to exchange ACPI events between QEMU/VMM and the Guest
Kernel.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c         | 5 ++++-
 include/hw/arm/virt.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 822c7d3d14..3986f6d9fc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -80,6 +80,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/acpi/cpu_hotplug.h"
 #include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
@@ -180,6 +181,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_CPUHP_ACPI] =         { 0x090c0000, ACPI_CPU_HOTPLUG_REG_LEN},
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -677,7 +679,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_CPU_HOTPLUG_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -693,6 +695,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 3, vms->memmap[VIRT_CPUHP_ACPI].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 362422413c..b5bfb75f71 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -78,6 +78,7 @@ enum {
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
+    VIRT_CPUHP_ACPI,
     VIRT_PVTIME,
     VIRT_LOWMEMMAP_LAST,
 };
-- 
2.34.1
