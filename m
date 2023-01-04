Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305693ejb;
        Wed, 4 Jan 2023 14:01:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs6kqyRvEFVLe64ZST+gEsHEUSRWP5WVzJQFzJ+gDIHrd9i8D02DdWz7Dk5BI4M3PMBwncP
X-Received: by 2002:a5d:420c:0:b0:291:b891:5c1b with SMTP id n12-20020a5d420c000000b00291b8915c1bmr12348082wrq.18.1672869677309;
        Wed, 04 Jan 2023 14:01:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869677; cv=none;
        d=google.com; s=arc-20160816;
        b=sM04BAJ3txpdZDmLkksohm+KP2LapHfuncct5dQZsrutdq+tm+IfY9x5CYVXo7Q0pv
         5GhEH3lNBWAjrcroi8DijLvNPOeA0ih4xX3BIP/oWYBaoojCe2nmZYVXfIX/gXkigziy
         6OaUJqtKnGrRKfO9tLDPzZahP0hy0sVPgEBIGb9art3UjN6MJX9PhFRTwb7QeqMeoaEE
         AIgeRGOwTOJMgIuPNBi0e7El+vbdE1u8HUWEU4wN38kW48WSx1ojZBVVI8r5wa+FIN8I
         Y8oi3VBN3Iotp8P51kxsvxXGnropilIKJl9muqJvVH6i3hE7+HqGkMLL9B4PpHSvfcQF
         lcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=FQWKf42WdYIRelmjsSpz3+3V2eDmolRC00cxxxE3GbI=;
        b=LjzXanFznVZvPbJwz8fS8jTHGS16BH6+07RQBR2u5Dd9NCY1RqzdR83FMvlMTkmifJ
         QJdgThixTGlMGArXqbQoNqD+wdFT/75sXP4zEeQERtdwezyD+g0Wt6Kaax+DAO7sYdZb
         QpHhd/XzaVMTrEs1AZXyVHw3ghyCIrtlLRkoteL8fg1hwv3gBVkqgBpuBJmZDd9UFbUL
         9oEb09sF2FjxQIF/pR3srHs1rL6rJ3bMme+mMiOM2WjwNv7bXGnglCvy13ju8H/5ICw5
         Ht+uYxhhDifZdUwWAAhowuvEBuSkgjCBLWCvLUo6LEK/Qo7eQfIthful0Yh4PvAFOphf
         d7wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="Q0/rWGlB";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id n11-20020a056000170b00b0027cdca8fbc5si17205052wrc.95.2023.01.04.14.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:17 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="Q0/rWGlB";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E40724D802;
	Wed,  4 Jan 2023 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQWKf42WdYIRelmjsSpz3+3V2eDmolRC00cxxxE3GbI=;
	b=Q0/rWGlBGyUEdAW8vyMeTYQ/J+R5baRSM3beg7Jc0lqCnjKIlqGF79WFGUeWa3eAhIXo/N
	hVuSqXuX5dNg9T10ehrZzAu0OPD6qZK05TS860faYgS866/DTQl/YhUY38cSH856rCkDqg
	JZL+kyFpqgjDUWOmJLNOBehTBueQZc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869676;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQWKf42WdYIRelmjsSpz3+3V2eDmolRC00cxxxE3GbI=;
	b=lde44PVCRW4Fr0uo0Ww52oAvlC9o74l9dV3dg0uT7CsW0Vd1yCQDPFsCv7f/0LsL/0Keh5
	7gdE/2H2wMYEpuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 386321342C;
	Wed,  4 Jan 2023 22:01:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QC+kACr3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:14 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH 11/27] target/arm: only perform TCG cpu and machine inits if TCG enabled
Date: Wed,  4 Jan 2023 18:58:19 -0300
Message-Id: <20230104215835.24692-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EfdttFi9Qroe

From: Claudio Fontana <cfontana@suse.de>

of note, cpreg lists were previously initialized by TCG first,
and then thrown away and replaced with the data coming from KVM.

Now we just initialize once, either for TCG or for KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[moved arm_cpu_register_gdb_regs_for_features out of tcg_enabled]
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu.c     | 31 +++++++++++++++++-------------
 target/arm/kvm.c     | 18 +++++++++---------
 target/arm/kvm_arm.h |  3 +--
 target/arm/machine.c | 45 +++++++++++++++++++++++++-------------------
 4 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f5381af437..5a132aa7bc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -524,9 +524,11 @@ static void arm_cpu_reset_hold(Object *obj)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+        arm_rebuild_hflags(env);
