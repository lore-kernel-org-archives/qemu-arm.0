Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3918245wrx;
        Tue, 16 Apr 2019 06:18:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRTvV4xqr3Hg8/wzqkG4irPy3oyg88/AAOoXrtGdV8ZO+4WEAtLrHY5ICuSJzpZZyXEqc0
X-Received: by 2002:a5d:6646:: with SMTP id f6mr5322103wrw.68.1555420738592;
        Tue, 16 Apr 2019 06:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420738; cv=none;
        d=google.com; s=arc-20160816;
        b=mPsOhm8jS/pEEQdDAyoo8RcxyrGJj+5gqB3XncEcl2tObJEogFNNg2NLhAsqOD5B/l
         DZ3YJKpWmD6FiGgAtkumLe6cHR9bU6InwZSUU67lrArWi7UZrHNAfUz5uyzUwzTPuoKG
         2eJJr3DTb1iPLLl9nzc2uBKhVY2TiYgBHLuvf1xNq1XcEGfZvZPzOIYqW6X5aP1Bm7u+
         exusTSKRe8DNucvOv6vxCi/CPloY2mK/8E7aYacoyHCZ032fO5dXHWyNwoMi5EkUtGYW
         4nKKvGUxxwYuSulh6Df3mId0qaySF1hVLZJt6QqvI7SUYn5L7sYmCZ6WRftzIg0LJ6cG
         sp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=vgFUR6xcpc3B+FPhUs+qoTJrY4/JQVuVV6lizjvsuwM=;
        b=N6pN/tsbmrjVmy6Xttb0H8IcvNK3lCPnLZ2fq2hZGUxKnArtGFcdqvJYoNt7aC2vDc
         KQojoKAMjZCz8rrZ7Yc/REc7lQf3ljhKL82vBeI/IYzIU9ZgOmLhC1Zs7RkYMFwOBxXE
         nbIJGtOqa5osxXyRIV3OUKRHWzFzmDpDmDjYqXWoot/Vp4HXIiaKd9y77Abm1LCX2AoD
         zzAmtXgMCJCvj6tld/q37adXvOx1GxvVtthmBdp5sBNjD5lTiLy40pVVJkGRAOOYB3tm
         jLucZtBmRcMGJ2gm30TTrGQDqMnb7C2fiPpPduCep8AIVoUmYiA9tCFYTA6ofA82a1N8
         Gp8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoesVOvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p193si12667136wme.184.2019.04.16.06.18.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:18:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoesVOvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNzF-0004Jo-Gw
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:18:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfa-00058S-KX
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfY-0001WX-Js
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:38 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfW-0001TH-H4
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:34 -0400
Received: by mail-wm1-x344.google.com with SMTP id r186so2294520wmf.1
	for <qemu-devel@nongnu.org>; Tue, 16 Apr 2019 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vgFUR6xcpc3B+FPhUs+qoTJrY4/JQVuVV6lizjvsuwM=;
	b=UoesVOvuSQSma5E7cyukhcTuimUQWZM716eqHftc6ei1Qml7paVyX5WBXpCROSUpwv
	6zRK7ZLk2i9UhVoEctgibuL28jkJO3b2bIYYaJjMayHTfWaHxQBN49kl+uOoxDuY+IBW
	DVW2BROcnujW27urJubHvY5BHZXgYlv7wPnEFkKTy/emDOIuWaW+BKRxDgD5afZIZNtk
	VENfzuoGKiKw9wr/+TEJcRwXlNctzd8/Xym+kRN3BVmX+/8TSiE4qoevxgXvEtfOw3Dj
	Z0TBUjAP/OvV3SNccClnoovV7N1tTmHRazndQEWwQaTWF2pN52Ozy8NfEkgPX7xN3K01
	lJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vgFUR6xcpc3B+FPhUs+qoTJrY4/JQVuVV6lizjvsuwM=;
	b=KTpwxgTNGmVnNwF5D2sVFBic6PYAfJsAZNttJFvVNHA5bKOKybPHwOEmlPQ8o2HQaG
	9Aalgs8cg1z71bU7i1j6ls1tvS+FUmqFqJJrr+ZuFFt30ZhHDF7Y+9FiRlsQNSZk6t0u
	pXeBb+SfPzCMjYh7CRBSLrona6hSTEkO3O8yeoLNCfFETC3avOqXHaWevEF+BJ37nzBr
	KpO8T1vkgP9I5QD3m4o1kjvDa8JdeJqGaYQJM495WgiuPwMLZUZqxheAFkD4iMxzOat5
	fhO09xv8nnJq14jV00ztGY7+x6yf2qnwTaUf+1LsogmXoy3B+M9Cey3X1cEvwaUiXiJF
	TNGA==
