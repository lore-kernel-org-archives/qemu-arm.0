Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD7C43327
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 18:42:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfMLK-0007K1-Gw; Thu, 02 Jul 2026 14:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMLF-0007Aj-NR
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:55 -0400
Received: from mail-wm2-x01.google.com ([2a00:1450:4864:31::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfML9-0005NJ-Q5
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:53 -0400
Received: by mail-wm2-x01.google.com with SMTP id
 5b1f17b1804b1-493b4e7be03so5474955e9.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783017629; x=1783622429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=X1SJSwyo9KrjLG719g5sDGopyShTHVzbYAFFbtuPlMs=;
 b=JNCDUCiqHU6M/pGeMvJDJSuJ/4BxFWdo/s84vhTXPDH2cqSTWmij9psA/FuFu4mEX7
 IhPYXFKmW3udMell2EDzMqUuRhyBxRjD2aLdCIK8Tq9yGlDeIdptachieqp0+Fu+Zzhw
 K9gn6qlaTAgJOVmtfr6OSA4VfF2VQrd5qqHslBmFYz4w9kn6PHnpMB7m3VjDssyYIbj/
 dAAjc74wA1t1A+/Cp2LNrgmBOw6sS5OZ4rTaxvZD0eHe9heg2tcf+Qyr2J5cFBRP4lxW
 xDTcoUDfv0JtYMQeSz+6odxKjUJFf5UcdUSoWQe/T/zEIgvNs20D5t1lFm/Y4WnOXtNB
 5rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017629; x=1783622429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=X1SJSwyo9KrjLG719g5sDGopyShTHVzbYAFFbtuPlMs=;
 b=Oeo8MX25zZNpqulVffKof16yn84cwZ4RynbXMf6Tr4RWkiLa9nt3dOA1clzJkLOkZS
 VGYk1scjeHdPESMBCKkRQCoppUu3pwipzCwkQC2eh6IugOBVOeuhnZS1MkhoGwfC2+l0
 M9Wfs2FZk4Hqte4jmWSFEJyMIcx0cSVPflhGo5HxJax/Dt0NCEUGv4MxeNknGo2+gqEQ
 e3rZaYw6NUSCZ87vMRZBmprD8bhY8VfNOASoSY95Jhmq6bjXGk2Ixz4vD1Fi38q7flwp
 O2oPbQicUzGKeitBvkbYtqPcX3253KP2p1PCs/ocsdiI6+QpZushPmcaMdePSrv1zJlq
 OJpA==
X-Gm-Message-State: AOJu0Yx7I3RjUlb1jlCQsXRdQFgphMHOH8r59pLXO3hM0E7HWmN58jM/
 BQ6vAirmfzHO+qVvpeS0CLQemcKEx67M0ftNReeVYI9GeoI69kOn156pXIKvhOZMCioto3++acH
 TSm1rXQv0Lond
X-Gm-Gg: AfdE7cmk1nVK6H2CTlIJUB1E1YSXhi6b48FUbZ6770NtzhKAEMdrpwMr81cFLsMUWsI
 HcON2e6C0ZqR58vxrL2shu1I04KojgUmwfcV/48k+5sVMnGrJXljhI50/OJcXf1ObIX1C2iRCmA
 3idD27W+sDxBE0NmBehKeLcZFJaDcI+AZ79mQJih2poYV0a7e9Zxt2oEc9tiPcUD6eWEU+mwsNf
 LMU05H/Lta640DljJOMElRCOQPVJYuQIYKW5KeNKQipKYc2dst/iBJHJx6AKzWg+G+e8l6ayePI
 QIAzzkNM2t1ySwClVLTh465ufRkTo5QxEkITnEFO75KkzkHy0LsY0C12ohhR/CaCaZnae7wEp3a
 l3m8LsWK9RAOJGzXCfpk8Oo/keg2xYjjGTh2R1t8/0+kmwFPHdDtAaNqiUs0b8M+ishiDdIPgC/
 1c3INmlWFfuUNB5nDx0R3/L626Ooi7t4c1Qnya8ncygvrhtRmaeOSDhwsNq/op0KQ9QojMt5swI
 UaI+xRlkKVI/EXjtFp/Pg==
X-Received: by 2002:a05:600c:a4b:b0:493:bef8:ba8 with SMTP id
 5b1f17b1804b1-493c3dfc635mr87444245e9.39.1783017629158; 
 Thu, 02 Jul 2026 11:40:29 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm11628213f8f.13.2026.07.02.11.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:40:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/11] target/arm: Implement CPACR.ASEDIS and HCPTR.TASE
Date: Thu,  2 Jul 2026 19:40:17 +0100
Message-ID: <20260702184019.3431139-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702184019.3431139-1-peter.maydell@linaro.org>
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::1;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm2-x01.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

When executing at AArch32, there are optional trap bits for Neon
instructions in CPACR and HCPTR. We don't currently implement these.

Now we have a separate code path for access checks for Neon insns, we
can straightforwardly add the check there.  We need to track the
target EL for Neon-specific trapping in a new TB flag.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1499
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               |  6 +++
 target/arm/tcg/hflags.c        | 73 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-vfp.c | 16 ++++++--
 target/arm/tcg/translate.c     |  1 +
 target/arm/tcg/translate.h     |  1 +
 5 files changed, 94 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9985f661f8..1741f8e829 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2499,6 +2499,12 @@ FIELD(TBFLAG_A32, NS, 10, 1)
  * This requires an SME trap from AArch32 mode when using NEON.
  */
 FIELD(TBFLAG_A32, SME_TRAP_NONSTREAMING, 11, 1)
+/*
+ * Target EL for a Neon-disabled exception via CPACR.ASEDIS, HCPTR.TASE.
+ * If FPEXC_EL indicates a trap to a lower EL than this, that will
+ * take precedence.
+ */
+FIELD(TBFLAG_A32, NEONEXC_EL, 12, 2)
 
 /*
  * Bit usage when in AArch32 state, for M-profile only.
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 0716ca98fd..ec1b4d78f5 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -164,6 +164,77 @@ static bool sme_fa64(CPUARMState *env, int el)
     return true;
 }
 
+static int neon_exception_el(CPUARMState *env, int cur_el)
+{
+    /*
+     * Return the EL to trap to for A32 Neon specific traps
+     * (CPACR.ASEDIS and HCPTR.TASE). In the pseudocode these
+     * are checked in the same function as the more general trap
+     * bits that we handle in fp_exception_el(). Fortunately it
+     * is always the case that if the trap/enable bits specify
+     * taking an exception to different ELs for the Neon-specific
+     * insns and the general fp insns then the trap to the lower
+     * of the two ELs has priority, so we can calculate the two
+     * target ELs separately and pick the right destination later.
+     * Compare AArch32_CheckAdvSIMDOrFPEnabled().
+     */
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool cpacr_asedis = FIELD_EX64(env->cp15.cpacr_el1, CPACR, ASEDIS);
+    bool hcptr_tase = FIELD_EX64(env->cp15.cptr_el[2], HCPTR, TASE);
+
+    if (arm_feature(env, ARM_FEATURE_NO_NEON_TRAPS)) {
+        /* This CPU doesn't implement the trap bits (Cortex-A8) */
+        return 0;
+    }
+
+    /*
+     * CPACR doesn't exist before v6, but neither does Neon, so we can
+     * assume that if we're testing this then the trap exists.
+     */
+
+    if (arm_feature(env, ARM_FEATURE_EL2) && arm_el_is_aa64(env, 2)) {
+        /*
+         * The AArch64 CPTR_EL2 has no equivalent to HCPTR.TASE; only
+         * an AArch32 EL2 can trap Neon specifically.
+         */
+        hcptr_tase = false;
+    }
+
+    /*
+     * NSACR.NSASEDIS makes the effective values of HCPTR.TASE and
+     * CPACR.ASEDIS be 1 in NonSecure state. NSACR has no
+     * effect unless EL3 exists and is AArch32.
+     */
+    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
+        if (FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            cpacr_asedis = true;
+            hcptr_tase = true;
+        }
+    }
+
+    /* CPACR is ignored if E2H+TGE are both set */
+    if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        if (cpacr_asedis) {
+            if (!arm_el_is_aa64(env, 3)
+                && (cur_el == 3 || arm_is_secure_below_el3(env))) {
+                /* Trap from Secure PL0 or PL1 to Secure PL1 */
+                return 3;
+            }
+            if (cur_el <= 1) {
+                /* trap from EL0 or EL1 to EL1 */
+                return 1;
+            }
+        }
+    }
+
+    /* HCPTR.TASE traps to EL2 */
+    if (cur_el <= 2 && hcptr_tase) {
+        return 2;
+    }
+    return 0;
+}
+
 static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -209,6 +280,8 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, SME_TRAP_NONSTREAMING, 1);
     }
 
