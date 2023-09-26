Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp980278ejc;
        Tue, 26 Sep 2023 03:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+9nNfmtfpkqeC/HOuKLoSKqfekFrMt9OXHs11t5W+U3ueZqXiCGuOhPl0rGBzx5aoP0Ap
X-Received: by 2002:a7b:cc95:0:b0:405:3a63:6d12 with SMTP id p21-20020a7bcc95000000b004053a636d12mr8578530wma.17.1695722803122;
        Tue, 26 Sep 2023 03:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722803; cv=none;
        d=google.com; s=arc-20160816;
        b=eDfXlcM+ZHXwUNqXGuqHgxW+5U6bt3f6UXS7B4acXEcFyR3Af2yWaEWgKC919gLV0S
         bGGADO6Ofq6aiF8JfX39tQrIojVh6ICmDJkZ2p/WvR762PiUW3qYc1fCx1MOSPts5YXr
         ccaej3XvskudKQc/siItbGn9QDh28F8Sb7+g/YxZo4MByCw77FlZloKYrdW8d7nXWdq1
         VOf6I7OBRYJ4PWCQ9zdnd9bxs7E/5bpVQa4AL0oseDAowrnkoEbEIYGlLkHIxTD0scdF
         VyKdNFIE5dFW4DifmlGSZp9In0onI7tJc/pJ8ZOGNTtG/76KvwRvDCRrPL+83rDAhMT2
         YudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=A2+gmA6V7vrZks6nSMTqW0icIEvfQFPUal+BTJzMMEE=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=A1/gLtKmPHbD6zv2mwsMvRSdyFiGwmFyVy304qHTTsBlQwt8GaIvC/ovy0CQZaeNAy
         rsSJgQEsR8LRL4Gauit1I47oTMbrDb6Kamh5yxSSOR2Z33o2CuIgUjcUazcdYlE6dMzQ
         OwfU5ib2BSQoPBpFOsWX2Fs6zIG0qivq80brXekXOmrNPIarGAH1MmamGoCX65plZUJN
         KzcZbIg74qeS+kgIVmZfk8tlMDzWca6SDoLhvYWlp+RknHXsIdeWpE80iPM0w57Y2sq5
         pzqc+LWF7sT07NKvtqHAcremPy6qppXkQJoO03cnaKYDME6F7D5QTUHYXN96wrihvFou
         79dA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id q10-20020a05600000ca00b0031ff563cc36si5757081wrx.778.2023.09.26.03.06.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwNS0btXz6K8rH;
	Tue, 26 Sep 2023 18:05:28 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:06:24 +0100
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
Subject: [PATCH RFC V2 04/37] arm/virt,target/arm: Machine init time change common to vCPU {cold|hot}-plug
Date: Tue, 26 Sep 2023 11:04:03 +0100
Message-ID: <20230926100436.28284-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 3GdZ0b4qNsDT

Refactor and introduce the common logic required during the initialization of
both cold and hot plugged vCPUs. Also initialize the *disabled* state of the
vCPUs which shall be used further during init phases of various other components
like GIC, PMU, ACPI etc as part of the virt machine initialization.

KVM vCPUs corresponding to unplugged/yet-to-be-plugged QOM CPUs are kept in
powered-off state in the KVM Host and do not run the guest code. Plugged vCPUs
are also kept in powered-off state but vCPU threads exist and is kept sleeping.

TBD:
For the cold booted vCPUs, this change also exists in the arm_load_kernel()
in boot.c but for the hotplugged CPUs this change should still remain part of
the pre-plug phase. We are duplicating the powering-off of the cold booted CPUs.
Shall we remove the duplicate change from boot.c?

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Reported-by: Gavin Shan <gavin.shan@redhat.com>
[GS: pointed the assertion due to wrong range check]
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c      | 149 ++++++++++++++++++++++++++++++++++++++++-----
 target/arm/cpu.c   |   7 +++
 target/arm/cpu64.c |  14 +++++
 3 files changed, 156 insertions(+), 14 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0eb6bf5a18..3668ad27ec 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -221,6 +221,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static CPUArchId *virt_find_cpu_slot(MachineState *ms, int vcpuid);
 static int virt_get_socket_id(const MachineState *ms, int cpu_index);
 static int virt_get_cluster_id(const MachineState *ms, int cpu_index);
 static int virt_get_core_id(const MachineState *ms, int cpu_index);
