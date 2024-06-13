Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97171ejr;
        Thu, 13 Jun 2024 16:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHgr1Ruj69amMcLGguvNGFylb4xJRRpPjHf1eaW3dAdmOpzPSgz6W94Q36bpxXvLvXFzxRPbfDia/7o/6knROZMt4qS1yB
X-Google-Smtp-Source: AGHT+IEm0949htJ3rqdOat4N6tEnV7knLUgdNDwYZA7Ug/VsWWYv/e9XUGngq6ydMIvtBoWqfY0W
X-Received: by 2002:a05:600c:6545:b0:421:eded:a201 with SMTP id 5b1f17b1804b1-42304859adamr8746545e9.38.1718322011560;
        Thu, 13 Jun 2024 16:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322011; cv=none;
        d=google.com; s=arc-20160816;
        b=Pt0rnzl6/GmQ7soPQaX4X2gbNrBCDoZgLi8fZRvPTgTeUK+rgzdaZcLwgHhYvyHYFO
         onOjKtk/VNBy8bCSZEeOrJNOpZ6OOgZWko6LvuNZ7pv2u3ql2Y4VT2itlv2+iLUx+eRg
         uQoPAbGPPWY27Zi5MVdCzEJ1mvPVYvcDKlIgUbYbS7LwL4Bij42d/75DGmxdtukitiHf
         C2OnSxdfUe/czHJZK3PhrA6U6siiH3R4HjE7opBG1Nray7Upax/ifqC0ptvXb0BoE/3q
         K4U5BzBeSwUN5b2ki9e6EDFNeQSC43TmQSUovJZlLISomk14NoiHUUcvjiyvsAeMNrEn
         9W1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=1WqnPCx7a+wQq2Icw+lRB/hvpTrs/NIkDFLNFWJkmKs=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=ATWkZG1y5mRiA5i05a/lSw/JFUon9rka0SK4cJPDXlrMgoGZOZjA0NfmcDaOR+q61t
         wKr2urUlEXJRKV0bRjLzYQKSGCAtMDtZDeFEm5IGP6Efx5CUF+5aFyjEUCiuIqVdzmhP
         N6X2JkAZS1lDlRXlB+JWXW4j+pKZmZ+uIyvg3FjZJBTpp1R+UKAx1I/cuuHo/EapGpqk
         174CjjR0vkM+az6/EM5C43gwdYyFzFhF8lUPWwiXsKNLqFwUM+STIyh9tvd2r2zjbrFu
         IfMNSr3pU5rIh7C92GsXNetn+xgJttzX9PbDs98H6AidgxG2qhymjwCY7uRPuMf19mDL
         61rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-423034f4143si11613505e9.19.2024.06.13.16.40.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f0c0zWJz6HJTY;
	Fri, 14 Jun 2024 07:35:28 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C9A8140594;
	Fri, 14 Jun 2024 07:40:10 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:39:48 +0100
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
Subject: [PATCH RFC V3 06/29] arm/virt,kvm: Pre-create disabled possible vCPUs @machine init
Date: Fri, 14 Jun 2024 00:36:16 +0100
Message-ID: <20240613233639.202896-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: F6YNpVGnfCWW

In the ARMv8 architecture, the GIC must know all the CPUs it is connected to
during its initialization, and this cannot change afterward. This must be
ensured during the initialization of the VGIC as well in KVM, which requires all
vCPUs to be created and present during its initialization. This is necessary
because:

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
 hw/arm/virt.c         | 56 +++++++++++++++++++++++++++++++++++--------
 include/hw/core/cpu.h |  1 +
 target/arm/cpu64.c    |  1 +
 target/arm/kvm.c      | 41 ++++++++++++++++++++++++++++++-
 target/arm/kvm_arm.h  | 11 +++++++++
 5 files changed, 99 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a285139165..81e7a27786 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2383,14 +2383,8 @@ static void machvirt_init(MachineState *machine)
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
@@ -2402,11 +2396,53 @@ static void machvirt_init(MachineState *machine)
         object_property_set_int(cpuobj, "thread-id",
                                 virt_get_thread_id(machine, n), NULL);
 
-        cpu_slot = virt_find_cpu_slot(machine, cs->cpu_index);
-        virt_cpu_set_properties(cpuobj, cpu_slot, &error_fatal);
+        if (n < smp_cpus) {
+            qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
+            object_unref(cpuobj);
+        } else {
+            /* handling for vcpus which are yet to be hot-plugged */
+            cs->cpu_index = n;
+            cpu_slot = virt_find_cpu_slot(machine, cs->cpu_index);
 
-        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
-        object_unref(cpuobj);
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
+             cpu_slot->cpu = cs;
+        }
     }
 
     /* Now we've created the CPUs we can see if they have the hypvirt timer */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 60b4778da9..62e68611c0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -520,6 +520,7 @@ struct CPUState {
     uint64_t dirty_pages;
     int kvm_vcpu_stats_fd;
     bool vcpu_dirty;
+    VMChangeStateEntry *vmcse;
 
     /* Use by accel-block: CPU is executing an ioctl() */
     QemuLockCnt in_ioctl_lock;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d6b48b3424..9b7e8b032c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -789,6 +789,7 @@ static void aarch64_cpu_initfn(Object *obj)
      * enabled explicitly
      */
     cs->disabled = true;
+    cs->thread_id = 0;
 }
 
 static void aarch64_cpu_finalizefn(Object *obj)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7cf5cf31de..01c83c1994 100644
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
