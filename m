Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1969283ejn;
        Sun, 16 Oct 2022 15:11:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qJgMF+WmrfAuOo3Qpwo53DJs065xV9poMXvqsp/zN/6ItQlo4K9TrAyfHaDb181D2qE/S
X-Received: by 2002:ae9:e010:0:b0:6ec:9473:dbe1 with SMTP id m16-20020ae9e010000000b006ec9473dbe1mr5740557qkk.181.1665958310824;
        Sun, 16 Oct 2022 15:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665958310; cv=none;
        d=google.com; s=arc-20160816;
        b=vfbXxFSM7lI3yOtgqeb91rFaycxAoW2D4xatUSWIOMo7dTpXK0LHdiQkXsjsBvU29Z
         wuZdWa5/oxNyJP7IWkeB/wynroUwNMRqTpl1VG3RU0WLKafP7SeUJXD+L9QglD4OwieR
         gXyHub3hScuHm1sIOKuAjkg8mCw+RMocyKkIQznfAgSraG42pq3+D9rDI7LzzlYq9pp0
         dyL7XBRllYEnI3pp8OSIxKFdFZE/RnMXvlfLhbUFSWHMe8V4wvHhygHiJ9RU165Vgx0e
         mvDvoQHr20eBVKMrTiobP9cUNXfbq+6/M7oxcSeEgpod+1FfrZxv6phYAOCnKfOo+DHm
         zu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=URMwA6GPQqJ+vPJT+scBC3gJWrphY4n1dsKKi5K3NW4=;
        b=dm3j1OaMro/nzwN2Ko9QNnBiUqoj2w8vMQEVK4+ag3OQ/ieioA8h69+jpLO1bHOX8L
         hGHHl6piOtdIv6e3ErfdDOxMsEx0l7vg0lcX9U6ov2QE5Rb0RzJt/S1nnWmS+ER46t7r
         //AL52s5g1ikd21NayaVwfFsxQBhrqWR2NLscx04GHLLWs+IONErtG3XAZz/kWob2LEw
         EA3mKhu1D79NWjRr3KYLRvomM8wNLDk6RSbX+QroX6BmhGOfkVu5Kd2uarLidJZGp+l5
         vyyDv6pZoVYaIb7rQZou0Iw4NiJyY/Wxm7YwSu7YwBTFxKDFyThIKFpG4CopgBZWfcmm
         +nSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UanubQ60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc18-20020a05622a411200b0039cdc9bb3f1si3299289qtb.400.2022.10.16.15.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UanubQ60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okBrK-0002TQ-15
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpx-0002Oy-V3
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:27 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpu-0007jq-TG
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 n18-20020a17090ade9200b0020b0012097cso11722425pjv.0
 for <qemu-arm@nongnu.org>; Sun, 16 Oct 2022 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URMwA6GPQqJ+vPJT+scBC3gJWrphY4n1dsKKi5K3NW4=;
 b=UanubQ60bx4PiG7nqLqykNZrJtBoE5jmTMd0RihDWN33WqjxQtD+HLpbeYvVXFbJyv
 PB4yAV7xLlQzS95y44lfcVuMOlX/AqC8Z2D5zOY4TNSSatETO0dux70jpaPNEP/BIx1E
 P1mOrjCQTBEFjdsCymYXEckBzJXo5XeEpgx2aoZxrRHw/pmkXOUJ724Q7XSmhbLYaFYu
 q6V2508FLDj/Jo1Hc5VA3NVkG8Sth0RbCUoHEOUmWIicEr1wFGoKz48EMj/OBA8ZmsRm
 BxaIQodwOA5ra6BGm5sSaeRPDlLlZ9q97/yPUDy0AHxJBjoeSeCyH48hZJ47ln/hs0tX
 cQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URMwA6GPQqJ+vPJT+scBC3gJWrphY4n1dsKKi5K3NW4=;
 b=pIEc5JSkakTsAmfSI5ydL6TGaTYf2/A/diWILTSzFzY0DU3hScAjMT7xaes9ucYPQf
 SiXlAsmHBi+JfRCuYAS5kI1UWTgHHFLO/3CbaUR4qhuU3EdNzdc91wcnSCU2Ex2W3kLH
 PcbvtzjUH+V3mgannvkcH1sIcd6IJXa/GYaJen0iTFjBd5ZtdnhO4CireoopUjgE4opS
 0c7xpzl2US9+dgrVWdRtO0HAS7H6YkeGBhoq2bg18EfikAxmBZwlDrJEMVx66u6hnK1a
 i4qsHD34DycoKgXOOYdlFNqTH3oKJT67Gq8IpKA1EZiU3z5lvzgpnC5kDgP445xfoPxG
 M6rQ==
X-Gm-Message-State: ACrzQf27XBJtA5/x0myfJEA/rzgv4f50NRHKA0Hoo9rWqOOd5lnMZikf
 e9+Pt/B9NBeIMRhNb5rizeVWeA==
X-Received: by 2002:a17:902:6a87:b0:181:c6c6:1d38 with SMTP id
 n7-20020a1709026a8700b00181c6c61d38mr8754313plk.74.1665958221221; 
 Sun, 16 Oct 2022 15:10:21 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 3/9] target/arm: Change gen_*set_pc_im to gen_*update_pc
Date: Mon, 17 Oct 2022 08:09:26 +1000
Message-Id: <20221016220932.274260-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D1+GQvp8HLGR

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

