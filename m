Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp835410ejn;
        Wed, 19 Oct 2022 20:18:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47Kp4VCFci/49j8wS5pYtXuQ25/2/m6bcNRcccDoBc+9WDxbEt7lfS4TNO9qk+SOAGrxsq
X-Received: by 2002:ae9:e107:0:b0:6ed:638:930 with SMTP id g7-20020ae9e107000000b006ed06380930mr7711844qkm.211.1666235907912;
        Wed, 19 Oct 2022 20:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666235907; cv=none;
        d=google.com; s=arc-20160816;
        b=hzGXJfDOwR5AaL7wnx8pNUf6Q93C5JIU2iQmkR69ZsKB7LyIeOrsJlXeGtoKvDRSul
         YSyT+UNmHtJZwzBAez/g87Pwb7uYzqssKUz4x/FLRZBnuABP6rvTQhobovgZ+IPA2XW4
         cPoGNkWchtkxwNShNPNgWqyRm1upIhaqHQAG6O+j5kJ0HdbHoI6nXA6F+VnUJ1IUWLC8
         S8Qkufz/aO+P1MzboPw7U05CT4FP0LJSV4t6qYviRmPt1rI5DRDiufccUoS42TYlnemE
         h/155SZ23ASqIeV3rG5K0iRlxLq0cl+KuF0F9aZZVEBovH03ZutKdLNl7NbrwnSu4gwj
         jPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=URMwA6GPQqJ+vPJT+scBC3gJWrphY4n1dsKKi5K3NW4=;
        b=WQgYIjlVKHT/p577S3YK7fZmuAzV07pYfJ5NgfOafzNU7LHusoIyiMnrYtMsU3Vu09
         9wShjER/e4o+OUISlWfuOAMSpjift6leM2fWNR7DmlmZ0hhdFq14uXS/MblUZtlkiIzH
         bXrbueONpXX41WQq9XfwUcNqIb5MMsKhYTdBIvWFol6k+j4HLJc74k+BKRICXx5mPTlQ
         aqjIEMpW7T1cvehRuVrhol9I3KMp0giNd8rOkZGg36+R9ittP/IRQgV0e4JypnaxCl19
         yD2a7MTSFM3q/4RTbyuhx4gGxarEhwPzx5XeigKL2jhf8Yzv8YKDh5hjUsDlf7kzOZlb
         umbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COcm9iIN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu15-20020a056214234f00b0049915000526si9677008qvb.450.2022.10.19.20.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COcm9iIN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olM4h-0001lx-DF
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:18:27 -0400
Received: from [::1] (port=59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLvL-0003No-CN
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu1-0003AP-MN
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLty-0001na-HG
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:24 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso1488733pjn.0
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 20:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URMwA6GPQqJ+vPJT+scBC3gJWrphY4n1dsKKi5K3NW4=;
 b=COcm9iINJeryWczmqNzJz2ylwY74LRb0A9p+qv1JhAO1LXhDh1gbd4EljHTK03IzE2
 8ZLjoDg80KptzVC7H4jeUt1LQg0CEG0j3ybJ03bt5cZylSqBsOA7hfApDdeckAIYc5fC
 Bejk4plPjXwFqbZQlTXdbKS1lnCmys1xlGoXImVGnZHzc8lI6rcjSO71CcKMws6n1lp7
 7OuSQxykds4J7s6rZxz0eKhhvyVk8HPVnd1ViVbFcmgiiiJKMPmOTvodj9Y6jdJ/i66m
 zNRwplNfPWnxBMXbT06BEbHHmK6JSaKqCPo9hiRBilu73fma7qvK/G+4o1W3UzM2hf6q
 n34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URMwA6GPQqJ+vPJT+scBC3gJWrphY4n1dsKKi5K3NW4=;
 b=A/hKdSFOI27bIM2Fbb3/wjUUoSoxxHui+ilWQaebeFh7m+bSHwskLTnyAGaGspOc5b
 kuYeBBzXbWSIOi9yNlMZIZm2k/t+jctzbkSt4uYCeTnLzzElV2uiK8IcqX5Mv1mqece7
 NGjGrwD/siLkPatXXGZoJLJIx+kKh6pJLERBoyTKKoUDbX6HmrRgQnMA/8IbQeusESYb
 E5p8aKwP4itB96cIkMJ3mv7Ck77OeG5+TWMOM0qrZAHH0dJcWKNEN0AFC6Y8J46P8ur3
 EJYZZ1j8H0ieG2VYnxECEio/EhjGN/fT0iQl+MbB7ykQ2Ju83LeAESoB8uFroOzwQ/FN
 3PPg==
X-Gm-Message-State: ACrzQf1qgeuskBhDxGZKXZrc9JdAt7z+cMfhlC3l/M6fYg3ATi57QTe1
 Q+IS0uXFJmac/jorfAOjoVWes7MC2LDPkJBQ
X-Received: by 2002:a17:90b:3e81:b0:20d:bbe5:f332 with SMTP id
 rj1-20020a17090b3e8100b0020dbbe5f332mr37163354pjb.112.1666235239000; 
 Wed, 19 Oct 2022 20:07:19 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 3/9] target/arm: Change gen_*set_pc_im to gen_*update_pc
