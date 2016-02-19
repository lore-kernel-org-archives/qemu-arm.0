Received: by 10.25.208.211 with SMTP id h202csp31320lfg;
        Fri, 19 Feb 2016 12:05:32 -0800 (PST)
X-Received: by 10.66.101.2 with SMTP id fc2mr20664862pab.96.1455912332309;
        Fri, 19 Feb 2016 12:05:32 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com. [2607:f8b0:400e:c00::230])
        by mx.google.com with ESMTPS id rb5si18328432pab.125.2016.02.19.12.05.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:32 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::230 as permitted sender) client-ip=2607:f8b0:400e:c00::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::230 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x230.google.com with SMTP id x65so56432663pfb.1;
        Fri, 19 Feb 2016 12:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sy4Jh8miDEYJxxcaeVBunx5q7WnY5H1MNqpCXeFEk44=;
        b=Xb3Q3mBKQ4dyyU+fWHXhgw9OcdI0kzvCVhNTJJWf+hYLcnTG16vPrJS6n9GnXqO5qR
         7CadjE21/VXWN3mWG9f0Sin49raF3Rv/mM4L0Pg/9r+mBK/OmQF86aZyfBnoZCMQHtm4
         CXIrkcbpeIeGf26eCfr2PB+o1olrPuL9Mzb2fW4yOE1XAsK0WQFpb4toFdsKssvjx3hZ
         h6otZIYHmJ3OksviQaw1GTeN4/7Nak4ESbTJ51MMKE1K+DcF42xs5eEcs19oRUF2Eb8z
         SplLoRSkUrwEIOgZrLnxs2TRiO7zIqNQoOWvogk2yMO77kZk0NJq5BxtFWfGvRz/zlU3
         7K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sy4Jh8miDEYJxxcaeVBunx5q7WnY5H1MNqpCXeFEk44=;
        b=VD2Q7OiKm7IbonFD8LenTL78CXn1Dh/iZVIIQinQxLdOuj55LQ3QUFJsQCJLud0c5j
         DDDdKcFG0suld1LcVxjeF7ZZkVb6m9Bw2EwOF/yuwFrYLtvQIz7h18JPAt/BuwJarTxY
         k2BNYW/0008Xq5WP25TFJhGzTeeBQroJHQ1EkV6ZeIvbR23Pzd7xUvp8aGQBycoqcsC2
         4gubOx85gCS7YC8UEUZZy/xn4SKIsRlvEACEbIk77GN+lsfgnQXscf9lsI9n3hmfFu18
         DfSKAd/hCTFGnHy47bln1AtB+RjsWNl3cYYOPt4MT1mMdB/o8QnJIR686mIxb7lkdyPB
         Ph1A==
X-Gm-Message-State: AG10YORMdsDpx0RC9LgnDCTBSNkBnY/NJETzvFxbsFOUMQNIi/mYWADcchpORmiqEX8ndw==
X-Received: by 10.98.72.215 with SMTP id q84mr20924039pfi.152.1455912331970;
        Fri, 19 Feb 2016 12:05:31 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id o73sm19647758pfa.37.2016.02.19.12.05.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:31 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 7/8] target-arm: A64: Create Instruction Syndromes for Data Aborts
Date: Fri, 19 Feb 2016 21:04:51 +0100
Message-Id: <1455912292-23807-8-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: AeqUjw+go3gk

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for generating the instruction syndrome for Data Aborts.
These syndromes are used by hypervisors for example to trap and emulate
memory accesses.

We save the decoded data out-of-band with the TBs at translation time.
When exceptions hit, the extra data attached to the TB is used to
recreate the state needed to encode instruction syndromes.
This avoids the need to emit moves with every load/store.

Based on a suggestion from Peter Maydell.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/cpu.h           |  2 +-
 target-arm/op_helper.c     | 47 +++++++++++++++++++++++-------
 target-arm/translate-a64.c | 72 +++++++++++++++++++++++++++++++++++++++++++++-
 target-arm/translate.c     |  5 +++-
 target-arm/translate.h     | 14 +++++++++
 5 files changed, 127 insertions(+), 13 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 1623821..c3ade8d 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -95,7 +95,7 @@
 struct arm_boot_info;
 
 #define NB_MMU_MODES 7