X-Gm-Message-State: APjAAAVTrslsSheoFRLktyzqEWvZXA1FYd/1sUi5cw+3VfXi2b3FlPE+
	7immF1foBOsQ18X1jzoQYbAEIxyM0ug=
X-Received: by 2002:a1c:c8:: with SMTP id 191mr25805188wma.44.1555419511380;
	Tue, 16 Apr 2019 05:58:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:41 +0100
Message-Id: <20190416125744.27770-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH 23/26] target/arm: Implement M-profile lazy FP
 state preservation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ooQwqJb+EGFy

The M-profile architecture floating point system supports
lazy FP state preservation, where FP registers are not
pushed to the stack when an exception occurs but are instead
only saved if and when the first FP instruction in the exception
handler is executed. Implement this in QEMU, corresponding
to the check of LSPACT in the pseudocode ExecuteFPCheck().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |   3 ++
 target/arm/helper.h    |   2 +
 target/arm/translate.h |   1 +
 target/arm/helper.c    | 112 +++++++++++++++++++++++++++++++++++++++++
 target/arm/translate.c |  22 ++++++++
 5 files changed, 140 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 42df41b11ab..8fd6551c6cd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -57,6 +57,7 @@
 #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
 #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
 #define EXCP_STKOF          19   /* v8M STKOF UsageFault */
+#define EXCP_LAZYFP         20   /* v7M fault during lazy FP stacking */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
@@ -3173,6 +3174,8 @@ FIELD(TBFLAG_A32, NS, 6, 1)
 FIELD(TBFLAG_A32, VFPEN, 7, 1)
 FIELD(TBFLAG_A32, CONDEXEC, 8, 8)
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
+/* For M profile only, set if FPCCR.LSPACT is set */
+FIELD(TBFLAG_A32, LSPACT, 18, 1)
 /* For M profile only, set if we must create a new FP context */
 FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1)
 /* For M profile only, set if FPCCR.S does not match current security state */
diff --git a/target/arm/helper.h b/target/arm/helper.h
index a09566f795c..0a3a80528c7 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -69,6 +69,8 @@ DEF_HELPER_2(v7m_blxns, void, env, i32)
 
 DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
 
