Received: by 10.25.159.19 with SMTP id i19csp857998lfe;
        Fri, 12 Feb 2016 06:37:09 -0800 (PST)
X-Received: by 10.98.42.85 with SMTP id q82mr2603927pfq.18.1455287829159;
        Fri, 12 Feb 2016 06:37:09 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com. [2607:f8b0:400e:c03::241])
        by mx.google.com with ESMTPS id rm10si20370055pab.25.2016.02.12.06.37.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:37:09 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::241 as permitted sender) client-ip=2607:f8b0:400e:c03::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x241.google.com with SMTP id gc2so140652pab.3;
        Fri, 12 Feb 2016 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rsUn9JtrBMmHmiigbnm2PVvfRiC6pT6XaJm2ZPirKXg=;
        b=Rg6/am/EV3br1QHOiihEey7hIrd11eitfwb50yL5Hl2YJDrzFhttODuD6HdtTqiezh
         u50b1GjpFGEnHOQGi7UwrduvFNOh/6qv+MnC4alM/OSinEzsTXvjdh0YDxmavy/UXcQr
         FXUWORtY+dkASHfGLNHaHTuSwdOuzyyWvWhHctpHEs5EGMzwFfVlnZyO8Iu+Qk0I38xv
         WZ1Qulcg/Jl4CoS/yYUyOzWMcR5kvYdnM3wyWwbOD2OIbaorE5aYwquEmUKoJs7p73oT
         52X8j7VSdD9AUHFsOyVTdi1+YA97WXjNEj+KHxvYa+hutyIRmO2b5fCG33jzlAoW0u6g
         2wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rsUn9JtrBMmHmiigbnm2PVvfRiC6pT6XaJm2ZPirKXg=;
        b=Mlvcgr+v3JWmEmqb5BFNn/4N4nlDSnoIkJ8Rp+W+V+Gf2ePahO2wnM5EvMfa+hHj0G
         +IcWEgbz08lsX8CzvimYnWAH95fTXCoABMQ/xunOx0lefi6BJ1ZkkaEXZNszujfYgaLU
         BmPwaIE72BZxk4kcdmLlIpXak3pTgAv6Riho7tfVPe0Wr2I76eUnrvsQxRAekCa6aO7/
         +qWeXn/DwCkHL+8atnjTHhVlp+QGxp7fl/O91mkVSItrUzDYZRDiWKRVymZV0uWHbtzl
         ARJlx+TkWA+YtmgVF+FKjTZN7FRzUXM87AJenod3pBiubnSnpmfgaEQGXmPoQf2DYcGl
         FiOg==
X-Gm-Message-State: AG10YOTEIbl3QAAs1MDuoTpa/of9ho4YYAd94GxhrXK2ZBTr4D3SgPyed8XUS4ikufemBw==
X-Received: by 10.66.145.68 with SMTP id ss4mr2520630pab.79.1455287828822;
        Fri, 12 Feb 2016 06:37:08 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id ey2sm20052601pab.2.2016.02.12.06.37.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:37:08 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 8/9] target-arm: A64: Create Instruction Syndromes for Data Aborts
Date: Fri, 12 Feb 2016 15:34:01 +0100
Message-Id: <1455287642-28166-9-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: nbXfqVg0WhU6

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
 target-arm/cpu.h           |  5 +++-
 target-arm/op_helper.c     | 34 +++++++++++++++++++++++--
 target-arm/translate-a64.c | 63 +++++++++++++++++++++++++++++++++++++++++++++-
 target-arm/translate.c     |  5 +++-
 target-arm/translate.h     |  3 +++
 5 files changed, 105 insertions(+), 5 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index a00a121..fecc48f 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -95,7 +95,7 @@
 struct arm_boot_info;
 
 #define NB_MMU_MODES 7
-#define TARGET_INSN_START_EXTRA_WORDS 1
+#define TARGET_INSN_START_EXTRA_WORDS 2
 
 /* We currently assume float and double are IEEE single and double
    precision respectively.
@@ -196,6 +196,9 @@ typedef struct CPUARMState {
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
     uint64_t daif; /* exception masks, in the bits they are in PSTATE */
 