-#define TARGET_INSN_START_EXTRA_WORDS 1
+#define TARGET_INSN_START_EXTRA_WORDS 2
 
 /* We currently assume float and double are IEEE single and double
    precision respectively.
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 2522d3c..6070588 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -75,6 +75,37 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ireg, uint32_t def,
 
 #if !defined(CONFIG_USER_ONLY)
 
+static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
+                                            unsigned int target_el,
+                                            bool same_el,
+                                            bool s1ptw, int is_write,
+                                            int fsc)
+{
+    uint32_t syn;
+
+    if (target_el != 2 || s1ptw) {
+        /* ISV is only set for data aborts routed to EL2 and
+         * never for stage-1 page table walks faulting on stage 2.
+         *
+         * See ARMv8 specs, D7-1974:
+         * ISS encoding for an exception from a Data Abort, the
+         * ISV field.
+         */
+        template_syn = 0;
+    }
+    /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
+     * syndrome created at translation time.
+     * Now we create the runtime syndrome with the remaining fields.
+     */
+    syn = syn_data_abort(same_el,
+                         0, 0, 0, 0, 0, 0,
+                         0, 0, s1ptw, is_write == 1, fsc,
+                         0);
+    /* Merge runtime syndrome with the template syndrome.  */
+    syn |= template_syn;
+    return syn;
+}
+
 /* try to fill the TLB and return an exception if error. If retaddr is
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
@@ -115,10 +146,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
-            syn = syn_data_abort(same_el,
-                                 0, 0, 0, 0, 0, 0,
-                                 0, 0, fi.s1ptw, is_write == 1, syn,
-                                 1);
+            syn = merge_syn_data_abort(env->exception.syndrome, target_el,
+                                       same_el, fi.s1ptw, is_write, syn);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
@@ -139,6 +168,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     CPUARMState *env = &cpu->env;
     int target_el;
     bool same_el;
+    uint32_t syn;
 
     if (retaddr) {
         /* now we have a real cpu fault */
@@ -163,12 +193,9 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
         env->exception.fsr |= (1 << 11);
     }
 
-    raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort(same_el,
-                                   0, 0, 0, 0, 0, 0,
-                                   0, 0, 0, is_write == 1, 0x21,
-                                   1),
-                    target_el);
+    syn = merge_syn_data_abort(env->exception.syndrome, target_el,
+                               same_el, 0, is_write, 0x21);
+    raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
 }
 
 #endif /* !defined(CONFIG_USER_ONLY) */
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 9e26d5e..5250c08 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1803,6 +1803,24 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
 }
 #endif
 
+static void disas_ldr_update_isyn_sse_sf(DisasContext *s, int size,
+                                        bool is_signed, int opc)
+{
+    int opc0 = extract32(opc, 0, 1);
+    int regsize;
+
+    s->isyn.dabt.sse = is_signed;
+    /* Update the Sixty-Four bit (SF) registersize. This logic is derived
+     * from the ARMv8 specs for LDR (Shared decode for all encodings).
+     */
+    if (is_signed) {
+        regsize = opc0 ? 32 : 64;
+    } else {
+        regsize = size == 3 ? 64 : 32;
+    }
+    s->isyn.dabt.sf = regsize == 64;
+}
+
 /* C3.3.6 Load/store exclusive
  *
  *  31 30 29         24  23  22   21  20  16  15  14   10 9    5 4    0
@@ -1859,6 +1877,12 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         } else {
             do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
         }
+
+        /* Generate ISV for non-exclusive accesses including LASR.  */
+        s->isyn.dabt.valid = true;
+        s->isyn.dabt.sse = false;
+        s->isyn.dabt.sf = size == 3 ? 64 : 32;
+        s->isyn.dabt.ar = is_lasr;
     }
 }
 
@@ -1901,6 +1925,11 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         }
         size = 2 + extract32(opc, 0, 1);
         is_signed = extract32(opc, 1, 1);
+
+        /* Enable ISV generation.  */
+        s->isyn.dabt.valid = true;
+        s->isyn.dabt.sse = is_signed;
+        s->isyn.dabt.sf = size == 3 ? 64 : 32;
     }
 
     tcg_rt = cpu_reg(s, rt);
@@ -2119,6 +2148,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         is_store = (opc == 0);
         is_signed = extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
