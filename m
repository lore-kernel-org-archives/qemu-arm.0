Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595249njl;
        Tue, 8 Oct 2024 20:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUY7b45YItf6sVlxZrUob3gpl2haR8jQaZrCbT16gG9Ftv+YMbrQHLnwq4uTRQ3OefjGdTBNHEVKv2xhA==@linaro.org
X-Google-Smtp-Source: AGHT+IHibbkbMGHG8wmJtSceyo3DbFVxJQM6Ho2+H4aet6oVk3RHLkQ3057jD9wV6uZAb51Nt17M
X-Received: by 2002:a5d:5682:0:b0:371:9377:975f with SMTP id ffacd0b85a97d-37d3a9f520emr392698f8f.25.1728444096500;
        Tue, 08 Oct 2024 20:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444096; cv=none;
        d=google.com; s=arc-20240605;
        b=f682e+/m/iBhW3vDueF6PCNhHubS7tHpnagAhP83n1Y08YasCG5avX6j3FkNHkwVn7
         xMtgoOMaTNWihuGQ4YWM3SpLJhESXs1cMvwms4wBzYyHer/6e1Q3lbo8L5eaV4rXaNc9
         V6viUMLaVztw3HWvzrYSZsaN+tH5t48S24kG+U+AD6HGoZRCOc7m/npyb6VyFiVYvfQt
         /0+viKCF5kv0y3neZ4s9AutLGPp2tNtuH6bYN+CM4y24kHXuRqs20iiOa2xMH0mcssV0
         YD3JeAMenGp1ylOhlclvdzSJF5YuA7z84jqIud7WGflOr+H2Jr6MuC0gVMU9U0qPF6n5
         WN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Jj0uN7kPc/t9wC6+Q32tzsrJ/j6YGIFDMC/1LoRCBC0=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=fQMP+df6VqJUrtD7rxGugcczRpWVkxQuWc+aWG8EMkQeVwzeMFzpvhL05FNWh5JZVM
         5eiY2MFgEjKrl0a7RnVJ3kg9C6W3lZGDlg56EL9wXYMdlxw7+NH3leR8ltwjGRWyiPjv
         qR9TtvdEP7V1mAW6iV5Z81AvU04n1BXzA0ZIpe5ISaZPNZm0l+VjyIBgMqU9XcXRYQam
         B8SZECMZsv6UIWkWIzG/s6PnTj/h9S64nnPC1V2lsC4wb1YJnFRH+k+808jqdknKIwOy
         sTLWgef8JpUT2hnpzkw8q3s2PYUEZY3jZkrjs8Yev2MObk6aKOl8w3WR804SBsZ+nH7U
         3w+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1695e641si3828742f8f.400.2024.10.08.20.21.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdTB75TXz6K98r;
	Wed,  9 Oct 2024 11:21:18 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C4D2140447;
	Wed,  9 Oct 2024 11:21:35 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:21:16 +0200
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
Subject: [PATCH RFC V4 06/33] arm/virt,kvm: Pre-create disabled possible vCPUs @machine init
Date: Wed, 9 Oct 2024 04:17:48 +0100
Message-ID: <20241009031815.250096-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 4wxLCxZfOaWK

In the ARMv8 architecture, the GIC must know all the CPUs it is connected to
during its initialization, and this cannot change afterward. This must be
ensured during the initialization of the VGIC in KVM, which requires all vCPUs
to be created and present during its initialization. This is necessary because:

1. The association between GICC and MPIDR must be fixed at VM initialization
   time. This is represented by the register `GIC_TYPER(mp_affinity, proc_num)`.
2. GICC (CPU interfaces), GICR (redistributors), etc., must all be initialized
   at boot time.
3. Memory regions associated with GICR, etc., cannot be changed (added, deleted,
   or modified) after the VM has been initialized.

