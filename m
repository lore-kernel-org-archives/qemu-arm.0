Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595160njl;
        Tue, 8 Oct 2024 20:21:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGscUYowOhc7HsPZe85LLfZzCw7e7grllpFRMH+G3z0GhzapNHpkWkwserzRNlwoevx/IrmLwVhxPHhw==@linaro.org
X-Google-Smtp-Source: AGHT+IH8A5fwZyqxG3K75v3Ikf7GLwWj/jX6aZNtg4W4ubVGwNmMxArNn7YLxoAnRW3NuoJtdQ03
X-Received: by 2002:a05:600c:870a:b0:42c:e0da:f132 with SMTP id 5b1f17b1804b1-430d748da57mr4964985e9.32.1728444077070;
        Tue, 08 Oct 2024 20:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444077; cv=none;
        d=google.com; s=arc-20240605;
        b=iT5mWM/tyv1Vt7MptXoZeQ/u5oKyOUIQpuFuxOSys+imnL0uBkxD+N7bB/DZAtHRUI
         kfZO+dmLWT0ROAjOiMRVgXm5dzo5Yk/dycaVhcAAseK/91HV0CQ0tXYqweNqU9HN6ZZW
         PRlsVI/KcmkC3gKhESf59a8Ix3Awon+WnDclQd5/fJ7lie08rpGsblYFNBsI2+077dsV
         o6Dg+xynix817GuYFhP/B2cxYCnvKbLGcNZk0vIULhjJHdcAPokJ0exAEzCg08gQuzXf
         uOpuJpy2noxXhdQ/qiwe7YVgZxo7pkh7OGKyczAdJJ5YZPpAWJ7lpN8wmJxjwDTejYRK
         /9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=r3sSu6XIu8QOtzcBR0so69Axin8l9PEvydS5pf0s6fQ=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=G7+wgaPafjm0MZMez8HP0C8f8lki0gkArnicjKNfK8hfAzT+rNn4ICKEc59BQk2pkm
         NLodCZwCJlkNbSJ7FWBVoDTQ4rEowOus/USpCYCnNMj4hLrejrT/V2Wa2mxG6FCMJ4AY
         s6ZQv4PahKwBiSeU9Y0xpuP0vYxlQBrPFmrTt7YedmlVNYO5y5RvQmiJRSTdgsIcW5BG
         fQEMrpY87HAzGJGASSa+EZwHbzrtnDdgvPo66sb0SsI4CQiM6PbBIttkknaSND3QLtS0
         xxEpBAsLbWlDhHRzSnnjbgsizN15MFmQA1vdYMlu0tDzqNtwr8VTPC6PfoecMr9QgrdC
         /Bdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1691b6a2si3925322f8f.256.2024.10.08.20.21.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdRg4d5Tz6J67Y;
	Wed,  9 Oct 2024 11:19:59 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 11A87140A34;
	Wed,  9 Oct 2024 11:21:16 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:20:56 +0200
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
Subject: [PATCH RFC V4 05/33] arm/virt,target/arm: Machine init time change common to vCPU {cold|hot}-plug
Date: Wed, 9 Oct 2024 04:17:47 +0100
Message-ID: <20241009031815.250096-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: Ti8ipNECSj/M

Introduce the common logic required during the initialization of both cold and
hot-plugged vCPUs. Additionally, initialize the *disabled* state of the vCPUs,
which will be used further during the initialization phases of various other
components like GIC, PMU, ACPI, etc., as part of the virtual machine
initialization.

Reported-by: Gavin Shan <gshan@redhat.com>
[GS: pointed the assertion due to wrong range check in cpu_pre_plug phase]
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 92 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h | 26 ++++++++++++
 target/arm/cpu.c      |  7 ++++
 target/arm/cpu64.c    | 14 +++++++
 4 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c01489a22d..3db4769289 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2828,6 +2828,26 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
     return socket_id % ms->numa_state->num_nodes;
 }
 
+static int
+virt_get_cpu_id_from_cpu_topo(const MachineState *ms, DeviceState *dev)
+{
+    int cpu_id, sock_vcpu_num, clus_vcpu_num, core_vcpu_num;
+    ARMCPU *cpu = ARM_CPU(dev);
+
+    /* calculate total logical cpus across socket/cluster/core */
+    sock_vcpu_num = cpu->socket_id * (ms->smp.threads * ms->smp.cores *
+                    ms->smp.clusters);
+    clus_vcpu_num = cpu->cluster_id * (ms->smp.threads * ms->smp.cores);
+    core_vcpu_num = cpu->core_id * ms->smp.threads;
+
+    /* get vcpu-id(logical cpu index) for this vcpu from this topology */
+    cpu_id = (sock_vcpu_num + clus_vcpu_num + core_vcpu_num) + cpu->thread_id;
+
+    assert(cpu_id >= 0 && cpu_id < ms->possible_cpus->len);
+
+    return cpu_id;
+}
+
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
@@ -2910,6 +2930,70 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                          dev, &error_abort);
 }
 
