Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1843292wro;
        Fri, 15 Mar 2019 03:09:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+Dm4J/ARDZ3VX5O4Z2ZrQYARdaA840vK0yE3oxUTGjVQp2jVM/F/FmO41MU1GP9z6L0dt
X-Received: by 2002:a5d:6711:: with SMTP id o17mr1745069wru.268.1552644545368;
        Fri, 15 Mar 2019 03:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552644545; cv=none;
        d=google.com; s=arc-20160816;
        b=V3fxCK1Hiz5kKGKeTvotFIRD1QB2gg+J1VWuGm63jo1UaVskfnTdhyTzJtzwivcM86
         075V33xlIirkrLWR7hUY3kCXd+IqHdTp7cYi0s1hxpIja7ug06utXEbPL6ldZ/T+xPOc
         hZsqz9SBodc/dSCzIFPu6ktFN3DTxTqegaai2ktPiUHs3xEHHxwbJG0Hzhv2/8Ls+bfy
         TDzQvvRlEPI24mE63ZRKrwD48Srb0HWpXBV6NtpxfWS+HK3NKKeu8E86cWlo8XqJOxEN
         7QVBa1J0QvruQk+O7opN+MFs/Pnk+t5rkbQeyqK9MUf/tHbzZfbb4OOVz1LxCrkg3mhZ
         8NFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=dlFv4qIVZhs5Ia6Gi4pgZMscUXtZDFECZFAvEbrV6jU=;
        b=NZhFrLhfJfsY9zUru3lGyXzMkLu1WfuXow7+PelnRljao1Jl9d5MW6sQMwiLrTzgFP
         ycro452za1vlQ6SAWW8YZgUEYSxSPmuJwM2o/PSXg//2Wph2PRuxtPP1Sez0/hwg7eQb
         ml+LztuHX+Lux6Ln67pCMNib+89VB4n0lN2rcfrH/5G0f/2WiXwrcnYvGarmDwUJVJoV
         gEhMRj6X4uZsp0WnNbWnRdX02Vk2AVc2PX/l5YPO+clYtt1MsH6NTT0vrUMVEgzw5dfQ
         N2sJIZxWJjJTUDFbcAzdGTiKHOPr3lTQrXKwbtpfdvcZkC4BUeNyk/gjCMGkMXFveoCC
         VozQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=stcyfdQW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si938121wrt.251.2019.03.15.03.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 03:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=stcyfdQW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4jlw-0001Ua-7P
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 06:09:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1h4jkz-0001Rw-V2
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1h4jkx-0000nh-AN
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:08:05 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43643)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1h4jkw-0000mp-MI
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:08:03 -0400
Received: by mail-pg1-x536.google.com with SMTP id l11so6110546pgq.10
	for <qemu-devel@nongnu.org>; Fri, 15 Mar 2019 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dlFv4qIVZhs5Ia6Gi4pgZMscUXtZDFECZFAvEbrV6jU=;
	b=stcyfdQWjsPL71cxZDdfHabH3vTeciZSEAiCj3ZqV74YVCvAb9ZIw+ZS5GJMte+UHh
	aKFc8x/udYXOK4SrppkzD0jXm6fmGoTrxdL9WnRGS42aQxwkTIP/XQ1qKR6jSkGt3fFx
	5bB66iDFQVZL9kwZpi8upYqt6GNxWGPkFaOgM1yOPTMOqADS1biJrx6Hynm28ZsFBgof
	PnjHhSNywYXfMbSzf/XLuI4nncWSKfsKCrdE9rghxrvmRn4zxJhi1joy7EbhCWgyywPW
	5cCiU0vPwUyxlypq2OTjEtVrwyUabCMQ8xEl6L5v8JRHXxTxkyz01ApoGT0o/Ze6j7nR
	sKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dlFv4qIVZhs5Ia6Gi4pgZMscUXtZDFECZFAvEbrV6jU=;
	b=Xt367HvZKVlem0BIKxxid6IzWgWZezclGQhi8m5BNwzD3P5T85PshKQOhKQBfCvNzv
	wWSYdNsy2eGJ/7rQPco0CDvNfbj8nOs/T11eju07/GVtT9bGyYqq/kS3foMTNPCTjul1
	FtKmcVUJDXDik5kUWCh7TPm35AU5BMSZ1FjxyQu7ZI35lZcFlbbI+FOJpTUs8UwJQheD
	ry80n8msdPTtbztokwqpRIqYwE51fSmKKISStgzNU1utv7jxNbnnc55sRgX7UD6hUANV
	wNUa/kyZdj6RpNeQ9YPagiowKEOxA8kgrY6avI3eGC9vjrM8YpfIp4kUMeYARnK/gwIv
	4bdg==