+        disas_ldr_update_isyn_sse_sf(s, size, is_signed, opc);
     }
 
     switch (idx) {
@@ -2238,6 +2268,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
         is_store = (opc == 0);
         is_signed = extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
+        disas_ldr_update_isyn_sse_sf(s, size, is_signed, opc);
     }
 
     if (rn == 31) {
@@ -2321,6 +2352,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
         is_store = (opc == 0);
         is_signed = extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
+        disas_ldr_update_isyn_sse_sf(s, size, is_signed, opc);
     }
 
     if (rn == 31) {
@@ -2354,6 +2386,11 @@ static void disas_ldst_reg(DisasContext *s, uint32_t insn)
     bool is_vector = extract32(insn, 26, 1);
     int size = extract32(insn, 30, 2);
 
+    /* Vectored load/stores do not include an Insn Syndrome.  */
+    s->isyn.dabt.valid = !is_vector;
+    s->isyn.dabt.sas = size;
+    s->isyn.dabt.srt = rt;
+
     switch (extract32(insn, 24, 2)) {
     case 0:
         if (extract32(insn, 21, 1) == 1 && extract32(insn, 10, 2) == 2) {
@@ -2660,6 +2697,21 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 /* C3.3 Loads and stores */
 static void disas_ldst(DisasContext *s, uint32_t insn)
 {
+    uint32_t isyn32;
+
+    /* Insn Syndrome in AArch64 is only valid for:
+     * Load/Stores of a single GPR (e.g not vector regs).
+     * Including register 31.
+     * Including Acquire/Release.
+     * Excluding Exclusive accesses.
+     * Excluding accesses with writeback.
+     *
+     * We clear the insn syndrome state here (invalidating it).
+     * The various sub decoders will then fill out information
+     * as they decode it.
+     */
+    memset(&s->isyn, 0, sizeof s->isyn);
+
     switch (extract32(insn, 24, 6)) {
     case 0x08: /* Load/store exclusive */
         disas_ldst_excl(s, insn);
@@ -2685,6 +2737,23 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
         unallocated_encoding(s);
         break;
     }
+
+    /* The saved insn syndrome state in insn_start is already zero (invalid).
+     * We only update it if we have a valid insn syndrome to save.
+     */
+    if (s->isyn.dabt.valid) {
+        isyn32 = syn_data_abort(0,
+                                s->isyn.dabt.valid,
+                                s->isyn.dabt.sas,
+                                s->isyn.dabt.sse,
+                                s->isyn.dabt.srt,
+                                s->isyn.dabt.sf,
+                                s->isyn.dabt.ar,
+                                0, 0, 0, 0, 0, false);
+        /* We don't use the lower 14 bits.  */
+        isyn32 >>= 14;
+        tcg_set_insn_param(s->insn_start_idx, 2, isyn32);
+    }
 }
 
 /* C3.4.6 PC-rel. addressing
@@ -11087,7 +11156,8 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
     tcg_clear_temp_count();
 
     do {
-        tcg_gen_insn_start(dc->pc, 0);
+        dc->insn_start_idx = tcg_op_buf_count();
+        tcg_gen_insn_start(dc->pc, 0, 0);
         num_insns++;
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
diff --git a/target-arm/translate.c b/target-arm/translate.c
index e69145d..7d83c94 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11406,7 +11406,8 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
       }
     do {
         tcg_gen_insn_start(dc->pc,
-                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1));
+                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
+                           0);
         num_insns++;
 
 #ifdef CONFIG_USER_ONLY
@@ -11722,8 +11723,10 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
     if (is_a64(env)) {
         env->pc = data[0];
         env->condexec_bits = 0;
+        env->exception.syndrome = data[2] << 14;
     } else {
         env->regs[15] = data[0];
         env->condexec_bits = data[1];
+        env->exception.syndrome = data[2] << 14;
     }
 }
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 53ef971..e002c90 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -58,6 +58,20 @@ typedef struct DisasContext {
     bool ss_same_el;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
     int c15_cpar;
+    /* State needed to create the Data Abort template syndrome.  */
+    struct {
+        /* Data Abort section.  */
+        struct {
+            bool valid;
+            unsigned int sas;
+            bool sse;
+            unsigned int srt;
+            bool sf;
+            bool ar;
+        } dabt;
+    } isyn;
+    /* TCG op index of the current insn_start.  */
+    int insn_start_idx;
 #define TMP_A64_MAX 16
     int tmp_a64_count;
     TCGv_i64 tmp_a64[TMP_A64_MAX];
-- 
1.9.1
