Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp982110ejc;
        Tue, 26 Sep 2023 03:09:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDR4zaprbrwNVCax7RCgnUw7fve5UrEm62p8SC2IzqF1H0kM9XidyYcxskIwLMe0iUaw/c
X-Received: by 2002:a5d:430f:0:b0:320:976:f940 with SMTP id h15-20020a5d430f000000b003200976f940mr8907405wrq.13.1695722995583;
        Tue, 26 Sep 2023 03:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722995; cv=none;
        d=google.com; s=arc-20160816;
        b=KfHlR0mmjdwf+Z9tV1kvJQHjylNqa3MyjvqiLydbrmJu3SyTAbh3FJAx3xy+oHJEJ4
         vRGyyWfunWMtSMjM9bg83RwpKU97/EvuyOtOd3/nGAbiYcrm0gQ8TYLxUyoNYLjmlnYC
         E+TSidaTtgcq97WQOfSHyUp80c24vgCa98hYBM/x3I6oES0RuBkF3m1zX6kalq5nevTL
         dGNXcZUOfwCi0tr+C7N73E+4f1GQIjE/WncL5XgL3z3nCKY0HrHcG/+nJUI+LCuE499O
         ohwl3Ii0VJ4SOUGNpNZzuFiUcA9tEHXCMzs88UrIX47Th77JSqg+DU9PW2Ep5XopV1u4
         Hbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=W9/UTx1UlHhO3uGFdGpD0DYMZYZXrowwL6P40sYwmV4=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=UxrTBUYKihjtKHgzPteTLndxzikfsK19DspYWp53lNruXKep60ar5pOKTVHtz+Hrda
         o69QVozdGZkCYWx8vAhxZxjPk3O1X4O7tK/Fpl9io4Sz6vmB8h5+5fQnwkFxD19/rpts
         f7iG/oknc9RQCkFepGm6DX16UmGzTKRyzgZKqOr3TfscHQ26+ujl49MvJYCxNe4/lhaG
         sljD02kTwGLjBwW0F1T91vgb664r1YAYPuoCJNsmNnBIKoyjtA/uhypdSUM8DTVYlcTv
         6csLDTB1ITno/f3x3kkQMxCixaxS1kR5N7aNbChGXHNPVkUShFboshTQr10Ddtu0ct8w
         ravg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k3-20020adff5c3000000b00320093f2756si5734530wrp.274.2023.09.26.03.09.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwQt4FpJz6D9CZ;
	Tue, 26 Sep 2023 18:07:34 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:09:30 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 14/37] arm/virt: Add cpu hotplug events to GED during creation
Date: Tue, 26 Sep 2023 11:04:13 +0100
Message-ID: <20230926100436.28284-15-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: whODJU0MJBpf

Add CPU Hotplug event to the set of supported ged-events during the creation of
GED device during VM init. Also initialize the memory map for CPU Hotplug
control device used in event exchanges between Qemu/VMM and the guest.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 5 ++++-
 include/hw/arm/virt.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 070c36054e..5c8a0672dc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -76,6 +76,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/acpi/cpu_hotplug.h"
 #include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
@@ -155,6 +156,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_CPUHP_ACPI] =         { 0x090c0000, ACPI_CPU_HOTPLUG_REG_LEN},
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -640,7 +642,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_CPU_HOTPLUG_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -655,6 +657,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 3, vms->memmap[VIRT_CPUHP_ACPI].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index fc0469c33f..09a0b2d4f0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -85,6 +85,7 @@ enum {
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
+    VIRT_CPUHP_ACPI,
     VIRT_PVTIME,
     VIRT_LOWMEMMAP_LAST,
 };
-- 
2.34.1
