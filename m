Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259C2F46C47
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVn-00039v-RD; Mon, 06 Apr 2026 11:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVm-00038U-Eg
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVj-00045u-SX
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-35c238f1063so2411589a91.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487906; x=1776092706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1L86uxagesTAR2MbXgeWPsQvtTYWrgsau2aa3Y7nNBA=;
 b=L+jQxzTIy4oVVptSsNeSLiGu+N3q4LUe4w+8TB0HOdYd9cHlcVerF7lGz6tMeaJ89B
 5Ffe8FamwIKcbjRg3cHL4b60wWbQnm0NlV2ZvrW+r2/xYBs7iYNkYWDVNsnxr8+Jkj2y
 4GG6P3qazuZuxMtcSDQTnzLKA8P0RToMi13H4zry+OdJUKrkujgpGFX80Y3opM/Htz3d
 MVCa++l08HDcdp9nJqhY2ZrIspKx3SvFBfX/IEXM4GrfsfbZg9nmjKEjckVj/cKhoG58
 KRJWgxHfjFk8qiiZszcwRH2bGFsBGyQFahsEKM6ll0uKeCbMCbv4D7oS0qRbsQloHzqz
 PnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487906; x=1776092706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1L86uxagesTAR2MbXgeWPsQvtTYWrgsau2aa3Y7nNBA=;
 b=Aobq+RaP5F7+Tu9eAfBM/JtVE830emGhiGGdQP4MbGx/YLDJUE4xXKhhQ0wDUHsRxO
 FramFDn/jD8wRkC4PcRlx2O1eZNtN8Mkl/ztSVoXztWSmQQDbXwpoRyvowXngudoinu3
 zgJ6oF9jOt8BnqNwqz1ecIOBSDa+lx6u/2BM9URobgqNb489WKt1rS6+xUZBQlYZZ0Kw
 3iyZhbAfKVI0f/H7oEO3FAWjkpM/woeydYPQNjpuRE687M9F8eO0UKSIxhDCm+i2uvct
 UKsHHVfgeMQ2Wvll21JGCX7zvxIKQf0tCVKrHIDk9ihlQ3d7s+a52PZWlNM091rieIea
 DpTg==
X-Gm-Message-State: AOJu0YymMiV5/kMhOvlhFx0Jos3n2nC1ddeIH7hhTIiH3avWbc66wfYE
 BPEt9hLaLTBU4m/jSCd4zOTSWipYIgTPEIajHPA7tfcXmihyis94vhEjhN+njXjJpPU=
X-Gm-Gg: AeBDievEFjFZh7LcQhTHuXB5jSLVvGZAGV30dsM7lbm+JfSzAR0ztwiYbF7UWJfi5AP
 DiVJKTkzgygTIin9Rrr9VVHy8Qd+KyM12vCmVTWd0SMHv5kyIgtjJeOIwjwTEKZvl+thJJKlLl3
 BtbjvTG6pIOwXR/3OOJ9eK3uRrKO4Ok/z6koKW3TG10xlrjt9o1RVTcMigjrBd9c0FhVR9TdI1E
 x4ws082a+FZQc9e6m3HW22HynwcKhvLMiZgqe3l1sMIaCHSYvX7qM/4mSEqKhOLpEJj6MWYS8Qw
 dvai9Ov0/pMouS6yGPyIajjfeeeIPRBJY+oNpG0fDZsd9dMsv7eY1NZKGM/BkQXCoUq0pDJFyr/
 UjSbQJjFzpCm9TcTtuoZBEWWvTEr9p/FXvJfHq69Q6wZnihmiJhJ4by45rSAxMIQi9NWrnI6PCp
 jnaNpCiScJnQjmJCMMxK/ozD6ji7bt/6rNDDBMCyNA6pgQ30gKQ7YKiZEIbUQAXseFGyBA58xCQ
 vnt
X-Received: by 2002:a17:903:2ec8:b0:2ae:59a9:639d with SMTP id
 d9443c01a7336-2b2817cc36bmr143376475ad.4.1775487906168; 
 Mon, 06 Apr 2026 08:05:06 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:05:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 13/14] tcg/translator: add parameter to translator_loop for
 current addr type
Date: Mon,  6 Apr 2026 08:04:33 -0700
Message-ID: <20260406150434.407201-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102e.google.com
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

With TCG_ADDRESS_BITS mechanism, it's now possible to specify which
variant every source file is written for. Compared to before, it means
that addr_type will now vary per tb translation, where it was constant
for a given target previously.

Thus, we add a parameter to translator_loop().
Since all targets for now still use default target addr type, we add a
simple helper returning this value based on target_long_bits().

