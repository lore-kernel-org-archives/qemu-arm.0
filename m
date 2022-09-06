Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2862350ejh;
        Tue, 6 Sep 2022 03:29:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6oST6kqIeR0bQeo+adwhofZbVih1Ocgg0tDTbOms4hkpxxehuGEtoppSNUdhGD3ixu+WTz
X-Received: by 2002:a05:620a:1902:b0:6b8:d90e:cef7 with SMTP id bj2-20020a05620a190200b006b8d90ecef7mr35102338qkb.131.1662460183019;
        Tue, 06 Sep 2022 03:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662460183; cv=none;
        d=google.com; s=arc-20160816;
        b=RQHJU1Pz8Yud7O3MJkqrBNB5fP86tT0W3y9RBaWIXfoJoq9G3PNqI/oJlMuDhTgkm8
         WeS2DSmq8aPP6kbFZsqob05sHBJ7kninWBmpC97L+PWady15cjBlf73f1uPCjQ/1qTMR
         Aste7d6hpzEb+c7jdjd5D3vbFmtUOiUL1O9iYv3d0ckOPENhgyiiANA6noQdW7ooqcNK
         kRhXkRkNsklVymbB25OpgpdyoNLgqR8rmp4ooU6gEvGGlMqFBh05pe9cBRo/SW4pFhB+
         GOkplI8aWi5LbONT3TxkOSQnsKa3Bok+nMozHvIbKVs2kCtesfO3PGKKldc6bAWpC7nh
         GRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mqm4WV1Zg2oRFbNDchviFjo14KmPDklLQg7bzAkRtM0=;
        b=cQlcMx4LBhab+LCk3axFVSasxlXCOoHKKjRZ5ajoXZ6Df3RGyOcCAwIbf0SPAdIn4S
         qMNSHrX6Pw4vJH8qcEVp/VtxUtJPjO5dhqMk8NMxyGJveOEXv43UORlB1AbhBsQr0SaO
         h5CLPSSMx1VIPYHK0DENN1OxXVIYcVCiIwxb0YrkrXOXUelGoDMixjKdIBIvqH8Cx4j+
         KlDOVmr62kmTnlacqHY7OhmOc17YYQYdr3bI5ZmBqab45hqDe//KW442Tj8sRUYF+gue
         hxD76rk/trQ+ldVrdIvyYF0W9QEpoTK/Dm730SDFmTB/jIE0CgRXQt5sdq1IzNuT/VXF
         HTMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SG64jAAU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do46-20020a05620a2b2e00b006b88d0b5ec4si7327589qkb.35.2022.09.06.03.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 03:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SG64jAAU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVpu-0005xa-ED
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 06:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSs-0004Gu-SR
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSg-00035P-B6
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id k9so14678434wri.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Mqm4WV1Zg2oRFbNDchviFjo14KmPDklLQg7bzAkRtM0=;
 b=SG64jAAUupg7cl9FmOCHs7d6A5z9ylmPHD5t3tiEd/I60R65J2Bq6sPpxPIk79HO+l
 vcq3vTj+MQt08aLZFKs5rtDy3JaUL4zbxvimkyeetyfQVra6m8/sumlXO1Ota7BYC1eT
 SFfALnB43V88N3Nmu+3+EAx2oAwecShBLyXnRKC5PA7b6dAhJJh/VfKjvkOKsXQO26tT
 Bx9n1IRqDyMDHv18Ke8r4JBR7qujO/59DGL+uGc83PbFgjyDWp9Sr5Prg5MolgK0fSD6
 w1v0jAcMvMeQNBMBUZI9oM0d/gCEvrVYB4nIotrCPCoBqb/ZC1VIE2wehRgtrZFksftp
 mOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Mqm4WV1Zg2oRFbNDchviFjo14KmPDklLQg7bzAkRtM0=;
 b=big30N0ia/fS5gv1K5qy9ecueG19cp9eVMqwRW5Bs/gz6bILEXAYjnm0OtRsYtOHYy
 X66UXiCGbFsyNLNSj5uW6JGHuiEP/BrlaBuOOinjoXKvpSXeBK5LyZ4jBBGU7UMUmhAd
 bRu3gqBinjgn9Ax3Hbyvjm73hDFl0K4i153sXAmytx6Srp9lhWuojd8tzBhSYKNw2XZk
 h5vk8AVijQm12XZkM9TL+u1VBd94D4N/eEm4GNDLxaEJ2eFmolmfOztd6Gr2QsNp0/eP
 isBVGNOf0bRN8MdVggtJ6wC8zkok8xJLBBbVOidQKIx0Q/RwA+A7S8aYLRdvJgvgY242
 pTGw==
X-Gm-Message-State: ACgBeo1Ilu6bxkdQXMVr9ryEbbnJSh+vkXITrkdmzhPafbZ2tzoBILYd
 ljc0iillDS3xM7SY9lvWmc7GfLIRSB47jrEQ
X-Received: by 2002:a05:6000:1888:b0:222:c96d:862f with SMTP id
 a8-20020a056000188800b00222c96d862fmr26004890wri.706.1662458740939; 
 Tue, 06 Sep 2022 03:05:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 9/9] target/arm: Enable TARGET_TB_PCREL