+static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                              Error **errp)
+{
+    MachineState *ms = MACHINE(hotplug_dev);
+    ARMCPU *cpu = ARM_CPU(dev);
+    CPUState *cs = CPU(dev);
+    CPUArchId *cpu_slot;
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
+    if ((cpu->core_id < 0) || (cpu->core_id >= ms->smp.cores)) {
+        error_setg(errp, "Invalid core-id %d specified, correct range 0:%u",
+                   cpu->core_id, ms->smp.cores - 1);
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
+    cpu_slot = virt_find_cpu_slot(cs);
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
+    CPUState *cs = CPU(dev);
+    CPUArchId *cpu_slot;
+
+    /* insert the cold/hot-plugged vcpu in the slot */
+    cpu_slot = virt_find_cpu_slot(cs);
+    cpu_slot->cpu = CPU(dev);
+
+    cs->disabled = false;
+}
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2917,6 +3001,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
@@ -2973,6 +3059,8 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         virt_memory_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_plug(hotplug_dev, dev, errp);
     }
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
@@ -3057,7 +3145,8 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     if (device_is_dynamic_sysbus(mc, dev) ||
         object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         return HOTPLUG_HANDLER(machine);
     }
     return NULL;
@@ -3161,6 +3250,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
+    mc->has_hotpluggable_cpus = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->pre_plug = virt_machine_device_pre_plug_cb;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 5300e8d2bc..446c574c0d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -246,4 +246,30 @@ static inline int virt_get_thread_id(const MachineState *ms, int cpu_index)
     return ms->possible_cpus->cpus[cpu_index].props.thread_id;
 }
 
+static inline CPUArchId *virt_find_cpu_slot(CPUState *cs)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    CPUArchId *cpu_slot;
+
+    assert(cs->cpu_index >= 0 && cs->cpu_index < ms->possible_cpus->len);
+
+    cpu_slot = &ms->possible_cpus->cpus[cs->cpu_index];
+
+    /*
+     * The slot ID refers to the index where a vCPU with a specific architecture
+     * ID (e.g., MPIDR or affinity) is plugged in. The slot ID is more closely
+     * related to the machine configuration, while the architecture ID is tied
+     * directly to the vCPU itself. Currently, the code assumes that the slot ID
+     * and architecture ID are the same, which can make the concept of a slot
+     * somewhat vague. However, it makes more sense to associate the
+     * hot-(un)plugging of vCPUs with a slot as a metaphor. This could represent
+     * the smallest granularity for vCPU hot-(un)plugging. That said, we cannot
+     * rule out the possibility of extending this concept to die or socket
+     * level hot-(un)plugging in the future, should the ARM specification allow
+     * for it.
+     */
+
+    return cpu_slot;
+}
+
 #endif /* QEMU_ARM_VIRT_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bda95366d1..3de0cb346b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2680,6 +2680,12 @@ static const TCGCPUOps arm_tcg_ops = {
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
@@ -2699,6 +2705,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = arm_cpu_has_work;
     cc->mmu_index = arm_cpu_mmu_index;
     cc->dump_state = arm_cpu_dump_state;
+    cc->get_arch_id = arm_cpu_get_arch_id;
     cc->set_pc = arm_cpu_set_pc;
     cc->get_pc = arm_cpu_get_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 262a1d6c0b..d36d3519df 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -784,6 +784,17 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
     }
 }
 
+static void aarch64_cpu_initfn(Object *obj)
+{
+    CPUState *cs = CPU(obj);
+
+    /*
+     * We start every ARM64 vCPU as a disabled, possible vCPU. It must be
+     * explicitly enabled.
+     */
+    cs->disabled = true;
+}
+
 static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
@@ -796,7 +807,9 @@ static const gchar *aarch64_gdb_arch_name(CPUState *cs)
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
+    dc->user_creatable = true;
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_core_xml_file = "aarch64-core.xml";
@@ -841,6 +854,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info)
 static const TypeInfo aarch64_cpu_type_info = {
     .name = TYPE_AARCH64_CPU,
     .parent = TYPE_ARM_CPU,
+    .instance_init = aarch64_cpu_initfn,
     .instance_finalize = aarch64_cpu_finalizefn,
     .abstract = true,
     .class_init = aarch64_cpu_class_init,
-- 
2.34.1
