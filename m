Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp453049lfm;
        Sat, 13 Jun 2020 14:52:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVP2Hlt2mDRCzhrEmZ/Xgd16vb2nHhqImFiq4pn53CJzjjaVaCks2Vs4CEWLg0+7LRdGzT
X-Received: by 2002:a25:8403:: with SMTP id u3mr32383470ybk.276.1592085162134;
        Sat, 13 Jun 2020 14:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592085162; cv=none;
        d=google.com; s=arc-20160816;
        b=yXshvpktIxwhoJdmPoQseEjebzxOCtPI9fkIERsXGFRXzEAUGhFIOE6RX8u6PLA5oK
         Y5Y7PkQfYASxcJ/NLQhtudEGX2owbEPhTZDIWrFKKkS7kLzv1cU1DbLEJNom/IZ8m118
         +rDzfmR+i3iVsZd2jfNd98dOVnhDQWDkI+DvsmfXq/pubn1QvhPt4bM45kIjmjSNqnJ1
         Kx/TiN+wnkSfH3FjrafbMUSp2pcdekzRt5zyyZdD60art+XtatgdyXuAqFUC8uV1sgZF
         SNfWbz4YJBAUPDMpDKhDBjkTTlAYUSBNyNdXss25YJtwu6+KB5/t2g8p454MGsiAgTUt
         isHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=uGwbBtC/w5mf5BplI5hlfrawQ+CT808J4j7aQw8w89w=;
        b=YrslwUqlB9X2yoLGGRTwLuNbh2jjfdvtGXxplcMdJ1CC8x7sglC6Ffmzgge7WVxKLm
         Gi51VKMur1n5bfDq4H2lG/t4R5cw8oy20zNjCrnndoK1Cxo4k7KdTLhtC4zA9bbqtFYr
         bTDnbw42IyUeEdcDKZUKY1lglAmVsiBISk0jzBiLrgGAtDUflSAzhN8b5CH0YSRRaxuT
         WNKJVcKlSAXF9bkF+rk6wL/MG3b57eR/c+HIAs7vBzJgPJEDQXIq3ZOVwGSwaxCgJ4o7
         lC6IL/pbSGcUzwaQzRUyjF2gMBlSpcmyl040HmWK1/RHfAlx4OoIzVUwIwPj2p1ilrX8
         lzMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si6819050ybp.143.2020.06.13.14.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkE4v-0001q4-DY
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyd-0007iD-Dg; Sat, 13 Jun 2020 17:46:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3710 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyb-0003UB-2p; Sat, 13 Jun 2020 17:46:11 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8C85E43C4B70648A5679;
 Sun, 14 Jun 2020 05:46:06 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:45:58 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 18/22] arm/cpuhp: Changes to update GIC with vcpu hot-plug
 notification
Date: Sat, 13 Jun 2020 22:36:25 +0100
Message-ID: <20200613213629.21984-19-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YJyZTnEJ+l+5

Adds the notification support about vcpu hot-(un)plug required to update the
GIC so that it can update its vcpu to GIC cpu interface association.

NOTE: This is using 'struct VirtMachineState' inside the notifier function.
      Question:  Not sure if it is right to use machine related data structure
      inside GIC related files? Its design looks to be pretty much abstracted
      from any machine related stuff. @Peter Maydell

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c                      | 12 +++++--
 hw/intc/arm_gicv3_common.c         | 54 ++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_cpuif.c          |  5 +++
 hw/intc/gicv3_internal.h           |  1 +
 include/hw/arm/virt.h              |  1 +
 include/hw/intc/arm_gicv3_common.h |  1 +
 6 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f0295e940e..b4cfd53a59 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1928,6 +1928,8 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vms);
 
+    notifier_list_init(&vms->cpuhp_notifiers);
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
@@ -2378,6 +2380,12 @@ out:
     error_propagate(errp, local_err);
 }
 
