Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009231ejf;
        Tue, 16 Aug 2022 13:35:03 -0700 (PDT)
X-Received: by 2002:a05:6870:64a5:b0:10e:6ae2:a6a8 with SMTP id cz37-20020a05687064a500b0010e6ae2a6a8mr164857oab.52.1660682103060;
        Tue, 16 Aug 2022 13:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682103; cv=none;
        d=google.com; s=arc-20160816;
        b=vau8iI7nzuAmlhklxFICmLCk5VodtL4K7XxVimTbE3WrytXWOqKCQTaGqzhOoWDbPd
         QweOmkMth5JB0HSyoG0HnaJbm7fk701PM5dCw7MhLqjuumDuCH9LF+EWdMqIyECSbrNz
         khbAp1Z8mS7fhLUeYOvs8Pvy0hix4GU3SitzTR/xLEiYhCrrZ993NxqjlHoK18s+9cj4
         sc0z5ri9mi3X/+xJ9WEMAsoHKhnn0PDjGrehLPdPzge/4/TAPLnVzqineFceThtEFnT7
         5tdk3lGNeebse9HGy3LYNOhFIThl7b4UmIGhNa0vcFZ22mtLSlOI/nR/5EPdtcSook1h
         bK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9I+4AArGFxiC7vqCR51iszLCV7tpsFmNO7q4jMHrxNw=;
        b=fgf5BoiJuz2hiccpRucO+UOwZHPSWKYgMYSllPsiexFd3YV0H/WRk0FxvBS9fUKMMS
         INto33h9WqJzpn/z2p7aVx7PibZgZTmUGVSfH1Cwo7wCpedQNGXOgRawQrEMWg57AqI+
         84UkNa4LCNMqpQS09opm6b4GYYOzPeawOhaY76qWQxfDedWFOWqcym4lKUuTtdhqFFpO
         ptU3hquWOuaw4QfH8n3IcRBxJu8NIP3HVpS5dqKMiK6EDhaYBl9GdtNTy0OccpHgE4oM
         5tMkWdK7HKmvAHxqKeUua9XagiRW/1P7RmEom5zvDJXfLrdyNcQ8j3irJAO6lesuGwi9
         n2qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frLuC5NZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r5-20020acada05000000b00339c46556d2sor2749200oig.101.2022.08.16.13.35.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frLuC5NZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9I+4AArGFxiC7vqCR51iszLCV7tpsFmNO7q4jMHrxNw=;
        b=frLuC5NZl14E4jlIVmc2JjxpXp+LIzPELQrtYB3fABBNj5hqoSX8yAKn4TvQDQHX5T
         MIr4lCYgo0AWdsjeKjKYIbgVq3yROu3kTwIoqdxqzob8t8Bk9lAQRu++cxaGfBxZuRCQ
         zuMhE534UXPDkLYbFWJXmsmjmN/iNJaNOcwRTHlreb6E6Xsm2pRa+JiJI/vIxIzdFDrt
         CyEKmLLuMKzftQx/GdpVrj+eZ7u6EV+kxYKM76W8B4rGELxfNZgJjoY9IIihHfcby92f
         FFeYVE7BL3yE5xiHk/xqe8+NGRSRNy06mEmdy3BkOT1pST4/k5eBtVOHH6M54X3jnhIT
         SuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9I+4AArGFxiC7vqCR51iszLCV7tpsFmNO7q4jMHrxNw=;
        b=oQNEV97lkFv1/C8NtA6/PZRjwlt265Qz0ckqnxxoBMfbSNhFEBJA9DBD5KREJrHwcY
         PWXjrFISh/0StOqbkd00RataYuHnTDIJROD9mEAiwfdBD3fGvOtzTQ/bz3iNoYJDcfVm
         FJmOeW/PcNveAF64rZ0lMHb4ugchHdTFVSvIJQ5tbauq8/GwknRfilEuzes3sW0ffh1V
         zeQRuM4d32Y8ASmFrzw8fl1dRQjlrT2qwG+wvMKD1gnDM2LPeSgwukB5cdsfEDuRCRtw
         wk9WtMjHu7dw4JVIMIvnGaJvCJNfkmoHSbXPeu22ITlELv2Xqs4TfRwZ9czb3a58KykH
         MWIg==
