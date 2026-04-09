Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8BCE98FA6
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 03:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAgPf-0000fd-Ps; Wed, 08 Apr 2026 23:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPe-0000f6-Az
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPc-0003t2-R8
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:38 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2adff872068so2843355ad.1
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 20:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775706635; x=1776311435; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZgQTS24GRUW9F9mDekJ69gAxd73kOMLRaKq2o0x7oE=;
 b=Qe2DRoaTv8zIUbqRUx8XGpQnUUfqBLf48SGdMKOdWJvxmgpJvYAaXM85rfWI53ue+0
 I09bhNIq5+a078mV0jXQirc3J/JmeTgaezS4CdIpIO33sMmeTSTKANV4b5JzfjdGnEFl
 mkKVJ1CEPZhUEWdocTvPlvU3F3ARb9N0iOxsbOoYKc7LAZoooilMYkWCA+JaRAhTAiVK
 R+ZPyc2MHjc0w/SByoFwiguLBS1H1ZFWKX9LRxEBdsOYatgEChxvWxQGBvkrRWrVRniT
 bkUGw6hGLSTcTLTTmF3cLt4XNH6ONOhruuybXHeJoQoxJHi2PFuEpEynxhgTBhrv/DMU
 U0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775706635; x=1776311435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YZgQTS24GRUW9F9mDekJ69gAxd73kOMLRaKq2o0x7oE=;
 b=HUGCtdteVGAi7V7s5dayPK6jopuf7PwGhRoRqM/HYvySv77Kg5xx5Nd+0SKSn9vSa9
 p+xME9svHTXT2yX0hEU+hgVt8K1v9NYPHQrolAyfNJkWop9lwZZhxl7tU0o9t1yCed5d
 y4+4t11kT3A+8aTufwU4JSQA/UsjIS/luW/l/wFold0tsYZmB+wSLFseOr+xSJRZTZp5
 i5EsXArUxBOrjPmuoJ5/rCwPvJ1cX4tFTHmHBhK6dy/5yvxbwoVWKL41Nf+ae4TsSaNH
 48eXs9XJJwvCT9qtTINBsAUUa3dSOvamP1AScoPAaTW9N/TbcwWZDeFJN2UinwmO7J7H
 mJ7w==
X-Gm-Message-State: AOJu0YyU2wr82MaWKovC2VvO/uNFgqN7JtgcHqgIOv15FY6qQBKdj/uh
 7Clj4PT7sAGUUmjLHOVHUGIM6wq2O6PWrRYZfY8Y6RDuMMRIsuOXyoZ8Ig+5SCvrD0PceLuITGf
 Kdwa11dU=
X-Gm-Gg: AeBDieuxEf5uG5mttAjsAK5ZfGCLrcJidgErkuAGj/gCsysIo8RlgtySvqY3L02Nmx1
 tzmTUFkhGx+9o2B/pXtjqwk21W4npKDdisBhF8edbZpR6sK0Z0FeUd3HuU3xEYC3jE8RTDJ58g3
 3KB6LHFkA2XeEUFvgt9syH/AZnqqhG59Wq7TWsCGMFYZO213vP0dI3Fs6XgRBc4twK4Vi3BwwMH
 TAftMD89F/lqDtbKIBRmjXhcylxuVZbXXQkf013swK9+HWgpXBFnCbfE1YNwVymLkES6x03hu61
 qQafyyWnKCyZErRVW7Rh3NAuJFmNpKuZh4XdLt9HB5aLbjO6gvkKXM69FjuOrNE0l+AvM9azfVN
 zM8wdlIfMG7mKtWTGzTSuCQkN/m4MAf7+5JZ+7NSuorLdSKQEQOnw9HqRY53c95y2oabgMKSyXN
 hjc20+jJ3zU89WEB38PlPZJzrCyAkS7Lz9nng0TcFMkg0JkZxUXkifaYTz
X-Received: by 2002:a17:903:3904:b0:2b0:5ae9:ee4 with SMTP id
 d9443c01a7336-2b2c73021e9mr20265515ad.5.1775706635409; 
 Wed, 08 Apr 2026 20:50:35 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm277830605ad.0.2026.04.08.20.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 20:50:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v2 4/7] target/arm: Store SVC immediate for user-only
Date: Thu,  9 Apr 2026 13:50:12 +1000
Message-ID: <20260409035015.132370-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409035015.132370-1-richard.henderson@linaro.org>
References: <20260409035015.132370-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rather than re-reading the insn during syscall processing to
find the immediate, store it in CPUARMState during translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 linux-user/arm/cpu_loop.c  | 13 ++++---------
 target/arm/tcg/translate.c | 19 +++++++++++++++++--
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b11a31c807..5b564c7113 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -817,6 +817,7 @@ typedef struct CPUArchState {
     bool tagged_addr_enable;
 #else
     /* For usermode syscall translation.  */
+    uint32_t syscall_info;
     bool eabi;
 #endif /* !CONFIG_USER_ONLY */
 } CPUARMState;
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 19874f4c72..86f13ad83a 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -271,7 +271,6 @@ void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, si_signo, si_code;
-    unsigned int n, insn;
     abi_ulong ret;
 
     for(;;) {
@@ -312,20 +311,16 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_SWI:
             {
+                unsigned int n;
+
                 env->eabi = true;
                 /* system call */
                 if (env->thumb) {
                     /* Thumb is always EABI style with syscall number in r7 */
                     n = env->regs[7];
                 } else {
-                    /*
-                     * Equivalent of kernel CONFIG_OABI_COMPAT: read the
-                     * Arm SVC insn to extract the immediate, which is the
-                     * syscall number in OABI.
-                     */
-                    /* FIXME - what to do if get_user() fails? */
-                    get_user_code_u32(insn, env->regs[15] - 4, env);
-                    n = insn & 0xffffff;
+                    /* The 24-bit SVC immediate is stored during translate. */
+                    n = env->syscall_info;
                     if (n == 0) {
                         /* zero immediate: EABI, syscall number in r7 */
                         n = env->regs[7];
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index ce427c5a3c..ec21e33a06 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1158,6 +1158,21 @@ void unallocated_encoding(DisasContext *s)
     gen_exception_insn(s, 0, EXCP_UDEF, syn_uncategorized());
 }
 
+static void gen_exception_swi(DisasContext *s)
+{
+#ifdef CONFIG_USER_ONLY
+# ifndef TARGET_AARCH64
+    /*
+     * Only 16-bits of the immediate are recorded in the syndrome,
+     * so store the entire 24-bit immediate for cpu_loop().
+     */
+    tcg_gen_st_i32(tcg_constant_i32(s->svc_imm), tcg_env,
+                   offsetof(CPUARMState, syscall_info));
+# endif
+#endif
+    gen_exception(EXCP_SWI, syn_aa32_svc(s->svc_imm, s->thumb));
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
@@ -6781,7 +6796,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception_swi(dc);
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -6854,7 +6869,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(tcg_env);
             break;
         case DISAS_SWI:
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception_swi(dc);
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.43.0


