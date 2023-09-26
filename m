Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp983224ejc;
        Tue, 26 Sep 2023 03:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgF7jOvTZpGfu8Sn31I10uXYqnFnzdQ2CQ9eNMpLkA9la6s3Q3YBH8xriJl4MqNkvzVIrB
X-Received: by 2002:adf:e910:0:b0:313:e391:e492 with SMTP id f16-20020adfe910000000b00313e391e492mr1719385wrm.17.1695723118347;
        Tue, 26 Sep 2023 03:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723118; cv=none;
        d=google.com; s=arc-20160816;
        b=LjcE+f4GcjkpJGsQ9zXc2aQAROv0XfIB4Ntx4T2GSnQ5+6bpjtdCxGuctPtytAJtjE
         idLhmhlJ9WUGIgsgGMXQELTvEIqsg7omlHWHVd38hJVqP6aL6BqascN5WFrWazv2Jbif
         QRIdx6sxL5LBj1YE7mSSoHG2s8CJqBeuZpGeVJyqIdpMhrXwILLbcHChxNs+U1PeVkgm
         bkYhveAT6WDv/LGJOaXNy9d8lNhW51nDxqGITkLLdobu5D8VieXzKOA5r5d1qrAd2XNB
         A8Ir0ibkn56rYbfVcp1n89O4nhBY8q28YvW3vUkqjQ0zLmnS0ZRQ2Pw7VBKoTuxhGVDa
         4RwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=JMT9lxlIr8U30jFpvH3VF5x0qdUrmqShBqK46ub2/3k=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=eXzjuoKJB1F+ePjtH+QmPGAaIm/o72fuZDvM7w2/nV6QlpUlzT5G5cQxr7rEqundgk
         URxwrZDxtZEAixajfzG/O0QIZnHaHazgvdSmq+aCMa0wxbpKfFvLx+q09qmbxqbHVTfQ
         Dux4gXqxbU0dv60+vnWdtKzjklH7xrRmdxNbX2OOxpf7otEdxvE4SgR/OcY7FwIBInhk
         TegJo/OM5hkBsPuZRC0g/Nba5MvRap9W6S6mkYDSFFIUuqU8xMTvQmAYfDEMeBrYrFaU
         AyUAFz1TobvgMUmetGxkoa/NFKchpPIUd6Sf8HlliWu+M2dcwdaxuC2m0WPjTIKVcx/q
         LP6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i6-20020adfe486000000b003232a412f87si1978225wrm.36.2023.09.26.03.11.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwTF2Ccyz6D979;
	Tue, 26 Sep 2023 18:09:37 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:11:39 +0100
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
Subject: [PATCH RFC V2 21/37] hw/arm: MADT Tbl change to size the guest with possible vCPUs
Date: Tue, 26 Sep 2023 11:04:20 +0100
Message-ID: <20230926100436.28284-22-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: UlqIGg/uLJj9

Changes required during building of MADT Table by QEMU to accomodate disabled
possible vCPUs. This info shall be used by the guest kernel to size up its
resources during boot time. This pre-sizing of the guest kernel done on
possible vCPUs will facilitate hotplug of the disabled vCPUs.

This change also caters ACPI MADT GIC CPU Interface flag related changes
recently introduced in the UEFI ACPI 6.5 Specification which allows deferred
virtual CPU online'ing in the Guest Kernel.

Link: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d27df5030e..cbccd2ca2d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -700,6 +700,29 @@ static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
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
+     * We MUST set 'online-capable' Bit for all hotpluggable CPUs except the
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
@@ -726,12 +749,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, vms->gic_version, 1);
     build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+    for (i = 0; i < MACHINE(vms)->smp.max_cpus; i++) {
+        CPUState *cpu = qemu_get_possible_cpu(i);
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
-        uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
-                                             PPI(VIRTUAL_PMU_IRQ) : 0;
+        uint32_t pmu_interrupt = vms->pmu ? PPI(VIRTUAL_PMU_IRQ) : 0;
+        uint32_t flags = virt_acpi_get_gicc_flags(cpu);
+        uint64_t mpidr = qemu_get_cpu_archid(i);
 
         if (vms->gic_version == VIRT_GIC_VERSION_2) {
             physical_base_address = memmap[VIRT_GIC_CPU].base;
@@ -746,7 +770,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
         build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
         /* Flags */
-        build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
+        build_append_int_noprefix(table_data, flags, 4);
         /* Parking Protocol Version */
         build_append_int_noprefix(table_data, 0, 4);
         /* Performance Interrupt GSIV */
@@ -760,7 +784,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, vgic_interrupt, 4);
         build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
         /* MPIDR */
-        build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
+        build_append_int_noprefix(table_data, mpidr, 8);
         /* Processor Power Efficiency Class */
         build_append_int_noprefix(table_data, 0, 1);
         /* Reserved */
-- 
2.34.1