This patch adds support to pre-create all possible vCPUs within the host using
the KVM interface as part of the virtual machine initialization. These vCPUs can
later be attached to QOM/ACPI when they are actually hot-plugged and made
present.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
[VP: Identified CPU stall issue & suggested probable fix]
---
 hw/arm/virt.c         | 69 ++++++++++++++++++++++++++++++++++++++-----
 include/hw/core/cpu.h |  1 +
 target/arm/cpu64.c    |  1 +
 target/arm/kvm.c      | 41 ++++++++++++++++++++++++-
 target/arm/kvm_arm.h  | 11 +++++++
 5 files changed, 114 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3db4769289..badde5ed7a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2364,17 +2364,12 @@ static void machvirt_init(MachineState *machine)
 
     assert(possible_cpus->len == max_cpus);
     for (n = 0; n < possible_cpus->len; n++) {
+        CPUArchId *cpu_slot;
         Object *cpuobj;
         CPUState *cs;
 
-        if (n >= smp_cpus) {
-            break;
-        }
-
         cpuobj = object_new(possible_cpus->cpus[n].type);
-
         cs = CPU(cpuobj);
-        cs->cpu_index = n;
 
         aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
         object_property_set_int(cpuobj, "socket-id",
@@ -2386,8 +2381,57 @@ static void machvirt_init(MachineState *machine)
         object_property_set_int(cpuobj, "thread-id",
                                 virt_get_thread_id(machine, n), NULL);
 
-        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
-        object_unref(cpuobj);
+        if (n < smp_cpus) {
+            qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
+            object_unref(cpuobj);
+        } else {
+            /* handling for vCPUs which are yet-to-be hot-plugged */
+            cs->cpu_index = n;
+            cpu_slot = virt_find_cpu_slot(cs);
+
+           /* GICv3 will need `mp-affinity` to derive `gicr_typer` */
+            virt_cpu_set_properties(cpuobj, cpu_slot, &error_fatal);
+
+            /*
+             * For KVM, we shall be pre-creating the now disabled/un-plugged
+             * possbile host vcpus and park them till the time they are
+             * actually hot plugged. This is required to pre-size the host
+             * GICC and GICR with the all possible vcpus for this VM.
+             */
+            if (kvm_enabled()) {
+                kvm_arm_create_host_vcpu(ARM_CPU(cs));
+                /*
+                 * Override the default architecture ID with the one fetched
+                 * from KVM. After initialization, we will destroy the CPUState
+                 * for disabled vCPUs; however, the CPU slot and its association
+                 * with the architecture ID (and consequently the vCPU ID) will
+                 * remain fixed for the entire lifetime of QEMU and cannot be
+                 * altered. This is also an ARM CPU architectural constraint.
+                 */
+                cpu_slot->arch_id = arm_cpu_mp_affinity(ARM_CPU(cs));
+            }
+            /*
+             * Add disabled vCPU to CPU slot during the init phase of the virt
+             * machine
+             * 1. We need this ARMCPU object during the GIC init. This object
+             *    will facilitate in pre-realizing the GIC. Any info like
+             *    mp-affinity(required to derive gicr_type) etc. could still be
+             *    fetched while preserving QOM abstraction akin to realized
+             *    vCPUs.
+             * 2. Now, after initialization of the virt machine is complete we
+             *    could use two approaches to deal with this ARMCPU object:
+             *    (i) re-use this ARMCPU object during hotplug of this vCPU.
+             *                             OR
+             *    (ii) defer release this ARMCPU object after gic has been
+             *         initialized or during pre-plug phase when a vCPU is
+             *         hotplugged.
+             *
+             *    We will use the (ii) approach and release the ARMCPU objects
+             *    after GIC and machine has been fully initialized during
+             *    machine_init_done() phase.
+             */
+             cpu_slot->cpu = cs;
+        }
     }
 
     /* Now we've created the CPUs we can see if they have the hypvirt timer */
@@ -2990,6 +3034,15 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     /* insert the cold/hot-plugged vcpu in the slot */
     cpu_slot = virt_find_cpu_slot(cs);
     cpu_slot->cpu = CPU(dev);
+    if (kvm_enabled()) {
+        /*
+         * Override the default architecture ID with the one fetched from KVM
+         * Currently, KVM derives the architecture ID from the vCPU ID specified
+         * by QEMU. In the future, we might implement a change where the entire
+         * architecture ID can be configured directly by QEMU.
+         */
+        cpu_slot->arch_id = arm_cpu_mp_affinity(ARM_CPU(cs));
+    }
 
     cs->disabled = false;
 }
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 73a4e4cce1..bcc62fbf0c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -530,6 +530,7 @@ struct CPUState {
     uint64_t dirty_pages;
     int kvm_vcpu_stats_fd;
     bool vcpu_dirty;
+    VMChangeStateEntry *vmcse;
 
     /* Use by accel-block: CPU is executing an ioctl() */
     QemuLockCnt in_ioctl_lock;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d36d3519df..2a517fdb9f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -793,6 +793,7 @@ static void aarch64_cpu_initfn(Object *obj)
      * explicitly enabled.
      */
     cs->disabled = true;
+    cs->thread_id = 0;
 }
 
 static void aarch64_cpu_finalizefn(Object *obj)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 849e2e21b3..8ed160cbca 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1003,6 +1003,38 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
     write_list_to_cpustate(cpu);
 }
 
+void kvm_arm_create_host_vcpu(ARMCPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    unsigned long vcpu_id = cs->cpu_index;
+    int ret;
+
+    ret = kvm_create_vcpu(cs);
+    if (ret < 0) {
+        error_report("Failed to create host vcpu %ld", vcpu_id);
+        abort();
+    }
+
+    /*
+     * Initialize the vCPU in the host. This will reset the sys regs
+     * for this vCPU and related registers like MPIDR_EL1 etc. also
+     * gets programmed during this call to host. These are referred
+     * later while setting device attributes of the GICR during GICv3
+     * reset
+     */
+    ret = kvm_arch_init_vcpu(cs);
+    if (ret < 0) {
+        error_report("Failed to initialize host vcpu %ld", vcpu_id);
+        abort();
+    }
+
+    /*
+     * park the created vCPU. shall be used during kvm_get_vcpu() when
+     * threads are created during realization of ARM vCPUs.
+     */
+    kvm_park_vcpu(cs);
+}
+
 /*
  * Update KVM's MP_STATE based on what QEMU thinks it is
  */
@@ -1874,7 +1906,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return -EINVAL;
     }
 
-    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cpu);
+    /*
+     * Install VM change handler only when vCPU thread has been spawned
+     * i.e. vCPU is being realized
+     */
+    if (cs->thread_id) {
+        cs->vmcse = qemu_add_vm_change_state_handler(kvm_arm_vm_state_change,
+                                                     cpu);
+    }
 
     /* Determine init features for this CPU */
     memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cfaa0d9bc7..0be7e896d2 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -96,6 +96,17 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
  */
 void kvm_arm_reset_vcpu(ARMCPU *cpu);
 
+/**
+ * kvm_arm_create_host_vcpu:
+ * @cpu: ARMCPU
+ *
+ * Called at to pre create all possible kvm vCPUs within the the host at the
+ * virt machine init time. This will also init this pre-created vCPU and
+ * hence result in vCPU reset at host. These pre created and inited vCPUs
+ * shall be parked for use when ARM vCPUs are actually realized.
+ */
+void kvm_arm_create_host_vcpu(ARMCPU *cpu);
+
 #ifdef CONFIG_KVM
 /**
  * kvm_arm_create_scratch_host_vcpu:
-- 
2.34.1
