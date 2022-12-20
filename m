Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4678713ejb;
        Tue, 20 Dec 2022 14:06:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRAKZ1dtUwwnqbzPHCW9CDeW+qLalQOcCAcbE9qY3rICRCXVx1vgxAbvc0CIQl4E8V3MZC
X-Received: by 2002:a05:600c:3d11:b0:3d3:4aa6:4fd0 with SMTP id bh17-20020a05600c3d1100b003d34aa64fd0mr11931505wmb.6.1671574008847;
        Tue, 20 Dec 2022 14:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671574008; cv=none;
        d=google.com; s=arc-20160816;
        b=c3JH6aCQgMDTLvaEgFtG5GdnvWs1oFIqd9uEpyU8GphufYkFFm89vpwdOwOSHQR7ZC
         01Rw6W2ut0/O3ayJAr4BUAc0RvUYQoZD9ExkPWwc0TUOvXrP2+3PeGQQAFHebrvpo4W3
         JX0hMx2IUsO+r4ssSI3i4eTQUgtBZBrh56JjQzkIu8y4CRW7REb46+WoVRO10u7X6IYc
         6/1wiEd2dpABihjaHvXWPIoT60eGE6eRJ60cx4EsVwbH9+NRlOoh4CloKdqNJQeC74oi
         EpQ/sIanMKvh6miKIgxIbM+3zrzWupoDMFLOVDOW8uHeXiGKmmUFJG7kUwKod7R0mEj2
         XgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=uNooRhtg57jwueZDg2HkPFfIvQcQ1FUxw6N+xDzNzjc=;
        b=bro9d48ZedOKVtH7oyw8Kcg+fqfaHgOeYuBKemzaYAc/fBDF+LtHDk4jE/az26fLLL
         fKa/i3xkm7cEWa+yzqZIVOUa+/LHlmwGhRvzShWY0Gw58H9OMJTTjBrCuwUlMja71V4+
         Bc4Enhq3dtNm3qQJL69f/PKcsyBGYZslfZaaOZVDuqJ34fbYwbq+8ulCX47IyDFInuW1
         tPR5i8yujgQkkp8TEgyvuZwdjlNcoP1oNg9/wPbyLJWlPPGg64XJRD+YiVWSNI8oYKyq
         Muw94HTzWAFjhpqF/J7zU7x/7V1W27YS13GPc4kHlE2c5uohgcwFDBZhhMO01jvpFHR+
         u9aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZjFyKStg;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id m25-20020a05600c3b1900b003c0e4cafb8csi48012wms.161.2022.12.20.14.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 14:06:48 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZjFyKStg;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B18D76A4A;
	Tue, 20 Dec 2022 22:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671574008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNooRhtg57jwueZDg2HkPFfIvQcQ1FUxw6N+xDzNzjc=;
	b=ZjFyKStgZIG4w5VtecSY3HY3t9sRva9i42R+iLExDXf5Ge541G4aYWgDPUZ+Ica3gIkwO3
	ANNN9WB69k5CjVd+12IXJVUoRwO29FMSLVgqtrtjSGMfh28NPVFwACHsbwZ1CGsaWPRcZ+
	VkQV1yMFpfHVof420vQ6tSdTkmQXN0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671574008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNooRhtg57jwueZDg2HkPFfIvQcQ1FUxw6N+xDzNzjc=;
	b=TuAuMyq4RMxDU16RnMD4lEl3MXZ/wY2Bf/g1rc5eZD43TkTx4JbRGya1qPGdmLK8PCjAlX
	HJx48XYDxxFnwoAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 847BB13254;
	Tue, 20 Dec 2022 22:06:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IKAtEvUxomPwfAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 22:06:45 +0000
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
Subject: [PATCH v2 5/5] target/arm: only perform TCG cpu and machine inits if TCG enabled
Date: Tue, 20 Dec 2022 19:04:26 -0300
Message-Id: <20221220220426.8827-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221220220426.8827-1-farosas@suse.de>
References: <20221220220426.8827-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cczhqltTWICl

From: Claudio Fontana <cfontana@suse.de>

of note, cpreg lists were previously initialized by TCG first,
and then thrown away and replaced with the data coming from KVM.

Now we just initialize once, either for TCG or for KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
[moved arm_cpu_register_gdb_regs_for_features out of tcg_enabled]
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Originally from:
[RFC v14 16/80] target/arm: only perform TCG cpu and machine inits if
TCG enabled
https://lore.kernel.org/r/20210416162824.25131-17-cfontana@suse.de
---
 target/arm/cpu.c     | 31 +++++++++++++++++-------------
 target/arm/kvm.c     | 18 +++++++++---------
 target/arm/kvm_arm.h |  3 +--
 target/arm/machine.c | 45 +++++++++++++++++++++++++-------------------
 4 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2fa022f62b..fdf30e7268 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -525,9 +525,11 @@ static void arm_cpu_reset_hold(Object *obj)
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
@@ -1600,6 +1602,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     {
         uint64_t scale;
 
@@ -1625,7 +1628,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1943,17 +1947,16 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -2049,10 +2052,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }
 
-    register_cp_regs_for_features(cpu);
-    arm_cpu_register_gdb_regs_for_features(cpu);
+    if (tcg_enabled()) {
+        register_cp_regs_for_features(cpu);
+        init_cpreg_list(cpu);
+    }
 
-    init_cpreg_list(cpu);
+    arm_cpu_register_gdb_regs_for_features(cpu);
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
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
