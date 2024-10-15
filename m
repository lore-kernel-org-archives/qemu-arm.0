Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2340127njb;
        Tue, 15 Oct 2024 03:07:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTU7JQmXJLEWfpgcVWFeaU7JB8GXTpdjdHsfMJ8s5pFmcpQqSP0yioew7ffyEzCveT0xXr+kIhZa86EQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEdRR/d4qFqItx1U+K8N4q0bLmVFehoA67HYSzuluwg/hk/3exSHYnfV9KA+31fWUgV3AC5
X-Received: by 2002:a05:6000:cf:b0:37d:5133:8cba with SMTP id ffacd0b85a97d-37d55204527mr9909544f8f.20.1728986864664;
        Tue, 15 Oct 2024 03:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986864; cv=none;
        d=google.com; s=arc-20240605;
        b=g26seRl9J20dfgeOEMUpsAGvfDrp8MwNViaX9tmTMlmSmKqS4lbqbdceH6t8x/Tbu+
         VkGpAHVrChi2SIUHZzpBlBXzsp4jlKbM21uxuDhHFBuKTdVFxvPf0AHjvsQxShCpD7YW
         0WulAqXsR1rqrHH2PhBaoXa7GDFcS9jZ6BwtX2jWC9Di/NJMVTxuXw05tSl/0UA1sVpP
         u6EvvL3TEo9/gidjXxViz8e79C/g2u5Z5LGhHquXZmP5YAObBRV4uSSQjJ7X2Ixn7+z4
         vDR/zhPEyQopqMdPyKAYAgMr8Y54+WcdCn9XOCRHkkJwMOQ5rwhxvnz6Sftce3gt+dyk
         crFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=cfzfDLLf9xiYRqICfIYhaTgYVk2WIGmOhalHqhYtblM=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=PNgQxEvzsZa1vH7I3g6Aw+VLKTMbEP0E6CZxtLBJ6O76eiXQpmNlvI3Gdqq8ybEmJV
         VHzHeW/ITZ0CLf8Z/I9aDaL/l2hhC4Bp3U0JV4ak1j1oz060EC/9dZ9Wm+rjbDhEWtKH
         UMTIFTeJk9vDR19PFYsXFE2qGRyTRiI5IdHkA3KD9d1Dpq4MlqH3n6yvWY6L7gbEQDdf
         xh1WBjFY12CHx7H9Fn43OMrpw8kT9xZK+NY30hLSvca3k9BAbbMpXbFXbqPgOTkX83MB
         rsrzr+mPnhQfh6Hqn7DSPYaYE4WSgrci4LJOJ+Cvpl0hdjfVXoQVXd84e85jiVg8g3wH
         Ja4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fcb5a8bsi528438f8f.528.2024.10.15.03.07.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV5r1Mr9z6DB5T;
	Tue, 15 Oct 2024 18:02:56 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 853B21404F5;
	Tue, 15 Oct 2024 18:07:24 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:07:04 +0200
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
Subject: [PATCH RFC V5 19/30] hw/arm,gicv3: Changes to notify GICv3 CPU state with vCPU hot-(un)plug event
Date: Tue, 15 Oct 2024 11:00:01 +0100
Message-ID: <20241015100012.254223-20-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 6m+mJt5jNA4S

Virtual CPU hot-(un)plug events must be communicated to the GIC. Introduce a
notification mechanism to ensure these events are properly relayed to the GIC,
allowing it to update the accessibility of the GIC CPU interface and adjust the
vCPU-to-GIC CPU interface association accordingly.

This approach deviates from the standard ARM CPU architecture specification,
where the CPU-to-GIC interface is typically fixed and the accessibility of the
GIC CPU interface cannot be disabled. However, this workaround is necessary
to address limitations imposed by the ARM CPU architecture [1][2].

For more details regarding these constraints and the workarounds, please refer
to the slides below:

References:
[1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
    architectures that don’t Support CPU Hotplug (like ARM64)
    Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
    (Slides 13,17,18)
[2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
    SoC Based Systems (like ARM64)
    Link: https://kvmforum2020.sched.com/event/eE4m

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c                      | 31 ++++++++++++++-
 hw/intc/arm_gicv3_common.c         | 60 +++++++++++++++++++++++++++++-
 include/hw/arm/virt.h              |  1 +
 include/hw/intc/arm_gicv3_common.h | 23 ++++++++++++
 4 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0a912919ec..295012bce1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -703,6 +703,16 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     return dev;
 }
 
+static void virt_add_gic_cpuhp_notifier(VirtMachineState *vms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
+
+    if (mc->has_hotpluggable_cpus) {
+        Notifier *cpuhp_notifier = gicv3_cpuhp_notifier(vms->gic);
+        notifier_list_add(&vms->cpuhp_notifiers, cpuhp_notifier);
+    }
+}
+
 static void create_its(VirtMachineState *vms)
 {
     const char *itsclass = its_class_name();
@@ -979,6 +989,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
         create_v2m(vms);
     }
+
+    /* add GIC CPU hot(un)plug update notifier */
+    virt_add_gic_cpuhp_notifier(vms);
 }
 
 static void create_uart(const VirtMachineState *vms, int uart,
@@ -2450,6 +2463,8 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vms);
 
+    notifier_list_init(&vms->cpuhp_notifiers);
+
     assert(possible_cpus->len == max_cpus);
     for (n = 0; n < possible_cpus->len; n++) {
         CPUArchId *cpu_slot;
@@ -3066,6 +3081,18 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                          dev, &error_abort);
 }
 
