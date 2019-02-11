Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1941847wrq;
        Sun, 10 Feb 2019 17:08:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYFi6Hn0Eca7UctHdDr07XKtjGKJcCTFiAL3OQGPmYSXA5vvnkAAjdWjmEfFmcF7ch00dUU
X-Received: by 2002:a1c:342:: with SMTP id 63mr6901655wmd.34.1549847339370;
        Sun, 10 Feb 2019 17:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847339; cv=none;
        d=google.com; s=arc-20160816;
        b=Hcu3fefTufJConEo1+WudhZako9CKq/beCESMTOrd82JvJ6rMM12BWTxt+Dx3NZtrz
         UV+OQr1RyYcm/AjTdtNWhKEYIMDB1w7Ax80jR48GGnDC6ypro22BxV2qbs0LTX/LnbFZ
         hjcIsIbKlE/C73iQye6Tnaa1085L8kTOdNTcBu63wn0+ZE3RzshkjU1yi2M6KnAKurqg
         itiCE6/uKYTB314LgjrbWOvx+R7os5vwXCnIoiq+O67Y44TPPMiTDLTbMUwT8N9EgRJW
         B0Vo+1xI3XmbFDoUs3kc5nVZYz+wvmAoswoYrNjIbx5cjMZu7lesqUFn0pb9XSKfRodK
         LrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=hbKS6AD3am/sY2oZ+gJOc5vr5/ws9wlGISFwMC+r3mY=;
        b=Z3dO7MHdTnbsCTlgVKGtdnxXCmBj4FdiaaYVSQTux9eMuNmvlzqlA+nsqd3QvNREfQ
         elQ2Je0iGbQ7NQyKLBPzYX0x2K4QhSXaaAu23hkj8z3iVgnrTIlclarUj/S6JSxBCAIG
         1RoIV+jJD8KlTVimE9B+aOumsjW70vUEXKr27OZSSqSS0izx7V0qkrHkjFgUjB7PIZK2
         ziPsY17afyf/k99G+h03qhzkiB5YZs2kE8KcqahcxB2vi2ly3fEYlpIP4qQgPUm2+Qlv
         nwVxz95ea/XP6cpqvNTEMr6XvjaLm+pevun7U8AGUprFbLhkhmBCfKYPiN5nxwkxPEUB
         SOPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q0QbfSM7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si3650246wmh.26.2019.02.10.17.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:08:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q0QbfSM7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt05i-0005Rz-7h
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05S-0005QH-IN
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05L-0007z5-WC
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:39 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05L-0007xg-LD
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:35 -0500
Received: by mail-pl1-x642.google.com with SMTP id p4so4491882plq.11
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hbKS6AD3am/sY2oZ+gJOc5vr5/ws9wlGISFwMC+r3mY=;
	b=q0QbfSM7mQnomNySomDc9n9qQHWL6/bfueUP6si8383ziySXHEE4mIsY4X/4o7Qe6s
	TprNvXnR33w7Bx6NgL/1D4lfyLoj6o5FhsE+q+vRgMStEsLavXet4mYDnHXYRHSAblsk
	g1f0ikcNDKFhhlZncXd3+Iwd1JEDnYnJEGeLMMTsSRlg7yIktWKVkmRAcct5IfJTg0O/
	RApYXKwC03SnO2hbzrlqlOuJGwX4FHfWMIoZZ4J+JzY/qMgn6crSWw5l/mcV/DJLIhwS
	MWyPrq+vJOpbFLW10gPvDxmJocKC+Pu/HHZkRmcBnR+aAeZ9aHG/K+lMWC2Pc2jnJecY
	ySHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hbKS6AD3am/sY2oZ+gJOc5vr5/ws9wlGISFwMC+r3mY=;
	b=tbdQeSDWOd6Yi4CdyYPW5XinWkG7HR3ZCSI7dxC4KYsyKVZC+IAy3RhKM1V8wnItm1
	1xQX5ONRHTLxImCCxrLKqQ+vhJNNJWnjh/XPX/ixR0iPMVfASgfcuCva1VDFoVyt7NjA
	bD+vaw5H2DMDrTLmbV5d+orGDCEI72OUiXPmMjEtuOFK/f0EjfDQ1l7ExuIYRCOgrrKG
	1/VSHdVnJBqlj1ceABaXRWOC6PcU5Y/XR5oTMJ71+D7cysCCT8njNH1kwmxprcmWi+Gp
	BiAxOQiohEYfoJqLnFzPrBaX/HIsGszmzVGo9lU4jvzEpXVnMkXOTaprI/gRI2ngUFH3
	8Vrg==