+    /* IS state from decoded instructions. Only valid after Data aborts.  */
+    ARMInsnSyndrome isyn;
+
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
 
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 9bf635f..b195848 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -115,8 +115,23 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
+            if (target_el != 2 || fi.s1ptw) {
+                /* ISV is only set for data aborts routed to EL2 and
+                 * never for S1PTWalks faulting on Stage 2.
+                 *
+                 * See ARMv8 specs:
+                 * ISS encoding for an exception from a Data Abort, the
+                 * ISV field.
+                 */
+                env->isyn.dabt.valid = 0;
+            }
             syn = syn_data_abort(same_el,
-                                 0, 0, 0, 0, 0, 0,
+                                 env->isyn.dabt.valid,
+                                 env->isyn.dabt.sas,
+                                 env->isyn.dabt.sse,
+                                 env->isyn.dabt.srt,
+                                 env->isyn.dabt.sf,
+                                 env->isyn.dabt.ar,
                                  0, 0, fi.s1ptw, is_write == 1, syn,
                                  env->thumb);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
@@ -163,9 +178,24 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
         env->exception.fsr |= (1 << 11);
     }
 
+    if (target_el != 2) {
+        /* ISV is only set for data aborts routed to EL2 and
+         * never for S1PTWalks faulting on Stage 2.
+         *
+         * See ARMv8 specs:
+         * ISS encoding for an exception from a Data Abort, the
+         * ISV field.
+         */
+        env->isyn.dabt.valid = 0;
+    }
     raise_exception(env, EXCP_DATA_ABORT,
                     syn_data_abort(same_el,
-                                   0, 0, 0, 0, 0, 0,
+                                   env->isyn.dabt.valid,
+                                   env->isyn.dabt.sas,
+                                   env->isyn.dabt.sse,
+                                   env->isyn.dabt.srt,
+                                   env->isyn.dabt.sf,
+                                   env->isyn.dabt.ar,
                                    0, 0, 0, is_write == 1, 0x21,
                                    env->thumb),
                     target_el);
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 9e26d5e..2f17cba 100644
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
@@ -2685,6 +2737,14 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
         unallocated_encoding(s);
         break;
     }
+
+    /* The saved insn syndrome state in insn_start is already zero (invalid).
+     * We only update it if we have a valid insn syndrome to save.
+     */
+    if (s->isyn.dabt.valid) {
+        isyn32 = arm_encode_dabt_isyn_u32(&s->isyn);
+        tcg_set_insn_param(s->insn_start_idx, 2, isyn32);
+    }
 }
 
 /* C3.4.6 PC-rel. addressing
@@ -11087,7 +11147,8 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
     tcg_clear_temp_count();
 
     do {
-        tcg_gen_insn_start(dc->pc, 0);
+        dc->insn_start_idx = tcg_op_buf_count();
+        tcg_gen_insn_start(dc->pc, 0, 0);
         num_insns++;
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
diff --git a/target-arm/translate.c b/target-arm/translate.c
index cf3dc33..0d53e7d 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11349,7 +11349,8 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
       }
     do {
         tcg_gen_insn_start(dc->pc,
-                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1));
+                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
+                           0);
         num_insns++;
 
 #ifdef CONFIG_USER_ONLY
@@ -11665,8 +11666,10 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
     if (is_a64(env)) {
         env->pc = data[0];
         env->condexec_bits = 0;
+        arm_decode_dabt_isyn_u32(&env->isyn, data[2]);
     } else {
         env->regs[15] = data[0];
         env->condexec_bits = data[1];
+        arm_decode_dabt_isyn_u32(&env->isyn, data[2]);
     }
 }
diff --git a/target-arm/translate.h b/target-arm/translate.h
index a94e17e..2130a84 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -58,6 +58,9 @@ typedef struct DisasContext {
     bool ss_same_el;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
     int c15_cpar;
+    ARMInsnSyndrome isyn;
+    /* TCG op index of the current insn_start.  */
+    int insn_start_idx;
 #define TMP_A64_MAX 16
     int tmp_a64_count;
     TCGv_i64 tmp_a64[TMP_A64_MAX];
-- 
1.9.1
