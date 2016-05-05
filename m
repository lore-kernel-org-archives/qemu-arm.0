Received: by 10.25.208.137 with SMTP id h131csp813482lfg;
        Thu, 5 May 2016 09:10:04 -0700 (PDT)
X-Received: by 10.194.164.228 with SMTP id yt4mr16515009wjb.64.1462464604511;
        Thu, 05 May 2016 09:10:04 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id w1si12385621wjj.244.2016.05.05.09.10.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 May 2016 09:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x232.google.com with SMTP id e201so26524001wme.0;
        Thu, 05 May 2016 09:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AlyL/UNPVdP7r5rnkBMLIAVh4zcP0PnVcS4eyMEUT0I=;
        b=JwFtdoFkR/Nlgy1o8a86X2kkU+2Q+Gp6kOazQ8VU1s/heSEEDTQL1+mvxQqKVB0EUK
         6XX4n13bc1hxaqB2iKRfTr9TSoJ7qgX2AlEAQuhorXgNbqwyXUdD13EkF7r2graw3o6C
         uSywFGOeKhlKMk8u3yTjHESD/ArpIRNUdxMdrep2EDn5UlbCX+cpYxvOkwDZ1hTOfaP+
         1Wc84HIXqCDENMCJ+mZ8z4mrLo2mCGdG8UMC3bAwD3TuzNk4n5DZEuCi7OzhGC3EzL+k
         ep3SIBK9PzRZ9OESb+pvSP+LiZafJQA3vEHoGG78BsdM/7PqUwkwncN3DrWnMO73vYMp
         PRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AlyL/UNPVdP7r5rnkBMLIAVh4zcP0PnVcS4eyMEUT0I=;
        b=F7cWXi5h+oNDeELRWB6wp0qUCSRmEA8w1IMVHMrxN6pveonTho4VEHgdbJ42go+YR5
         4map2BaQEEdTI6uUwvre+iWBZXXfxkZmWYgmVpwMvJr85u1rCa1Lkbs+quO+jqNGLBCU
         nqAdrtfPuvCEU3V9XTg+5PW82g9Q8eiGE8qwJiMbAPrl4be6gQUQylInEjH4+QTUVg7T
         yJksARO+WoEwNVGTDXqZMQjkqXxyEPW1R+Ipkw0whycyL1S1jaiW6Qy4bzzXIjYa3SEJ
         ceyVoBnYME5k9IEMwh4d8ULyglYMqHVMTiWeLENUpx7fdljkjoKWwYWuuLt/FAXG++wm
         abdg==
X-Gm-Message-State: AOPr4FXh+GwctzWfQ0d/dl+lK7uCiYmtgqLZafXL1XIQDbl/t3/ShprrqhEYwleCmh3WtA==
X-Received: by 10.28.31.73 with SMTP id f70mr4552572wmf.77.1462464604110;
        Thu, 05 May 2016 09:10:04 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id jd4sm10405363wjb.43.2016.05.05.09.10.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 May 2016 09:10:03 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v4 1/1] target-arm: A64: Create Instruction Syndromes for Data Aborts
Date: Thu,  5 May 2016 18:10:01 +0200
Message-Id: <1462464601-10888-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1462464601-10888-1-git-send-email-edgar.iglesias@gmail.com>
References: <1462464601-10888-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: kctxi0NduDNv

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for generating the ISS (Instruction Specific Syndrome) for
Data Abort exceptions taken from AArch64.
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
 target-arm/cpu.h           |  14 ++++-
 target-arm/op_helper.c     |  49 ++++++++++++++--
 target-arm/translate-a64.c | 140 ++++++++++++++++++++++++++++++++++++++-------
 target-arm/translate.c     |   5 +-
 target-arm/translate.h     |   2 +
 5 files changed, 180 insertions(+), 30 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 066ff67..dea9bab 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -94,7 +94,19 @@
 struct arm_boot_info;
 
 #define NB_MMU_MODES 7
