Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp98140ejr;
        Thu, 13 Jun 2024 16:43:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgv249jY4uCK/AHLb4LIrWJCG2yrQp/BWgmvPSJP7x10QZAdbfneyBwl9gyITfJr5ysWp9YGsRioAbYVbC+9fF+UthaRvf
X-Google-Smtp-Source: AGHT+IEVGVZjCEETCa0krocqONLjQOcQOT5MvjDM5Q5l6T4/m7WwqFjoZ5x3LA5eNpmvcTCOe5M8
X-Received: by 2002:a5d:510a:0:b0:35f:28e1:5028 with SMTP id ffacd0b85a97d-3607a738142mr648116f8f.15.1718322215490;
        Thu, 13 Jun 2024 16:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322215; cv=none;
        d=google.com; s=arc-20160816;
        b=JwuY1t4MPOddQ7vyZLM/CHd/NzQh1k7gM34kuiGVimMiW2PZWIPCUUVGdfuEzwsZlg
         IMJ9AjSaw+SDinbrlJcjd7QjYvPKplrAnxV8midoC0Ofl5WlA05KZHXA65P1ul1+eIcu
         o7HOOwwzwafbVwuA+4jIPmGHJvHnMpv2OqFHmVrTU0eF+pMSHeKvLW72fsJEFgfjSrqr
         H544J0oHj4qMaLNn8z7ETgJIKtUgGB3gfn9j91CGjKxWiF4WRf10CFclB3/fUuT55hA4
         jK8iWvoM9zgv4cmvyvf4xk9jEnIJW9eQGLYA3RMkIsGIHnHdJRdQHjsD8ADV+lzJ1oxl
         4oSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=0UEOWEDXdRRgPe7c0V3zEEcLFb5F/JKWL7SMoDumicw=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=TFaTuO2lcBtg4yFFCQ6aXLeVN9hho56jM/9KI6PPBMRj2i0E4GpiJu256VKQV771aR
         TULzvgAH7Pejvo4xWTh5ICL3Au6VlRWMGlUaguEAHAjnfIaOqVu56C9qhJsF9p1yvhWL
         zpyqFyHCRAD9QtU1ZVyuwJK8OemPBYXjj+uxutZSd8BnEREM5gg93z7AoFDnG9BBV+0Z
         tIKZrGGRA1Nf2OF52fY9Zwm06hU1zK6iV62asUgzLHdqvhMcyA5bGFCI68/IAM3I3hid
         j9b6R9ynYP2zcJBr+H94LDupV5N9249dYAieJDmfWWVTacvlFTja/7++JYMNCiK44RWe
         2WHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3607512fd10si1421957f8f.834.2024.06.13.16.43.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f8L60scz67MmR;
	Fri, 14 Jun 2024 07:42:10 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D7F414065C;
	Fri, 14 Jun 2024 07:43:34 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:43:11 +0100
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
Subject: [PATCH RFC V3 15/29] hw/arm: MADT Tbl change to size the guest with possible vCPUs
Date: Fri, 14 Jun 2024 00:36:25 +0100
Message-ID: <20240613233639.202896-16-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 7A7cOZwoJnY3

Changes are required during the building of the MADT table by QEMU to
accommodate disabled possible vCPUs. This information will be used by the guest
kernel to size up its resources during boot time. The pre-sizing of the guest
kernel based on possible vCPUs will facilitate the hotplug of the disabled
vCPUs.

This change also addresses ACPI MADT GIC CPU interface flag-related changes
recently introduced in the UEFI ACPI 6.5 specification, which allows deferred
virtual CPU online'ing in the guest kernel.

Link: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2d44567df5..4b4906f407 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -657,6 +657,29 @@ static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
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
@@ -683,12 +706,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+        uint64_t mpidr = qemu_get_cpu_archid(i);
 
         if (vms->gic_version == VIRT_GIC_VERSION_2) {
             physical_base_address = memmap[VIRT_GIC_CPU].base;
@@ -703,7 +727,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
         build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
         /* Flags */
-        build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
+        build_append_int_noprefix(table_data, flags, 4);
         /* Parking Protocol Version */
         build_append_int_noprefix(table_data, 0, 4);
         /* Performance Interrupt GSIV */
@@ -717,7 +741,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, vgic_interrupt, 4);
         build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
         /* MPIDR */
-        build_append_int_noprefix(table_data, arm_cpu_mp_affinity(armcpu), 8);
+        build_append_int_noprefix(table_data, mpidr, 8);
         /* Processor Power Efficiency Class */
         build_append_int_noprefix(table_data, 0, 1);
         /* Reserved */
-- 
2.34.1