X-Gm-Message-State: ACgBeo2mWKvOlk30HiEgZlp91tWlsWtUzGwuJ1fO3nuQU6M6LEAzHNPM
	Jd/ulM8zyE4ThA8TRB7v7fpaJxYdXc7uk4E4
X-Google-Smtp-Source: AA6agR6DVT6y8hRFB6R23L+Iq4zkhSnPbftbSHAcO5dd2MoEj8tT76K+ebSbEcrbXsSlKeD7xBxkGQ==
X-Received: by 2002:a05:6808:1891:b0:344:2d65:a386 with SMTP id bi17-20020a056808189100b003442d65a386mr148156oib.192.1660682102610;
        Tue, 16 Aug 2022 13:35:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:35:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 28/33] target/arm: Change gen_exception_insn* to work on displacements
Date: Tue, 16 Aug 2022 15:33:55 -0500
Message-Id: <20220816203400.161187-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: l4Q12GY8VovM

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  4 ++--
 target/arm/translate-a64.c    | 28 +++++++++++--------------
 target/arm/translate-m-nocp.c |  6 +++---
 target/arm/translate-mve.c    |  2 +-
 target/arm/translate-vfp.c    |  6 +++---
 target/arm/translate.c        | 39 +++++++++++++++++------------------
 6 files changed, 40 insertions(+), 45 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 33b94a18bb..d42059aa1d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -281,9 +281,9 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
-void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+void gen_exception_insn_el(DisasContext *s, int pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn);
+void gen_exception_insn(DisasContext *s, int pc_diff, int excp, uint32_t syn);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 90f31b1dff..422ce9288d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1163,7 +1163,7 @@ static bool fp_access_check_only(DisasContext *s)
         assert(!s->fp_access_checked);
         s->fp_access_checked = true;
 
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_fp_access_trap(1, 0xe, false, 0),
                               s->fp_excp_el);
         return false;
@@ -1178,7 +1178,7 @@ static bool fp_access_check(DisasContext *s)
         return false;
     }
     if (s->sme_trap_nonstreaming && s->is_nonstreaming) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming, false));
         return false;
     }
@@ -1198,7 +1198,7 @@ bool sve_access_check(DisasContext *s)
             goto fail_exit;
         }
     } else if (s->sve_excp_el) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
         goto fail_exit;
     }
@@ -1220,7 +1220,7 @@ bool sve_access_check(DisasContext *s)
 static bool sme_access_check(DisasContext *s)
 {
     if (s->sme_excp_el) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_smetrap(SME_ET_AccessTrap, false),
                               s->sme_excp_el);
         return false;
@@ -1250,12 +1250,12 @@ bool sme_enabled_check_with_svcr(DisasContext *s, unsigned req)
         return false;
     }
     if (FIELD_EX64(req, SVCR, SM) && !s->pstate_sm) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_NotStreaming, false));
         return false;
     }
     if (FIELD_EX64(req, SVCR, ZA) && !s->pstate_za) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_InactiveZA, false));
         return false;
     }
@@ -1915,7 +1915,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome);
+    gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
 /* MRS - move from system register
@@ -2169,8 +2169,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
-                               syn_aa64_svc(imm16));
+            gen_exception_insn(s, 4, EXCP_SWI, syn_aa64_svc(imm16));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -2183,8 +2182,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_update_pc(s, 0);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_HVC,
-                                  syn_aa64_hvc(imm16), 2);
+            gen_exception_insn_el(s, 4, EXCP_HVC, syn_aa64_hvc(imm16), 2);
             break;
         case 3:                                                     /* SMC */
             if (s->current_el == 0) {
@@ -2194,8 +2192,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_update_pc(s, 0);
             gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_SMC,
-                                  syn_aa64_smc(imm16), 3);
+            gen_exception_insn_el(s, 4, EXCP_SMC, syn_aa64_smc(imm16), 3);
             break;
         default:
             unallocated_encoding(s);