@@ -2154,6 +2155,14 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    finalize_gic_version(vms);
+    if (tcg_enabled() || hvf_enabled() || qtest_enabled() ||
+        (vms->gic_version < VIRT_GIC_VERSION_3)) {
+        machine->smp.max_cpus = smp_cpus;
+        mc->has_hotpluggable_cpus = false;
+        warn_report("cpu hotplug feature has been disabled");
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -2180,11 +2189,6 @@ static void machvirt_init(MachineState *machine)
         virt_set_memmap(vms, pa_bits);
     }
 
-    /* We can probe only here because during property set
-     * KVM is not available yet
-     */
-    finalize_gic_version(vms);
-
     sysmem = vms->sysmem = get_system_memory();
 
     if (vms->secure) {
@@ -2289,17 +2293,9 @@ static void machvirt_init(MachineState *machine)
     assert(possible_cpus->len == max_cpus);
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
-        CPUState *cs;
-
-        if (n >= smp_cpus) {
-            break;
-        }
 
         cpuobj = object_new(possible_cpus->cpus[n].type);
 
-        cs = CPU(cpuobj);
-        cs->cpu_index = n;
-
         aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
         object_property_set_int(cpuobj, "socket-id",
                                 virt_get_socket_id(machine, n), NULL);
@@ -2804,6 +2800,50 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static CPUArchId *virt_find_cpu_slot(MachineState *ms, int vcpuid)
+{
+    VirtMachineState *vms = VIRT_MACHINE(ms);
+    CPUArchId *found_cpu;
+    uint64_t mp_affinity;
+
+    assert(vcpuid >= 0 && vcpuid < ms->possible_cpus->len);
+
+    /*
+     * RFC: Question:
+     * TBD: Should mp-affinity be treated as MPIDR?
+     */
+    mp_affinity = virt_cpu_mp_affinity(vms, vcpuid);
+    found_cpu = &ms->possible_cpus->cpus[vcpuid];
+
+    assert(found_cpu->arch_id == mp_affinity);
+
+    /*
+     * RFC: Question:
+     * Slot-id is the index where vCPU with certain arch-id(=mpidr/ap-affinity)
+     * is plugged. For Host KVM, MPIDR for vCPU is derived using vcpu-id.
+     * As I understand, MPIDR and vcpu-id are property of vCPU but slot-id is
+     * more related to machine? Current code assumes slot-id and vcpu-id are
+     * same i.e. meaning of slot is bit vague.
+     *
+     * Q1: Is there any requirement to clearly represent slot and dissociate it
+     *     from vcpu-id?
+     * Q2: Should we make MPIDR within host KVM user configurable?
+     *
+     *          +----+----+----+----+----+----+----+----+
+     * MPIDR    |||  Res  |   Aff2  |   Aff1  |  Aff0   |
+     *          +----+----+----+----+----+----+----+----+
+     *                     \         \         \   |    |
+     *                      \   8bit  \   8bit  \  |4bit|
+     *                       \<------->\<------->\ |<-->|
+     *                        \         \         \|    |
+     *          +----+----+----+----+----+----+----+----+
+     * VCPU-ID  |  Byte4  |  Byte2  |  Byte1  |  Byte0  |
+     *          +----+----+----+----+----+----+----+----+
+     */
+
+    return found_cpu;
+}
+
 static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
@@ -2847,6 +2887,81 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                          dev, &error_abort);
 }
 