+static void virt_update_gic(VirtMachineState *vms, CPUState *cs, bool plugging)
+{
+    GICv3CPUHotplugInfo gic_info = {
+        .gic = vms->gic,
+        .cpu = cs,
+        .cpu_plugging = plugging
+    };
+
+    /* notify gic to stitch GICC to this new cpu */
+    notifier_list_notify(&vms->cpuhp_notifiers, &gic_info);
+}
+
 static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp)
 {
@@ -3142,7 +3169,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      * `machvirt_init()`.
      */
     if (vms->acpi_dev) {
-        /* TODO: update GIC about this hotplug change here */
+        virt_update_gic(vms, cs, true);
         wire_gic_cpu_irqs(vms, cs);
     }
 }
@@ -3227,7 +3254,7 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
 
     unwire_gic_cpu_irqs(vms, cs);
-    /* TODO: update the GIC about this hot unplug change */
+    virt_update_gic(vms, cs, false);
 
     /* TODO: unregister cpu for reset & update F/W info for the next boot */
 
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 218ced1d9f..c21fff4903 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -33,7 +33,6 @@
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
 
-
 static void gicv3_gicd_no_migration_shift_bug_post_load(GICv3State *cs)
 {
     if (cs->gicd_no_migration_shift_bug) {
@@ -366,6 +365,62 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
     }
 }
 
+static int arm_gicv3_get_proc_num(GICv3State *s, CPUState *cpu)
+{
+    uint64_t mp_affinity;
+    uint64_t gicr_typer;
+    uint64_t cpu_affid;
+    int i;
+
+    mp_affinity = object_property_get_uint(OBJECT(cpu), "mp-affinity", NULL);
+    /* match the cpu mp-affinity to get the gic cpuif number */
+    for (i = 0; i < s->num_cpu; i++) {
+        gicr_typer = s->cpu[i].gicr_typer;
+        cpu_affid = (gicr_typer >> 32) & 0xFFFFFF;
+        if (cpu_affid == mp_affinity) {
+            return i;
+        }
+    }
+
+    return -1;
+}
+
+static void arm_gicv3_cpu_update_notifier(Notifier *notifier, void * data)
+{
+    GICv3CPUHotplugInfo *gic_info = (GICv3CPUHotplugInfo *)data;
+    CPUState *cpu = gic_info->cpu;
+    ARMGICv3CommonClass *agcc;
+    int gic_cpuif_num;
+    GICv3State *s;
+
+    s = ARM_GICV3_COMMON(gic_info->gic);
+    agcc = ARM_GICV3_COMMON_GET_CLASS(s);
+
+    /* this shall get us mapped GICv3 CPU interface corresponding to MPIDR */
+    gic_cpuif_num = arm_gicv3_get_proc_num(s, cpu);
+    if (gic_cpuif_num < 0) {
+        error_report("Failed to associate cpu %d with any GIC cpuif",
+                     cpu->cpu_index);
+        abort();
+    }
+
+    /* Update the GICv3 CPU interface accessibiltiy accordingly */
+    gicv3_set_cpustate(&s->cpu[gic_cpuif_num], cpu, gic_info->cpu_plugging);
+
+    if (!gic_info->cpu_plugging) {
+        return;
+    }
+
+    /* re-stitch the GICv3 CPU interface to this new vCPU */
+    gicv3_set_gicv3state(cpu, &s->cpu[gic_cpuif_num]);
+
+    /*
+     * define and register the GICv3 CPU interface `system registers` for
+     * this new vCPU being hotplugged
+     */
+    agcc->init_cpu_reginfo(cpu);
+}
+
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
@@ -492,6 +547,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         s->cpu[cpuidx - 1].gicr_typer |= GICR_TYPER_LAST;
     }
 
+    s->cpu_update_notifier.notify = arm_gicv3_cpu_update_notifier;
+
     s->itslist = g_ptr_array_new();
 }
 
@@ -499,6 +556,7 @@ static void arm_gicv3_finalize(Object *obj)
 {
     GICv3State *s = ARM_GICV3_COMMON(obj);
 
+    notifier_remove(&s->cpu_update_notifier);
     g_free(s->redist_region_count);
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 98ce68eae1..0202f0252c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -186,6 +186,7 @@ struct VirtMachineState {
     char *oem_id;
     char *oem_table_id;
     bool ns_el2_virt_timer_irq;
+    NotifierList cpuhp_notifiers;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 3f585162f3..c02a810da9 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -295,6 +295,7 @@ struct GICv3State {
     GICv3CPUState *gicd_irouter_target[GICV3_MAXIRQ];
     uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
 
+    Notifier cpu_update_notifier;
     GICv3CPUState *cpu;
     /* List of all ITSes connected to this GIC */
     GPtrArray *itslist;
@@ -345,6 +346,28 @@ struct ARMGICv3CommonClass {
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
                               const MemoryRegionOps *ops);
+/**
+ * Structure used by GICv3 CPU hotplug notifier
+ */
+typedef struct GICv3CPUHotplugInfo {
+    DeviceState *gic; /* GICv3State */
+    CPUState *cpu;
+    bool cpu_plugging; /* CPU being plugged or unplugged */
+} GICv3CPUHotplugInfo;
+
+/**
+ * gicv3_cpuhp_notifier
+ *
+ * Returns CPU hotplug notifier which could be used to update GIC about any
+ * CPU hot(un)plug events.
+ *
+ * Returns: Notifier initialized with CPU Hot(un)plug update function
+ */
+static inline Notifier *gicv3_cpuhp_notifier(DeviceState *dev)
+{
+    GICv3State *s = ARM_GICV3_COMMON(dev);
+    return &s->cpu_update_notifier;
+}
 
 /**
  * gicv3_class_name
-- 
2.34.1
