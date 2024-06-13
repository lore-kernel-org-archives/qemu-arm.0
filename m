Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97032ejr;
        Thu, 13 Jun 2024 16:39:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrfkIaJTs06KgMyROCyTXZqQFQiuKpNtP9k2evqplLpnHib/sDJwzorT+OoUPyq90mY6EmLJpkLfvsH+sR9W4YwsouKkMJ
X-Google-Smtp-Source: AGHT+IHLpLZbcStMEvfox8qPJ9kDNoyCmy7B3fri0Z7tiex99t5huQ/3pe+KZfy0o9BDcqcM9UnU
X-Received: by 2002:a05:600c:350b:b0:421:83fd:9022 with SMTP id 5b1f17b1804b1-4230484eec3mr9926505e9.31.1718321989079;
        Thu, 13 Jun 2024 16:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718321989; cv=none;
        d=google.com; s=arc-20160816;
        b=Xw9XQV7p1Uavqf53d1KrhZy5kvNH4RYVouCzLKRgnK6DHmULGzZoNyTrLddxYWgjlM
         j6Aw2ZYSny7UniGuuRhDPwfGNv6dBOM+5TaRKEsCABG84PWbey5FkFVCHmMDeshrT3cJ
         4tzQ4dVgnpYElBjXUHD0MgMTSij2msIk4rBdk07fFIr74+7hVUX0SC/MFQmKl0OWKhSH
         KsuSFg45nxwmiCjNcY7g7mTjuDN7OLfcdVi3q71jrM1vBIsiGGRYVffh4XHV2GJdEBFS
         TP/KQ/mSRqBjvZPC6Z2Qv+n0XoDBq4bNimr1TmTVy17WZlxw1+/RgSclzQh95lPlGFZR
         96Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=OuAc7gPDb9j9AAW9MX/zRRYP4FVz3MMLXg8xrjKi47U=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=z1O4fqsj2mC+uvmXG+x/sgl6SnrvzXJ9y5jcyBBPTnu2ktaOt8wm1fK1H9ocibHMcM
         Zm3ISfFML3pWDscPvFgesIUHSJUzXq0UrBGPV+YTMri8sFD4AwJxh8bSosQKcst9aea0
         iWMYF1Qqtw12QJmHiaQIXExZB1YQa37JfvKk9gClFEpJE16X3aAS8V3o4RrjIZoIxgWC
         EprCWr/WUFelAPa/MJCBinXLssibFntUl/THiuzJAbdR4sEsa9y8oXPKodTwrNJfMYcp
         SxCUb5UmhXKXLSw1o5x3G7Fu8tSbw+ZKfu+oLHS9SuMNvVGHZUbokujqK2GOXpXezKtI
         W1NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42286eef6c9si28578075e9.24.2024.06.13.16.39.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f402bDPz6H7Gh;
	Fri, 14 Jun 2024 07:38:24 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id CB992140AE5;
	Fri, 14 Jun 2024 07:39:47 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:39:25 +0100
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
Subject: [PATCH RFC V3 05/29] arm/virt,target/arm: Machine init time change common to vCPU {cold|hot}-plug
Date: Fri, 14 Jun 2024 00:36:15 +0100
Message-ID: <20240613233639.202896-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: hVSadcPwhsXz

Introduce the common logic required during the initialization of both cold and
hot-plugged vCPUs. Additionally, initialize the *disabled* state of the vCPUs,
which will be used further during the initialization phases of various other
components like GIC, PMU, ACPI, etc., as part of the virtual machine
initialization.

KVM vCPUs corresponding to unplugged or yet-to-be-plugged QOM CPUs are kept in a
powered-off state in the KVM Host and do not run the guest code. Plugged vCPUs
are also kept in a powered-off state, but vCPU threads exist and remain in a
sleeping state.

TBD:
For cold-booted vCPUs, this change also exists in the `arm_load_kernel()`
function in `boot.c`. However, for hot-plugged CPUs, this change should remain
part of the pre-plug phase. We are duplicating the powering-off of the
cold-booted CPUs. Should we remove the duplicate change from `boot.c`?

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reported-by: Gavin Shan <gshan@redhat.com>
[GS: pointed the assertion due to wrong range check]
---
 hw/arm/virt.c      | 94 +++++++++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c   |  7 ++++
 target/arm/cpu64.c | 14 +++++++
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2e0ec7d869..a285139165 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2817,6 +2817,26 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
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
@@ -2899,6 +2919,72 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
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
+    cpu_slot->cpu = CPU(dev);
+
+    cs->disabled = false;
+    return;
+}
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2906,6 +2992,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
@@ -2962,6 +3050,8 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         virt_memory_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_plug(hotplug_dev, dev, errp);
     }
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
@@ -3046,7 +3136,8 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     if (device_is_dynamic_sysbus(mc, dev) ||
         object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         return HOTPLUG_HANDLER(machine);
     }
     return NULL;
@@ -3150,6 +3241,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
+    mc->has_hotpluggable_cpus = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->pre_plug = virt_machine_device_pre_plug_cb;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index abc4ed0842..c92162fa97 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2639,6 +2639,12 @@ static const TCGCPUOps arm_tcg_ops = {
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
@@ -2658,6 +2664,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = arm_cpu_has_work;
     cc->mmu_index = arm_cpu_mmu_index;
     cc->dump_state = arm_cpu_dump_state;
+    cc->get_arch_id = arm_cpu_get_arch_id;
     cc->set_pc = arm_cpu_set_pc;
     cc->get_pc = arm_cpu_get_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c15d086049..d6b48b3424 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -780,6 +780,17 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
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
@@ -792,7 +803,9 @@ static const gchar *aarch64_gdb_arch_name(CPUState *cs)
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
+    dc->user_creatable = true;
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_core_xml_file = "aarch64-core.xml";
@@ -837,6 +850,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info)
 static const TypeInfo aarch64_cpu_type_info = {
     .name = TYPE_AARCH64_CPU,
     .parent = TYPE_ARM_CPU,
+    .instance_init = aarch64_cpu_initfn,
     .instance_finalize = aarch64_cpu_finalizefn,
     .abstract = true,
     .class_init = aarch64_cpu_class_init,
-- 
2.34.1
