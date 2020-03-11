Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1026717lfc;
        Wed, 11 Mar 2020 10:24:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs2XyKjKiMeMIPNjqtcBkdAOTxLhmDw0H7UFOh5t5/v/MuD5/1Zi/bfvDk890p9+GL0ycHf
X-Received: by 2002:ac8:1633:: with SMTP id p48mr3746345qtj.305.1583947495837;
        Wed, 11 Mar 2020 10:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947495; cv=none;
        d=google.com; s=arc-20160816;
        b=hsBXmF66MNltp/VHwQeG+eumBAAPls3JGyw4hOZPmqnuW8++I5cPXuMeOGmq2i0e5Y
         bWYU3QUlSDPgShApiVLbGCgEPg/rCPaQjL60NN6IhCLTCa8Wuob/TSl50SPOZ7SsJ7Sx
         1pKfajQAP7LHlU432hb7Xpr8NkhTaf+ZxuGClsSsgG2mhUFuJhUBLy+zXaA65igu/cDN
         pMW7Xdt7gKEn2W4bJVOGHrWYJneCFWiusVR3XwBtX6XSBWMVVFEhZxgaQjark2Syw8l+
         nwTRMANa1yzS9NN+jWuqYlemGb+IiHOTN9ncDu/FDH+oTWauZdOEZpW8DcFgMG5qSrLR
         BkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=O2gsYX+dRSCeu2WGGDHmG2EGgCyTD7AXhL+FcSOBbco=;
        b=G/fLnXXTcmM8C6RdNd13QzJRi8zYsvfCT2T3P/Ri+Ywm2r9JlSsfH9qWcjqavZdZAg
         waB07ndQ3NJ8k4XdiX+thFB8FA9BJK5L1hs8S5yx0EK3z/LFpI7+Yuavupw1IamwioyH
         feN9GJA/V0pNdNjQXMZPEfPJJWPMxzbj9f/GJ+BwCtHwtvhG7eQ4nnfV0rik48RUoDOn
         rEsqKregbcaUGlJTYSAZi2vlGuxgsRoL0L36At/fnSyhbPvPCInsPba1xYjaJGzY/+aP
         i6HvTkrw7jVjoJ1XZJ9APT9djKYO+tMMytXfhyfNWjgvBDpC5iUF9g0fDdCzxg3lmTrC
         pdpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si1466255qkh.67.2020.03.11.10.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC56F-0003zA-8u
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55D-0002HP-8n
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 13:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55B-00043D-V7
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 13:23:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3279 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC558-0003si-VD; Wed, 11 Mar 2020 13:23:47 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BE2E998B9FD3E14039DF;
 Thu, 12 Mar 2020 01:23:44 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 01:23:35 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v3 06/10] hw/arm/virt: Add nvdimm hot-plug infrastructure
Date: Wed, 11 Mar 2020 17:20:10 +0000
Message-ID: <20200311172014.33052-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPnmr6tRJJwz

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

This adds support to init nvdimm acpi state and build nvdimm acpi tables.
Please note nvdimm_support is not yet enabled.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v2 -> v3
 -Modified commit log.
---
 hw/arm/Kconfig           |  1 +
 hw/arm/virt-acpi-build.c |  6 ++++++
 hw/arm/virt.c            | 19 +++++++++++++++++++
 hw/mem/Kconfig           |  2 +-
 include/hw/arm/virt.h    |  1 +
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bc54fd61f9..b023c0ecd5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,6 +25,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
+    select ACPI_NVDIMM
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c13710b727..b7d666b7a4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
+#include "hw/mem/nvdimm.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "kvm_arm.h"
@@ -826,6 +827,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         }
     }
 
+    if (ms->nvdimms_state->is_enabled) {
+        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
+                          ms->nvdimms_state, ms->ram_slots);
+    }
+
     if (its_class_name() && !vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 32d865a488..18178553fa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -148,6 +148,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
+    [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1784,6 +1785,18 @@ static void machvirt_init(MachineState *machine)
 
     create_platform_bus(vms);
 
+    if (machine->nvdimms_state->is_enabled) {
+        const struct AcpiGenericAddress arm_virt_nvdimm_acpi_dsmio = {
+            .space_id = AML_AS_SYSTEM_MEMORY,
+            .address = vms->memmap[VIRT_NVDIMM_ACPI].base,
+            .bit_width = NVDIMM_ACPI_IO_LEN << 3
+        };
+
+        nvdimm_init_acpi_state(machine->nvdimms_state, sysmem,
+                               arm_virt_nvdimm_acpi_dsmio,
+                               vms->fw_cfg, OBJECT(vms));
+    }
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.nb_cpus = smp_cpus;
     vms->bootinfo.board_id = -1;
@@ -1970,6 +1983,8 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    MachineState *ms = MACHINE(hotplug_dev);
+    bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     Error *local_err = NULL;
 
     pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
@@ -1977,6 +1992,10 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
         goto out;
     }
 
+    if (is_nvdimm) {
+        nvdimm_plug(ms->nvdimms_state);
+    }
+
     hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
                          dev, &error_abort);
 
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index 2ad052a536..c27844900d 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -8,4 +8,4 @@ config MEM_DEVICE
 config NVDIMM
     bool
     default y
-    depends on (PC || PSERIES)
+    depends on (PC || PSERIES || ARM_VIRT)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 02f500cb8e..59588d18db 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -79,6 +79,7 @@ enum {
     VIRT_SECURE_MEM,
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
+    VIRT_NVDIMM_ACPI,
     VIRT_LOWMEMMAP_LAST,
 };
 
-- 
2.17.1


