Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp552938lfg;
        Sat, 21 Aug 2021 13:00:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBhljMIx7sEf4LQuYM3j7zDOPbsAu9aihCYE4OuPGOz31KCkK5tcR3LDYZRYuANeb+RHTA
X-Received: by 2002:a5e:a81a:: with SMTP id c26mr20937624ioa.15.1629576026431;
        Sat, 21 Aug 2021 13:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629576026; cv=none;
        d=google.com; s=arc-20160816;
        b=FSBAYj6uT0dKV3u0zNjvdOLL1IdTpcne5zxDZQ0S84FlPdqeEGQ/Nx/lb3yVeaMPlR
         Ct0E82wfbgDLQTOU++st1TSPnHVFvb0xGmL+xY3Ibo3oVEm9ESDFbIEV1G5nBI7XRCxe
         6sl9K/+e8Cl3a7ToSp2UDz/rU244KsnovNVUvTsO/Za7Az7EhKy0kFotqidN5JW2nrqe
         ygwsrxbYtTeg4/R1cf1td1yAuYJJ/WXqHCeAbCiFJTM2KWVBuk5ccf8hjKRsUmeHBHaO
         Pzor5riiMTvUJcMwWf0sxy0lBslFictLVGAWeoXZaDth/lQe4xSgVrq29L1Kk5fHbaLW
         K+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Hn7fpe16SCWF4h1OR7HYJ+ccPYtVq+eIAGolsqSBqQg=;
        b=CEemHaXU2KgEiB6uc6SA7rKkRPLN6kq91s8e4jvIleSqf0IAohXrZlhEqd7qqSlGnc
         aIydZF6wdMRCUHdAg8JEibTwLSC0TzTr4O3H5qiX95DsavtKRyYGhnZDKHnFV4krKAU+
         ZzFpFvtTMGHFJjwg5pGvoDZYW0amGqz5SAQ4yZpfm+/tUQ/hNL41/tk96/kPjZ4rteqT
         g9Os8qVLCARonMDgVw82o8lQLKhQcqxIXR41bWy765+p+YKifaFlo1X/ZqF4okRoCV3S
         s2Dhz7bOWaqLXxaLo/EV8t3PnvoAEg5AX7gBZfdIcQ+C0Qf1himjkZayh7vZrhWpXIjz
         9tmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FPkA54iO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si10345102ils.161.2021.08.21.13.00.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 13:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FPkA54iO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHXAH-0002Jt-N8
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 16:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA0-0002Dt-MN
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:08 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9w-0004VZ-I8
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:08 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e7so12644346pgk.2
 for <qemu-arm@nongnu.org>; Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hn7fpe16SCWF4h1OR7HYJ+ccPYtVq+eIAGolsqSBqQg=;
 b=FPkA54iO9x5uIRs0eU6ZRiQrqcJBIYj4gLFIRCAqbF96eZDS4MOlnJQqrtbZlNVs6F
 YU8nraOK3x49ZTaV1DbJIt2CCFjWOKSazSFPAYYvbk5Yroh9VCboQSTwKiycn5P+BHEL
 00kBPDaKye+51c197gCbSqqyeR7KdA3BxNkLjIW00rLGjKWAArvfrUiEHCOoa25aD+c6
 +EzkLcgdtqHHeQzA/eJusxb+OwlCx0JKY+i1mWnccaybqrW7vX310/5BvUznKq6WGhYH
 vQ+Kj0xtGkmvtfQeCiKl18cy9MMHmED0hYGCX86QdtXPj/YFNepeNg4CzNwuJUhoFcNC
 CGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hn7fpe16SCWF4h1OR7HYJ+ccPYtVq+eIAGolsqSBqQg=;
 b=dLa1+uMePtuojMdP4YEYm/3/Lu3FvoNRJACkkXLnfuLLqdGzLrChGFJfnEyHiCAgpu
 KhkktmdC4GE5rHuTPhkh+Hb0LymuBkNxX35jA8h7jlWbkveyvMgyzQC6Fqc+qgq14OsV
 Y63etj+quIx+2aYadvi12qNV0nr5wdVhjSF7ay/A1nvw7NRmUNCFQ+ML8p3CA7KJBzGn
 yygytMyG2KwNgRIMs7y6wnm7O8bJMo+g1/oUJVtNXF7wL0ukWJN9UN5dRZt0DynzkybP
 rh+BFOtltUHfDL2I38DOzO814r/9tsrFgt0pYqWRO+ayO/09CkKMvMbeI2Sko9Je8MTm
 zbWg==
X-Gm-Message-State: AOAM531r7OiBHWlsq4k2Z34a55tJZTklaISfHw4MIvYtzfTNZx7puZ1H
 d0BCbbF0KW9G4o/dyH0uJDlG8A==
