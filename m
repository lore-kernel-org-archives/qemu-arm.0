Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97279ejr;
        Thu, 13 Jun 2024 16:40:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUI3mZ2/xDhQ4cIlScfLzUcUByuXuNRV/F7ImkH0e3Ge50ixja7kQeVVCjNU1D9vpOVTw7c1ZQ0tMxyCnLoog0kE3uowCd
X-Google-Smtp-Source: AGHT+IFyh3gUvclIt3BJH3NSvXfqfUbHKFzeF+QRbLRekc48IPi3vDT2d24wpMjeWgtH2pv3t4YU
X-Received: by 2002:a05:6000:1f8d:b0:35f:d57:a698 with SMTP id ffacd0b85a97d-3607a7623camr1090394f8f.31.1718322036695;
        Thu, 13 Jun 2024 16:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322036; cv=none;
        d=google.com; s=arc-20160816;
        b=BEjAjzKd3Yz/uPBWXNeNRoeq2NgighajG6aZWsCKIwV9tl6OYu+Esw58vb+txZKLXQ
         1kx+Ia7M2LOgak2gp6zKncIqDepUBZjATiaDo4o1at6rRsG/uhkEgXu+FdiBYwlGBFl/
         AuUOjljB/SsxXkZGzjl/WHg4WJdTkJoblFEFUey9cc289eS6gazH6W8QdjrxVqqxKIdT
         GST29Bxn4RHKpr168Li+WER4scgFm4pf7s2Tk/h2r6oxqvVTuqfZ1tyobibncUY+pnfW
         7IPBQrOsz/tVu9nbEXXGF48Vzv/VTjBIlgDy4OtD4iPJ9gcKju1RVkLc8xuSBqw+tL6K
         P8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vfny4BWpA617HpIurGlSvAcUkn0onIPe+oZW7c0rjd8=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=q9kITVuL3K3NhGsdIAKVGTCUeuHqqRRDqKYxZCButBmZCcHSV70Br5fq2/4z/8TpY9
         PswXwsPPFe0ZZkU2cs5PA/K9qEipSmKkHklSFMhGbnT5JenbDxbVnp7aCOzRNxq4zwbu
         nrFCLBWlaPugveK+XO9vbKrNXkbzTFuEK/REn2ICZCiAoUF+UOhEGLau+i1D3jZf5+ON
         lCphQHq/JqtnUKFn6oTWSmHRsn5fb3MFsCA+FHUYZZZetnftxz4HRDmAhOnTpzKlES6A
         WunrUNFbAeVZmwV+8OlsUML7/HBKSwnwhhWE7ybKkn12b16eT/HLWIJPQ8IPKNdqpBkA
         c79w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36075138874si1420113f8f.995.2024.06.13.16.40.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f1524dLz6HJTP;
	Fri, 14 Jun 2024 07:35:53 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 95E051400D9;
	Fri, 14 Jun 2024 07:40:35 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:40:10 +0100
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
Subject: [PATCH RFC V3 07/29] arm/virt,gicv3: Changes to pre-size GIC with possible vcpus @machine init
Date: Fri, 14 Jun 2024 00:36:17 +0100
Message-ID: <20240613233639.202896-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: gi0037HciFSY

The GIC needs to be pre-sized with possible vCPUs at initialization time. This
is necessary because memory regions and resources associated with GICC/GICR,
etc., cannot be changed (added, deleted, or modified) after the VM has been
initialized. Additionally, `GIC_TYPER` needs to be initialized with
`mp_affinity` and CPU interface number association, which cannot be changed
after the GIC has been initialized.

Once all the CPU interfaces of the GIC have been initialized, it must be ensured
that any updates to the GICC during reset only take place for the *enabled*
vCPUs and not the disabled ones. Therefore, proper checks are required at
various places.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
[changed the comment in arm_gicv3_icc_reset]
---
 hw/arm/virt.c              | 15 ++++++++-------
 hw/intc/arm_gicv3_common.c |  7 +++++--
 hw/intc/arm_gicv3_cpuif.c  |  8 ++++++++
 hw/intc/arm_gicv3_kvm.c    | 34 +++++++++++++++++++++++++++++++---
 include/hw/arm/virt.h      |  2 +-
 5 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81e7a27786..ac53bfadca 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -751,6 +751,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     const char *gictype;
     int i;
     unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int max_cpus = ms->smp.max_cpus;
     uint32_t nb_redist_regions = 0;
     int revision;
 
@@ -775,7 +776,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
     vms->gic = qdev_new(gictype);
     qdev_prop_set_uint32(vms->gic, "revision", revision);