Date: Tue,  6 Sep 2022 11:05:28 +0100
Message-Id: <20220906100528.343244-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jrD1hP1EL3ML

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  2 ++
 target/arm/translate.h     |  6 ++++
 target/arm/cpu.c           | 23 +++++++-------
 target/arm/translate-a64.c | 37 ++++++++++++++++++-----
 target/arm/translate.c     | 62 ++++++++++++++++++++++++++++++--------
 5 files changed, 100 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 68ffb12427..ef62371d8f 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -34,4 +34,6 @@
 
 #define NB_MMU_MODES 15
 
+#define TARGET_TB_PCREL 1
+
 #endif
diff --git a/target/arm/translate.h b/target/arm/translate.h
index d42059aa1d..7717ea3f45 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -12,6 +12,12 @@ typedef struct DisasContext {
 
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
+    /*
+     * For TARGET_TB_PCREL, the value relative to pc_curr against which
+     * offsets must be computed for cpu_pc.  -1 if unknown due to jump.
+     */
+    target_ulong pc_save;
+    target_ulong pc_cond_save;
     target_ulong page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 047bf3f4ab..f5e74b6c3b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -64,17 +64,18 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * It's OK to look at env for the current mode here, because it's
-     * never possible for an AArch64 TB to chain to an AArch32 TB.
-     */
-    if (is_a64(env)) {
-        env->pc = tb_pc(tb);
-    } else {
-        env->regs[15] = tb_pc(tb);
+    /* The program counter is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        CPUARMState *env = cs->env_ptr;
+        /*
+         * It's OK to look at env for the current mode here, because it's
+         * never possible for an AArch64 TB to chain to an AArch32 TB.
+         */
+        if (is_a64(env)) {
+            env->pc = tb_pc(tb);
+        } else {
+            env->regs[15] = tb_pc(tb);
+        }
     }
 }
 #endif /* CONFIG_TCG */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7dd9b29dbf..cd3e9bb3c0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -150,12 +150,18 @@ static void reset_btype(DisasContext *s)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, int diff)
 {
-    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_i64(dest, cpu_pc, (s->pc_curr - s->pc_save) + diff);
+    } else {
+        tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    }
 }
 
 void gen_a64_update_pc(DisasContext *s, int diff)
 {
     gen_pc_plus_diff(s, cpu_pc, diff);
+    s->pc_save = s->pc_curr + diff;
 }
 
 /*
@@ -209,6 +215,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
      * then loading an address into the PC will clear out any tag.
      */
     gen_top_byte_ignore(s, cpu_pc, src, s->tbii);
+    s->pc_save = -1;
 }
 
 /*
@@ -347,16 +354,22 @@ static void gen_exception_internal(int excp)
 
 static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
+    target_ulong pc_save = s->pc_save;
+
     gen_a64_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
+    target_ulong pc_save = s->pc_save;
+
     gen_a64_update_pc(s, 0);
     gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 static void gen_step_complete_exception(DisasContext *s)
@@ -385,11 +398,16 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
 
 static void gen_goto_tb(DisasContext *s, int n, int diff)
 {
-    uint64_t dest = s->pc_curr + diff;
+    target_ulong pc_save = s->pc_save;
 
-    if (use_goto_tb(s, dest)) {
-        tcg_gen_goto_tb(n);
-        gen_a64_update_pc(s, diff);
+    if (use_goto_tb(s, s->pc_curr + diff)) {
+        if (TARGET_TB_PCREL) {
+            gen_a64_update_pc(s, diff);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_a64_update_pc(s, diff);
+        }
         tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
@@ -401,6 +419,7 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
             s->base.is_jmp = DISAS_NORETURN;
         }
     }
+    s->pc_save = pc_save;
 }
 
 static void init_tmp_a64_array(DisasContext *s)
@@ -14717,7 +14736,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 
     dc->isar = &arm_cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = true;
     dc->thumb = false;
     dc->sctlr_b = 0;
@@ -14799,8 +14818,12 @@ static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong pc_arg = dc->base.pc_next;
 
-    tcg_gen_insn_start(dc->base.pc_next, 0, 0);
+    if (TARGET_TB_PCREL) {
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
+    tcg_gen_insn_start(pc_arg, 0, 0);
     dc->insn_start = tcg_last_op();
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f01c8df60a..a25ba48e87 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -164,6 +164,7 @@ void arm_gen_condlabel(DisasContext *s)
     if (!s->condjmp) {
         s->condlabel = gen_new_label();
         s->condjmp = 1;
+        s->pc_cond_save = s->pc_save;
     }
 }
 
@@ -278,7 +279,12 @@ static int jmp_diff(DisasContext *s, int diff)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, int diff)
 {
-    tcg_gen_movi_i32(var, s->pc_curr + diff);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_i32(var, cpu_R[15], (s->pc_curr - s->pc_save) + diff);
+    } else {
+        tcg_gen_movi_i32(var, s->pc_curr + diff);
+    }
 }
 
 /* Set a variable to the value of a CPU register.  */
