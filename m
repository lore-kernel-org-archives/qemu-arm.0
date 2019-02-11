Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp103599wrp;
        Mon, 11 Feb 2019 15:54:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYyN4ea85GLfTGpjI2eOXiWTZJKG7FOaPFlISt1Z0VADS4qThZ6xxLoFN2FxS9p9i0ruQ/0
X-Received: by 2002:a81:f00c:: with SMTP id p12mr632788ywm.55.1549929246173;
        Mon, 11 Feb 2019 15:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929246; cv=none;
        d=google.com; s=arc-20160816;
        b=vy9HWplIqdvQD8MKDV4EmKaISqIHp7Gm3XuZ55gnLHe7GDqhN88ez0MoGWlgAveoKT
         2EjWconZnNO8cCqduGrKJARpMmDolUvNt9OzH8fZPQpWP2qljiak765MNj+W4xZDopfh
         u+H6iqmf073hMLm6KTNXBgoMQVttMPLaXeaWBNDNCpnyfOT2AItChb64CWiaDf97kCt0
         F/PFrSGyklUviy9Bxw13wDShuwDgNZ8BU/Qt/nhJ8BpbBwzELpMinz72vJ+W3E97PfuW
         TlYWfGl3rvPQXUSMrgsffYrBvN9BnCP0FsXEy1J16pSq/GRsb1a0HkOvP8yJWEmZO+eJ
         tzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ItNJF+IPQ2RCWNqC/N6zjDNVc+cTfSXBzvGik2fXPgw=;
        b=eFOiumnelNMXpE/NVNzcO+kx50VeE+sVAqfGOpnWmm9KWZiYXywcZsFdkSGgBpmaYw
         CGRBLtzHLqY8506RbCFunoVqr0vRhRyUr+OO4NUbvxpS5o+x0Qvjg/JUpUIDtEj3VkgB
         V+U9mkbt3ngjdw01+GZmVir/TdLaGP0POw3zoY2fSAf+dDdn4RQ0p+0xPgpHR8FgMLRN
         XYfxR6fH5vCS7qmjF69+uZkXYL/wCUXqArLmgdGwk7VuzjcSCbBiBq7d8g/7mIC+oqAx
         CTJE27TAmGygCLsOMEwgtfA2hP4OJXfbd/HavkR9KnnEz1GaNmF0G9ud2+4KbTBRKRS5
         QHgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z2y4ykkr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r67si7010083ywd.116.2019.02.11.15.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:54:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z2y4ykkr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLOn-00054b-Hi
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:54:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNs-00052I-FG
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNr-0004Kl-7I
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:08 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLNq-0004JB-VT
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:07 -0500
Received: by mail-pl1-x644.google.com with SMTP id p4so320722plq.11
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ItNJF+IPQ2RCWNqC/N6zjDNVc+cTfSXBzvGik2fXPgw=;
	b=Z2y4ykkrljePgNBLExGtmw3QoRHl37rAz83DrD775OWmcLJ7SOhADwY59/8oQWfqD4
	BZRh6M6YSbhKql56U5+Nw1iVhUGsYVxnj6DhIqnmr57YhIQK0T/ZEL9kUEMo9WczKtHs
	AsgD+MMakO6QgJ5OZ3dmtKNYNYoBMig88Y8Pqyqefb94f8H3MOdR0bzM03H7pgAHer20
	fZxJJAy2D2UFaO9n5DEfekF/JedSUtVXziN114g67yIaBdOLb3acN3/j9Y+GRn5QEbNf
	YHF2AGb1re+Ncd+5SPOKDz7iqjvCEfgXJY4XDZK9ZUL7q9iDZFmi8chcFk9yMnl35eI+
	oCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ItNJF+IPQ2RCWNqC/N6zjDNVc+cTfSXBzvGik2fXPgw=;
	b=htHRHYVkg3mGDeqJw/MoWqpS0gvESB7HWy6lst6FM/9obAeqsJB2AeqDdHYJd3RjCR
	J9WTKJF+0cfdyOTOVjU1O/oan4UeTBmmUSvwcrx1ldvIjye4ECbtCh9Hx4eL0m8Kou1C
	D4Lct1fF/HX+eAEuXcAMtcs2KXK6oY4pPBvUukGF+ywJOuX5/PprFv4x6h6AULwFe6J4
	FvlJjOvdrzswvqhs9hmpnlhOfLcxqzJTcszcNHPeXytk4vn4wvzhdm2YJZPooUqLz0bx
	pmBcfsGufs24PmkCMxjWP4EU/A+sGhc0YfqJ9sXn5PimLvycOM13Itg92qnDFuR38JLG
	hENA==