+DEF_HELPER_1(v7m_preserve_fp_state, void, env)
+
 DEF_HELPER_2(v8m_stackcheck, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 59b9dbd0136..475d51f8ff8 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,6 +42,7 @@ typedef struct DisasContext {
     bool v8m_stackcheck; /* true if we need to perform v8M stack limit checks */
     bool v8m_fpccr_s_wrong; /* true if v8M FPCCR.S != v8m_secure */
     bool v7m_new_fp_ctxt_needed; /* ASPEN set but no active FP context */
+    bool v7m_lspact; /* FPCCR.LSPACT set */
     /* Immediate value in AArch32 SVC insn; must be set if is_jmp == DISAS_SWI
      * so that top level loop can generate correct syndrome information.
      */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 975ac9c6fc4..c56746aafa2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7383,6 +7383,12 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     g_assert_not_reached();
 }
 
+void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
 uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 {
     /* The TT instructions can be used by unprivileged code, but in
@@ -7742,6 +7748,97 @@ pend_fault:
     return false;
 }
 
+void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
+{
+    /*
+     * Preserve FP state (because LSPACT was set and we are about
+     * to execute an FP instruction). This corresponds to the
+     * PreserveFPState() pseudocode.
+     * We may throw an exception if the stacking fails.
+     */
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+    bool negpri = !(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_HFRDY_MASK);
+    bool is_priv = !(env->v7m.fpccr[is_secure] & R_V7M_FPCCR_USER_MASK);
+    bool splimviol = env->v7m.fpccr[is_secure] & R_V7M_FPCCR_SPLIMVIOL_MASK;
+    uint32_t fpcar = env->v7m.fpcar[is_secure];
+    bool stacked_ok = true;
+    bool ts = is_secure && (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK);
+    bool take_exception;
+
+    /* Take the iothread lock as we are going to touch the NVIC */
+    qemu_mutex_lock_iothread();
+
+    /* Check the background context had access to the FPU */
+    if (!v7m_cpacr_pass(env, is_secure, is_priv)) {
+        armv7m_nvic_set_pending_lazyfp(env->nvic, ARMV7M_EXCP_USAGE, is_secure);
+        env->v7m.cfsr[is_secure] |= R_V7M_CFSR_NOCP_MASK;
+        stacked_ok = false;
+    } else if (!is_secure && !extract32(env->v7m.nsacr, 10, 1)) {
+        armv7m_nvic_set_pending_lazyfp(env->nvic, ARMV7M_EXCP_USAGE, M_REG_S);
+        env->v7m.cfsr[M_REG_S] |= R_V7M_CFSR_NOCP_MASK;
+        stacked_ok = false;
+    }
+
+    if (!splimviol && stacked_ok) {
+        /* We only stack if the stack limit wasn't violated */
+        int i;
+        ARMMMUIdx mmu_idx;
+
+        mmu_idx = arm_v7m_mmu_idx_all(env, is_secure, is_priv, negpri);
+        for (i = 0; i < (ts ? 32 : 16); i += 2) {
+            uint64_t dn = *aa32_vfp_dreg(env, i / 2);
+            uint32_t faddr = fpcar + 4 * i;
+            uint32_t slo = extract64(dn, 0, 32);
+            uint32_t shi = extract64(dn, 32, 32);
+
+            if (i >= 16) {
+                faddr += 8; /* skip the slot for the FPSCR */
+            }
+            stacked_ok = stacked_ok &&
+                v7m_stack_write(cpu, faddr, slo, mmu_idx, STACK_LAZYFP) &&
+                v7m_stack_write(cpu, faddr + 4, shi, mmu_idx, STACK_LAZYFP);
+        }
+
+        stacked_ok = stacked_ok &&
+            v7m_stack_write(cpu, fpcar + 0x40,
+                            vfp_get_fpscr(env), mmu_idx, STACK_LAZYFP);
+    }
+
+    /*
+     * We definitely pended an exception, but it's possible that it
+     * might not be able to be taken now. If its priority permits us
+     * to take it now, then we must not update the LSPACT or FP regs,
+     * but instead jump out to take the exception immediately.
+     * If it's just pending and won't be taken until the current
+     * handler exits, then we do update LSPACT and the FP regs.
+     */
+    take_exception = !stacked_ok &&
+        armv7m_nvic_can_take_pending_exception(env->nvic);
+
+    qemu_mutex_unlock_iothread();
+
+    if (take_exception) {
+        raise_exception_ra(env, EXCP_LAZYFP, 0, 1, GETPC());
+    }
+
+    env->v7m.fpccr[is_secure] &= ~R_V7M_FPCCR_LSPACT_MASK;
+
+    if (ts) {
+        /* Clear s0 to s31 and the FPSCR */
+        int i;
+
+        for (i = 0; i < 32; i += 2) {
+            *aa32_vfp_dreg(env, i / 2) = 0;
+        }
+        vfp_set_fpscr(env, 0);
+    }
+    /*
+     * Otherwise s0 to s15 and FPSCR are UNKNOWN; we choose to leave them
+     * unchanged.
+     */
+}
+
 /* Write to v7M CONTROL.SPSEL bit for the specified security bank.
  * This may change the current stack pointer between Main and Process
  * stack pointers if it is done for the CONTROL register for the current
@@ -9067,6 +9164,7 @@ static void arm_log_exception(int idx)
             [EXCP_NOCP] = "v7M NOCP UsageFault",
             [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
             [EXCP_STKOF] = "v8M STKOF UsageFault",
+            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -9360,6 +9458,12 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
             return;
         }
         break;
+    case EXCP_LAZYFP:
+        /*
+         * We already pended the specific exception in the NVIC in the
+         * v7m_preserve_fp_state() helper function.
+         */
+        break;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
         return; /* Never happens.  Keep compiler happy.  */
@@ -13488,6 +13592,14 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+
+        if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
+            flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
+        }
+    }
+
     *pflags = flags;
     *cs_base = 0;
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6829f975e65..04988efca7c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3423,6 +3423,27 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
         /* Handle M-profile lazy FP state mechanics */
 
+        /* Trigger lazy-state preservation if necessary */
+        if (s->v7m_lspact) {
+            /*
+             * Lazy state saving affects external memory and also the NVIC,
+             * so we must mark it as an IO operation for icount.
+             */
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_start();
+            }
+            gen_helper_v7m_preserve_fp_state(cpu_env);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_end();
+            }
+            /*
+             * If the preserve_fp_state helper doesn't throw an exception
+             * then it will clear LSPACT; we don't need to repeat this for
+             * any further FP insns in this TB.
+             */
+            s->v7m_lspact = false;
+        }
+
         /* Update ownership of FP context: set FPCCR.S to match current state */
         if (s->v8m_fpccr_s_wrong) {
             TCGv_i32 tmp;
@@ -13389,6 +13410,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->v8m_fpccr_s_wrong = FIELD_EX32(tb_flags, TBFLAG_A32, FPCCR_S_WRONG);
     dc->v7m_new_fp_ctxt_needed =
         FIELD_EX32(tb_flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED);
+    dc->v7m_lspact = FIELD_EX32(tb_flags, TBFLAG_A32, LSPACT);
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
 
-- 
2.20.1

