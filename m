Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2339226njb;
        Tue, 15 Oct 2024 03:06:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlZ/+M5u82aEva1cH+DWZU6DHqZZahNZTw0Ial0BSMSPiv2ys1NDZGf8UJVQGK+DrHVX7sMJi58dhe8g==@linaro.org
X-Google-Smtp-Source: AGHT+IEshtOqZXn1emVqfdNQxFPPzymEIMY08VkTwtLZpPwxkl9qAfTD/Wqu2PzhkfNMoZ9cV3lL
X-Received: by 2002:adf:f84e:0:b0:37d:3735:8fe9 with SMTP id ffacd0b85a97d-37d551d53cfmr10323590f8f.27.1728986765762;
        Tue, 15 Oct 2024 03:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986765; cv=none;
        d=google.com; s=arc-20240605;
        b=LgjhNnvak6LGZ1rFBUTDZ4g5v3a7yaubVk63yjd8YZZXTqXjp0Mp+01vGBT32+9u09
         TvSTzf/GhLNhA4L8aI/0F1Gj9mwkPx8Q/063Yt86YEj5U4B7wBS6wE9Miu0cNNdBZWZt
         9sQ/oTaNOLDWPO/R3TzuIPHG12zXRBZ7r/t721d8r69dX8WdbkiTunH3EKc7m1J0t1BI
         dlQEgmyJ5yZ8AhKQt6p24jsDm5UM6iOnWCNCjzmLoG+A4WViFyfQRZV/MwmHaRJDOTdW
         jf6DA8jJGfQZveY6OzhSUfTMpx3YsVCgOO/wjQFg7D2aAo1X8k0XeSQhrEfrYnftLdCs
         hPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=2iEdWYHhMXNeq0WtMjLtROqrDM5oN/5U94NE8jtz+JQ=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=iBDg2uquZIphhNWWdokmwscGk85gG3k/ZK4E0pyu2OT0c20NJY5VdVb5RBtJcHmA0n
         YHphQyZHQYWYDT1Rsto8xg43vLLQ5vxlE+bei3gxeSJAlTHHHuuGyCrPSLugB22NGTvt
         0TYvuSOqm2s0s6Rr44tPoMmd2wsF+YTouoxvRGhU7eVbEOvtvv5GuukPgOecKYhN1Tqy
         OMj6hcEVUu1iP76/OHbGANkXBUV1UFukpnYx0Gf65nCSJXJNgwsMiaZWiu9kc9UCyzza
         3/QMhqs7xSO7KVgwXhIFzA2qoE3A2NF+BFYNoQ2kls87GKRYRlAr4uRly8TaKZKBzb67
         ODXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fc9ed59si522092f8f.469.2024.10.15.03.06.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:06:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV7b2GYpz6FH29;
	Tue, 15 Oct 2024 18:04:27 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 83382140451;
	Tue, 15 Oct 2024 18:06:04 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:05:44 +0200
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
Subject: [PATCH RFC V5 15/30] hw/arm/acpi: MADT Tbl change to size the guest with possible vCPUs
Date: Tue, 15 Oct 2024 10:59:57 +0100
Message-ID: <20241015100012.254223-16-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: i0+nHejyT+A1

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
 include/hw/acpi/cpu.h    | 19 +++++++++++++++++++
 2 files changed, 49 insertions(+), 6 deletions(-)

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
index bd3f9973c9..c688bb2141 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -96,4 +96,23 @@ static inline bool acpi_persistent_cpu(CPUState *cpu)
      */
     return cpu && cpu->acpi_persistent;
 }
+
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