X-Gm-Message-State: APjAAAWlMCc1/7q/a+FhvHJ3Tqta4+7h8F8j4UYA1Y/xufb3JYdfWx3S
	w3vpg9qRGq3WhvO1L6WinF2ytA==
X-Received: by 2002:a62:e40d:: with SMTP id r13mr3114098pfh.11.1552644481095; 
	Fri, 15 Mar 2019 03:08:01 -0700 (PDT)
Received: from localhost.localdomain ([104.237.86.214])
	by smtp.gmail.com with ESMTPSA id b7sm4882128pfi.36.2019.03.15.03.07.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 03:08:00 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Mar 2019 18:07:45 +0800
Message-Id: <1552644466-24625-2-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::536
Subject: [Qemu-devel] [PATCH v6 1/2] hw/arm: Add arm SBSA reference machine,
 skeleton part
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, radoslaw.biernacki@linaro.org,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYjukZRi48Dy

For the Aarch64, there is one machine 'virt', it is primarily meant to
run on KVM and execute virtualization workloads, but we need an
environment as faithful as possible to physical hardware, for supporting
firmware and OS development for pysical Aarch64 machines.

This patch introduces new machine type 'sbsa-ref' with main features:
 - Based on 'virt' machine type.
 - A new memory map.
 - CPU type cortex-a57.
 - EL2 and EL3 are enabled.
 - GIC version 3.
 - System bus AHCI controller.
 - System bus EHCI controller.
 - CDROM and hard disc on AHCI bus.
 - E1000E ethernet card on PCIE bus.
 - VGA display adaptor on PCIE bus.
 - No virtio deivces.
 - No fw_cfg device.
 - No ACPI table supplied.
 - Only minimal device tree nodes.

Arm Trusted Firmware and UEFI porting to this are done accordingly, and
it should supply ACPI tables to load OS, the minimal device tree nodes
supplied from this platform are only to pass the dynamic info reflecting
command line input to firmware, not for loading OS.

To make the review easier, this task is split into two patches, the
fundamental sceleton part and the peripheral devices part, this patch is
the first part.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Kconfig                  |   3 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/sbsa-ref.c               | 303 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 hw/arm/sbsa-ref.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2a7efc1..4fbb6ac 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -144,6 +144,7 @@ CONFIG_IOH3420=y
 CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_ARM_VIRT=y
+CONFIG_SBSA_REF=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_SMBUS_EEPROM=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d298fbd..6654914 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -38,6 +38,9 @@ config PXA2XX
 config REALVIEW
     bool
 
+config SBSA_REF
+    bool
+
 config STELLARIS
     bool
 
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fa57c7c..fa812ec 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -12,6 +12,7 @@ obj-$(CONFIG_NSERIES) += nseries.o
 obj-$(CONFIG_OMAP) += omap_sx1.o palm.o
 obj-$(CONFIG_PXA2XX) += gumstix.o spitz.o tosa.o z2.o
 obj-$(CONFIG_REALVIEW) += realview.o
+obj-$(CONFIG_SBSA_REF) += sbsa-ref.o
 obj-$(CONFIG_STELLARIS) += stellaris.o
 obj-$(CONFIG_STRONGARM) += collie.o
 obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
