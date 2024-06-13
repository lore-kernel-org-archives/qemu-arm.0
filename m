Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp99300ejr;
        Thu, 13 Jun 2024 16:46:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqqBh8lryV3ANwCzkptwNx5Ju4yS/779JWMSsCDPoKvw1Mip6rLllzpHTZiL/4wZMIy7jrt/erfGqsQTSjCL+FvHK/z9pe
X-Google-Smtp-Source: AGHT+IFw3SwRwPdun4Ih7ohE1uNXfnCTXz+XeAlsg1irydiZO9JcB3gJZNKrAJ2Q+lGOMZjz7BaA
X-Received: by 2002:a05:6000:400f:b0:35f:d96:7e93 with SMTP id ffacd0b85a97d-3607a768d0amr903163f8f.37.1718322419533;
        Thu, 13 Jun 2024 16:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322419; cv=none;
        d=google.com; s=arc-20160816;
        b=cj4hb+AS8VqZatVYpdV4rL3YBijCnsWsbRQhFVmpQqleJhdRcTSLVqCuLd6mPdr19m
         bIFDgL6gtLi6FDpTJAdQWmEAeKSC+mqUk7wJLzmNeQT3+NAyGSFtRWSJL1ofTzubuKmY
         PDmdDW3Qau2QOktrHvb/+695Yh3y3cI5cop5I7XD8G9dGXsyPgBTCWIJlbnc8CuV13kj
         kDfWnllysvx6NPQIHk0qwN1uxZoMwm7oGKfZTekpQfXGXNMsC7PQIgFBBgtveD1Isrxl
         Agbj2epNoODGHw8jptlqKnqZGNt9zuQOYC39SVHAqzQjjyD2tJCF+2qHW8IvXhmXqVSV
         LNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AEcJedHVz4FCPSBXV6KLJpHI1rsa+Ek6tedwEO7yh3c=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=OiQU6OtZTrbVHWaJHj34h32G+dC8apVj76E+6nXzmX6J3rQ3deWhyhmW1caul2J3Gd
         H30J0gUCOn4A/0neeTbEJUexxzC3gtSsnDSLNHv4JUkxvsQyA4V/SIxc1mreN/elsn1h
         YkYk9vClDSW4DbyTpoU67lw7GXDPDOTdkcpzjNxfolqeCMj74Td35nx8LYzh++deUaUM
         8yDGyteNThBJ8Nqw8Awp73LwApPqt6rbX5XEjGclrK84nh7nadvZyIJTd/cVVnI8tj4r
         1/gXRha8rIDhhlMRqhSEUBks9B855HQ4Enhqg+5X9w1dnFbN8svq01tI9mQAorInIHzr
         PsWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-360750b6363si1498082f8f.105.2024.06.13.16.46.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f8S0zM6z67j6n;
	Fri, 14 Jun 2024 07:42:16 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 7279014065C;
	Fri, 14 Jun 2024 07:46:58 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:46:35 +0100
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
Subject: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize* ARMCPU during vCPU Hot-unplug
Date: Fri, 14 Jun 2024 00:36:34 +0100
Message-ID: <20240613233639.202896-25-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: Wdt3EJqNDo29

vCPU Hot-unplug will result in QOM CPU object unrealization which will do away
with all the vCPU thread creations, allocations, registrations that happened
as part of the realization process. This change introduces the ARM CPU unrealize
function taking care of exactly that.

Note, initialized KVM vCPUs are not destroyed in host KVM but their Qemu context
is parked at the QEMU KVM layer.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
[VP: Identified CPU stall issue & suggested probable fix]
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/cpu.c       | 101 +++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h       |  14 ++++++
 target/arm/gdbstub.c   |   6 +++
 target/arm/helper.c    |  25 ++++++++++
 target/arm/internals.h |   3 ++
 target/arm/kvm.c       |   5 ++
 6 files changed, 154 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c92162fa97..a3dc669309 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -157,6 +157,16 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
     QLIST_INSERT_HEAD(&cpu->pre_el_change_hooks, entry, node);
 }
 
+void arm_unregister_pre_el_change_hooks(ARMCPU *cpu)
+{
+    ARMELChangeHook *entry, *next;
+
+    QLIST_FOREACH_SAFE(entry, &cpu->pre_el_change_hooks, node, next) {
+        QLIST_REMOVE(entry, node);
+        g_free(entry);
+    }
+}
+
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
 {
@@ -168,6 +178,16 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
     QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
 }
 
+void arm_unregister_el_change_hooks(ARMCPU *cpu)
+{
+    ARMELChangeHook *entry, *next;
+
+    QLIST_FOREACH_SAFE(entry, &cpu->el_change_hooks, node, next) {
+        QLIST_REMOVE(entry, node);
+        g_free(entry);
+    }
+}
+
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
 {
     /* Reset a single ARMCPRegInfo register */
@@ -2552,6 +2572,85 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     acc->parent_realize(dev, errp);
 }
 