+    DP_TBFLAG_A32(flags, NEONEXC_EL, neon_exception_el(env, el));
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 6e944a0322..4db4b14841 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -306,15 +306,25 @@ bool vfp_access_check(DisasContext *s)
 
 /*
  * Access check for Neon; this is for instructions which can be
- * trapped by CPACR.ASEDIS and HCPTR.TASE. Support for those traps
- * is optional and we currently do not implement them, so this
- * is identical to a VFP access check for now.
+ * trapped by CPACR.ASEDIS and HCPTR.TASE.
  */
 bool neon_access_check(DisasContext *s)
 {
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
         return vfp_access_check_m(s, false);
     } else {
+        /*
+         * If the Neon-specific trap bits request a trap to a lower EL
+         * than the general FP trap bits, the trap to the lower EL
+         * has priority.
+         */
+        if (s->neon_excp_el &&
+            (!s->fp_excp_el || s->neon_excp_el < s->fp_excp_el)) {
+            uint32_t syn = syn_a32_fp_access_trap(1, 0xe, 1, 0);
+
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syn, s->neon_excp_el);
+            return false;
+        }
         return vfp_access_check_a(s, false, true);
     }
 }
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c744b16345..587ef09d48 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6375,6 +6375,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->vec_stride = EX_TBFLAG_A32(tb_flags, VECSTRIDE);
         dc->sme_trap_nonstreaming =
             EX_TBFLAG_A32(tb_flags, SME_TRAP_NONSTREAMING);
+        dc->neon_excp_el = EX_TBFLAG_A32(tb_flags, NEONEXC_EL);
     }
     dc->lse2 = false; /* applies only to aarch64 */
     dc->cp_regs = cpu->cp_regs;
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 462d4c1c74..2eebef76bb 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -88,6 +88,7 @@ typedef struct DisasContext {
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sme_excp_el; /* SME exception EL or 0 if enabled */
     int zt0_excp_el; /* ZT0 exception EL or 0 if enabled */
+    int neon_excp_el; /* A32 Neon exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
     int svl;         /* current streaming vector length in bytes */
     int max_svl;     /* maximum implemented streaming vector length */
-- 
2.43.0