new file mode 100644
index 0000000..b6d31f2
--- /dev/null
+++ b/hw/arm/sbsa-ref.c
@@ -0,0 +1,303 @@
+/*
+ * ARM SBSA Reference Platform emulation
+ *
+ * Copyright (c) 2018 Linaro Limited
+ * Written by Hongbo Zhang <hongbo.zhang@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/units.h"
+#include "sysemu/numa.h"
+#include "sysemu/sysemu.h"
+#include "exec/address-spaces.h"
+#include "exec/hwaddr.h"
+#include "kvm_arm.h"
+#include "hw/arm/arm.h"
+#include "hw/boards.h"
+#include "hw/intc/arm_gicv3_common.h"
+
+#define RAMLIMIT_GB 8192
+#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
+
+enum {
+    SBSA_FLASH,
+    SBSA_MEM,
+    SBSA_CPUPERIPHS,
+    SBSA_GIC_DIST,
+    SBSA_GIC_REDIST,
+    SBSA_SMMU,
+    SBSA_UART,
+    SBSA_RTC,
+    SBSA_PCIE,
+    SBSA_PCIE_MMIO,
+    SBSA_PCIE_MMIO_HIGH,
+    SBSA_PCIE_PIO,
+    SBSA_PCIE_ECAM,
+    SBSA_GPIO,
+    SBSA_SECURE_UART,
+    SBSA_SECURE_MEM,
+    SBSA_AHCI,
+    SBSA_EHCI,
+};
+
+typedef struct MemMapEntry {
+    hwaddr base;
+    hwaddr size;
+} MemMapEntry;
+
+typedef struct {
+    MachineState parent;
+    struct arm_boot_info bootinfo;
+    const MemMapEntry *memmap;
+    const int *irqmap;
+    int smp_cpus;
+    void *fdt;
+    int fdt_size;
+    int psci_conduit;
+} SBSAMachineState;
+
+#define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
+#define SBSA_MACHINE(obj) \
+    OBJECT_CHECK(SBSAMachineState, (obj), TYPE_SBSA_MACHINE)
+
+static const MemMapEntry sbsa_ref_memmap[] = {
+    /* 512M boot ROM */
+    [SBSA_FLASH] =              {          0, 0x20000000 },
+    /* 512M secure memory */
+    [SBSA_SECURE_MEM] =         { 0x20000000, 0x20000000 },
+    /* Space reserved for CPU peripheral devices */
+    [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
+    [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
+    [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_UART] =               { 0x60000000, 0x00001000 },
+    [SBSA_RTC] =                { 0x60010000, 0x00001000 },
+    [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
+    [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
+    [SBSA_SMMU] =               { 0x60040000, 0x00020000 },
+    /* Space here reserved for more SMMUs */
+    [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
+    [SBSA_EHCI] =               { 0x60110000, 0x00010000 },
+    /* Space here reserved for other devices */
+    [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
+    /* 256M PCIE ECAM space */
+    [SBSA_PCIE_ECAM] =          { 0x80000000, 0x10000000 },
+    /* 32-bit address PCIE MMIO space */
+    [SBSA_PCIE_MMIO] =          { 0x90000000, 0x70000000 },
+    /* ~1TB PCIE MMIO space (4GB to 1024GB boundary) */
+    [SBSA_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0xFF00000000ULL },
+    [SBSA_MEM] =                { 0x10000000000ULL, RAMLIMIT_BYTES },
+};
+
+static const int sbsa_ref_irqmap[] = {
+    [SBSA_UART] = 1,
+    [SBSA_RTC] = 2,
+    [SBSA_PCIE] = 3, /* ... to 6 */
+    [SBSA_GPIO] = 7,
+    [SBSA_SECURE_UART] = 8,
+    [SBSA_AHCI] = 9,
+    [SBSA_EHCI] = 10,
+};
+
+static void sbsa_ref_init(MachineState *machine)
+{
+    SBSAMachineState *vms = SBSA_MACHINE(machine);
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *secure_sysmem = NULL;
+    MemoryRegion *ram = g_new(MemoryRegion, 1);
+    bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    const CPUArchIdList *possible_cpus;
+    int n, sbsa_max_cpus;
+
+    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
+        error_report("sbsa-ref: CPU type other than the built-in "
+                     "cortex-a57 not supported");
+        exit(1);
+    }
+
+    if (kvm_enabled()) {
+        error_report("sbsa-ref: KVM is not supported at this machine");
+        exit(1);
+    }
+
+    if (machine->kernel_filename && firmware_loaded) {
+        error_report("sbsa-ref: No fw_cfg device on this machine, "
+                     "so -kernel option is not supported when firmware loaded, "
+                     "please load OS from hard disk instead");
+        exit(1);
+    }
+
+    /*
+     * This machine has EL3 enabled, external firmware should supply PSCI
+     * implementation, so the QEMU's internal PSCI is disabled.
+     */
+    vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+
+    sbsa_max_cpus = vms->memmap[SBSA_GIC_REDIST].size / GICV3_REDIST_SIZE;
+
+    if (max_cpus > sbsa_max_cpus) {
+        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
+                     "supported by machine 'sbsa-ref' (%d)",
+                     max_cpus, sbsa_max_cpus);
+        exit(1);
+    }
+
+    vms->smp_cpus = smp_cpus;
+
+    if (machine->ram_size > vms->memmap[SBSA_MEM].size) {
+        error_report("sbsa-ref: cannot model more than %dGB RAM", RAMLIMIT_GB);
+        exit(1);
+    }
+
+    secure_sysmem = g_new(MemoryRegion, 1);
+    memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
+                       UINT64_MAX);
+    memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
+
+    possible_cpus = mc->possible_cpu_arch_ids(machine);
+    for (n = 0; n < possible_cpus->len; n++) {
+        Object *cpuobj;
+        CPUState *cs;
+
+        if (n >= smp_cpus) {
+            break;
+        }
+
+        cpuobj = object_new(possible_cpus->cpus[n].type);
+        object_property_set_int(cpuobj, possible_cpus->cpus[n].arch_id,
+                                "mp-affinity", NULL);
+
+        cs = CPU(cpuobj);
+        cs->cpu_index = n;
+
+        numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
+                          &error_fatal);
+
+        if (object_property_find(cpuobj, "reset-cbar", NULL)) {
+            object_property_set_int(cpuobj, vms->memmap[SBSA_CPUPERIPHS].base,
+                                    "reset-cbar", &error_abort);
+        }
+
+        object_property_set_link(cpuobj, OBJECT(sysmem), "memory",
+                                 &error_abort);
+
+        object_property_set_link(cpuobj, OBJECT(secure_sysmem),
+                                 "secure-memory", &error_abort);
+
+        object_property_set_bool(cpuobj, true, "realized", &error_fatal);
+        object_unref(cpuobj);
+    }
+
+    memory_region_allocate_system_memory(ram, NULL, "sbsa-ref.ram",
+                                         machine->ram_size);
+    memory_region_add_subregion(sysmem, vms->memmap[SBSA_MEM].base, ram);
+
+    vms->bootinfo.ram_size = machine->ram_size;
+    vms->bootinfo.kernel_filename = machine->kernel_filename;
+    vms->bootinfo.nb_cpus = smp_cpus;
+    vms->bootinfo.board_id = -1;
+    vms->bootinfo.loader_start = vms->memmap[SBSA_MEM].base;
+    vms->bootinfo.firmware_loaded = firmware_loaded;
+    arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
+}
+
+static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *vms, int idx)
+{
+    uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
+    return arm_cpu_mp_affinity(idx, clustersz);
+}
+
+static const CPUArchIdList *sbsa_ref_possible_cpu_arch_ids(MachineState *ms)
+{
+    SBSAMachineState *vms = SBSA_MACHINE(ms);
+    int n;
+
+    if (ms->possible_cpus) {
+        assert(ms->possible_cpus->len == max_cpus);
+        return ms->possible_cpus;
+    }
+
+    ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
+                                  sizeof(CPUArchId) * max_cpus);
+    ms->possible_cpus->len = max_cpus;
+    for (n = 0; n < ms->possible_cpus->len; n++) {
+        ms->possible_cpus->cpus[n].type = ms->cpu_type;
+        ms->possible_cpus->cpus[n].arch_id =
+            sbsa_ref_cpu_mp_affinity(vms, n);
+        ms->possible_cpus->cpus[n].props.has_thread_id = true;
+        ms->possible_cpus->cpus[n].props.thread_id = n;
+    }
+    return ms->possible_cpus;
+}
+
+static CpuInstanceProperties
+sbsa_ref_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+
+    assert(cpu_index < possible_cpus->len);
+    return possible_cpus->cpus[cpu_index].props;
+}
+
+static int64_t
+sbsa_ref_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    return idx % nb_numa_nodes;
+}
+
+static void sbsa_ref_instance_init(Object *obj)
+{
+    SBSAMachineState *vms = SBSA_MACHINE(obj);
+
+    vms->memmap = sbsa_ref_memmap;
+    vms->irqmap = sbsa_ref_irqmap;
+}
+
+static void sbsa_ref_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = sbsa_ref_init;
+    mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
+    mc->max_cpus = 512;
+    mc->pci_allow_0_address = true;
+    mc->minimum_page_bits = 12;
+    mc->block_default_type = IF_IDE;
+    mc->no_cdrom = 1;
+    mc->default_ram_size = 1 * GiB;
+    mc->default_cpus = 4;
+    mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
+    mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
+    mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+}
+
+static const TypeInfo sbsa_ref_info = {
+    .name          = TYPE_SBSA_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .instance_size = sizeof(SBSAMachineState),
+    .instance_init = sbsa_ref_instance_init,
+    .class_init    = sbsa_ref_class_init,
+};
+
+static void sbsa_ref_machine_init(void)
+{
+    type_register_static(&sbsa_ref_info);
+}
+
+type_init(sbsa_ref_machine_init);
-- 
2.7.4