X-Gm-Message-State: AHQUAuaVk5ycHSBL7yeDidDQBMCf/Tj3m1/W0amAfuhOueDCuC5gNIos
	PvjnnKgdYRw3pm7ldVlP+lbToAiNm2s=
X-Received: by 2002:a17:902:7e4c:: with SMTP id
	a12mr916414pln.340.1549929185578; 
	Mon, 11 Feb 2019 15:53:05 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:33 -0800
Message-Id: <20190211235258.542-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v3 03/28] target/arm: Add clear_pstate_bits,
 share gen_ss_advance
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
X-TUID: sj90QsNn58YF

We do not need an out-of-line helper for clearing bits in pstate.
While changing things, share the implementation of gen_ss_advance.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  2 --
 target/arm/translate.h     | 19 +++++++++++++++++++
 target/arm/op_helper.c     |  5 -----
 target/arm/translate-a64.c | 11 -----------
 target/arm/translate.c     | 11 -----------
 5 files changed, 19 insertions(+), 29 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 28b1dd6252..c21fa2edfe 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -77,8 +77,6 @@ DEF_HELPER_2(get_cp_reg, i32, env, ptr)
 DEF_HELPER_3(set_cp_reg64, void, env, ptr, i64)
 DEF_HELPER_2(get_cp_reg64, i64, env, ptr)
 
-DEF_HELPER_1(clear_pstate_ss, void, env)
-
 DEF_HELPER_2(get_r13_banked, i32, env, i32)
 DEF_HELPER_3(set_r13_banked, void, env, i32, i32)
 
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 17748ddfb9..33af50a13f 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -202,6 +202,25 @@ static inline TCGv_i32 get_ahp_flag(void)
     return ret;
 }
 
+/* Clear bits within PSTATE.  */
+static inline void clear_pstate_bits(uint32_t bits)
+{
+    TCGv_i32 p = tcg_temp_new_i32();
+
+    tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
+    tcg_gen_andi_i32(p, p, ~bits);
+    tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
+    tcg_temp_free_i32(p);
+}
+
+/* If the singlestep state is Active-not-pending, advance to Active-pending. */
+static inline void gen_ss_advance(DisasContext *s)
+{
+    if (s->ss_active) {
+        s->pstate_ss = 0;
+        clear_pstate_bits(PSTATE_SS);
+    }
+}
 
 /* Vector operations shared between ARM and AArch64.  */
 extern const GVecGen3 bsl_op;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c5721a866d..8698b4dc83 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -861,11 +861,6 @@ uint64_t HELPER(get_cp_reg64)(CPUARMState *env, void *rip)
     return res;
 }
 
-void HELPER(clear_pstate_ss)(CPUARMState *env)
-{
-    env->pstate &= ~PSTATE_SS;
-}
-
 void HELPER(pre_hvc)(CPUARMState *env)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 13e010d27b..ba139bba26 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -421,17 +421,6 @@ static void gen_exception_bkpt_insn(DisasContext *s, int offset,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_ss_advance(DisasContext *s)
-{
-    /* If the singlestep state is Active-not-pending, advance to
-     * Active-pending.
-     */
-    if (s->ss_active) {
-        s->pstate_ss = 0;
-        gen_helper_clear_pstate_ss(cpu_env);
-    }
-}
-
 static void gen_step_complete_exception(DisasContext *s)
 {
     /* We just completed step of an insn. Move from Active-not-pending
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 66cf28c8cb..baf6068ec1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -298,17 +298,6 @@ static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
     tcg_temp_free_i32(tcg_excp);
 }
 
-static void gen_ss_advance(DisasContext *s)
-{
-    /* If the singlestep state is Active-not-pending, advance to
-     * Active-pending.
-     */
-    if (s->ss_active) {
-        s->pstate_ss = 0;
-        gen_helper_clear_pstate_ss(cpu_env);
-    }
-}
-
 static void gen_step_complete_exception(DisasContext *s)
 {
     /* We just completed step of an insn. Move from Active-not-pending
-- 
2.17.2

