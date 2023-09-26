Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp995089ejc;
        Tue, 26 Sep 2023 03:37:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwWjfTfgCPl+9LcC8LognyDar5KtBzI606bSbHcL02geQ+7dxF1d6IcXSv6OkGvgf4A16f
X-Received: by 2002:a5d:56c9:0:b0:31f:db15:e9d8 with SMTP id m9-20020a5d56c9000000b0031fdb15e9d8mr8653320wrw.3.1695724657053;
        Tue, 26 Sep 2023 03:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695724657; cv=none;
        d=google.com; s=arc-20160816;
        b=jLumZWaXhazyBoBqF2Ty78o3ZH729szuu2sgkyYR7snCMpOsXjZzLRjEXXk69Q/aAI
         rXQ62ubi/Wtbk6hWoIGLlXTB1PDw+pOeNjWyAuhd/HhBaNyWwVnFNOEmYFlbcqvC/8NP
         jHep54EJqmfwBekz5l6ljm4AwAA50VZAvC+7UvB65MKm4vpmKovOvEwUa1JSGckPn4ck
         JhLVTTmQw7l9poSoMAvKtdqz1gMBmwC9sOY5wG6c5Ps0UgAG4R/DfCwrtnb0Nd9llieS
         pOl721CuZLzWsik5a4Nel6oBm67VuZJlw+71ExYR/2Pd6/IDVoMNLLEorR2V9ybuL+ar
         Xccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=5lHvOA8aSk5be7Neeo4mOvpuo0WVg0rrQEJc5+JqTSY=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=FCUqtOmxmK0LBdLcQ2IsRUnjg+m09w62VPDwRLQgOvFdJ5qqHIw/ECqi6FJ1pJKQgZ
         UqgBZgNWaECXpZPd8NhSX6ofscdV8XpMlVuQh/rQIC2s32Cm1K5bag3oC7Bh/NVT5wZd
         mZPrjxXc+HWXBZgG9mc98KO1ZOxJgYgsm2ykRd0zFj56c3OADhqR6jewegByx4Ohw84W
         D3MGQYM6+TWc+C9dnL6egssTX/yU6gXZ2Arame+tfuqpIsYtVrXdMtwMqxMPRieQDIEr
         9ic80eyuQDjS6cZRfFLL+uUyKN0ySAtZQr5Vy7Ut8MlKPhrcwS3R712FqA8qWJSBgFSn
         5j6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id e18-20020a5d4e92000000b003232848429dsi2247102wru.589.2023.09.26.03.37.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rvwzn104Qz6J7yr;
	Tue, 26 Sep 2023 18:32:37 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:37:17 +0100
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
Subject: [PATCH RFC V2 32/37] target/arm: Add support of *unrealize* ARMCPU during vCPU Hot-unplug
Date: Tue, 26 Sep 2023 11:36:49 +0100
Message-ID: <20230926103654.34424-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: v+2Tl3ISePk+

vCPU Hot-unplug will result in QOM CPU object unrealization which will do away
with all the vCPU thread creations, allocations, registrations that happened
as part of the realization process. This change introduces the ARM CPU unrealize
function taking care of exactly that.

Note, initialized KVM vCPUs are not destroyed in host KVM but their Qemu context
is parked at the QEMU KVM layer.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
[VP: Identified CPU stall issue & suggested probable fix]
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/cpu-qom.h   |   3 ++
 target/arm/cpu.c       | 101 +++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h       |  13 ++++++
 target/arm/gdbstub.c   |   6 +++
 target/arm/helper.c    |  25 ++++++++++
 target/arm/internals.h |   1 +
 target/arm/kvm64.c     |   4 ++
 7 files changed, 153 insertions(+)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 514c22ced9..2503493710 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -54,6 +54,7 @@ struct ARMCPUClass {
 
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
     ResettablePhases parent_phases;
 };
 
@@ -70,7 +71,9 @@ struct AArch64CPUClass {
 };
 
 void register_cp_regs_for_features(ARMCPU *cpu);
+void unregister_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
+void destroy_cpreg_list(ARMCPU *cpu);
 
 /* Callback functions for the generic timer's timers. */
 void arm_gt_ptimer_cb(void *opaque);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3a2e7e64ee..93b00835bf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -141,6 +141,16 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
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
@@ -152,6 +162,16 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
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
@@ -2244,6 +2264,85 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -2347,6 +2446,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, arm_cpu_realizefn,
                                     &acc->parent_realize);
+    device_class_set_parent_unrealize(dc, arm_cpu_unrealizefn,
+                                      &acc->parent_unrealize);
 
     device_class_set_props(dc, arm_cpu_properties);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d51d39f621..9fe89cf10a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3264,6 +3264,13 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
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
@@ -3276,6 +3283,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
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
index f421c5d041..fecbd84ba6 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -580,3 +580,9 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
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
index 50f61e42ca..272d6ba139 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -262,6 +262,19 @@ void init_cpreg_list(ARMCPU *cpu)
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
 /*
  * Some registers are not accessible from AArch32 EL3 if SCR.NS == 0.
  */
@@ -9279,6 +9292,18 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
 /* Sort alphabetically by type name, except for "any". */
 static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
 {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0f01bc32a8..fe330e89e7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -183,6 +183,7 @@ static inline int r14_bank_number(int mode)
 }
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
+void arm_cpu_unregister_gdb_regs(ARMCPU *cpu);
 void arm_translate_init(void);
 
 void arm_restore_state_to_opc(CPUState *cs,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 364cc21f81..38de0b4148 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -651,6 +651,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
+    if (cs->thread_id) {
+        qemu_del_vm_change_state_handler(cs->vmcse);
+    }
+
     return 0;
 }
 
-- 
2.34.1
