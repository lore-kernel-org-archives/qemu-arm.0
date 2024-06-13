Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97656ejr;
        Thu, 13 Jun 2024 16:41:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnnTRWKL0La68qcOg919teN/FhKIPQ/9FAT0/6bYP4YolS3zDjLfS1kpQLUvI53e4xzcnX156ebOudJPhWXdtlW/s9IzuZ
X-Google-Smtp-Source: AGHT+IFvl38c9Yt8Ry1/PA9E+6XiEJ8ayHGyF82JigWG26vGT6YOXWsfJxdiHJq8tRlGWbuJ+ydb
X-Received: by 2002:a05:6870:9589:b0:250:3c25:ca61 with SMTP id 586e51a60fabf-2584288b414mr1325124fac.6.1718322106416;
        Thu, 13 Jun 2024 16:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322106; cv=none;
        d=google.com; s=arc-20160816;
        b=eDqh6hgXPggpgPzXjfRRQlVqkVaMUsbYn6c+CDp1mwiOL0/rrhDcJ/Ror/6f91TzpE
         f3LosWfcJxRIUQNsWip1LdSAeGXU8MrfNhwFw4ckJ2pkD1v0jIb0u2RmIFrqG48NM8vx
         BA5FwM9/ZjeIHSQPLQjPADTSOjFD8D38OzQmRXCt3eIZofTAs/TT8PKgzEUACYC5C8T2
         Rd99zY9uRBf+GxPnl6sRjkCBZbENZTr0bfzYXLdhfboR7UFzQHkWhDYUfrrYq9TfvKqD
         wpkxJHG+X0A3WYFtbf3l5ZUOa7AQmSSaGadhUz66XRpiY4kNQyZ9qDG7emXxWpWOriyP
         8ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=V+jaRrAsmC2yr307TIPX3BZaQX6+UTukdCnI+aHK5kE=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=mrbDyT8mj/K7HS28Vc/ADEv4uK6LkoLL9Xb3RpA3f+jcvaC/uujTkCp6NWXEXFJ8+h
         G3GUj4ncqn0Vlo7OlaZIaHfeolAWAVzCfJeEBWR3aT8apbxoAztTZ5/iu+yWHJbC/4rt
         zEmBF5MfATp+zZ5TMmuALNYZgDiqx48gLENvF5GbWcf335pkyQk6XZscg5uEjHDjCW0p
         1My5AdN99nvCd3t9/P2SkTPOLieh4Nb+Xfwoy+Y69YJMP7P1lsfs0RDYWDLdD81kzCR/
         auWZ0Rwt+I+uBRan/EoXYIBdFK/NldgeLvswGXiiabisIyDd/rOqeSocf3neqq/y5Kdx
         U8wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-705ccb9d254si2245773b3a.351.2024.06.13.16.41.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f7k2xc6z6K69v;
	Fri, 14 Jun 2024 07:41:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 44AD114065C;
	Fri, 14 Jun 2024 07:41:41 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:41:18 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 10/29] arm/virt: Add cpu hotplug events to GED during creation
Date: Fri, 14 Jun 2024 00:36:20 +0100
Message-ID: <20240613233639.202896-11-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: Cctb3Uwqdo51

Add the CPU Hotplug event to the set of supported GED events during the creation
of the GED device at VM initialization. Additionally, initialize the memory
map for the CPU Hotplug control device, which is used for event exchanges
between QEMU/VMM and the guest.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c         | 5 ++++-
 include/hw/arm/virt.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 57ec429022..918bcb9a1b 100644
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
@@ -176,6 +177,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_CPUHP_ACPI] =         { 0x090c0000, ACPI_CPU_HOTPLUG_REG_LEN},
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -660,7 +662,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_CPU_HOTPLUG_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -676,6 +678,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 3, vms->memmap[VIRT_CPUHP_ACPI].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index d8dcc89a0d..d711cab46d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -75,6 +75,7 @@ enum {
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
+    VIRT_CPUHP_ACPI,
     VIRT_PVTIME,
     VIRT_LOWMEMMAP_LAST,
 };
-- 
2.34.1