@@ -321,6 +327,7 @@ void store_reg(DisasContext *s, int reg, TCGv_i32 var)
          */
         tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->base.is_jmp = DISAS_JUMP;
+        s->pc_save = -1;
     } else if (reg == 13 && arm_dc_feature(s, ARM_FEATURE_M)) {
         /* For M-profile SP bits [1:0] are always zero */
         tcg_gen_andi_i32(var, var, ~3);
@@ -786,7 +793,8 @@ void gen_set_condexec(DisasContext *s)
 
 void gen_update_pc(DisasContext *s, int diff)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_R[15], diff);
+    s->pc_save = s->pc_curr + diff;
 }
 
 /* Set PC and Thumb state from var.  var is marked as dead.  */
@@ -796,6 +804,7 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
     tcg_gen_andi_i32(cpu_R[15], var, ~1);
     tcg_gen_andi_i32(var, var, 1);
     store_cpu_field(var, thumb);
+    s->pc_save = -1;
 }
 
 /*
@@ -1118,6 +1127,8 @@ static void gen_exception(int excp, uint32_t syndrome)
 static void gen_exception_insn_el_v(DisasContext *s, int pc_diff, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (s->aarch64) {
         gen_a64_update_pc(s, pc_diff);
     } else {
@@ -1126,6 +1137,7 @@ static void gen_exception_insn_el_v(DisasContext *s, int pc_diff, int excp,
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 void gen_exception_insn_el(DisasContext *s, int pc_diff, int excp,
@@ -1137,6 +1149,8 @@ void gen_exception_insn_el(DisasContext *s, int pc_diff, int excp,
 
 void gen_exception_insn(DisasContext *s, int pc_diff, int excp, uint32_t syn)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (s->aarch64) {
         gen_a64_update_pc(s, pc_diff);
     } else {
@@ -1145,6 +1159,7 @@ void gen_exception_insn(DisasContext *s, int pc_diff, int excp, uint32_t syn)
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
@@ -2612,11 +2627,14 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, int diff)
 {
-    target_ulong dest = s->pc_curr + diff;
-
-    if (translator_use_goto_tb(&s->base, dest)) {
-        tcg_gen_goto_tb(n);
-        gen_update_pc(s, diff);
+    if (translator_use_goto_tb(&s->base, s->pc_curr + diff)) {
+        if (TARGET_TB_PCREL) {
+            gen_update_pc(s, diff);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_update_pc(s, diff);
+        }
         tcg_gen_exit_tb(s->base.tb, n);
     } else {
         gen_update_pc(s, diff);
@@ -2628,10 +2646,13 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
 static void gen_jmp_tb(DisasContext *s, int diff, int tbno)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
         s->base.is_jmp = DISAS_JUMP;
+        s->pc_save = pc_save;
         return;
     }
     switch (s->base.is_jmp) {
@@ -2667,6 +2688,7 @@ static void gen_jmp_tb(DisasContext *s, int diff, int tbno)
          */
         g_assert_not_reached();
     }
+    s->pc_save = pc_save;
 }
 
 static inline void gen_jmp(DisasContext *s, int diff)
@@ -9333,7 +9355,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->isar = &cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = false;
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
@@ -9488,13 +9510,17 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
      * fields here.
      */
     uint32_t condexec_bits;
+    target_ulong pc_arg = dc->base.pc_next;
 
+    if (TARGET_TB_PCREL) {
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
     if (dc->eci) {
         condexec_bits = dc->eci << 4;
     } else {
         condexec_bits = (dc->condexec_cond << 4) | (dc->condexec_mask >> 1);
     }
-    tcg_gen_insn_start(dc->base.pc_next, condexec_bits, 0);
+    tcg_gen_insn_start(pc_arg, condexec_bits, 0);
     dc->insn_start = tcg_last_op();
 }
 
@@ -9537,7 +9563,10 @@ static bool arm_check_ss_active(DisasContext *dc)
 
 static void arm_post_translate_insn(DisasContext *dc)
 {
-    if (dc->condjmp && !dc->base.is_jmp) {
+    if (dc->condjmp && dc->base.is_jmp == DISAS_NEXT) {
+        if (dc->pc_save != dc->pc_cond_save) {
+            gen_update_pc(dc, dc->pc_cond_save - dc->pc_save);
+        }
         gen_set_label(dc->condlabel);
         dc->condjmp = 0;
     }
@@ -9867,6 +9896,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
     if (dc->condjmp) {
         /* "Condition failed" instruction codepath for the branch/trap insn */
+        dc->pc_save = dc->pc_cond_save;
         gen_set_label(dc->condlabel);
         gen_set_condexec(dc);
         if (unlikely(dc->ss_active)) {
@@ -9929,11 +9959,19 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
     if (is_a64(env)) {
-        env->pc = data[0];
+        if (TARGET_TB_PCREL) {
+            env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->pc = data[0];
+        }
         env->condexec_bits = 0;
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     } else {
-        env->regs[15] = data[0];
+        if (TARGET_TB_PCREL) {
+            env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->regs[15] = data[0];
+        }
         env->condexec_bits = data[1];
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     }
-- 
2.34.1

