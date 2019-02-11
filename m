Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp104621wrp;
        Mon, 11 Feb 2019 15:55:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IahIosLLHlQntUyElOoEkH2QOHCjKarQC7Sv7OZY51RQAEw6uIEcl5e0s3qYJD66kdkVMbj
X-Received: by 2002:a25:30c3:: with SMTP id w186mr702320ybw.24.1549929341163;
        Mon, 11 Feb 2019 15:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929341; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAmXK5yeBrxPvY2B8mMdB2VtTOe74cIJYHb4WccOr+eDLB7+StEMLV7pq50S2RBp8b
         9EdwJnALnFPUrhzDsvgJ46KNCbJKX3WVTJ/009H4jQaUdCD9CMhoR5RFsODax1+wo+LC
         d5KC8lI2ousns5+3VQszeXj/BJFHqjT3tbaOxqLmyOfJCWpdL2SaX91hNHeB8IvqbGZ9
         PRbkC8erfT2WGzfjxDctMX5iBkkFOMYui45TObQZzIAem6+wxVB1+Cf1BbFh3lPCfxOt
         c6Am9oPD/8Ft2X+Cf4FVTzOc/x1r8r+QohXBpChnanvK1lVke5AztmuzldCjobQ2R8fw
         6wag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=hbKS6AD3am/sY2oZ+gJOc5vr5/ws9wlGISFwMC+r3mY=;
        b=NuO5lN1zHK1BIKyaXeHtFkSf0SgvFv4hnVwH/rqG0kgDmewDJlmIGEaJFa1oLzrlA2
         lWtXFA4UFxeXtsHd8LZjVwEz4AtY5LCHOTm2JAft2B75OrCXRN/yQmDPXbno4WI2Wlix
         /zINxzNbfLsnpA81hGW8BrTYa8qdgDMOVoCeRngGCjnhe/OtRSWzRlnivtet4Bg4rHez
         nn2ISYGwE/mhSWLXJKFMsdqyrIIRAiuxS+EfHD9rwVZgr+GBQx8zY4//n58z3dTol+I1
         SNLutxQqXUzzEaw/Lva0WmbcYnfNWujcqf8qIoWutUWhiYzN4BO90Xt1eDaoYGQIYhq2
         tRnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rq2DDaSh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si6870137ywg.267.2019.02.11.15.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rq2DDaSh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLQK-0006bf-H9
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:55:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNr-00051I-NT
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNq-0004Io-5J
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:07 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLNp-0004H3-RI
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:06 -0500
Received: by mail-pg1-x543.google.com with SMTP id z11so335240pgu.0
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hbKS6AD3am/sY2oZ+gJOc5vr5/ws9wlGISFwMC+r3mY=;
	b=rq2DDaShtc6LY6HTelUqvdzvJ2ZQje4EzLF7TPfPeMpQScMj+726YSL8pCmPZmAOrm
	KfVNcZ4njaaciZP8ObFCVO2w2jZXONsMg2rOWxs6rVA7DxgW0gtG5zqfDevD/PS1OWv5
	BYP49/av/7XUsSvsU21AMYXx2rNPR7e8FynRPDAae6B0R7c5moDoab0t56k6o+nk7fz1
	tEwjYNOmCHgtKq8sapNxdlO6ubC3geN/2G5u1gEC3CG+P7FrVG61TQ6VsvoG2tWnRoRp
	L6KmNeLSOw4nhnypFfdaFI8b8zdXzpStqtRVzXyGAQ05766BiRIgpQpmyGmiUD8oUo51
	eqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hbKS6AD3am/sY2oZ+gJOc5vr5/ws9wlGISFwMC+r3mY=;
	b=Pt+GF2wJKH1TVGSF8osfKGUYjnnIu6mzXTgpIn5fyFCL68mKSISqYbvw4Hw6czWGOA
	aRyfsJcwWvyUsxZQ80PJ6924eNoxCuHWyYzV60XQd5srEVI1LU+UPfLRNiic6rJoVKtk
	p+ZlGyaGfbq8FSGSoTlJbBZNaM+vlYikU0qdZKZvtL3PEHKpBNXdZRGKTo0f1uyez3OO
	Lt6dC45m4sQh0nwDF33GZJEdUcQkWKcKxqfzvjYXuYyP3ddtj56WW88hBIpNysWj+NUu
	dPaLw+vyr3wrSW996uKEnkPygYkpmXjmw01KrylFHup6cIXmmXBrahh5TmMnxV3CW08F
	WOFQ==
X-Gm-Message-State: AHQUAuZmpHORcRdvFWZ+WetlhxXwt2rSwr2zmR5xsg7PNM57r3TW/HfB
	fdKT24nKo0ch+ILKrv6/Vj5h7YWy8Xk=
X-Received: by 2002:a63:ce0e:: with SMTP id y14mr825477pgf.145.1549929184202; 
	Mon, 11 Feb 2019 15:53:04 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:32 -0800
Message-Id: <20190211235258.542-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v3 02/28] target/arm: Split helper_msr_i_pstate
 into 3
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2PsldmFsnzEk

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