-#define TARGET_INSN_START_EXTRA_WORDS 1
+/* ARM-specific extra insn start words:
+ * 1: Conditional execution bits
+ * 2: Partial exception syndrome for data aborts
+ */
+#define TARGET_INSN_START_EXTRA_WORDS 2
+
+/* The 2nd extra word holding syndrome info for data aborts does not use
+ * the upper 6 bits nor the lower 14 bits. We mask and shift it down to
+ * help the sleb128 encoder do a better job.
+ * When restoring the CPU state, we shift it back up.
+ */
+#define ARM_INSN_START_WORD2_MASK ((1 << 26) - 1)
+#define ARM_INSN_START_WORD2_SHIFT 14
 
 /* We currently assume float and double are IEEE single and double
    precision respectively.
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index c7fba85..26aa4af 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -75,6 +75,43 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ireg, uint32_t def,
 
 #if !defined(CONFIG_USER_ONLY)
 
+static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
+                                            unsigned int target_el,
+                                            bool same_el,
+                                            bool s1ptw, int is_write,
+                                            int fsc)
+{
+    uint32_t syn;
+
+    /* ISV is only set for data aborts routed to EL2 and
+     * never for stage-1 page table walks faulting on stage 2.
+     *
+     * Furthermore, ISV is only set for certain kinds of load/stores.
+     * If the template syndrome does not have ISV set, we should leave
+     * it cleared.
+     *
+     * See ARMv8 specs, D7-1974:
+     * ISS encoding for an exception from a Data Abort, the
+     * ISV field.
+     */
+    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
+        syn = syn_data_abort_no_iss(same_el,
+                                    0, 0, s1ptw, is_write == 1, fsc);
+    } else {
+        /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
+         * syndrome created at translation time.
+         * Now we create the runtime syndrome with the remaining fields.
+         */
+        syn = syn_data_abort_with_iss(same_el,
+                                      0, 0, 0, 0, 0,
+                                      0, 0, s1ptw, is_write == 1, fsc,
+                                      false);
+        /* Merge the runtime syndrome with the template syndrome.  */
+        syn |= template_syn;
+    }
+    return syn;
+}
+
 /* try to fill the TLB and return an exception if error. If retaddr is
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
@@ -115,8 +152,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
-            syn = syn_data_abort_no_iss(same_el,
-                                        0, 0, fi.s1ptw, is_write == 1, syn);
+            syn = merge_syn_data_abort(env->exception.syndrome, target_el,
+                                       same_el, fi.s1ptw, is_write, syn);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
@@ -137,6 +174,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     CPUARMState *env = &cpu->env;
     int target_el;
     bool same_el;
+    uint32_t syn;
 
     if (retaddr) {
         /* now we have a real cpu fault */
@@ -161,10 +199,9 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
         env->exception.fsr |= (1 << 11);
     }
 
-    raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort_no_iss(same_el,
-                                          0, 0, 0, is_write == 1, 0x21),
-                    target_el);
+    syn = merge_syn_data_abort(env->exception.syndrome, target_el,
+                               same_el, 0, is_write, 0x21);
+    raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
 }
 
 #endif /* !defined(CONFIG_USER_ONLY) */
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 24f5e17..17ec6bb 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -305,6 +305,20 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
     }
 }
 
+static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
+{
+    /* We don't need to save all of the syndrome so we mask and shift
+     * out uneeded bits to help the sleb128 encoder do a better job.
+     */
+    syn &= ARM_INSN_START_WORD2_MASK;
+    syn >>= ARM_INSN_START_WORD2_SHIFT;
+
+    /* We check and clear insn_start_idx to catch multiple updates.  */
+    assert(s->insn_start_idx != 0);
+    tcg_set_insn_param(s->insn_start_idx, 2, syn);
+    s->insn_start_idx = 0;
+}
+
 static void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
@@ -720,23 +734,47 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
  * Store from GPR register to memory.
  */
 static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
