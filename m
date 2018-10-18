Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2394615wrt;
        Thu, 18 Oct 2018 07:46:00 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61KCWw3GqMPP26wi0C0nuTyWT6RqOBhnFo9Dmgb7/lpOKkNxqQ6ydkhz+F7WYooYG2K4Cr/
X-Received: by 2002:a0c:f30b:: with SMTP id j11mr30516780qvl.78.1539873960260;
        Thu, 18 Oct 2018 07:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873960; cv=none;
        d=google.com; s=arc-20160816;
        b=X6szJev98k5fc201L2qmAqnNXE11ife2Kbd+vmlLXL8ld0SuoVC3Jz8TTBC6khmQvO
         yK0j6v6LnCS92MorJO4pT9uVJgBgLPsdwC3scRTH+y9cB7E4QEGSlVPYomz4NMnsTGRn
         aJcmakMkTW9/+7quhyT1SyJBACjgObchr9oWCQLz0LAuTdUBEjjlUU8qmRN3eQFKlbkY
         xFQhhftkDUYpStWIVRTU6C9otZ7Z0jUzQefHS7xecPRNjC0yihiJ1R8sBN3wPVk7oZb3
         MPeZx2eDAdfPnF1hbHMOvL9jhnmouBo47xx4fOI+QfXQKY6HdfwJcqd+3gf0RxMrMzTF
         GL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=IgoWQiB1/45K1h96sbf4WyrGsj1N+Vh5sVnY+Vzp57Q=;
        b=JblMkHR7xS1dS7fgRz7hliCdWwDFeQbEJb7s50r3YeLIHGTvj6nxZ6bOrw/fjW+uSR
         cBrFEAiRKsWuty+tXVi7tRWmtfwHqVg4FVE8bF4dZp9HJS167JJtikW33Ua6yLhVH8Ll
         dPIRF07RxKg3S/Ev4jZYxAm69rsgIqpEDjCa1GKNKDzfX27w/qkcdaaCTbFM5tZJaE18
         EHMM6VuA6/Wbuby0Kf4RhY9k/o3ECkO12dFwAnO+eEzC7igdWlWUXY/hpy5BeybE+6pB
         9ajte8A0cE1Y313LZY5WxhRus5KiDUPKq8UtWEdcGtS4P2mnpfr6EfC2Mhsyo8ljQJ9Q
         7mDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a8si1814642qvf.8.2018.10.18.07.46.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:46:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9Yl-0000mP-OJ
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:45:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Lh-0006UO-BP
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 10:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9LZ-00089D-P0
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 10:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9LS-0007tE-5S; Thu, 18 Oct 2018 10:32:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F57FC0587CE;
	Thu, 18 Oct 2018 14:32:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00CF060150;
	Thu, 18 Oct 2018 14:32:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:40 +0200
Message-Id: <20181018143042.29588-15-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 18 Oct 2018 14:32:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 14/16] hw/arm/virt: Add nvdimm hot-plug
 infrastructure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MvP1yd1uDRh3

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

Pre-plug and plug handlers are prepared for NVDIMM support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
---
 default-configs/arm-softmmu.mak |  2 ++
 hw/arm/virt-acpi-build.c        |  6 ++++++
 hw/arm/virt.c                   | 22 ++++++++++++++++++++++
 include/hw/arm/virt.h           |  3 +++
 4 files changed, 33 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 1c110cfe7f..466b3d2c39 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -160,4 +160,6 @@ CONFIG_STRONGARM=y
 CONFIG_HIGHBANK=y
 CONFIG_MUSICPAL=y
 CONFIG_MEM_HOTPLUG=y
+CONFIG_NVDIMM=y
+CONFIG_ACPI_NVDIMM=y
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8818bbf5ec..dc100dd4c0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -808,6 +808,7 @@ static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     GArray *table_offsets;
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
@@ -848,6 +849,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         }
     }
 
+    if (vms->acpi_nvdimm_state.is_enabled) {
+        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
+                          &vms->acpi_nvdimm_state, ms->ram_slots);
+    }
+
     if (its_class_name() && !vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1548e9480a..d84d5a5841 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -141,6 +141,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_ACPI_IO] =            { 0x09070000, 0x00010000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1609,6 +1610,18 @@ static void machvirt_init(MachineState *machine)
 
     create_platform_bus(vms, pic);
 
+    if (vms->acpi_nvdimm_state.is_enabled) {
+        AcpiNVDIMMState *acpi_nvdimm_state = &vms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_MEMORY;
+        acpi_nvdimm_state->dsm_io.base =
+                vms->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.len = NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
+                               vms->fw_cfg, OBJECT(vms));
+    }
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
@@ -1794,10 +1807,19 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     Error *local_err = NULL;
 
     pc_dimm_plug(dev, MACHINE(vms), &local_err);
+    if (local_err) {
+        goto out;
+    }
 
+    if (is_nvdimm) {
+        nvdimm_plug(&vms->acpi_nvdimm_state);
+    }
+
+out:
     error_propagate(errp, local_err);
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 032d88f4c4..974a110a38 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -37,6 +37,7 @@
 #include "hw/arm/arm.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/mem/nvdimm.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -81,6 +82,7 @@ enum {
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
     VIRT_DEVICE_MEM,
+    VIRT_ACPI_IO,
 };
 
 typedef enum VirtIOMMUType {
@@ -128,6 +130,7 @@ typedef struct {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    AcpiNVDIMMState acpi_nvdimm_state;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
-- 
2.17.1