Date: Thu, 20 Oct 2022 13:06:35 +1000
Message-Id: <20221020030641.2066807-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8KIyME1RHk5q

In preparation for TARGET_TB_PCREL, reduce reliance on
absolute values by passing in pc difference.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h |  2 +-
 target/arm/translate.h     |  6 ++--
 target/arm/translate-a64.c | 32 +++++++++---------
 target/arm/translate-vfp.c |  2 +-
 target/arm/translate.c     | 68 ++++++++++++++++++++------------------
 5 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 78a84c1414..5339c22f1e 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -40,7 +40,7 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop);
 TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs);
 void gen_set_cpsr(TCGv_i32 var, uint32_t mask);
 void gen_set_condexec(DisasContext *s);
-void gen_set_pc_im(DisasContext *s, target_ulong val);
+void gen_update_pc(DisasContext *s, target_long diff);
 void gen_lookup_tb(DisasContext *s);
 long vfp_reg_offset(bool dp, unsigned reg);
 long neon_full_reg_offset(unsigned reg);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 90bf7c57fc..d651044855 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -254,7 +254,7 @@ static inline int curr_insn_len(DisasContext *s)
  * For instructions which want an immediate exit to the main loop, as opposed
  * to attempting to use lookup_and_goto_ptr.  Unlike DISAS_UPDATE_EXIT, this
  * doesn't write the PC on exiting the translation loop so you need to ensure
- * something (gen_a64_set_pc_im or runtime helper) has done so before we reach
+ * something (gen_a64_update_pc or runtime helper) has done so before we reach
  * return from cpu_tb_exec.
  */
 #define DISAS_EXIT      DISAS_TARGET_9
@@ -263,14 +263,14 @@ static inline int curr_insn_len(DisasContext *s)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
-void gen_a64_set_pc_im(uint64_t val);
+void gen_a64_update_pc(DisasContext *s, target_long diff);
 extern const TranslatorOps aarch64_translator_ops;
 #else
 static inline void a64_translate_init(void)
 {
 }
 
-static inline void gen_a64_set_pc_im(uint64_t val)
+static inline void gen_a64_update_pc(DisasContext *s, target_long diff)
 {
 }
 #endif
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6a372ed184..585d42d5b2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -140,9 +140,9 @@ static void reset_btype(DisasContext *s)
     }
 }
 
-void gen_a64_set_pc_im(uint64_t val)
+void gen_a64_update_pc(DisasContext *s, target_long diff)
 {
-    tcg_gen_movi_i64(cpu_pc, val);
+    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
 }
 
 /*
@@ -334,14 +334,14 @@ static void gen_exception_internal(int excp)
 
 static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
 {
-    gen_a64_set_pc_im(pc);
+    gen_a64_update_pc(s, pc - s->pc_curr);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
-    gen_a64_set_pc_im(s->pc_curr);
+    gen_a64_update_pc(s, 0);
     gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -376,11 +376,11 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
 
     if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
-        gen_a64_set_pc_im(dest);
+        gen_a64_update_pc(s, diff);
         tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
-        gen_a64_set_pc_im(dest);
+        gen_a64_update_pc(s, diff);
         if (s->ss_active) {
             gen_step_complete_exception(s);
         } else {
@@ -1952,7 +1952,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         uint32_t syndrome;
 
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
-        gen_a64_set_pc_im(s->pc_curr);
+        gen_a64_update_pc(s, 0);
         gen_helper_access_check_cp_reg(cpu_env,
                                        tcg_constant_ptr(ri),
                                        tcg_constant_i32(syndrome),
@@ -1962,7 +1962,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * The readfn or writefn might raise an exception;
          * synchronize the CPU state in case it does.
          */
-        gen_a64_set_pc_im(s->pc_curr);
+        gen_a64_update_pc(s, 0);
     }
 
     /* Handle special cases first */
@@ -2172,7 +2172,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             /* The pre HVC helper handles cases when HVC gets trapped
              * as an undefined insn by runtime configuration.
              */
