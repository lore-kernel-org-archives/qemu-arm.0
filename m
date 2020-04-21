Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5066436lfm;
        Tue, 21 Apr 2020 06:02:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypIjqTZAas4m13cAldyXXn3G25J17v8C16s+ySjyBcBgb0BRcjfjTY/m1sFJ7RoaZH8MpS6b
X-Received: by 2002:aed:3edd:: with SMTP id o29mr21161382qtf.149.1587474162556;
        Tue, 21 Apr 2020 06:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587474162; cv=none;
        d=google.com; s=arc-20160816;
        b=cUsoMNbmx6ENsyBsKL2VtXqBhnh+8VE1NSZoGJUhnHJyB4saRKgIPjpkBsbT9MFxKC
         294VSEBMvVoRVbzJrb2VfoHPOiEpQnT8QkNKEGN0HgK4hHSxrEyBSqRGpSskjpq3kMe/
         8lp063HDMgSlccdWYX2qRJY3us6wPOhJQ18OiIKFaEq5YOOHitV69p/jCYCdz1N9/Kd1
         1WJLOgEfeQ2WRwXCxq6KpeiU+tbRuur9fD5D6WmiKgjM4l63u+I3BFjviPxJtX1CcDO+
         qB9bD+WJwhhimQV1i3Ppmp595nWZEowPqSLrrrvweIB0057ObkBP1/ylwMFwCfJZx238
         1goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=zWw+HBooFOwKRK+tg6O9i+zFkM/+rcboLIwYduoYAtU=;
        b=zVF0l5qja86ECPRIgUTPPSK+6PR8xRf8VNHOMuRucgSvjrev98WS8nTzYXp2X8bVYd
         77LHL/YDDe2fd4vDc1b527COsMjEUCq3WwylY2m0tsctrgzbtxF+0UWgP1ZfVonzoYkZ
         etIeZWeiUXbaZI5TZ3M0PF6rvGHlud2fs0ZLtiqZ/Mtka0lKiYu+y2PlfdBmyDMZMFqi
         KyuPnaAqgRUZ8IyIbd2AsspOMOZRuGrAaRJ5oD1Y2bp6vwrrlSKqXYmb0wW54fAx5o69
         GjXpkmlzFmgnyrX64aHGuM+Lotn5hHhCiockFRnzGGP+Wt5XyAN7g9i64/gNk/UgFuud
         yvdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n23si1401423qtp.346.2020.04.21.06.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsXw-00087s-IQ
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXa-00082I-Hc
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXZ-0002Cb-R6
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:18 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:45086 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXZ-0001xB-3H; Tue, 21 Apr 2020 09:02:17 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3D6DE9B5E5B65EE706C6;
 Tue, 21 Apr 2020 21:02:09 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.91.160) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 21:02:02 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v4 3/7] hw/arm/virt: Add nvdimm hot-plug infrastructure
Date: Tue, 21 Apr 2020 13:59:30 +0100
Message-ID: <20200421125934.14952-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.91.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 09:02:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 45.249.212.32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 prime.zeng@hisilicon.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0UzxWVkv+5ba

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

This adds support to init nvdimm acpi state and build nvdimm acpi tables.
Please note nvdimm_support is not yet enabled.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/Kconfig           |  1 +
 hw/arm/virt-acpi-build.c |  6 ++++++
 hw/arm/virt.c            | 19 +++++++++++++++++++
 hw/mem/Kconfig           |  2 +-
 include/hw/arm/virt.h    |  1 +
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 188419dc1e..5364172537 100644
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
index 81d41a3990..f22b1e6097 100644
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
index 7dc96abf72..8a2beaf650 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -149,6 +149,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
+    [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1866,6 +1867,18 @@ static void machvirt_init(MachineState *machine)
 
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
@@ -2077,6 +2090,8 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    MachineState *ms = MACHINE(hotplug_dev);
+    bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     Error *local_err = NULL;
 
     pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
@@ -2084,6 +2099,10 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
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
index 60b2f521eb..6d67ace76e 100644
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