-                             TCGv_i64 tcg_addr, int size, int memidx)
+                             TCGv_i64 tcg_addr, int size, int memidx,
+                             bool iss_valid,
+                             unsigned int iss_srt,
+                             bool iss_sf, bool iss_ar)
 {
     g_assert(size <= 3);
     tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->be_data + size);
+
+    if (iss_valid) {
+        uint32_t syn;
+
+        syn = syn_data_abort_with_iss(0,
+                                      size,
+                                      false,
+                                      iss_srt,
+                                      iss_sf,
+                                      iss_ar,
+                                      0, 0, 0, 0, 0, false);
+        disas_set_insn_syndrome(s, syn);
+    }
 }
 
 static void do_gpr_st(DisasContext *s, TCGv_i64 source,
-                      TCGv_i64 tcg_addr, int size)
+                      TCGv_i64 tcg_addr, int size,
+                      bool iss_valid,
+                      unsigned int iss_srt,
+                      bool iss_sf, bool iss_ar)
 {
-    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s));
+    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s),
+                     iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
 /*
  * Load from memory to GPR register
  */
-static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
-                             int size, bool is_signed, bool extend, int memidx)
+static void do_gpr_ld_memidx(DisasContext *s,
+                             TCGv_i64 dest, TCGv_i64 tcg_addr,
+                             int size, bool is_signed,
+                             bool extend, int memidx,
+                             bool iss_valid, unsigned int iss_srt,
+                             bool iss_sf, bool iss_ar)
 {
     TCGMemOp memop = s->be_data + size;
 
@@ -752,13 +790,30 @@ static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
         g_assert(size < 3);
         tcg_gen_ext32u_i64(dest, dest);
     }
+
+    if (iss_valid) {
+        uint32_t syn;
+
+        syn = syn_data_abort_with_iss(0,
+                                      size,
+                                      is_signed,
+                                      iss_srt,
+                                      iss_sf,
+                                      iss_ar,
+                                      0, 0, 0, 0, 0, false);
+        disas_set_insn_syndrome(s, syn);
+    }
 }
 
-static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
-                      int size, bool is_signed, bool extend)
+static void do_gpr_ld(DisasContext *s,
+                      TCGv_i64 dest, TCGv_i64 tcg_addr,
+                      int size, bool is_signed, bool extend,
+                      bool iss_valid, unsigned int iss_srt,
+                      bool iss_sf, bool iss_ar)
 {
     do_gpr_ld_memidx(s, dest, tcg_addr, size, is_signed, extend,
-                     get_mem_index(s));
+                     get_mem_index(s),
+                     iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
 /*
@@ -1814,6 +1869,22 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
 }
 #endif
 
+/* Update the Sixty-Four bit (SF) registersize. This logic is derived
+ * from the ARMv8 specs for LDR (Shared decode for all encodings).
+ */
+static bool disas_ldst_compute_iss_sf(int size, bool is_signed, int opc)
+{
+    int opc0 = extract32(opc, 0, 1);
+    int regsize;
+
+    if (is_signed) {
+        regsize = opc0 ? 32 : 64;
+    } else {
+        regsize = size == 3 ? 64 : 32;
+    }
+    return regsize == 64;
+}
+
 /* C3.3.6 Load/store exclusive
  *
  *  31 30 29         24  23  22   21  20  16  15  14   10 9    5 4    0
@@ -1865,10 +1936,15 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
+        bool iss_sf = disas_ldst_compute_iss_sf(size, false, 0);
+
+        /* Generate ISS for non-exclusive accesses including LASR.  */
         if (is_store) {
-            do_gpr_st(s, tcg_rt, tcg_addr, size);
+            do_gpr_st(s, tcg_rt, tcg_addr, size,
+                      true, rt, iss_sf, is_lasr);
         } else {
-            do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
+            do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false,
+                      true, rt, iss_sf, is_lasr);
         }
     }
 }