This will allow us to convert targets one by one.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/translator.h        | 4 +++-
 include/tcg/tcg.h                | 5 +++++
 accel/tcg/translator.c           | 4 +++-
 target/alpha/translate.c         | 3 ++-
 target/arm/tcg/translate.c       | 3 ++-
 target/avr/translate.c           | 3 ++-
 target/hexagon/translate.c       | 3 ++-
 target/hppa/translate.c          | 3 ++-
 target/i386/tcg/translate.c      | 3 ++-
 target/loongarch/tcg/translate.c | 3 ++-
 target/m68k/translate.c          | 3 ++-
 target/microblaze/translate.c    | 3 ++-
 target/mips/tcg/translate.c      | 3 ++-
 target/or1k/translate.c          | 3 ++-
 target/ppc/translate.c           | 3 ++-
 target/riscv/translate.c         | 3 ++-
 target/rx/translate.c            | 3 ++-
 target/s390x/tcg/translate.c     | 3 ++-
 target/sh4/translate.c           | 3 ++-
 target/sparc/translate.c         | 3 ++-
 target/tricore/translate.c       | 3 ++-
 target/xtensa/translate.c        | 3 ++-
 22 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 8d343627bd9..c1d31e06b53 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -20,6 +20,7 @@
 
 #include "exec/memop.h"
 #include "exec/vaddr.h"
+#include "tcg/tcg.h"
 
 /**
  * DisasJumpType:
@@ -132,6 +133,7 @@ typedef struct TranslatorOps {
  * @host_pc: host physical program counter address
  * @ops: Target-specific operations.
  * @db: Disassembly context.
+ * @addr_type: TCG Type for addresses (TCGv_va).
  *
  * Generic translator loop.
  *
@@ -147,7 +149,7 @@ typedef struct TranslatorOps {
  */
 void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                      vaddr pc, void *host_pc, const TranslatorOps *ops,
