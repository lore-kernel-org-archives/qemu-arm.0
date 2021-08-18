Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1017834lfg;
        Tue, 17 Aug 2021 18:04:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfjXYdeAd4reVncmPvLSwJ5JjDSGK1Y/wk69F/0XVZLXQ0XPkcsqAjiQJkZ+rvBrWGhxLS
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr7358147wrw.150.1629248697191;
        Tue, 17 Aug 2021 18:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629248697; cv=none;
        d=google.com; s=arc-20160816;
        b=n8a7G0dlHqbtFt1v61rI9C6bhRLvU7GRpIZ043jW13SA92DiKqBz00pwXg0qn2N66r
         pzxuBzBM3HigaN22eAWVQEQwbmNq7/VpJqkozqSLLYTbvmwte+Tj/EnthRb1pEVXc9kt
         oJdAF9ISna/xwf5b4HT6/mL21e4ipuPs6qE0MymRwani31Zibcor8D7r2njNWqg/J7BQ
         qKQl0NeLDH1Xv+d5MM+LNvDMkOV/Z6Y8U6Pu+W9127mJfaKUenSM1+TVm0UB8GeFb781
         brBD7oBR7R3i51YCmryeQfmxzWnrDvriiSXWtOWqFSWUAGxgG2oTGEa7z0aqCHEiODEm
         PNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4MnDP8HjuwI7Ozvw8OKIQCnWMBJ/JVU5d/240T32zMU=;
        b=XjoHg82CXPAqg6bm7V3l6F9fBN2ec7o5yEnXIrN4q/TsLNCNhCRDksDQ4AgytnT9dk
         dKcenpDoJVQCABdoUM4+WXbaQ4S7MewS0hsMOIgxdw1oyD+unbhk/hddq6mw4xNdyfJP
         KagtjxWC30xBFx4dbjULQAWIMcSwzOgY/TilcvxUL+yjEoMJXE1tYhgnKGdgj+dyHrYn
         DvfyX7Qzj4l500514mqzE6hM0uekCiCcUI0Xgfc5A8RdnZ8GBNKT8Ucbf+shKZrzu2qj
         qfjJC7cdrrtfTNstnx30r/t8v0AgikdpufIiFrMKFJ+87ajtZakelyJbQ0/Na6jfxGEf
         UBAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3jTGXmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si3826528wrn.503.2021.08.17.18.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 18:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3jTGXmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGA0m-0001yx-5Q
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 21:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wu-00048k-2J
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 21:00:56 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wl-0001Kw-Cv
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 21:00:55 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso7836091pjb.2
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 18:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MnDP8HjuwI7Ozvw8OKIQCnWMBJ/JVU5d/240T32zMU=;
 b=M3jTGXmuGe0XK8Kd+q7dwEV0cB/bME4FDl5JCMSHKQpZShWnP4PkYSSnEyIaTRUD0R
 MnT1ytiINHFeSaWhG0VU3JHJIf0kdGocUT8oH9iKgZP1B7zHPKjALJpYtHdgQkJ1gDGi
 NBFclj9LLQsIJtqDBm/QoWbCQx5lU8EGY340xwshD/sAIagIqXa1WlkcDSoYe3QNF9Ba
 e97NKBcam2dHjZ2vNyNu+XUKK0RTAkXBiV9I4JCOGlw9DXyHwoxQMg97h5BUHjfIv+xe
 BC2cSM6NVgTf+nrSV0t3gY3tAX205V9Gao8iAlwyJmQHjnKZgfjjcGnDdlzskaz/X74h
 aOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MnDP8HjuwI7Ozvw8OKIQCnWMBJ/JVU5d/240T32zMU=;
 b=ln97BH0Q67SRcAwlfZQlslfRlWA7cP5TGwqzIi4zpx2POHi8R9FU3DkRpSK9zg3wPm
 fzdO0Gn3K1JcD5QXAIkR6VpvO1oSvH1HK4Lv5CiSpiT79MyqREMJmTpSkoJow5ClSRuC
 FWqvFlRrVJJfNr3b6SI9DcKZLEUg/5/nFXsb+iz2E6ggwbGF0xhma7h64TS9w9Iaw1F0
 DQvVK+UMWmRfmUrBF9OCiWtA6+6D3u7ygO9PBucIzCq7/bjtjTxK89dYuoMrfNaoFh0c
 rk+Tw/Upy7YKh4E7sltNnmCZ59EiEQkiNSAVBscEWxJwdL6C9pgYN6BIWdWhCliO1NLv
 sQjA==