@@ -1920,7 +1996,11 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
     if (is_vector) {
         do_fp_ld(s, rt, tcg_addr, size);
     } else {
-        do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, false);
+        /* Only unsigned 32bit loads target 32bit registers.  */
+        bool iss_sf = opc == 0 ? 32 : 64;
+
+        do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, false,
+                  true, rt, iss_sf, false);
     }
     tcg_temp_free_i64(tcg_addr);
 }
@@ -2039,9 +2119,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         if (is_load) {
-            do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, false);
+            do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, false,
+                      false, 0, false, false);
         } else {
-            do_gpr_st(s, tcg_rt, tcg_addr, size);
+            do_gpr_st(s, tcg_rt, tcg_addr, size,
+                      false, 0, false, false);
         }
     }
     tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
@@ -2054,9 +2136,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     } else {
         TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
         if (is_load) {
-            do_gpr_ld(s, tcg_rt2, tcg_addr, size, is_signed, false);
+            do_gpr_ld(s, tcg_rt2, tcg_addr, size, is_signed, false,
+                      false, 0, false, false);
         } else {
-            do_gpr_st(s, tcg_rt2, tcg_addr, size);
+            do_gpr_st(s, tcg_rt2, tcg_addr, size,
+                      false, 0, false, false);
         }
     }
 
@@ -2099,6 +2183,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     bool is_store = false;
     bool is_extended = false;
     bool is_unpriv = (idx == 2);
+    bool iss_valid = !is_vector;
     bool post_index;
     bool writeback;
 
@@ -2166,12 +2251,15 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         int memidx = is_unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+        bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
 
         if (is_store) {
-            do_gpr_st_memidx(s, tcg_rt, tcg_addr, size, memidx);
+            do_gpr_st_memidx(s, tcg_rt, tcg_addr, size, memidx,
+                             iss_valid, rt, iss_sf, false);
         } else {
             do_gpr_ld_memidx(s, tcg_rt, tcg_addr, size,
-                             is_signed, is_extended, memidx);
+                             is_signed, is_extended, memidx,
+                             iss_valid, rt, iss_sf, false);
         }
     }
 
@@ -2269,10 +2357,14 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
+        bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
         if (is_store) {
-            do_gpr_st(s, tcg_rt, tcg_addr, size);
+            do_gpr_st(s, tcg_rt, tcg_addr, size,
+                      true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, is_extended);
+            do_gpr_ld(s, tcg_rt, tcg_addr, size,
+                      is_signed, is_extended,
+                      true, rt, iss_sf, false);
         }
     }
 }
@@ -2349,10 +2441,13 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
+        bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
         if (is_store) {
-            do_gpr_st(s, tcg_rt, tcg_addr, size);
+            do_gpr_st(s, tcg_rt, tcg_addr, size,
+                      true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, is_extended);
+            do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, is_extended,
+                      true, rt, iss_sf, false);
         }
     }
 }
@@ -11099,7 +11194,8 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
     tcg_clear_temp_count();
 
     do {
-        tcg_gen_insn_start(dc->pc, 0);
+        dc->insn_start_idx = tcg_op_buf_count();
+        tcg_gen_insn_start(dc->pc, 0, 0);
         num_insns++;
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 940ec8d..594cbfc 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11724,7 +11724,8 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
       }
     do {
         tcg_gen_insn_start(dc->pc,
-                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1));
+                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
+                           0);
         num_insns++;
 
 #ifdef CONFIG_USER_ONLY
@@ -12041,8 +12042,10 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
     if (is_a64(env)) {
         env->pc = data[0];
         env->condexec_bits = 0;
+        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     } else {
         env->regs[15] = data[0];
         env->condexec_bits = data[1];
+        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     }
 }
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 6a18d7b..dbd7ac8 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -59,6 +59,8 @@ typedef struct DisasContext {
     bool ss_same_el;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
     int c15_cpar;
+    /* TCG op index of the current insn_start.  */
+    int insn_start_idx;
 #define TMP_A64_MAX 16
     int tmp_a64_count;
     TCGv_i64 tmp_a64[TMP_A64_MAX];
-- 
2.5.0