-            gen_a64_set_pc_im(s->pc_curr);
+            gen_a64_update_pc(s, 0);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
             gen_exception_insn_el(s, s->base.pc_next, EXCP_HVC,
@@ -2183,7 +2183,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 unallocated_encoding(s);
                 break;
             }
-            gen_a64_set_pc_im(s->pc_curr);
+            gen_a64_update_pc(s, 0);
             gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
             gen_exception_insn_el(s, s->base.pc_next, EXCP_SMC,
@@ -14936,7 +14936,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          */
         switch (dc->base.is_jmp) {
         default:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, 4);
             /* fall through */
         case DISAS_EXIT:
         case DISAS_JUMP:
@@ -14953,13 +14953,13 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         default:
         case DISAS_UPDATE_EXIT:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, 4);
             /* fall through */
         case DISAS_EXIT:
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_UPDATE_NOCHAIN:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, 4);
             /* fall through */
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr();
@@ -14968,11 +14968,11 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_SWI:
             break;
         case DISAS_WFE:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, 4);
             gen_helper_wfe(cpu_env);
             break;
         case DISAS_YIELD:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, 4);
             gen_helper_yield(cpu_env);
             break;
         case DISAS_WFI:
@@ -14980,7 +14980,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
              * This is a special case because we don't want to just halt
              * the CPU if trying to debug across a WFI.
              */
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, 4);
             gen_helper_wfi(cpu_env, tcg_constant_i32(4));
             /*
              * The helper doesn't necessarily throw an exception, but we
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 94cc1e4b77..070f465b17 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -856,7 +856,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_FPSID:
             if (s->current_el == 1) {
                 gen_set_condexec(s);
-                gen_set_pc_im(s, s->pc_curr);
+                gen_update_pc(s, 0);
                 gen_helper_check_hcr_el2_trap(cpu_env,
                                               tcg_constant_i32(a->rt),
                                               tcg_constant_i32(a->reg));
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ae30c26ca4..9863a08f49 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -768,9 +768,9 @@ void gen_set_condexec(DisasContext *s)
     }
 }
 
-void gen_set_pc_im(DisasContext *s, target_ulong val)
+void gen_update_pc(DisasContext *s, target_long diff)
 {
-    tcg_gen_movi_i32(cpu_R[15], val);
+    tcg_gen_movi_i32(cpu_R[15], s->pc_curr + diff);
 }
 
 /* Set PC and Thumb state from var.  var is marked as dead.  */
@@ -862,7 +862,7 @@ static inline void gen_bxns(DisasContext *s, int rm)
 
     /* The bxns helper may raise an EXCEPTION_EXIT exception, so in theory
      * we need to sync state before calling it, but:
-     *  - we don't need to do gen_set_pc_im() because the bxns helper will
+     *  - we don't need to do gen_update_pc() because the bxns helper will
      *    always set the PC itself
      *  - we don't need to do gen_set_condexec() because BXNS is UNPREDICTABLE
      *    unless it's outside an IT block or the last insn in an IT block,
@@ -883,7 +883,7 @@ static inline void gen_blxns(DisasContext *s, int rm)
      * We do however need to set the PC, because the blxns helper reads it.
      * The blxns helper may throw an exception.
      */
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     gen_helper_v7m_blxns(cpu_env, var);
     tcg_temp_free_i32(var);
     s->base.is_jmp = DISAS_EXIT;
@@ -1051,7 +1051,7 @@ static inline void gen_hvc(DisasContext *s, int imm16)
      * as an undefined insn by runtime configuration (ie before
      * the insn really executes).
      */
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_pre_hvc(cpu_env);
     /* Otherwise we will treat this as a real exception which
      * happens after execution of the insn. (The distinction matters
@@ -1059,7 +1059,7 @@ static inline void gen_hvc(DisasContext *s, int imm16)
      * for single stepping.)
      */
     s->svc_imm = imm16;
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     s->base.is_jmp = DISAS_HVC;
 }
 
@@ -1068,16 +1068,16 @@ static inline void gen_smc(DisasContext *s)
     /* As with HVC, we may take an exception either before or after
      * the insn executes.
      */
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa32_smc()));
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     s->base.is_jmp = DISAS_SMC;
 }
 
 static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, pc);
