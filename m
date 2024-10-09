Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp597086njl;
        Tue, 8 Oct 2024 20:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh4NC4RwqT2hYM0/WC43DNWaCMvDxNzwQvl72Ex4YpFYBUPiDAlSkRuQGXbYJjBxwsvpnNpWxvGWG5hA==@linaro.org
X-Google-Smtp-Source: AGHT+IH89N6nciqVy5NuhGM4gm0V3CBoQsqMuKjcUEKl7DYlFm4udbPNuHFDCmoRf0at2CcNW3DA
X-Received: by 2002:a5d:61c9:0:b0:374:c92e:f6b1 with SMTP id ffacd0b85a97d-37d3a9d3c13mr541923f8f.23.1728444506648;
        Tue, 08 Oct 2024 20:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444506; cv=none;
        d=google.com; s=arc-20240605;
        b=OVp0f1fY3zTDxh4aillM40CY6mqKEu9RijFPf7Old0Pjs5dwrvtGea3X7+5g+ZX3cd
         pI/ZI7mhv47zeVGQlpe0v+WwoyQSCyDE0xncoJNWFqIZlsrnajd3RKQjpKRHQONrEYxG
         3vKq4VtbDGhYiAL9C98H93vcrpsfcglWB4jD7mqXe24P8l75QkEvWhQv1n1SBIIOu083
         552BETwxfS5mhoVH8inzR7imjYeJ4I2zdQQWhGcyhTMVSJvtXtpdFgmw1eEfOHb+XlKu
         2bqRTF8nBkzPH8SE08dKofcy1Hzt0Fh2CMDzrchw5UWxWg5nZFdY29rkpPG7PubKJHoT
         PdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=O7tOSl/OwffHdxvXVVe8evTXd9v5TwLrqAbp8Na/eGs=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=Snqb71NH8QDiKw9EPXlginU4Y4/dQETkgQSRlrbvbh5Y8HmpWTmo7F3QryQMjtDF7/
         PBDJUaDfrS+1GYz1l3RqRaqIobzbNy5g3bbcQ9SUO7FOqln9FUzHYvlc3quzuJ2iMR+Y
         cw4ZgHjZQRaa5G6QQ32U1a/Nk/BwSVl4pVMZnt9j0jc24bVRWPYgiZ+WBQFkAs0LP11I
         R12gIZ/lY8WMtQLNXcOmGUBHZ6/BX9pYVsKKAlPXzT2f/JdWeyEmFA99OEmiIGDxA9Va
         IqmGTM+PWfWXiFCoJm70sIpEw6Ga3OFm5xragrVX+riPWbg0bypTsUJ+k1yrlI1maf9N
         cMEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d2e78029bsi1090205f8f.471.2024.10.08.20.28.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:28:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdbx1lPNz687Yd;
	Wed,  9 Oct 2024 11:27:09 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id A8351140A34;
	Wed,  9 Oct 2024 11:28:25 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:28:06 +0200
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
Subject: [PATCH RFC V4 27/33] target/arm: Add support to *unrealize* ARMCPU during vCPU Hot-unplug
Date: Wed, 9 Oct 2024 04:18:09 +0100
Message-ID: <20241009031815.250096-28-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: AFPOh3fuHdTX

vCPU Hot-unplug will result in QOM CPU object unrealization which will do away
with all the vCPU thread creations, allocations, registrations that happened
as part of the realization process. This change introduces the ARM CPU unrealize
function taking care of exactly that.

Note, initialized KVM vCPUs are not destroyed in host KVM rather their Qemu
context is parked at the QEMU KVM layer.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
[VP: Identified CPU stall issue & suggested probable fix]
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 system/physmem.c       |   8 ++-
 target/arm/cpu.c       | 117 ++++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.h       |  14 +++++
 target/arm/gdbstub.c   |   6 +++
 target/arm/helper.c    |  25 +++++++++
 target/arm/internals.h |   3 ++
 target/arm/kvm.c       |   5 ++
 7 files changed, 176 insertions(+), 2 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index d71a2b1bbd..1bec3049fe 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2613,8 +2613,14 @@ static void tcg_commit(MemoryListener *listener)
      *
      * That said, the listener is also called during realize, before
      * all of the tcg machinery for run-on is initialized: thus halt_cond.