+static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                              Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    MachineState *ms = MACHINE(hotplug_dev);
+    ARMCPU *cpu = ARM_CPU(dev);
+    CPUState *cs = CPU(dev);
+    CPUArchId *cpu_slot;
+    int32_t min_cpuid = 0;
+    int32_t max_cpuid;
+
+    /* sanity check the cpu */
+    if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
+        error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
+                   ms->cpu_type);
+        return;
+    }
+
+    if ((cpu->thread_id < 0) || (cpu->thread_id >= ms->smp.threads)) {
+        error_setg(errp, "Invalid thread-id %u specified, correct range 0:%u",
+                   cpu->thread_id, ms->smp.threads - 1);
+        return;
+    }
+
+    max_cpuid = ms->possible_cpus->len - 1;
+    if (!dev->hotplugged) {
+        min_cpuid = vms->acpi_dev ? ms->smp.cpus : 0;
+        max_cpuid = vms->acpi_dev ? max_cpuid : ms->smp.cpus - 1;
+    }
+
+    if ((cpu->core_id < min_cpuid) || (cpu->core_id > max_cpuid)) {
+        error_setg(errp, "Invalid core-id %d specified, correct range %d:%d",
+                   cpu->core_id, min_cpuid, max_cpuid);
+        return;
+    }
+
+    if ((cpu->cluster_id < 0) || (cpu->cluster_id >= ms->smp.clusters)) {
+        error_setg(errp, "Invalid cluster-id %u specified, correct range 0:%u",
+                   cpu->cluster_id, ms->smp.clusters - 1);
+        return;
+    }
+
+    if ((cpu->socket_id < 0) || (cpu->socket_id >= ms->smp.sockets)) {
+        error_setg(errp, "Invalid socket-id %u specified, correct range 0:%u",
+                   cpu->socket_id, ms->smp.sockets - 1);
+        return;
+    }
+
+    cs->cpu_index = virt_get_cpu_id_from_cpu_topo(ms, dev);
+
+    cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
+    if (qemu_present_cpu(CPU(cpu_slot->cpu))) {
+        error_setg(errp, "cpu(id%d=%d:%d:%d:%d) with arch-id %" PRIu64 " exist",
+                   cs->cpu_index, cpu->socket_id, cpu->cluster_id, cpu->core_id,
+                   cpu->thread_id, cpu_slot->arch_id);
+        return;
+    }
+    virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
+}
+
+static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                          Error **errp)
+{
+    MachineState *ms = MACHINE(hotplug_dev);
+    CPUState *cs = CPU(dev);
+    CPUArchId *cpu_slot;
+
+    /* insert the cold/hot-plugged vcpu in the slot */
+    cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
+    cpu_slot->cpu = OBJECT(dev);
+
+    cs->disabled = false;
+    return;
+}
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2888,6 +3003,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         object_property_set_str(OBJECT(dev), "reserved-regions[0]",
                                 resv_prop_str, errp);
         g_free(resv_prop_str);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_pre_plug(hotplug_dev, dev, errp);
     }
 }
 
@@ -2909,6 +3026,8 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         virt_memory_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_plug(hotplug_dev, dev, errp);
     }
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
@@ -2993,7 +3112,8 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     if (device_is_dynamic_sysbus(mc, dev) ||
         object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         return HOTPLUG_HANDLER(machine);
     }
     return NULL;
@@ -3070,6 +3190,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #endif
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
+    mc->has_hotpluggable_cpus = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->pre_plug = virt_machine_device_pre_plug_cb;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1376350416..3a2e7e64ee 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2332,6 +2332,12 @@ static const struct TCGCPUOps arm_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static int64_t arm_cpu_get_arch_id(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    return cpu->mp_affinity;
+}
+
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2350,6 +2356,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
+    cc->get_arch_id = arm_cpu_get_arch_id;
     cc->set_pc = arm_cpu_set_pc;
     cc->get_pc = arm_cpu_get_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 96158093cc..a660e3f483 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -739,6 +739,17 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
     }
 }
 
+static void aarch64_cpu_initfn(Object *obj)
+{
+    CPUState *cs = CPU(obj);
+
+    /*
+     * we start every ARM64 vcpu as disabled possible vCPU. It needs to be
+     * enabled explicitly
+     */
+    cs->disabled = true;
+}
+
 static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
@@ -751,7 +762,9 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
+    dc->user_creatable = true;
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 34;
@@ -800,6 +813,7 @@ static const TypeInfo aarch64_cpu_type_info = {
     .name = TYPE_AARCH64_CPU,
     .parent = TYPE_ARM_CPU,
     .instance_size = sizeof(ARMCPU),
+    .instance_init = aarch64_cpu_initfn,
     .instance_finalize = aarch64_cpu_finalizefn,
     .abstract = true,
     .class_size = sizeof(AArch64CPUClass),
-- 
2.34.1
