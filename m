Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8EFC5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 12:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvwcC-0003f5-Lo; Mon, 17 Aug 2026 08:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc9-0003eI-AR
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvwc5-0001FB-49
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 08:38:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so26554345e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786970327; x=1787575127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LO1qIWf+firKfiFWba3ZmAKRvyjIfzdeRrNOPMzQdWY=;
 b=DL7qnlJiuRV4L6ZxpBWD1tHCTCJynZX/BqX1mLoP6Man/UG1j1qmTFUZK85Nbu7atk
 dBgPs6JgAlAwp/fgcHRQjmwV2YpJz8K7aE6l98v/JxcWt58kkTpkCDuBfREKN35yivYX
 m+nUrzZEUeJO1NzF/ynVjqnOu4K5NlT9oGDBtsRHRTSt2aT663P3R35XBnKXBVrODYYn
 lZmLs+CL2RyFfeX+r0sk6iTEfbh8+DOpKTeVEEt0eCMgrRBLBAEarl0cSgU4wslEblMw
 ir7dA1cevt03Yc/Txl0Tj7J6/Cl2jPMHAyYymjcnG/HiQMWt6sjv5bIC0oDsZvdBpdOG
 MLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786970327; x=1787575127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LO1qIWf+firKfiFWba3ZmAKRvyjIfzdeRrNOPMzQdWY=;
 b=Do8tGku7aP7nskhBX8/u2kbi5ac7Kt1+nMRzhDnkPxqGNVjo93FUKM7JGfrVifRpVW
 zX6cxufBVcfMFatmjbKsojlKlux3Zvnogl2dqZQseviXI4AewvT4F/YIY23fzt4uZ3qq
 xeK5ZaH0gprZZTocCr25drJoNGlrqZYuSIB/DXvea3CY5OY9lJVXKJJtrH6jzDra1xSo
 ASZcxVn9uGRM5rKiZBKPe+YWgfw1P1TeMoGVr5tJM6gkwoYKVrz29kDxaJ8DYhZ/UxVF
 rvMxjaUANUILbn1uEbFwrdnGLaq0PEcyvpJC5AiPXqIrAG6cANCR+mZuRCFfi1+tvdof
 XpOw==
X-Gm-Message-State: AOJu0YzcM4Fs2I5gHO0vqQRlxGMcYeQNqM0P2z0FHOIO5uUxmUqZV/Zo
 tnJq/D0xZ0TmGlFtv0h66R8zNTDlS8JCgMnw8ag0p6/5uijUD7gZHki1BmWslFpazvNnn4N/Viq
 pQksM
X-Gm-Gg: AR+sD12OwYpQBNQTcx3oyzfgmKbqmHoue/J/COX+Kj37Dk0wxOiOfBEUifMfs7I0BeM
 cIJkW8JgbqUQKCnsQotrMIDrPTw0D5Ez20Fqe4J43sdLv+BlvJ2aw7acU4Bcq4AI8Y1TvbWk9uW
 uw7RbIVQ48AML/hJQ7GYBFpWA9qHABIJofXKjWqxy+rVVII6i8Cz853/q/CQI+VZbk/LNPkmDzQ
 ziqWRI/jGDR5dbFul+efWG7/vQ0Ir1Y903Uab+Fr+PIO8eX0C3Fn6xD2Ns8W/IdJpI/MOw6wfBC
 BTyCHx0sIGJ84tysXi1J8l3NcvIcGL5enlDYyj5fP847a5owljD1GYMGLAqO4g/QE0lONmY9h2U
 qRua8PBKRmrJitvAehkwt5/Et3A2lR+F4lwtAORoR1M3WeNKUeIMm/rb4h5tZENpGnfYpQ6Ve/h
 G7xTvJeKdkuC+S8L2MovdXSKWzmqhU9pvcF7SW7eSvQUrii5AjhpIpcLKu29hMdr21s2HSeW3QS
 Is/gX0M+sc8ZQQb0L3GjYlz+Eo6WiqlIy6JtXtzv72bYF5M2hneQumnHA6Aa/33FOW9Ug==
X-Received: by 2002:a05:600c:4fc9:b0:499:79c3:4b55 with SMTP id
 5b1f17b1804b1-4998797befamr364113345e9.18.1786970327402; 
 Mon, 17 Aug 2026 05:38:47 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998780397dsm120415055e9.3.2026.08.17.05.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 05:38:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/8] target/arm: Implement CPACR.ASEDIS and HCPTR.TASE