+    gen_update_pc(s, pc - s->pc_curr);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1103,10 +1103,10 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
-        gen_a64_set_pc_im(pc);
+        gen_a64_update_pc(s, pc - s->pc_curr);
     } else {
         gen_set_condexec(s);
-        gen_set_pc_im(s, pc);
+        gen_update_pc(s, pc - s->pc_curr);
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
@@ -1121,10 +1121,10 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
 void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 {
     if (s->aarch64) {
-        gen_a64_set_pc_im(pc);
+        gen_a64_update_pc(s, pc - s->pc_curr);
     } else {
         gen_set_condexec(s);
-        gen_set_pc_im(s, pc);
+        gen_update_pc(s, pc - s->pc_curr);
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
@@ -1133,7 +1133,7 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syn));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2596,10 +2596,10 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 
     if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         tcg_gen_exit_tb(s->base.tb, n);
     } else {
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         gen_goto_ptr();
     }
     s->base.is_jmp = DISAS_NORETURN;
@@ -2608,9 +2608,11 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
 static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
 {
+    int diff = dest - s->pc_curr;
+
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         s->base.is_jmp = DISAS_JUMP;
         return;
     }
@@ -2627,7 +2629,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest - s->pc_curr);
+        gen_goto_tb(s, tbno, diff);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -2636,7 +2638,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          * Avoid using goto_tb so we really do exit back to the main loop
          * and don't chain to another TB.
          */
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         gen_goto_ptr();
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -2904,7 +2906,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because msr_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     tcg_reg = load_reg(s, rn);
     gen_helper_msr_banked(cpu_env, tcg_reg,
                           tcg_constant_i32(tgtmode),
@@ -2924,7 +2926,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because mrs_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     tcg_reg = tcg_temp_new_i32();
     gen_helper_mrs_banked(tcg_reg, cpu_env,
                           tcg_constant_i32(tgtmode),
@@ -4745,7 +4747,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             }
 
             gen_set_condexec(s);
-            gen_set_pc_im(s, s->pc_curr);
+            gen_update_pc(s, 0);
             gen_helper_access_check_cp_reg(cpu_env,
                                            tcg_constant_ptr(ri),
                                            tcg_constant_i32(syndrome),
@@ -4756,7 +4758,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
              * synchronize the CPU state in case it does.
              */
             gen_set_condexec(s);
-            gen_set_pc_im(s, s->pc_curr);
+            gen_update_pc(s, 0);
         }
 
         /* Handle special cases first */
@@ -4770,7 +4772,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 unallocated_encoding(s);
                 return;
             }
-            gen_set_pc_im(s, s->base.pc_next);
+            gen_update_pc(s, curr_insn_len(s));
             s->base.is_jmp = DISAS_WFI;
             return;
         default:
@@ -5157,7 +5159,7 @@ static void gen_srs(DisasContext *s,
     addr = tcg_temp_new_i32();
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_get_r13_banked(addr, cpu_env, tcg_constant_i32(mode));
     switch (amode) {
     case 0: /* DA */
@@ -6226,7 +6228,7 @@ static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
      * scheduling of other vCPUs.
      */
     if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_set_pc_im(s, s->base.pc_next);
+        gen_update_pc(s, curr_insn_len(s));
         s->base.is_jmp = DISAS_YIELD;
     }
     return true;
@@ -6242,7 +6244,7 @@ static bool trans_WFE(DisasContext *s, arg_WFE *a)
      * implemented so we can't sleep like WFI does.
      */
     if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_set_pc_im(s, s->base.pc_next);
+        gen_update_pc(s, curr_insn_len(s));
         s->base.is_jmp = DISAS_WFE;
     }
     return true;
@@ -6251,7 +6253,7 @@ static bool trans_WFE(DisasContext *s, arg_WFE *a)
 static bool trans_WFI(DisasContext *s, arg_WFI *a)
 {
     /* For WFI, halt the vCPU until an IRQ. */
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     s->base.is_jmp = DISAS_WFI;
     return true;
 }
@@ -8761,7 +8763,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         (a->imm == semihost_imm)) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
-        gen_set_pc_im(s, s->base.pc_next);
+        gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
         s->base.is_jmp = DISAS_SWI;
     }
@@ -9774,7 +9776,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_TOO_MANY:
         case DISAS_UPDATE_EXIT:
         case DISAS_UPDATE_NOCHAIN:
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         default:
             /* FIXME: Single stepping a WFI insn will not halt the CPU. */
@@ -9798,13 +9800,13 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
         case DISAS_UPDATE_EXIT:
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         default:
             /* indicate that the hash table must be used to find the next TB */
@@ -9844,7 +9846,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_set_label(dc->condlabel);
         gen_set_condexec(dc);
         if (unlikely(dc->ss_active)) {
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             gen_singlestep_exception(dc);
         } else {
             gen_goto_tb(dc, 1, curr_insn_len(dc));
-- 
2.34.1

