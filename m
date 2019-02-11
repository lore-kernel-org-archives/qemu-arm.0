Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1947076wrq;
        Sun, 10 Feb 2019 17:17:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbrlRZBVBZ7Gy+BCYO7qgfMZ+027qdmcDzlWaeZeqCHvZl2EuVpX/K8rcCgpRZWyfjVhJY4
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr7569678wmq.104.1549847835006;
        Sun, 10 Feb 2019 17:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847835; cv=none;
        d=google.com; s=arc-20160816;
        b=GiMe/TkyeRZgFmZoLcsvvPrcfiIwyKCrFOhDve9NqrjOt/QZOC5Uql3nO63sBJA9Av
         /LUt+yKjslQjyJ1R3sN/DqRqiM6COIzCFv/9oUITkAq+zIsDcoXS+AUC0DbxZUCGYbUN
         88Qlj7vekz6/K7Ytctem2NH1xQ/PbH/Yj92MwIpJtZH14bw4XhZVL3dlYeXNV45yzoSc
         QORvLAZGFGayX9EanmD+GS2O4YqIf5zj2/WGFh/nY8hylrcr/SKDTHscqYVdQk22aaU+
         b+jMsypSx3xN9yrSoTqoQ1MasjBCA64mYlz03/wkHFhJIHHoq43BF/VmopCixyox4613
         Q6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ItNJF+IPQ2RCWNqC/N6zjDNVc+cTfSXBzvGik2fXPgw=;
        b=hKMGZC/4jF3URQArD0/pSYjqeHeVM1CRAo8zn05lcwkIAbW0d4BOXbqFWJmcXXPfOp
         wANwBb7jm7WVZzoFGyHA2zmyI2bpS/BQl8uNvqNZwhKnI6QcTYSMqumJuCs7OkB3iu7G
         Hgk2OPc7t8j21GV+i7ujzatdNrQOJlxFVhAFt1coUXatcJrSVwKVeMZpstzQ+tTyoata
         N4MHfoncLPWqx9j+t1BsThM9oOY1eEgI7NJC64nQkV4KJTQbRliy8KWTqQbrEqoTI+nP
         duYciMnFpDlc7f6fgO7PgTkimgUIEkbjr1k1z5d+DYidPMrf+1esr5oc9Tx1E+X/KpFl
         UAvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EQslcFme;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si6783986wrq.453.2019.02.10.17.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:17:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EQslcFme;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Dh-0003RN-Vb
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:17:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05l-0005ik-6h
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0008O3-Ib
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:01 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05i-0007za-5I
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: by mail-pf1-x442.google.com with SMTP id h1so1653993pfo.7
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ItNJF+IPQ2RCWNqC/N6zjDNVc+cTfSXBzvGik2fXPgw=;
	b=EQslcFmeP6zD+i79OugPlC+uJRaMb1tZ+Y2s3/tMfGfvNocqaYyxRqxeWUpHPTAXUJ
	c/3ZYRKIdW3jyTPYwtN1qwJzls3DqxaNXON2BSlmIVzsQIWD8XIahQeKuWYUxQamMey3
	F54jNjMPVaOj2Cqf+CH8fin2KBtA7AC/4d4FX73Www23h3AVN9yzQMpkoWyydVZkOh7e
	28WDmyxFVjRJ4OzyxvK8qdPat1C661UBo8MqyO6Gd97iQOcmEEiE3MEeaSdLwBCVV9MW
	l2iJAycJqwBCkif/OQj5P5iQ+B4BrHE0hwYDTWWUQ+ujMS7tiw9NRsLi19+u3bCaOfoD
	ycPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ItNJF+IPQ2RCWNqC/N6zjDNVc+cTfSXBzvGik2fXPgw=;
	b=ul+RfAplHa5IuKgQIMe83mC/52Ic2vM/pQxZMUYugdeDN5W9YZhUeMu+7eo1ePKaiK
	9QcMldDq4bssjaG8UfliDZD+UMXGHxk6+6RYWeox6KrUXSCxoFZ9ThJpAf6L2GCsIoMa
	mzWDQ9bRJK4SrmQcDUSDLwMAG+R1s4ZjfXqRxOHCZqBqAP8A1LVEFwjBHvEJTk5NWzYX
	dyM2Mfk54jzEClxw/043ybVsKIzhCMdzFAWmQr3s7OcTb4mBI2hUO0lqb5rnzY+Ktx2g
	4l6JlyT0Kxnxs/kX1VQrrLQHbxLyEMnoYHtMEYsYrySLUNhq/cjzjJrybl5r+hKY80Sf
	/7iQ==
X-Gm-Message-State: AHQUAuZDOKWY0fhpbEbK/F5zLS3q0hl3D+JA5aWPQYz3I1GTLV3/jG6o
	ufzxnCIDz0xCv0jlPPn8MqmvJmBmO5Q=
X-Received: by 2002:a63:580f:: with SMTP id m15mr26451747pgb.342.1549847315806;
	Sun, 10 Feb 2019 17:08:35 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:06 -0800
Message-Id: <20190211010829.29869-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v2 03/26] target/arm: Add clear_pstate_bits,
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
X-TUID: dtzsoPvJ4S0J

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

