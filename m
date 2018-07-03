Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp698026wrq;
        Tue, 3 Jul 2018 00:29:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeu/Q/bfqX/Vc8hVewT9eegWIcfHBfCOvLS1qr+JgyCPYlla6sKPSGBQtlUlFnfPXEtEzCP
X-Received: by 2002:ac8:2759:: with SMTP id h25-v6mr12973193qth.259.1530602975798;
        Tue, 03 Jul 2018 00:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602975; cv=none;
        d=google.com; s=arc-20160816;
        b=dnuX4sorqkw9/Ctn8P0DbMUBDSvH094CpvQZs/0y08woGhcSAMzlhl+d2dffuBMmeh
         w2DTySbCw61LNlTVhJ+pF53q2nNQ4HiL5ztlbTAGyIwCqWTgtKH4ooGdnjojk8WI7Q+C
         ft0/FByYuc09x1GB27TrtrJVPmuFX9vMXC27jAoo/DGBCuRm8lsQ5THViNK0yxGyeyqH
         EPb+P9macd0DLdEcpQzG7JB0VJNifmTpPHKBmLnYmHN7Ps4nn4MB2mBggi20+jZIIDti
         cIGg5LdnDWFzcl32oFbmLz2VGuxZ4QeOzJ74KHFbCIb0f4HDmu+Jr5sIzY8lq1H05D6v
         b9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JixBQ00FiFNKkh3AKqE+kLMXBWuG1R87jl0jQLiiLB4=;
        b=FWfwdlAfGg48TFo5iZA/0DcpmTHz3QAuBekdk0ajWockfKcmXuJdMmQNB9EUwyHgIP
         2mXvXk80ys77my8AQg4FEuiUJ1CbqAIsW+zYbtWwsm2CEAiHsB3WUOlNnx6D7CWhLJ5D
         YNcMuIrSF3xp6PcHBQXEDUL+0OHRKoMVko3nWr321q6nyE4iknITNTCsWCLh1JmyWCWU
         VzOf+W4U8GeEbLRk8pFHJRcY5fQO/cFXVizzTCap+hdUHYBl0OtRz7Wi2rp2h6yD05UY
         dzkEoKifv3zzYpFzTx9VyW6Xftf1ewoBi4isH2prh2yPlU/VMnbTkydsWOOjOoDISwy1
         S2iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v1-v6si468929qtf.152.2018.07.03.00.29.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:29:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFkl-0005a2-88
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:29:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFgO-0003rF-1F
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcR-0005gr-Lc
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46864 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFcR-0005fV-7E; Tue, 03 Jul 2018 03:20:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAFB77262D;
	Tue,  3 Jul 2018 07:20:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB6761C5B6;
	Tue,  3 Jul 2018 07:20:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:56 +0200
Message-Id: <1530602398-16127-14-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 13/15] hw/arm/virt: Add nvdimm hot-plug
 infrastructure
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kNJoS1xmqeuD

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

Pre-plug and plug handlers are prepared for NVDIMM support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
---
 default-configs/arm-softmmu.mak |  2 ++
 hw/arm/virt-acpi-build.c        |  6 ++++++
 hw/arm/virt.c                   | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h           |  3 +++
 4 files changed, 34 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 28fe8f3..9f49a6a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -153,4 +153,6 @@ CONFIG_STRONGARM=y
 CONFIG_HIGHBANK=y
 CONFIG_MUSICPAL=y
 CONFIG_MEM_HOTPLUG=y
+CONFIG_NVDIMM=y
+CONFIG_ACPI_NVDIMM=y
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0915391..f18bb5c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -804,6 +804,7 @@ static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     GArray *table_offsets;
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
@@ -844,6 +845,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
index 7190962..51f42cd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -135,6 +135,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_ACPI_IO] =            { 0x09070000, 0x00010000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1607,6 +1608,18 @@ static void machvirt_init(MachineState *machine)
 
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
@@ -1801,9 +1814,11 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     PCDIMMDevice *dimm = PC_DIMM(dev);
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
+    bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     Error *local_err = NULL;
     uint64_t align;
 
@@ -1815,7 +1830,15 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
     }
 
     pc_dimm_plug(dev, MACHINE(hotplug_dev), align, &local_err);
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
index 173938d..2cabdbe 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -37,6 +37,7 @@
 #include "hw/arm/arm.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/mem/nvdimm.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -79,6 +80,7 @@ enum {
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
     VIRT_HOTPLUG_MEM,
+    VIRT_ACPI_IO,
 };
 
 typedef enum VirtIOMMUType {
@@ -128,6 +130,7 @@ typedef struct {
     char *kvm_type;
     int32_t max_vm_phys_shift;
     int32_t source_max_vm_phys_shift;
+    AcpiNVDIMMState acpi_nvdimm_state;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
-- 
2.5.5