X-Gm-Message-State: AHQUAuYHoVm0BNkX6MVZxGEjVcCiydJba6vp7ScjjPAbR4SvPLELI2RE
	s4rvpEyZ0IsJXu0rech5MesBS5On8f0=
X-Received: by 2002:a17:902:a50e:: with SMTP id
	s14mr23327027plq.311.1549847314566; 
	Sun, 10 Feb 2019 17:08:34 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:05 -0800
Message-Id: <20190211010829.29869-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v2 02/26] target/arm: Split helper_msr_i_pstate
 into 3
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eV4AqxsoKx71

The EL0+UMA check is unique to DAIF.  While SPSel had avoided the
check by nature of already checking EL >= 1, the other post v8.0
extensions to MSR (imm) allow EL0 and do not require UMA.  Avoid
the unconditional write to pc and use raise_exception_ra to unwind.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  3 +++
 target/arm/helper.h        |  1 -
 target/arm/internals.h     | 15 ++++++++++++++
 target/arm/helper-a64.c    | 30 +++++++++++++++++++++++++++
 target/arm/op_helper.c     | 42 --------------------------------------
 target/arm/translate-a64.c | 41 ++++++++++++++++++++++---------------
 6 files changed, 73 insertions(+), 59 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index aff8d6c9f3..a915c1247f 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -19,6 +19,9 @@
 DEF_HELPER_FLAGS_2(udiv64, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sdiv64, TCG_CALL_NO_RWG_SE, s64, s64, s64)
 DEF_HELPER_FLAGS_1(rbit64, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_2(msr_i_spsel, void, env, i32)
+DEF_HELPER_2(msr_i_daifset, void, env, i32)
+DEF_HELPER_2(msr_i_daifclear, void, env, i32)
 DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 53a38188c6..28b1dd6252 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -77,7 +77,6 @@ DEF_HELPER_2(get_cp_reg, i32, env, ptr)
 DEF_HELPER_3(set_cp_reg64, void, env, ptr, i64)
 DEF_HELPER_2(get_cp_reg64, i64, env, ptr)
 
-DEF_HELPER_3(msr_i_pstate, void, env, i32, i32)
 DEF_HELPER_1(clear_pstate_ss, void, env)
 
 DEF_HELPER_2(get_r13_banked, i32, env, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a4bd1becb7..587a1ddf58 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -968,4 +968,19 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data);
 
+static inline int exception_target_el(CPUARMState *env)
+{
+    int target_el = MAX(1, arm_current_el(env));
+
+    /*
+     * No such thing as secure EL1 if EL3 is aarch32,
+     * so update the target EL to EL3 in this case.
+     */
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
+        target_el = 3;
+    }
+
+    return target_el;
+}
+
 #endif
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 101fa6d3ea..87b8f36122 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -61,6 +61,36 @@ uint64_t HELPER(rbit64)(uint64_t x)
     return revbit64(x);
 }
 