+static void virt_update_gic(VirtMachineState *vms, CPUState *cs)
+{
+    /* notify gic to stitch GICC to this new cpu */
+    notifier_list_notify(&vms->cpuhp_notifiers, cs);
+}
+
 static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp)
 {
@@ -2432,7 +2440,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     virt_cpu_set_properties(OBJECT(cs), cpu_slot);
 
     if (dev->hotplugged) {
-        /* TODO: update GIC about this hotplug change here */
+        virt_update_gic(vms, cs);
     }
 }
 
@@ -2506,7 +2514,7 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
 
     unwire_gic_cpu_irqs(vms, cs);
-    /* TODO: update the GIC about this hot unplug change */
+    virt_update_gic(vms, cs);
 
     /* TODO: unregister this cpu for reset & update F/W info for the next boot */
 
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index bfa514444a..f6b7b359cb 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -31,6 +31,7 @@
 #include "gicv3_internal.h"
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
+#include "hw/arm/virt.h"
 
 
 static void gicv3_gicd_no_migration_shift_bug_post_load(GICv3State *cs)
@@ -305,8 +306,57 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
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
+static void arm_gicv3_cpu_update_notifier(Notifier * notifier, void * data)
+{
+    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
+    GICv3State *s = ARM_GICV3_COMMON(vms->gic);
+    CPUState *cpu = (CPUState *)data;
+    int gic_cpuif_num;
+
+    /* this shall get us mapped gicv3 cpuif corresponding to mpidr */
+    gic_cpuif_num = arm_gicv3_get_proc_num(s, cpu);
+    if (gic_cpuif_num < 0) {
+        error_report("Failed to associate cpu %d with any GIC cpuif",
+                     cpu->cpu_index);
+        abort();
+    }
+
+    /* check if update is for vcpu hot-unplug */
+    if (qemu_present_cpu(cpu)) {
+        s->cpu[gic_cpuif_num].cpu = NULL;
+        return;
+    }
+
+    /* re-stitch the gic cpuif to this new cpu */
+    gicv3_set_gicv3state(cpu, &s->cpu[gic_cpuif_num]);
+    gicv3_set_cpustate(&s->cpu[gic_cpuif_num], cpu);
+
+    /* TODO: initialize the registers info for this newly added cpu */
+}
+
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
     GICv3State *s = ARM_GICV3_COMMON(dev);
     int i;
 
@@ -386,12 +436,16 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (i << 8) |
             (last << 4);
     }
+
+    s->cpu_update_notifier.notify = arm_gicv3_cpu_update_notifier;
+    notifier_list_add(&vms->cpuhp_notifiers, &s->cpu_update_notifier);
 }
 
 static void arm_gicv3_finalize(Object *obj)
 {
     GICv3State *s = ARM_GICV3_COMMON(obj);
 
+    notifier_remove(&s->cpu_update_notifier);
     g_free(s->redist_region_count);
 }
 
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 90d8b0118e..b3aa5979ca 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -20,6 +20,11 @@
 #include "hw/irq.h"
 #include "cpu.h"
 
+void gicv3_set_cpustate(GICv3CPUState *s, CPUState *cpu)
+{
+    s->cpu = cpu;
+}
+
 void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 05303a55c8..6e14a7a6cd 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -409,5 +409,6 @@ static inline void gicv3_cache_all_target_cpustates(GICv3State *s)
 }
 
 void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s);
+void gicv3_set_cpustate(GICv3CPUState *s, CPUState *cpu);
 
 #endif /* QEMU_ARM_GICV3_INTERNAL_H */
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e8468d8cf6..c287433219 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -158,6 +158,7 @@ typedef struct {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    NotifierList cpuhp_notifiers;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 31ec9a1ae4..b51f74c728 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -248,6 +248,7 @@ struct GICv3State {
     GICv3CPUState *gicd_irouter_target[GICV3_MAXIRQ];
     uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
 
+    Notifier cpu_update_notifier;
     GICv3CPUState *cpu;
 };
 
-- 
2.17.1