@@ -14843,7 +14840,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -14874,8 +14871,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                                   syn_btitrap(s->btype));
+                gen_exception_insn(s, 0, EXCP_UDEF, syn_btitrap(s->btype));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 4029d7fdd4..694fae7e2e 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -143,7 +143,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return true;
     }
@@ -765,12 +765,12 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_NOCP, syn_uncategorized());
         return true;
     }
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return true;
     }
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 0cf1b5ea4f..db7ea3f603 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,7 +100,7 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         return false;
     }
 }
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 070f465b17..5c5d58d2c6 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -230,7 +230,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
         int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
         uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
 
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
     }
 
@@ -240,7 +240,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
      * appear to be any insns which touch VFP which are allowed.
      */
     if (s->sme_trap_nonstreaming) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
                                        curr_insn_len(s) == 2));
         return false;
@@ -272,7 +272,7 @@ bool vfp_access_check_m(DisasContext *s, bool skip_context_update)
          * the encoding space handled by the patterns in m-nocp.decode,
          * and for them we may need to raise NOCP here.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return false;
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 92c52edb7b..d441e31d3a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1103,32 +1103,33 @@ static void gen_exception(int excp, uint32_t syndrome)
                                        tcg_constant_i32(syndrome));
 }
 
-static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
+static void gen_exception_insn_el_v(DisasContext *s, int pc_diff, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
-        gen_a64_update_pc(s, pc - s->pc_curr);
+        gen_a64_update_pc(s, pc_diff);
     } else {
         gen_set_condexec(s);
-        gen_update_pc(s, pc - s->pc_curr);
+        gen_update_pc(s, pc_diff);
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+void gen_exception_insn_el(DisasContext *s, int pc_diff, int excp,
                            uint32_t syn, uint32_t target_el)
 {
-    gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
+    gen_exception_insn_el_v(s, pc_diff, excp, syn,
+                            tcg_constant_i32(target_el));
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
+void gen_exception_insn(DisasContext *s, int pc_diff, int excp, uint32_t syn)
 {
     if (s->aarch64) {
-        gen_a64_update_pc(s, pc - s->pc_curr);
+        gen_a64_update_pc(s, pc_diff);
     } else {
         gen_set_condexec(s);
-        gen_update_pc(s, pc - s->pc_curr);
+        gen_update_pc(s, pc_diff);
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
@@ -1145,7 +1146,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
+    gen_exception_insn(s, 0, EXCP_UDEF, syn_uncategorized());
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2872,7 +2873,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_el = tcg_constant_i32(3);
             }
 
-            gen_exception_insn_el_v(s, s->pc_curr, EXCP_UDEF,
+            gen_exception_insn_el_v(s, 0, EXCP_UDEF,
                                     syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
             return false;
@@ -2898,7 +2899,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
+    gen_exception_insn(s, 0, EXCP_UDEF, syn_uncategorized());
     return false;
 }
 
@@ -5122,8 +5123,7 @@ static void gen_srs(DisasContext *s,
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_uncategorized(), 3);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn_uncategorized(), 3);
         return;
     }
 
@@ -8508,7 +8508,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * Do the check-and-raise-exception by hand.
          */
         if (s->fp_excp_el) {
-            gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+            gen_exception_insn_el(s, 0, EXCP_NOCP,
                                   syn_uncategorized(), s->fp_excp_el);
             return true;
         }
@@ -8611,7 +8611,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         gen_set_label(skipexc);
     }
 
@@ -9081,7 +9081,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         return;
     }
 
@@ -9090,7 +9090,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9655,7 +9655,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(dc, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9728,8 +9728,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE,
-                           syn_uncategorized());
+        gen_exception_insn(dc, 0, EXCP_INVSTATE, syn_uncategorized());
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1