Date: Mon, 17 Aug 2026 13:38:35 +0100
Message-ID: <20260817123838.1578060-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817123838.1578060-1-peter.maydell@linaro.org>
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
 target/arm/tcg/hflags.c        | 82 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-vfp.c | 16 +++++--
 target/arm/tcg/translate.c     |  1 +
 target/arm/tcg/translate.h     |  1 +
 5 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4f07332543..afc3fda3b8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2506,6 +2506,12 @@ FIELD(TBFLAG_A32, NS, 10, 1)
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
index 0716ca98fd..14824e3dff 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -164,6 +164,86 @@ static bool sme_fa64(CPUARMState *env, int el)
     return true;
 }
 
+static int neon_exception_el(CPUARMState *env, int cur_el)
+{
+    /*
+     * Return the EL to trap to for A32 Neon specific traps
+     * (CPACR.ASEDIS and HCPTR.TASE). In the pseudocode these are
+     * checked in the same function as the more general trap bits that
+     * we handle in fp_exception_el(). Fortunately it is always the
+     * case that if the trap/enable bits specify taking an exception
+     * to different ELs for the Neon-specific insns and the general fp
+     * insns then the trap to the lower of the two ELs has priority,
+     * so we can calculate the two target ELs separately and pick the
+     * right destination later.  Compare AArch32_CheckAdvSIMDOrFPEnabled().
+     *
+     * CPACR doesn't exist before v6, but neither does Neon, so we can
+     * assume that if we're here testing this then the register exists.
+     * HCPTR always exists if EL2 is present.
+     */
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool cpacr_asedis = FIELD_EX64(env->cp15.cpacr_el1, CPACR, ASEDIS);
+    bool hcptr_tase = FIELD_EX64(env->cp15.cptr_el[2], HCPTR, TASE);
+    bool have_aarch32_el3 =
+        arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3);
+
+    if (!arm_feature(env, ARM_FEATURE_NEON_TRAPS)) {
+        /* This CPU doesn't implement the trap bits (Cortex-A8) */
+        return 0;
+    }
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
+     * We know we're in AArch32, but if this is EL0 and EL1 is AArch64
+     * then CPACR_EL1 applies rather than CPACR, and it doesn't have
+     * ASEDIS (instead using the same bit for TCPAC).
+     */
+    if (cur_el == 0 && arm_el_is_aa64(env, 1)) {
+        cpacr_asedis = false;
+    }
+
+    /* CPACR is ignored if E2H+TGE are both set */
+    if ((hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+        cpacr_asedis = false;
+    }
+
+    /*
+     * NSACR.NSASEDIS makes the effective values of HCPTR.TASE and
+     * CPACR.ASEDIS be 1 in NonSecure state. NSACR has no
+     * effect unless EL3 exists and is AArch32.
+     */
+    if (have_aarch32_el3 && cur_el <= 2 && !arm_is_secure_below_el3(env)) {
+        if (FIELD_EX32(env->cp15.nsacr, NSACR, NSASEDIS)) {
+            cpacr_asedis = true;
+            hcptr_tase = true;
+        }
+    }
+
+    if (cpacr_asedis) {
+        if (have_aarch32_el3 && (cur_el == 3 || arm_is_secure_below_el3(env))) {
+            /* Trap from Secure PL0 or PL1 to Secure PL1 */
+            return 3;
+        }
+        if (cur_el <= 1) {
+            /* trap from EL0 or EL1 to EL1 */
+            return 1;
+        }
+    }
+
+    /* HCPTR.TASE traps to EL2, including for execution at EL2 */
+    if (hcptr_tase && cur_el <= 2) {
+        return 2;
+    }
+    return 0;
+}
+
 static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -209,6 +289,8 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
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
index 055f3c5b40..ebd917f16c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6403,6 +6403,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->vec_stride = EX_TBFLAG_A32(tb_flags, VECSTRIDE);
         dc->sme_trap_nonstreaming =
             EX_TBFLAG_A32(tb_flags, SME_TRAP_NONSTREAMING);
+        dc->neon_excp_el = EX_TBFLAG_A32(tb_flags, NEONEXC_EL);
     }
     dc->lse2 = false; /* applies only to aarch64 */
     dc->cp_regs = cpu->cp_regs;
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a3d03159ad..cce84f29c4 100644
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


