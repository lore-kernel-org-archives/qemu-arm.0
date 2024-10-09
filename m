Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp596268njl;
        Tue, 8 Oct 2024 20:25:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkBS62vRI3iihllP/1amD68gU3nF47EmbMHqTNcZQub+Ih+k7WE5Kjk4twqpd4iylBvEQwbcoHrrYDuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGWmbniUQeXKT7Pg/12uWw8Gdvynjv+BwXGkrYeOmNp8i8XV7yChqc4RgGVFwo/rWJRLAJW
X-Received: by 2002:a05:600c:3b0d:b0:42c:c401:6d86 with SMTP id 5b1f17b1804b1-430d6faa2ebmr5213455e9.27.1728444311514;
        Tue, 08 Oct 2024 20:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444311; cv=none;
        d=google.com; s=arc-20240605;
        b=Nw8YnbH1b/K0VLGB2kH9syVNZ3U2Yr/cDapCXSyo0+lAyPnxhqaCOvcq3am2LDN6hB
         gFzkwAsHL2VMeaolf5ddjDQqDIPq6EvlvPrNUacpqT73SsMeGu2NKBklSgmhWFystpF8
         GM9lLz4kXV8N9vESoAoRWsPRvPHCe0FHLykY8vOeMnZoa/0MrgVuscy+ksN/6KlXYpNE
         LAymjCuaZIhAaTOZn5VHWkMOHDpBP+61t7Lt/gm9W1DZ8/s2zvNgocjGjmkxa8H1IOrv
         TcxJ8sPZX72NiNSZ9eCJPMVweOd3OnqTjB51eT+n00rkVMQHa79bN8OVcjwNgMVff28c
         LVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MyuojJQmISzm+kAZZcPGhLWvLjaD5dpxnyC38KV9sCQ=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=AT/sOhh0J00Dh7CdONz2hs3VW2aFAYscN81BH34Rt62m5CPpXWCLeNNSnOk7Wk57Ij
         2YXNrWx0bSF1+QAaPmFrathBwCJb+Z+v9rFqdBT3ullmFyXs8c/TeWGcgEVFkigWsBTu
         2wr2Clm3Qj+O2FPKVlH4ur7UbE9X3Nq59f/OeqZ6VTYpwwZi0OXUTC9RA7b3Nfi7h/q2
         7lznT8NeUT+c8bN4Ifz6ZNe0ML/lrQ2zzyDeEowT2LR/tRYOgIrKxChSEOo5x/G7Oigu
         glb54Ij2f1ew0K2VcVuJwxFgcegpJTgs4n+WQx63nrL+upWzg21TJTrzdq9ejyA+ZP48
         gr4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1695e803si3882067f8f.357.2024.10.08.20.25.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdSg6Yt2z6LDCG;
	Wed,  9 Oct 2024 11:20:51 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 9CE32140447;
	Wed,  9 Oct 2024 11:25:10 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:24:51 +0200
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
Subject: [PATCH RFC V4 17/33] hw/arm/acpi: MADT Tbl change to size the guest with possible vCPUs
Date: Wed, 9 Oct 2024 04:17:59 +0100
Message-ID: <20241009031815.250096-18-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: pNAHbxkw5jMR

When QEMU builds the MADT table, modifications are needed to include information
about possible vCPUs that are exposed as ACPI-disabled (i.e., `_STA.Enabled=0`).
This new information will help the guest kernel pre-size its resources during
boot time. Pre-sizing based on possible vCPUs will facilitate the future
hot-plugging of the currently disabled vCPUs.

Additionally, this change addresses updates to the ACPI MADT GIC CPU interface
flags, as introduced in the UEFI ACPI 6.5 specification. These updates enable
deferred virtual CPU onlining in the guest kernel.

Link: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++------
 include/hw/acpi/cpu.h    | 18 ++++++++++++++++++
 2 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 32238170ab..ff104b3496 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -663,6 +663,29 @@ static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
     build_append_int_noprefix(table_data, size, 4); /* Discovery Range Length */
 }
 
+static uint32_t virt_acpi_get_gicc_flags(CPUState *cpu)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+
+    /* can only exist in 'enabled' state */
+    if (!mc->has_hotpluggable_cpus) {
+        return 1;
+    }
+
+    /*
+     * ARM GIC CPU Interface can be 'online-capable' or 'enabled' at boot
+     * We MUST set 'online-capable' bit for all hotpluggable CPUs except the
+     * first/boot CPU. Cold-booted CPUs without 'Id' can also be unplugged.
+     * Though as-of-now this is only used as a debugging feature.
+     *
+     *   UEFI ACPI Specification 6.5
+     *   Section: 5.2.12.14. GIC CPU Interface (GICC) Structure
+     *   Table:   5.37 GICC CPU Interface Flags
+     *   Link: https://uefi.org/specs/ACPI/6.5
+     */
+    return cpu && !cpu->cpu_index ? 1 : (1 << 3);
+}
+
 static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
@@ -689,12 +712,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, vms->gic_version, 1);
     build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+    for (i = 0; i < MACHINE(vms)->smp.max_cpus; i++) {
+        CPUState *cpu = qemu_get_possible_cpu(i);
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? ARCH_GIC_MAINT_IRQ : 0;
-        uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
-                                             VIRTUAL_PMU_IRQ : 0;
+        uint32_t pmu_interrupt = vms->pmu ? VIRTUAL_PMU_IRQ : 0;
+        uint32_t flags = virt_acpi_get_gicc_flags(cpu);
+        uint64_t mpidr = acpi_get_cpu_archid(i);
 
         if (vms->gic_version == VIRT_GIC_VERSION_2) {
             physical_base_address = memmap[VIRT_GIC_CPU].base;
@@ -709,7 +733,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
         build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
         /* Flags */
-        build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
+        build_append_int_noprefix(table_data, flags, 4);
         /* Parking Protocol Version */
         build_append_int_noprefix(table_data, 0, 4);
         /* Performance Interrupt GSIV */
@@ -723,7 +747,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, vgic_interrupt, 4);
         build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
         /* MPIDR */
-        build_append_int_noprefix(table_data, arm_cpu_mp_affinity(armcpu), 8);
+        build_append_int_noprefix(table_data, mpidr, 8);
         /* Processor Power Efficiency Class */
         build_append_int_noprefix(table_data, 0, 1);
         /* Reserved */
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 32654dc274..4d6ae5453f 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -75,4 +75,22 @@ extern const VMStateDescription vmstate_cpu_hotplug;
     VMSTATE_STRUCT(cpuhp, state, 1, \
                    vmstate_cpu_hotplug, CPUHotplugState)
 
+/**
+ * acpi_get_cpu_archid:
+ * @cpu_index: possible vCPU for which arch-id needs to be retreived
+ *
+ * Fetches the vCPU arch-id of the possible vCPU. This should be same
+ * same as the one configured at KVM Host.
+ *
+ * Returns: arch-id of the possible vCPU
+ */
+static inline uint64_t acpi_get_cpu_archid(int cpu_index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const CPUArchIdList *possible_cpus = ms->possible_cpus;
+
+    assert((cpu_index >= 0) && (cpu_index < possible_cpus->len));
+
+    return possible_cpus->cpus[cpu_index].arch_id;
+}
 #endif
-- 
2.34.1
