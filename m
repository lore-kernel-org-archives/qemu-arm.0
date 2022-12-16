Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1721380ejb;
        Fri, 16 Dec 2022 13:32:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jz9eD3P6aH3m28k+rpGXFk8LHqtmV4yTKtmcVtmCG1XjgD8ehyZYZtgB/gu0pzTpNRBGl
X-Received: by 2002:adf:e544:0:b0:242:5469:55dd with SMTP id z4-20020adfe544000000b00242546955ddmr21282781wrm.36.1671226325350;
        Fri, 16 Dec 2022 13:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671226325; cv=none;
        d=google.com; s=arc-20160816;
        b=O6LRxE7uLWmqdrEOda9vVD+nV3mKX77+9vmrT5K5W/BCBCsYDja4Sf88lh3Ci0/a3S
         uC4Cr4Z1U0C7Yd+tIesRLGRvnXvFCGmoLcX7kUU5V24MozmU6/OajoGrh9/SU1bZSxoV
         CfZkni2SVoeQJi6Zi2dziK4fSu+CPVwSh4C7JQVKD9ev4NJgzF+fcdMkv3gWpqi3gkms
         3CKENMgyi2yQkIu0n01JTnUfWJ2ft+YSoj4gUumafCht9KvVJAdOYTAMM3reDIQIqZY7
         nesIIhkaOHZsHE1sEEs1UQebs7Ew94JRsUcxOfa25x1wiIuz2hMTNhwO2tBMHA6lJWkg
         F5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=oaMji3BzjI1LDTZ9j5iQcgfYvZl5G6sjaUFCXl3i2g8=;
        b=s8iR4+0VyQKpKTjTb/Rp+vl7AH+Prljjz0tLJ3Kvg8N06CZuP4Ufcfp/LMJOmM90pX
         sq0a6pE8R+5DlPxAQYQUxuum1wJyHGeVRDobP6Ft2v9Maf4KwTMkozxtQJPT9f3faJTA
         oTKvRbC3TKEGnfm7QOZc26UdTk2Zd2vyk3YwgMn5nNds7sLdmiZt+eLDzz8AhEpFfz5u
         /gxDmoYU2jgpdWMTjp1d8zX737wWYgYLRCpEFhNtDpf+RQrNeuYWf3Ln2n5Ke+tGdwW0
         HDprW6YuVA6IJszMI5Km7IqOqMVLdUcSqu4sU8iORKfKKJHfN6I8uDCn+SCcO39zBd+X
         xJ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cDzgkl87;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id bv10-20020a0560001f0a00b0022e4c5d0004si3256891wrb.435.2022.12.16.13.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 13:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cDzgkl87;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD4DB5D972;
	Fri, 16 Dec 2022 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671226324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaMji3BzjI1LDTZ9j5iQcgfYvZl5G6sjaUFCXl3i2g8=;
	b=cDzgkl87KhpljZie7uTde9BEePAMjXe8dxXZt0/Ya6gGHiOWUewVp4oVnWRt4USXFrFJ8N
	ESEaGvyeVBubnwNyJ5Li/aWgdWqkJbleVF+TBl6p3nYEf2Bv881+bxuMHclAZkDnRutlO2
	WVphC5t9AmEM0yxHW01C1ihIHE6/SbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671226324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaMji3BzjI1LDTZ9j5iQcgfYvZl5G6sjaUFCXl3i2g8=;
	b=KUPx8av4bI86SHzKDjoTLf0AX0T7KguYqPKHs0Yt9hePJvEq1DFF2xiP24907OMAIspdMB
	Ps6cPGYTbA4onrBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E027138FD;
	Fri, 16 Dec 2022 21:32:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4AVRBdLjnGPAHwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 21:32:02 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 5/5] target/arm: only perform TCG cpu and machine inits if TCG enabled
Date: Fri, 16 Dec 2022 18:29:44 -0300
Message-Id: <20221216212944.28229-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216212944.28229-1-farosas@suse.de>
References: <20221216212944.28229-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PfK9TDLOn25k

From: Claudio Fontana <cfontana@suse.de>

of note, cpreg lists were previously initialized by TCG first,
and then thrown away and replaced with the data coming from KVM.

Now we just initialize once, either for TCG or for KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
[moved arm_cpu_register_gdb_regs_for_features out of tcg_enabled]
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
We still need to tell GDB about the register sets even when running
with KVM.

Originally from:
[RFC v14 16/80] target/arm: only perform TCG cpu and machine inits if
TCG enabled
https://lore.kernel.org/r/20210416162824.25131-17-cfontana@suse.de
---
 target/arm/cpu.c     | 31 ++++++++++++----------
 target/arm/kvm.c     | 18 ++++++-------
 target/arm/kvm_arm.h |  3 +--
 target/arm/machine.c | 61 ++++++++++++++++++++++++--------------------
 4 files changed, 62 insertions(+), 51 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 38d066c294..a0c77ba153 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -523,9 +523,11 @@ static void arm_cpu_reset(DeviceState *dev)
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
 
 #ifndef CONFIG_USER_ONLY
@@ -1597,6 +1599,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     {
         uint64_t scale;
 
@@ -1622,7 +1625,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1940,17 +1944,16 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -2046,10 +2049,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
index 54c5c62433..4cc4468d3e 100644
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
 
@@ -811,36 +812,37 @@ static int cpu_post_load(void *opaque, int version_id)
         }
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
 
-    /*
-     * Misaligned thumb pc is architecturally impossible.
-     * We have an assert in thumb_tr_translate_insn to verify this.
-     * Fail an incoming migrate to avoid this assert.
-     */
-    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
-        return -1;
-    }
+        /*
+         * Misaligned thumb pc is architecturally impossible.
+         * We have an assert in thumb_tr_translate_insn to verify this.
+         * Fail an incoming migrate to avoid this assert.
+         */
+        if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+            return -1;
+        }
 
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
