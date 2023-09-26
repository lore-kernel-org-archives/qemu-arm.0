Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp980694ejc;
        Tue, 26 Sep 2023 03:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+KyhWeuuFD/vAn2y0WOjPI4ycyAIEubjbb6EMOXNpqlO/gJ9y2SzLvZk7JErEy/qHcHRo
X-Received: by 2002:a05:600c:1c90:b0:405:9450:dda6 with SMTP id k16-20020a05600c1c9000b004059450dda6mr4233096wms.22.1695722847463;
        Tue, 26 Sep 2023 03:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722847; cv=none;
        d=google.com; s=arc-20160816;
        b=Uk3p9el31M+gNv0mJyCed4e5M73hfOlwZbMb34FDndRkp5y7xSam7xDdf4/pVgbZ56
         1wY8katlGGpN64yaZtv/GwefRmWBdrC1kqXP3JWFIZxBK0EUnxWOdUjfkKMYZ53MgRP8
         57QvFZFATCYMpjup7GnzasbIhJ6v2EkEFpe9DLhRdrOd8ECwKje4dKw3OhqfaGnDUXuP
         4sFThlK8bz7IpX7oCKLyPwvXAcRja6pI5GKKWAmDECF7mL9TISLEM5dpjn9jN42/78Ye
         BY05i6S3gahPktkBlrSjzW9disV/CjEFxEhBSHM0I6wEBWVMlylFuxRbzBk9u3zijD6y
         9kXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=etYF/VrTZchx9AcANccesrZKbc2/RU1EhKDhycmZFA0=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=eEHmUzb2StOxCfX02/tZ5fZKvJPui3nJIeP5wV5J/lByeHsRMbFPl4ZIv3ARIvJ2Sz
         9V8lbHc1AVDMHog9OniLKrkMfJoC0IyBhTLfrbxafDxGrpmeSAZuukt0Z92EPvKVFDrb
         y3y2SRs14rqI5qye5qqiaus64MGmc0A/XoSIbjRM8ohWfYrxspk9r716G3tNWSJxIY8u
         faLcmO72lS/u2YvU6Sq58N8Z2K0uPVlIxfHeuG0VdIlyvufGnkR9nm2/6qz8KqepkJW1
         i4+Qisoc7VKaFBKdpwKjMC/Ninhrf0tCGSCHXiaZhA2gFDTI/hk8IQp5Jd/Hslld1eap
         h9VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id n12-20020a5d660c000000b0032151fc3a22si88417wru.526.2023.09.26.03.07.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwMt5x6Rz6D9DZ;
	Tue, 26 Sep 2023 18:04:58 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:07:00 +0100
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
Subject: [PATCH RFC V2 06/37] arm/virt,kvm: Pre-create disabled possible vCPUs @machine init
Date: Tue, 26 Sep 2023 11:04:05 +0100
Message-ID: <20230926100436.28284-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: gauvFKkdxq1Q

In ARMv8 architecture, GIC needs all the vCPUs to be created and present when
it is initialized. This is because:
1. GICC and MPIDR association must be fixed at the VM initialization time.
   This is represented by register GIC_TYPER(mp_afffinity, proc_num)
2. GICC(cpu interfaces), GICR(redistributors) etc all must be initialized
   at the boot time as well.
3. Memory regions associated with GICR etc. cannot be changed(add/del/mod)
   after VM has inited.

This patch adds the support to pre-create all such possible vCPUs within the
host using the KVM interface as part of the virt machine initialization. These
vCPUs could later be attached to QOM/ACPI while they are actually hot plugged
and made present.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
[VP: Identified CPU stall issue & suggested probable fix]
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 53 +++++++++++++++++++++++++++++++++++++++++--
 include/hw/core/cpu.h |  1 +
 target/arm/cpu64.c    |  1 +
 target/arm/kvm.c      | 32 ++++++++++++++++++++++++++
 target/arm/kvm64.c    |  9 +++++++-
 target/arm/kvm_arm.h  | 11 +++++++++
 6 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3668ad27ec..6ba131b799 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2293,8 +2293,10 @@ static void machvirt_init(MachineState *machine)
     assert(possible_cpus->len == max_cpus);
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
+        CPUState *cs;
 
         cpuobj = object_new(possible_cpus->cpus[n].type);
+        cs = CPU(cpuobj);
 
         aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
         object_property_set_int(cpuobj, "socket-id",
@@ -2306,8 +2308,55 @@ static void machvirt_init(MachineState *machine)
         object_property_set_int(cpuobj, "thread-id",
                                 virt_get_thread_id(machine, n), NULL);
 
-        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
-        object_unref(cpuobj);
+        if (n < smp_cpus) {
+            qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
+            object_unref(cpuobj);
+        } else {
+            CPUArchId *cpu_slot;
+
+            /* handling for vcpus which are yet to be hot-plugged */
+            cs->cpu_index = n;
+            cpu_slot = virt_find_cpu_slot(machine, cs->cpu_index);
+
+            /*
+             * ARM host vCPU features need to be fixed at the boot time. But as
+             * per current approach this CPU object will be destroyed during
+             * cpu_post_init(). During hotplug of vCPUs these properties are
+             * initialized again.
+             */
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
+             cpu_slot->cpu = OBJECT(cs);
+        }
     }
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e5af79950c..b2201a98ee 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -401,6 +401,7 @@ struct CPUState {
     uint32_t kvm_fetch_index;
     uint64_t dirty_pages;
     int kvm_vcpu_stats_fd;
+    VMChangeStateEntry *vmcse;
 
     /* Use by accel-block: CPU is executing an ioctl() */
     QemuLockCnt in_ioctl_lock;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a660e3f483..3a38e7ccaf 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_cpu_initfn(Object *obj)
      * enabled explicitly
      */
     cs->disabled = true;
+    cs->thread_id = 0;
 }
 
 static void aarch64_cpu_finalizefn(Object *obj)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b4c7654f49..0e1d0692b1 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -637,6 +637,38 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
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
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 94bbd9661f..364cc21f81 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -566,7 +566,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return -EINVAL;
     }
 
-    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cs);
+    /*
+     * Install VM change handler only when vCPU thread has been spawned
+     * i.e. vCPU is being realized
+     */
+    if (cs->thread_id) {
+        cs->vmcse = qemu_add_vm_change_state_handler(kvm_arm_vm_state_change,
+                                                     cs);
+    }
 
     /* Determine init features for this CPU */
     memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 051a0da41c..31408499b3 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -163,6 +163,17 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
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
 /**
  * kvm_arm_init_serror_injection:
  * @cs: CPUState
-- 
2.34.1