-    qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(vms->gic, "num-cpu", max_cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
@@ -787,7 +788,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
         QList *redist_region_count;
         uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
-        uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
+        uint32_t redist0_count = MIN(max_cpus, redist0_capacity);
 
         nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
@@ -798,7 +799,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                 virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
 
             qlist_append_int(redist_region_count,
-                MIN(smp_cpus - redist0_count, redist1_capacity));
+                MIN(max_cpus - redist0_count, redist1_capacity));
         }
         qdev_prop_set_array(vms->gic, "redist-region-count",
                             redist_region_count);
@@ -871,7 +872,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         } else if (vms->virt) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             intidbase + ARCH_GIC_MAINT_IRQ);
-            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+            sysbus_connect_irq(gicbusdev, i + 4 * max_cpus, irq);
         }
 
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
@@ -879,11 +880,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                                                      + VIRTUAL_PMU_IRQ));
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + max_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
-        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + 2 * max_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
-        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + 3 * max_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
 
         if (vms->gic_version != VIRT_GIC_VERSION_2) {
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index bd50a1b079..183d2de7eb 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -436,10 +436,13 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
-        CPUState *cpu = qemu_get_cpu(i);
+        CPUState *cpu = qemu_get_possible_cpu(i);
         uint64_t cpu_affid;
 
-        s->cpu[i].cpu = cpu;
+        if (qemu_enabled_cpu(cpu)) {
+            s->cpu[i].cpu = cpu;
+        }
+
         s->cpu[i].gic = s;
         /* Store GICv3CPUState in CPUARMState gicv3state pointer */
         gicv3_set_gicv3state(cpu, &s->cpu[i]);
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index bdb13b00e9..2a8aff0b99 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1052,6 +1052,10 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
+    if (!qemu_enabled_cpu(cs->cpu)) {
+        return;
+    }
+
     g_assert(bql_locked());
 
     trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
@@ -2036,6 +2040,10 @@ static void icc_generate_sgi(CPUARMState *env, GICv3CPUState *cs,
     for (i = 0; i < s->num_cpu; i++) {
         GICv3CPUState *ocs = &s->cpu[i];
 
+        if (!qemu_enabled_cpu(ocs->cpu)) {
+            continue;
+        }
+
         if (irm) {
             /* IRM == 1 : route to all CPUs except self */
             if (cs == ocs) {
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 9ea6b8e218..8dbbd79e1b 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -24,6 +24,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "kvm_arm.h"
@@ -458,6 +459,18 @@ static void kvm_arm_gicv3_put(GICv3State *s)
         GICv3CPUState *c = &s->cpu[ncpu];
         int num_pri_bits;
 
+        /*
+         * To support hotplug of vcpus we need to make sure all gic cpuif/GICC
+         * are initialized at machvirt init time. Once the init is done we
+         * release the ARMCPU object for disabled vcpus but this leg could hit
+         * during reset of GICC later as well i.e. after init has happened and
+         * all of the cases we want to make sure we dont acess the GICC for
+         * the disabled VCPUs.
+         */
+        if (!qemu_enabled_cpu(c->cpu)) {
+            continue;
+        }
+
         kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, true);
         kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
                         &c->icc_ctlr_el1[GICV3_NS], true);
@@ -616,6 +629,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
         GICv3CPUState *c = &s->cpu[ncpu];
         int num_pri_bits;
 
+        /* don't access GICC for the disabled vCPUs. */
+        if (!qemu_enabled_cpu(c->cpu)) {
+            continue;
+        }
+
         kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, false);
         kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
                         &c->icc_ctlr_el1[GICV3_NS], false);
@@ -695,10 +713,19 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
         return;
     }
 
+    /*
+     * This shall be called even when vcpu is being hotplugged or onlined and
+     * other vcpus might be running. Host kernel KVM code to handle device
+     * access of IOCTLs KVM_{GET|SET}_DEVICE_ATTR might fail due to inability to
+     * grab vcpu locks for all the vcpus. Hence, we need to pause all vcpus to
+     * facilitate locking within host.
+     */
+    pause_all_vcpus();
     /* Initialize to actual HW supported configuration */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
                       KVM_VGIC_ATTR(ICC_CTLR_EL1, c->gicr_typer),
                       &c->icc_ctlr_el1[GICV3_NS], false, &error_abort);
+    resume_all_vcpus();
 
     c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
 }
@@ -813,9 +840,10 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
     for (i = 0; i < s->num_cpu; i++) {
-        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
-
-        define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+        CPUState *cs = qemu_get_cpu(i);
+        if (qemu_enabled_cpu(cs)) {
+            define_arm_cp_regs(ARM_CPU(cs), gicv3_cpuif_reginfo);
+        }
     }
 
     /* Try to create the device via the device control API */
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 780bd53ceb..36ac5ff4a2 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -209,7 +209,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 
     assert(vms->gic_version != VIRT_GIC_VERSION_2);
 
-    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
+    return (MACHINE(vms)->smp.max_cpus > redist0_capacity &&
             vms->highmem_redists) ? 2 : 1;
 }
 
-- 
2.34.1