+     * Similarly, the listener can also be triggered during the *unrealize*
+     * operation. In such a case, we should avoid using `run_on_cpu` because the
+     * TCG vCPU thread might already be terminated. As a result, the CPU work
+     * will never get processed, and `tcg_commit_cpu` will not be called. This
+     * means that operations like `tlb_flush()` might not be executed,
+     * potentially leading to inconsistencies.
      */
-    if (cpu->halt_cond) {
+    if (cpu->halt_cond && !cpu->unplug) {
         async_run_on_cpu(cpu, tcg_commit_cpu, RUN_ON_CPU_HOST_PTR(cpuas));
     } else {
         tcg_commit_cpu(cpu, RUN_ON_CPU_HOST_PTR(cpuas));
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 14fcabc2c9..19d2f89f5f 100644
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
@@ -2642,6 +2662,98 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     acc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
+static void arm_cpu_unrealizefn(DeviceState *dev)
+{
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
+    ARMCPU *cpu = ARM_CPU(dev);
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(dev);
+    bool has_secure;
+
+    /* rock 'n' un-roll, whatever happened in the arm_cpu_realizefn cleanly */
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
+        if (cpu->pmu_timer) {
+            timer_del(cpu->pmu_timer);
+        }
+    }
+
+    cpu_remove_sync(CPU(dev));
+
+    /*
+     * We are intentionally destroying the CPU address space after the vCPU
+     * threads have been joined. This ensures that for TCG, any pending TLB
+     * flushes associated with the CPU are completed. The destruction of the
+     * address space also removes associated listeners, and joining threads
+     * after the address space no longer exists can lead to race conditions with
+     * already queued work for this CPU, which may result in a segmentation
+     * fault (SEGV) in `tcg_commit_cpu()`.
+     *
+     * Alternatively, Peter Maydell has suggested moving the CPU address space
+     * destruction to `cpu_common_unrealize()`, which would be called in the
+     * context of `parent_unrealize()`. This would also address the race
+     * condition in TCG.
+     *
+     * RFC: Question: Any additional thoughts or feedback on this approach would
+     * be appreciated?
+     */
+    has_secure = cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY);
+    cpu_address_space_destroy(cs, ARMASIdx_NS);
+    if (cpu->tag_memory != NULL) {
+        cpu_address_space_destroy(cs, ARMASIdx_TagNS);
+        if (has_secure) {
+            cpu_address_space_destroy(cs, ARMASIdx_TagS);
+        }
+    }
+    if (has_secure) {
+        cpu_address_space_destroy(cs, ARMASIdx_S);
+    }
+
+    acc->parent_unrealize(dev);
+
+    timer_del(cpu->gt_timer[GTIMER_PHYS]);
+    timer_del(cpu->gt_timer[GTIMER_VIRT]);
+    timer_del(cpu->gt_timer[GTIMER_HYP]);
+    timer_del(cpu->gt_timer[GTIMER_SEC]);
+    timer_del(cpu->gt_timer[GTIMER_HYPVIRT]);
+}
+#endif
+
 static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -2745,7 +2857,10 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, arm_cpu_realizefn,
                                     &acc->parent_realize);
-
+#ifndef CONFIG_USER_ONLY
+    device_class_set_parent_unrealize(dc, arm_cpu_unrealizefn,
+                                      &acc->parent_unrealize);
+#endif
     device_class_set_props(dc, arm_cpu_properties);
 
     resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1277a0ddfc..07bd7d6542 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1128,6 +1128,7 @@ struct ARMCPUClass {
 
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
     ResettablePhases parent_phases;
 };
 
@@ -3293,6 +3294,13 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
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
@@ -3305,6 +3313,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
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
index 554b8736bb..58067e30a5 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -595,3 +595,9 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
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
index 0a582c1cd3..a890f98445 100644
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
@@ -9985,6 +9998,18 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index 203a2dae14..722c4dd00b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -367,9 +367,12 @@ void arm_cpu_register(const ARMCPUInfo *info);
 void aarch64_cpu_register(const ARMCPUInfo *info);
 
 void register_cp_regs_for_features(ARMCPU *cpu);
+void unregister_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
+void destroy_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
+void arm_cpu_unregister_gdb_regs(ARMCPU *cpu);
 void arm_translate_init(void);
 
 void arm_cpu_register_gdb_commands(ARMCPU *cpu);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8ed160cbca..369d7ad135 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1983,6 +1983,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
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
