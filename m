Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2338354njb;
        Tue, 15 Oct 2024 03:04:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+UWcMGHI8gu+sZ8iz3Cf3pbaetkA0kelCT9/jgX6I2UKBPguPdMFXEnZIqEdZPSR+FlIKTJM7xX0u4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEKm9IskcJ3ZcWVCYWJLI3Kdu2l7BeelugmckCrfL0eVh9Yt49jKZkHtTbFtgxtC4Oe7Nmp
X-Received: by 2002:a05:600c:19d0:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-431255cea07mr128840535e9.1.1728986665569;
        Tue, 15 Oct 2024 03:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986665; cv=none;
        d=google.com; s=arc-20240605;
        b=B2Unv95VxiQgJGfl+Gaa2doy/V3xg4HD45bo+RbtqLF8KS8Tg4DiBG80MYDbTLNOto
         Yh+vk5Ujgxc9TIh7etP9dk6yeD7IzhE2u6m5kKn1dU8TeoQ3j25i/N1gjwNh8FIIocEc
         OwCR+l1OC3q0F9JhB+qLwNCvLKc9HFc6Dh0rG2T0Sayb6qBOzyc4upWAsla7KLFKGQ7c
         p8VZpDprZm0xBsqTRZXw9arnpu9wxb7Xl3jtHSFVfltsdrLLMTQytAijKR3++03TvWb2
         gtqau5HTBhLxs27Zi0yxCt0/T8dNQZ48sImNnDs7NuXultJ+k/SNxj50N91MAvp+/Ytm
         dsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=llQ97SlU6OmLui9zm9B9wMQmvYKx7Rmixh9ZbeE+D0A=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=bxV9PoQIFNgrppENb6tArw8bydQOlLiZZcHeIUGm0ls8w7a2aK/PorNfRuusZ1M80r
         Q6TuOewlrz6gFlbWBn+Cfpx9250IwKlgOv6Rh0+lGIOU8ViYHTGhqvvuk1iNg+YZ0PUT
         HAMprR0zORN5Ne6p7Tb+AEaI3CWjSg1rYku5lDwVOG7D3J3Nu7zMsoKFfF6U/+hjB0PP
         qN4been9pb77XyWoe9rz0+j5gWNYF6Fxxkp88PDpyVLnGW/fN2XPqmEEMauqjWoC35LU
         DsPMniFXijcmXl+emRpdiKctj6IrN3wE9IYKRAtcSthBRN3j8CF3fj665gb7Sx0rCkRh
         cFIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fd0558dsi512428f8f.1049.2024.10.15.03.04.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV5g0mr5z6FGpc;
	Tue, 15 Oct 2024 18:02:47 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 4FE03140AA7;
	Tue, 15 Oct 2024 18:04:24 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:04:04 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 10/30] arm/virt: Enhance GED framework to handle vCPU hotplug events
Date: Tue, 15 Oct 2024 10:59:52 +0100
Message-ID: <20241015100012.254223-11-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: wNqLQe8ccHtt

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
index 00fd65b4e1..b9df428049 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -81,6 +81,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/acpi/cpu_hotplug.h"
 #include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
@@ -181,6 +182,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_CPUHP_ACPI] =         { 0x090c0000, ACPI_CPU_HOTPLUG_REG_LEN},
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -678,7 +680,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_CPU_HOTPLUG_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -694,6 +696,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
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