+static void arm_cpu_unrealizefn(DeviceState *dev)
+{
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
+    ARMCPU *cpu = ARM_CPU(dev);
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(dev);
+    bool has_secure;
+
+    has_secure = cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY);
+
+    /* rock 'n' un-roll, whatever happened in the arm_cpu_realizefn cleanly */
+    cpu_address_space_destroy(cs, ARMASIdx_NS);
+
+    if (cpu->tag_memory != NULL) {
+        cpu_address_space_destroy(cs, ARMASIdx_TagNS);
+        if (has_secure) {
+            cpu_address_space_destroy(cs, ARMASIdx_TagS);
+        }
+    }
+
+    if (has_secure) {
+        cpu_address_space_destroy(cs, ARMASIdx_S);
+    }
+
+    destroy_cpreg_list(cpu);
+    arm_cpu_unregister_gdb_regs(cpu);
+    unregister_cp_regs_for_features(cpu);
+
+    if (cpu->sau_sregion && arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        g_free(env->sau.rbar);
+        g_free(env->sau.rlar);
+    }
+
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V7) &&
+        cpu->pmsav7_dregion) {
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            g_free(env->pmsav8.rbar[M_REG_NS]);
+            g_free(env->pmsav8.rlar[M_REG_NS]);
+            if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+                g_free(env->pmsav8.rbar[M_REG_S]);
+                g_free(env->pmsav8.rlar[M_REG_S]);
+            }
+        } else {
+            g_free(env->pmsav7.drbar);
+            g_free(env->pmsav7.drsr);
+            g_free(env->pmsav7.dracr);
+        }
+        if (cpu->pmsav8r_hdregion) {
+            g_free(env->pmsav8.hprbar);
+            g_free(env->pmsav8.hprlar);
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_PMU)) {
+        if (!kvm_enabled()) {
+            arm_unregister_pre_el_change_hooks(cpu);
+            arm_unregister_el_change_hooks(cpu);
+        }
+
+#ifndef CONFIG_USER_ONLY
+        if (cpu->pmu_timer) {
+            timer_del(cpu->pmu_timer);
+        }
+#endif
+    }
+
+    cpu_remove_sync(CPU(dev));
+    acc->parent_unrealize(dev);
+
+#ifndef CONFIG_USER_ONLY
+    timer_del(cpu->gt_timer[GTIMER_PHYS]);
+    timer_del(cpu->gt_timer[GTIMER_VIRT]);
+    timer_del(cpu->gt_timer[GTIMER_HYP]);
+    timer_del(cpu->gt_timer[GTIMER_SEC]);
+    timer_del(cpu->gt_timer[GTIMER_HYPVIRT]);
+#endif
+}
+
 static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -2654,6 +2753,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, arm_cpu_realizefn,
                                     &acc->parent_realize);
+    device_class_set_parent_unrealize(dc, arm_cpu_unrealizefn,
+                                      &acc->parent_unrealize);
 
     device_class_set_props(dc, arm_cpu_properties);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 208c719db3..a4a7555f7e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1118,6 +1118,7 @@ struct ARMCPUClass {
 
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
     ResettablePhases parent_phases;
 };
 
@@ -3228,6 +3229,13 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
  */
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque);
+/**
+ * arm_unregister_pre_el_change_hook:
+ * unregister all pre EL change hook functions. Generally called during
+ * unrealize'ing leg
+ */
+void arm_unregister_pre_el_change_hooks(ARMCPU *cpu);
+
 /**
  * arm_register_el_change_hook:
  * Register a hook function which will be called immediately after this
@@ -3240,6 +3248,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
  */
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
         *opaque);
+/**
+ * arm_unregister_el_change_hook:
+ * unregister all EL change hook functions.  Generally called during
+ * unrealize'ing leg
+ */
+void arm_unregister_el_change_hooks(ARMCPU *cpu);
 
 /**
  * arm_rebuild_hflags:
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index a3bb73cfa7..948e40b981 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -555,3 +555,9 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
     }
 #endif /* CONFIG_TCG */
 }
+
+void arm_cpu_unregister_gdb_regs(ARMCPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    gdb_unregister_coprocessor_all(cs);
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7587635960..9a2468347a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -264,6 +264,19 @@ void init_cpreg_list(ARMCPU *cpu)
     g_list_free(keys);
 }
 
+void destroy_cpreg_list(ARMCPU *cpu)
+{
+    assert(cpu->cpreg_indexes);
+    assert(cpu->cpreg_values);
+    assert(cpu->cpreg_vmstate_indexes);
+    assert(cpu->cpreg_vmstate_values);
+
+    g_free(cpu->cpreg_indexes);
+    g_free(cpu->cpreg_values);
+    g_free(cpu->cpreg_vmstate_indexes);
+    g_free(cpu->cpreg_vmstate_values);
+}
+
 static bool arm_pan_enabled(CPUARMState *env)
 {
     if (is_a64(env)) {
@@ -9987,6 +10000,18 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #endif
 }
 
+void unregister_cp_regs_for_features(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /* M profile has no coprocessor registers */
+        return;
+    }
+
+    /* empty it all. unregister all the coprocessor registers */
+    g_hash_table_remove_all(cpu->cp_regs);
+}
+
 /*
  * Private utility function for define_one_arm_cp_reg_with_opaque():
  * add a single reginfo struct to the hash table.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index ee3ebd383e..34dab0bb02 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -353,9 +353,12 @@ void arm_cpu_register(const ARMCPUInfo *info);
 void aarch64_cpu_register(const ARMCPUInfo *info);
 
 void register_cp_regs_for_features(ARMCPU *cpu);
+void unregister_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
+void destroy_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
+void arm_cpu_unregister_gdb_regs(ARMCPU *cpu);
 void arm_translate_init(void);
 
 void arm_restore_state_to_opc(CPUState *cs,
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 01c83c1994..1121771c4a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1988,6 +1988,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
+    /* vCPUs which are yet to be realized will not have handler */
+    if (cs->thread_id) {
+        qemu_del_vm_change_state_handler(cs->vmcse);
+    }
+
     return 0;
 }
 
-- 
2.34.1