+void HELPER(msr_i_spsel)(CPUARMState *env, uint32_t imm)
+{
+    update_spsel(env, imm);
+}
+
+static void daif_check(CPUARMState *env, uint32_t op,
+                       uint32_t imm, uintptr_t ra)
+{
+    /* DAIF update to PSTATE. This is OK from EL0 only if UMA is set.  */
+    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UMA)) {
+        raise_exception_ra(env, EXCP_UDEF,
+                           syn_aa64_sysregtrap(0, extract32(op, 0, 3),
+                                               extract32(op, 3, 3), 4,
+                                               imm, 0x1f, 0),
+                           exception_target_el(env), ra);
+    }
+}
+
+void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
+{
+    daif_check(env, 0x1e, imm, GETPC());
+    env->daif |= (imm << 6) & PSTATE_DAIF;
+}
+
+void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
+{
+    daif_check(env, 0x1f, imm, GETPC());
+    env->daif &= ~((imm << 6) & PSTATE_DAIF);
+}
+
 /* Convert a softfloat float_relation_ (as returned by
  * the float*_compare functions) to the correct ARM
  * NZCV flag state.
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c998eadfaa..c5721a866d 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -68,20 +68,6 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     cpu_loop_exit_restore(cs, ra);
 }
 
-static int exception_target_el(CPUARMState *env)
-{
-    int target_el = MAX(1, arm_current_el(env));
-
-    /* No such thing as secure EL1 if EL3 is aarch32, so update the target EL
-     * to EL3 in this case.
-     */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
-    }
-
-    return target_el;
-}
-
 uint32_t HELPER(neon_tbl)(uint32_t ireg, uint32_t def, void *vn,
                           uint32_t maxindex)
 {
@@ -875,34 +861,6 @@ uint64_t HELPER(get_cp_reg64)(CPUARMState *env, void *rip)
     return res;
 }
 
-void HELPER(msr_i_pstate)(CPUARMState *env, uint32_t op, uint32_t imm)
-{
-    /* MSR_i to update PSTATE. This is OK from EL0 only if UMA is set.
-     * Note that SPSel is never OK from EL0; we rely on handle_msr_i()
-     * to catch that case at translate time.
-     */
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UMA)) {
-        uint32_t syndrome = syn_aa64_sysregtrap(0, extract32(op, 0, 3),
-                                                extract32(op, 3, 3), 4,
-                                                imm, 0x1f, 0);
-        raise_exception(env, EXCP_UDEF, syndrome, exception_target_el(env));
-    }
-
-    switch (op) {
-    case 0x05: /* SPSel */
-        update_spsel(env, imm);
-        break;
-    case 0x1e: /* DAIFSet */
-        env->daif |= (imm << 6) & PSTATE_DAIF;
-        break;
-    case 0x1f: /* DAIFClear */
-        env->daif &= ~((imm << 6) & PSTATE_DAIF);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 void HELPER(clear_pstate_ss)(CPUARMState *env)
 {
     env->pstate &= ~PSTATE_SS;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 27b90d5778..13e010d27b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1647,29 +1647,38 @@ static void handle_sync(DisasContext *s, uint32_t insn,
 static void handle_msr_i(DisasContext *s, uint32_t insn,
                          unsigned int op1, unsigned int op2, unsigned int crm)
 {
+    TCGv_i32 t1;
     int op = op1 << 3 | op2;
+
+    /* End the TB by default, chaining is ok.  */
+    s->base.is_jmp = DISAS_TOO_MANY;
+
     switch (op) {
     case 0x05: /* SPSel */
         if (s->current_el == 0) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
-        /* fall through */
-    case 0x1e: /* DAIFSet */
-    case 0x1f: /* DAIFClear */
-    {
-        TCGv_i32 tcg_imm = tcg_const_i32(crm);
-        TCGv_i32 tcg_op = tcg_const_i32(op);
-        gen_a64_set_pc_im(s->pc - 4);
-        gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
-        tcg_temp_free_i32(tcg_imm);
-        tcg_temp_free_i32(tcg_op);
-        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
-        gen_a64_set_pc_im(s->pc);
-        s->base.is_jmp = (op == 0x1f ? DISAS_EXIT : DISAS_JUMP);
+        t1 = tcg_const_i32(crm & PSTATE_SP);
+        gen_helper_msr_i_spsel(cpu_env, t1);
+        tcg_temp_free_i32(t1);
         break;
-    }
+
+    case 0x1e: /* DAIFSet */
+        t1 = tcg_const_i32(crm);
+        gen_helper_msr_i_daifset(cpu_env, t1);
+        tcg_temp_free_i32(t1);
+        break;
+
+    case 0x1f: /* DAIFClear */
+        t1 = tcg_const_i32(crm);
+        gen_helper_msr_i_daifclear(cpu_env, t1);
+        tcg_temp_free_i32(t1);
+        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
+        s->base.is_jmp = DISAS_UPDATE;
+        break;
+
     default:
+    do_unallocated:
         unallocated_encoding(s);
         return;
     }
-- 
2.17.2