-                     DisasContextBase *db);
+                     DisasContextBase *db, TCGType addr_type);
 
 /**
  * translator_use_goto_tb
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 45c7e118c3d..f8301d98623 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -166,6 +166,11 @@ static inline int tcg_type_size(TCGType t)
 
 typedef tcg_target_ulong TCGArg;
 
+static inline TCGType tcg_default_addr_type(void)
+{
+    return target_long_bits() == 32 ? TCG_TYPE_I32 : TCG_TYPE_I64;
+}
+
 /* Define type and accessor macros for TCG variables.
 
    TCG variables are the inputs and outputs of TCG ops, as described
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index f3eddcbb2e8..cd7d079fe05 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -121,13 +121,15 @@ bool translator_use_goto_tb(DisasContextBase *db, vaddr dest)
 
 void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                      vaddr pc, void *host_pc, const TranslatorOps *ops,
-                     DisasContextBase *db)
+                     DisasContextBase *db, TCGType addr_type)
 {
     uint32_t cflags = tb_cflags(tb);
     TCGOp *icount_start_insn;
     TCGOp *first_insn_start = NULL;
     bool plugin_enabled;
 
+    tcg_ctx->addr_type = addr_type;
+
     /* Initialize DisasContext */
     db->tb = tb;
     db->pc_first = pc;
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 4d22d7d5a45..24c556bffc0 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2953,5 +2953,6 @@ void alpha_translate_code(CPUState *cpu, TranslationBlock *tb,
                           int *max_insns, vaddr pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(cpu, tb, max_insns, pc, host_pc, &alpha_tr_ops, &dc.base);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &alpha_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 204f9657993..ebcf68aea97 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6891,5 +6891,6 @@ void arm_translate_code(CPUState *cpu, TranslationBlock *tb,
     }
 #endif
 
-    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base,
+                    tcg_default_addr_type());
 }
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 649dd4b0112..e7c894b578f 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2802,5 +2802,6 @@ void avr_cpu_translate_code(CPUState *cs, TranslationBlock *tb,
                             int *max_insns, vaddr pc, void *host_pc)
 {
     DisasContext dc = { };
-    translator_loop(cs, tb, max_insns, pc, host_pc, &avr_tr_ops, &dc.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &avr_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 633401451d8..222e19c707e 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -1077,7 +1077,8 @@ void hexagon_translate_code(CPUState *cs, TranslationBlock *tb,
     DisasContext ctx;
 
     translator_loop(cs, tb, max_insns, pc, host_pc,
-                    &hexagon_tr_ops, &ctx.base);
+                    &hexagon_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
 
 #define NAME_LEN               64
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 70c20c00377..7cc260359a4 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4899,5 +4899,6 @@ void hppa_translate_code(CPUState *cs, TranslationBlock *tb,
                          int *max_insns, vaddr pc, void *host_pc)
 {
     DisasContext ctx = { };
-    translator_loop(cs, tb, max_insns, pc, host_pc, &hppa_tr_ops, &ctx.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &hppa_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 14210d569f7..261f2f928b3 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3615,5 +3615,6 @@ void x86_translate_code(CPUState *cpu, TranslationBlock *tb,
 {
     DisasContext dc;
 
-    translator_loop(cpu, tb, max_insns, pc, host_pc, &i386_tr_ops, &dc.base);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &i386_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
diff --git a/target/loongarch/tcg/translate.c b/target/loongarch/tcg/translate.c
index b9ed13d19c6..d3a03619e27 100644
--- a/target/loongarch/tcg/translate.c
+++ b/target/loongarch/tcg/translate.c
@@ -342,7 +342,8 @@ void loongarch_translate_code(CPUState *cs, TranslationBlock *tb,
     DisasContext ctx;
 
     translator_loop(cs, tb, max_insns, pc, host_pc,
-                    &loongarch_tr_ops, &ctx.base);
+                    &loongarch_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
 
 void loongarch_translate_init(void)
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index abc1c79f3cd..8e484cf36ea 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6126,7 +6126,8 @@ void m68k_translate_code(CPUState *cpu, TranslationBlock *tb,
                          int *max_insns, vaddr pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(cpu, tb, max_insns, pc, host_pc, &m68k_tr_ops, &dc.base);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &m68k_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
 
 static double floatx80_to_double(CPUM68KState *env, uint16_t high, uint64_t low)
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 2af67beecec..fdbf493145d 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1788,7 +1788,8 @@ void mb_translate_code(CPUState *cpu, TranslationBlock *tb,
                        int *max_insns, vaddr pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(cpu, tb, max_insns, pc, host_pc, &mb_tr_ops, &dc.base);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &mb_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
 
 void mb_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 54849e9ff1a..08b69716e40 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15242,7 +15242,8 @@ void mips_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext ctx;
 
-    translator_loop(cs, tb, max_insns, pc, host_pc, &mips_tr_ops, &ctx.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &mips_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
 
 void mips_tcg_init(void)
diff --git a/target/or1k/translate.c b/target/or1k/translate.c
index de81dc6ef8d..11aaa1084a2 100644
--- a/target/or1k/translate.c
+++ b/target/or1k/translate.c
@@ -1647,7 +1647,8 @@ void openrisc_translate_code(CPUState *cs, TranslationBlock *tb,
     DisasContext ctx;
 
     translator_loop(cs, tb, max_insns, pc, host_pc,
-                    &openrisc_tr_ops, &ctx.base);
+                    &openrisc_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
 
 void openrisc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a09a6df93fd..2f8b0061ff5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6719,5 +6719,6 @@ void ppc_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext ctx;
 
-    translator_loop(cs, tb, max_insns, pc, host_pc, &ppc_tr_ops, &ctx.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &ppc_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index cb4f4436018..3706359f516 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1440,7 +1440,8 @@ void riscv_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext ctx;
 
-    translator_loop(cs, tb, max_insns, pc, host_pc, &riscv_tr_ops, &ctx.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &riscv_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
 
 void riscv_translate_init(void)
diff --git a/target/rx/translate.c b/target/rx/translate.c
index a245b9db8fe..2f3d01d22a8 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2270,7 +2270,8 @@ void rx_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext dc;
 
-    translator_loop(cs, tb, max_insns, pc, host_pc, &rx_tr_ops, &dc.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &rx_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
 
 #define ALLOC_REGISTER(sym, name) \
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 92344441878..f8f134ee99b 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6509,7 +6509,8 @@ void s390x_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext dc;
 
-    translator_loop(cs, tb, max_insns, pc, host_pc, &s390x_tr_ops, &dc.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &s390x_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
 
 void s390x_restore_state_to_opc(CPUState *cs,
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index b1057727c55..ee0848d131b 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2316,5 +2316,6 @@ void sh4_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext ctx;
 
-    translator_loop(cs, tb, max_insns, pc, host_pc, &sh4_tr_ops, &ctx.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &sh4_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 7e8558dbbd8..c2c446f1407 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5853,7 +5853,8 @@ void sparc_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext dc = {};
 
-    translator_loop(cs, tb, max_insns, pc, host_pc, &sparc_tr_ops, &dc.base);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &sparc_tr_ops, &dc.base,
+                    tcg_default_addr_type());
 }
 
 void sparc_tcg_init(void)
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 0eaf7a82f87..4f264987853 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8500,7 +8500,8 @@ void tricore_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     DisasContext ctx;
     translator_loop(cs, tb, max_insns, pc, host_pc,
-                    &tricore_tr_ops, &ctx.base);
+                    &tricore_tr_ops, &ctx.base,
+                    tcg_default_addr_type());
 }
 
 /*
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 5e3707d3fdf..3fe7558bc52 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1233,7 +1233,8 @@ void xtensa_translate_code(CPUState *cpu, TranslationBlock *tb,
 {
     DisasContext dc = {};
     translator_loop(cpu, tb, max_insns, pc, host_pc,
-                    &xtensa_translator_ops, &dc.base);
+                    &xtensa_translator_ops, &dc.base,
+                    tcg_default_addr_type());
 }
 
 void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.47.3