+    }
 }
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
@@ -1599,6 +1601,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     {
         uint64_t scale;
 
@@ -1624,7 +1627,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1942,17 +1946,16 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_PMU);
     }
     if (arm_feature(env, ARM_FEATURE_PMU)) {
-        pmu_init(cpu);
-
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
+            pmu_init(cpu);
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
             arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
-        }
 
 #ifndef CONFIG_USER_ONLY
-        cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
-                cpu);
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
+                                          cpu);
 #endif
+        }
     } else {
         cpu->isar.id_aa64dfr0 =
             FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
@@ -2048,11 +2051,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }
 
-    register_cp_regs_for_features(cpu);
+    if (tcg_enabled()) {
+        register_cp_regs_for_features(cpu);
+        init_cpreg_list(cpu);
+    }
+
     arm_cpu_register_gdb_regs_for_features(cpu);
 
-    init_cpreg_list(cpu);
-
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     unsigned int smp_cpus = ms->smp.cpus;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..2f01c26f54 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -438,9 +438,11 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
     return &cpu->cpreg_values[res - cpu->cpreg_indexes];
 }
 
-/* Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
+/*
+ * Initialize the ARMCPU cpreg list according to the kernel's
+ * definition of what CPU registers it knows about.
+ *
+ * The parallel for TCG is init_cpreg_list()
  */
 int kvm_arm_init_cpreg_list(ARMCPU *cpu)
 {
@@ -482,12 +484,10 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         arraylen++;
     }
 
-    cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
-    cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, arraylen);
-    cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
-                                         arraylen);
-    cpu->cpreg_vmstate_values = g_renew(uint64_t, cpu->cpreg_vmstate_values,
-                                        arraylen);
+    cpu->cpreg_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_values = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_values = g_new(uint64_t, arraylen);
     cpu->cpreg_array_len = arraylen;
     cpu->cpreg_vmstate_array_len = arraylen;
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..41de2a7cf1 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -70,8 +70,7 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
  * @cpu: ARMCPU
  *
  * Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
+ * definition of what CPU registers it knows about.
  *
  * Returns: 0 if success, else < 0 error code
  */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index a186787d2b..5ac1e6173a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -687,7 +688,7 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -722,7 +723,7 @@ static int cpu_post_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_finish(&cpu->env);
     }
 
@@ -741,7 +742,7 @@ static int cpu_pre_load(void *opaque)
      */
     env->irq_line_state = UINT32_MAX;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -820,27 +821,28 @@ static int cpu_post_load(void *opaque, int version_id)
         return -1;
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
 
-    /*
-     * TCG gen_update_fp_context() relies on the invariant that
-     * FPDSCR.LTPSIZE is constant 4 for M-profile with the LOB extension;
-     * forbid bogus incoming data with some other value.
-     */
-    if (arm_feature(env, ARM_FEATURE_M) && cpu_isar_feature(aa32_lob, cpu)) {
-        if (extract32(env->v7m.fpdscr[M_REG_NS],
-                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4 ||
-            extract32(env->v7m.fpdscr[M_REG_S],
-                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4) {
-            return -1;
+        /*
+         * TCG gen_update_fp_context() relies on the invariant that
+         * FPDSCR.LTPSIZE is constant 4 for M-profile with the LOB extension;
+         * forbid bogus incoming data with some other value.
+         */
+        if (arm_feature(env, ARM_FEATURE_M) &&
+            cpu_isar_feature(aa32_lob, cpu)) {
+            if (extract32(env->v7m.fpdscr[M_REG_NS],
+                          FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4 ||
+                extract32(env->v7m.fpdscr[M_REG_S],
+                          FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4) {
+                return -1;
+            }
         }
-    }
 
-    if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
+        arm_rebuild_hflags(&cpu->env);
     }
-    arm_rebuild_hflags(&cpu->env);
 
     return 0;
 }
@@ -890,8 +892,13 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+#ifdef CONFIG_TCG
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
+#else
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+#endif /* CONFIG_TCG */
         {
             .name = "power_state",
             .version_id = 0,
-- 
2.35.3