X-Received: by 2002:a65:6398:: with SMTP id h24mr24869431pgv.367.1629576002913; 
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
Date: Sat, 21 Aug 2021 12:59:55 -0700
Message-Id: <20210821195958.41312-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yHF0Q7QfxKDw

For A64, any input to an indirect branch can cause this.

For A32, many indirect branch paths force the branch to be aligned,
but BXWritePC does not.  This includes the BX instruction but also
other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
exception or force align the PC.

We choose to raise an exception because we have the infrastructure,
it makes the generated code for gen_bx simpler, and it has the
possibility of catching more guest bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/syndrome.h      |  5 +++++
 target/arm/tlb_helper.c    | 24 +++++++++++++++++++++++
 target/arm/translate-a64.c | 21 ++++++++++++++++++--
 target/arm/translate.c     | 39 +++++++++++++++++++++++++++++++-------
 5 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 248569b0cd..d629ee6859 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 54d135897b..e9d97fac6e 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -275,4 +275,9 @@ static inline uint32_t syn_illegalstate(void)
     return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_pcalignment(void)
+{
+    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 3107f9823e..25c422976e 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -9,6 +9,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/helper-proto.h"
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
@@ -123,6 +124,29 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
+void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
+{
+    int target_el = exception_target_el(env);
+
+    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
+        /*
+         * To aarch64 and aarch32 el2, pc alignment has a
+         * special exception class.
+         */
+        env->exception.vaddress = pc;
+        env->exception.fsr = 0;
+        raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
+    } else {
+        /*
+         * To aarch32 el1, pc alignment is like data alignment
+         * except with a prefetch abort.
+         */
+        ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
+        arm_deliver_fault(env_archcpu(env), pc, MMU_INST_FETCH,
+                          cpu_mmu_index(env, true), &fi);
+    }
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 333bc836b2..39c2fb8c7e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14752,8 +14752,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *s = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
+    /* Singlestep exceptions have the highest priority. */
     if (s->ss_active && !s->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -14768,13 +14770,28 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         assert(s->base.num_insns == 1);
         gen_swstep_exception(s, 0, 0);
         s->base.is_jmp = DISAS_NORETURN;
+        s->base.pc_next = pc + 4;
         return;
     }
 
-    s->pc_curr = s->base.pc_next;
+    if (pc & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code.
+         * This should only be possible after an indirect branch, at the
+         * start of the TB.
+         */
+        assert(s->base.num_insns == 1);
+        gen_helper_exception_pc_alignment(cpu_env, tcg_constant_tl(pc));
+        s->base.is_jmp = DISAS_NORETURN;
+        s->base.pc_next = QEMU_ALIGN_UP(pc, 4);
+        return;
+    }
+
+    s->pc_curr = pc;
     insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
     s->insn = insn;
-    s->base.pc_next += 4;
+    s->base.pc_next = pc + 4;
 
     s->fp_access_checked = false;
     s->sve_access_checked = false;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5e0fc8a0a0..dfeaa2321d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9452,7 +9452,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_pre_translate_insn(DisasContext *dc)
+static bool arm_check_kernelpage(DisasContext *dc)
 {
 #ifdef CONFIG_USER_ONLY
     /* Intercept jump to the magic kernel page.  */
@@ -9464,7 +9464,11 @@ static bool arm_pre_translate_insn(DisasContext *dc)
         return true;
     }
 #endif
+    return false;
+}
 
+static bool arm_check_ss_active(DisasContext *dc)
+{
     if (dc->ss_active && !dc->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -9498,17 +9502,38 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
-    if (arm_pre_translate_insn(dc)) {
-        dc->base.pc_next += 4;
+    /* Singlestep exceptions have the highest priority. */
+    if (arm_check_ss_active(dc)) {
+        dc->base.pc_next = pc + 4;
         return;
     }
 
-    dc->pc_curr = dc->base.pc_next;
-    insn = arm_ldl_code(env, dc->base.pc_next, dc->sctlr_b);
+    if (pc & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code
+         * (or the execution of the kernelpage entrypoint). This should only
+         * be possible after an indirect branch, at the start of the TB.
+         */
+        assert(dc->base.num_insns == 1);
+        gen_helper_exception_pc_alignment(cpu_env, tcg_constant_tl(pc));
+        dc->base.is_jmp = DISAS_NORETURN;
+        dc->base.pc_next = QEMU_ALIGN_UP(pc, 4);
+        return;
+    }
+
+    if (arm_check_kernelpage(dc)) {
+        dc->base.pc_next = pc + 4;
+        return;
+    }
+
+    dc->pc_curr = pc;
+    insn = arm_ldl_code(env, pc, dc->sctlr_b);
     dc->insn = insn;
-    dc->base.pc_next += 4;
+    dc->base.pc_next = pc + 4;
     disas_arm_insn(dc, insn);
 
     arm_post_translate_insn(dc);
@@ -9570,7 +9595,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next += 2;
         return;
     }
-- 
2.25.1