X-Gm-Message-State: AOAM531XkSTfH0yepluZuBCYds6jnJLPkFB2XzjoUbPVm1N4xL3xMsJr
 d2d4pb9cJ9mfHHj3U0kV6kGDVYNvUbEXmA==
X-Received: by 2002:a17:90b:3718:: with SMTP id
 mg24mr6598021pjb.158.1629248445981; 
 Tue, 17 Aug 2021 18:00:45 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r13sm4567422pgl.90.2021.08.17.18.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:00:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/arm: Take an exception if PSTATE.IL is set
Date: Tue, 17 Aug 2021 15:00:38 -1000
Message-Id: <20210818010041.337010-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818010041.337010-1-richard.henderson@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J6O8YUtaMIsT

From: Peter Maydell <peter.maydell@linaro.org>

In v8A, the PSTATE.IL bit is set for various kinds of illegal
exception return or mode-change attempts.  We already set PSTATE.IL
(or its AArch32 equivalent CPSR.IL) in all those cases, but we
weren't implementing the part of the behaviour where attempting to
execute an instruction with PSTATE.IL takes an immediate exception
with an appropriate syndrome value.

Add a new TB flags bit tracking PSTATE.IL/CPSR.IL, and generate code
to take an exception instead of whatever the instruction would have
been.

PSTATE.IL and CPSR.IL change only on exception entry, attempted
exception exit, and various AArch32 mode changes via cpsr_write().
These places generally already rebuild the hflags, so the only place
we need an extra rebuild_hflags call is in the illegal-return
codepath of the AArch64 exception_return helper.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210817162118.24319-1-peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Added missing returns.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/syndrome.h      |  5 +++++
 target/arm/translate.h     |  2 ++
 target/arm/helper-a64.c    |  1 +
 target/arm/helper.c        |  8 ++++++++
 target/arm/translate-a64.c | 11 +++++++++++
 target/arm/translate.c     | 21 +++++++++++++++++++++
 7 files changed, 49 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d5..be557bf5d8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3441,6 +3441,7 @@ FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 /* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
 FIELD(TBFLAG_ANY, ALIGN_MEM, 12, 1)
+FIELD(TBFLAG_ANY, PSTATE__IL, 13, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 39a31260f2..c590a109da 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -270,4 +270,9 @@ static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
            (cv << 24) | (cond << 20) | ti;
 }
 
+static inline uint32_t syn_illegalstate(void)
+{
+    return EC_ILLEGALSTATE << ARM_EL_EC_SHIFT;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 241596c5bd..af1b6fa03c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -98,6 +98,8 @@ typedef struct DisasContext {
     bool hstr_active;
     /* True if memory operations require alignment */
     bool align_mem;
+    /* True if PSTATE.IL is set */
+    bool pstate_il;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 26f79f9141..19445b3c94 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1071,6 +1071,7 @@ illegal_return:
     if (!arm_singlestep_active(env)) {
         env->pstate &= ~PSTATE_SS;
     }
+    helper_rebuild_hflags_a64(env, cur_el);
     qemu_log_mask(LOG_GUEST_ERROR, "Illegal exception return at EL%d: "
                   "resuming execution at 0x%" PRIx64 "\n", cur_el, env->pc);
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 155d8bf239..201ecf8c67 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13408,6 +13408,10 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
 
+    if (env->uncached_cpsr & CPSR_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
@@ -13502,6 +13506,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
+    if (env->pstate & PSTATE_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
     if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
         /*
          * Set MTE_ACTIVE if any access may be Checked, and leave clear
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422e2ac0c9..230cc8d83b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14662,6 +14662,16 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     s->fp_access_checked = false;
     s->sve_access_checked = false;
 
+    if (s->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(s));
+        return;
+    }
+
     if (dc_isar_feature(aa64_bti, s)) {
         if (s->base.num_insns == 1) {
             /*
@@ -14780,6 +14790,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
+    dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 80c282669f..5e0fc8a0a0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9045,6 +9045,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
 
+    if (s->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(s));
+        return;
+    }
+
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
          * choose to UNDEF. In ARMv5 and above the space is used
@@ -9313,6 +9323,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
+    dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
@@ -9576,6 +9587,16 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
     dc->insn = insn;
 
+    if (dc->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(dc));
+        return;
+    }
+
     if (dc->eci) {
         /*
          * For M-profile continuable instructions, ECI/ICI handling
-- 
2.25.1

