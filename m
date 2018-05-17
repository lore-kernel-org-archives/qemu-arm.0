Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp522401wme;
        Thu, 17 May 2018 15:49:58 -0700 (PDT)
X-Received: by 2002:a62:230b:: with SMTP id j11-v6mr6830623pfj.177.1526597398582;
        Thu, 17 May 2018 15:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526597398; cv=none;
        d=google.com; s=arc-20160816;
        b=izvjeSrxhSQYdDYLnl9eDOD0lkw5t+TkJvOCHc4Uwq5FV36myuctrYJik29gRVqzNF
         rrJmqY55Z2ktTufxANpv2pVG4JRwABPPd6Aic7kMZdrh6ahziuA8UBrCbH63hkwF8leQ
         ne8xMYZTDFQkUsmaJ1q+AUJXD+0tPomOnkdAds5W4Rpr5nmlhgE8U2NkpQIb3aJq78Bu
         3sUTkMZf7yKibzOOYsqRh3zF0hZB9Jtupsd1hxpLUO/UM85mI/GXbzqukQTH0vg/eg3u
         Z43v1monwATu9fZ33Jgh13VW68L68k8U4KXgzfqzLpmv2akGD6z3NGmGkdZo4UAzS36e
         2eyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=abr2ZByy4Fc84u7O5LCCdgy+OqG6X+CktKI3vXqsVPg=;
        b=hMOQk1su6joEd2M63MvAe4JvVeZKnKWMsU5D2pf5MEQu3IeR6jRL8Em7qodZwG7gtP
         sVK160TE6kM4tx5NE2dJK5Dbupj95OZLLcgru081cPZkoplWwIraxmT/QbRBZtJh/vfB
         +PjUFGbiatD49qjtGnh7kuVHZf2LBdvvtKzBCcAYhRy9k7YKKFAm+LKfk9WeudoWYAWN
         JwsePg56tdgP883lhEwTD1dpP8EtvFDAb0WFMVXExOdOVIM+F63hLuRluMs3OEZe+ZPs
         wPO4oAsi78mbYf/i2wFNo8ZXVxE59o+U4Ei3CTkB/sAnhUqfGdVd9IgeRoJP9G21pLWJ
         QvFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NuMYkMPS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bb5-v6sor3539000plb.109.2018.05.17.15.49.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 15:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NuMYkMPS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=abr2ZByy4Fc84u7O5LCCdgy+OqG6X+CktKI3vXqsVPg=;
        b=NuMYkMPSTzkyvu8G/XdEzb675B97TTMcTyooxA/4ZJz+rA7wFPvpVYG/cR4lZvtEi9
         AIacJm7HM0++x1iNHKJ9E7gHLTKaMD5xf/ujROjs7nT1MSjMe/dGArcQam2vYVXpdHBz
         UJ9XOmpjW6rjsrpkndvsYnQ/IUSUce1sSNdrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=abr2ZByy4Fc84u7O5LCCdgy+OqG6X+CktKI3vXqsVPg=;
        b=AKSEtBbvQ51yvfxVzU8mR6nMd1tNP5ku4IWYMSW8m+KER0ga7tAmkNkMtHmuQsJxMu
         t5iBF6IvYIomTRZ0Hojvy6AMn5qbQrQJk47rjtfvoizbBI2fGq/4HzTj/qPJJITNRYZc
         uLL8P0txeS2RbTlKsxHgurih0T9+BBhFo7/s5s1eK1MGQgrfpyD/HED0sxMCTi+B42TC
         iiT95ioDpQn+HbGt8sZcWjg1TszEHecTYkxTV+xYabA5i1RdSzK15jkqllD2Gy7mg+zc
         Q6QKz2wEaiRooN4SYKiPIim2y0jQHdSkLkpcsmp47kAiYg3KPRDA74xtFOnOAfr7FiFs
         MRhw==
X-Gm-Message-State: ALKqPwfJ8b5CL9Q6lqn/RVfgHxa70CdZVle/NJmbNatWIIDnWLkANNug
	09pq0hmh1EEouZnEvbOLlhycdLlA
X-Google-Smtp-Source: AB8JxZp83kaHHmsSZTFffLyVjLzun5btW7pa8CTS9uRZyWcUYK4Xco9FfAcUxqwp3O9K7aRjLzfdKg==
X-Received: by 2002:a17:902:ba93:: with SMTP id k19-v6mr6726366pls.379.1526597397480;
        Thu, 17 May 2018 15:49:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id a11-v6sm8678809pgn.64.2018.05.17.15.49.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 May 2018 15:49:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 09/28] target/arm: convert conversion helpers to fpst/ahp_flag
Date: Thu, 17 May 2018 15:49:53 -0700
Message-Id: <20180517224953.11642-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517224953.11642-1-richard.henderson@linaro.org>
References: <20180517224953.11642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cZOB01HXp8Gm

From: Alex Bennée <alex.bennee@linaro.org>

Instead of passing env and leaving it up to the helper to get the
right fpstatus we pass it explicitly. There was already a get_fpstatus
helper for neon for the 32 bit code. We also add an get_ahp_flag() for
passing the state of the alternative FP16 format flag. This leaves
scope for later tracking the AHP state in translation flags.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 10 +++---
 target/arm/translate.h     | 12 +++++++
 target/arm/helper.c        | 56 +++++------------------------
 target/arm/translate-a64.c | 37 +++++++++++++++----
 target/arm/translate.c     | 74 +++++++++++++++++++++++++++++---------
 5 files changed, 112 insertions(+), 77 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index ce89968b2d..047f3bc1ca 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -187,12 +187,10 @@ DEF_HELPER_3(vfp_uqtoh, f16, i64, i32, ptr)
 DEF_HELPER_FLAGS_2(set_rmode, TCG_CALL_NO_RWG, i32, i32, ptr)
 DEF_HELPER_FLAGS_2(set_neon_rmode, TCG_CALL_NO_RWG, i32, i32, env)
 
-DEF_HELPER_2(vfp_fcvt_f16_to_f32, f32, i32, env)
-DEF_HELPER_2(vfp_fcvt_f32_to_f16, i32, f32, env)
-DEF_HELPER_2(neon_fcvt_f16_to_f32, f32, i32, env)
-DEF_HELPER_2(neon_fcvt_f32_to_f16, i32, f32, env)
-DEF_HELPER_FLAGS_2(vfp_fcvt_f16_to_f64, TCG_CALL_NO_RWG, f64, i32, env)
-DEF_HELPER_FLAGS_2(vfp_fcvt_f64_to_f16, TCG_CALL_NO_RWG, i32, f64, env)
+DEF_HELPER_FLAGS_3(vfp_fcvt_f16_to_f32, TCG_CALL_NO_RWG, f32, f16, ptr, i32)
+DEF_HELPER_FLAGS_3(vfp_fcvt_f32_to_f16, TCG_CALL_NO_RWG, f16, f32, ptr, i32)
+DEF_HELPER_FLAGS_3(vfp_fcvt_f16_to_f64, TCG_CALL_NO_RWG, f64, f16, ptr, i32)
+DEF_HELPER_FLAGS_3(vfp_fcvt_f64_to_f16, TCG_CALL_NO_RWG, f16, f64, ptr, i32)
 
 DEF_HELPER_4(vfp_muladdd, f64, f64, f64, f64, ptr)
 DEF_HELPER_4(vfp_muladds, f32, f32, f32, f32, ptr)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 37a1bba056..45f04244be 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -177,4 +177,16 @@ void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 
+/* Return state of Alternate Half-precision flag, caller frees result */
+static inline TCGv_i32 get_ahp_flag(void)
+{
+    TCGv_i32 ret = tcg_temp_new_i32();
+
+    tcg_gen_ld_i32(ret, cpu_env,
+                   offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPSCR]));
+    tcg_gen_extract_i32(ret, ret, 26, 1);
+
+    return ret;
+}
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c6fd7f9479..1762042fc7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11540,64 +11540,24 @@ uint32_t HELPER(set_neon_rmode)(uint32_t rmode, CPUARMState *env)
 }
 
 /* Half precision conversions.  */
-static float32 do_fcvt_f16_to_f32(uint32_t a, CPUARMState *env, float_status *s)
+float32 HELPER(vfp_fcvt_f16_to_f32)(float16 a, void *fpstp, uint32_t ahp_mode)
 {
-    int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
-    float32 r = float16_to_float32(make_float16(a), ieee, s);
-    if (ieee) {
-        return float32_maybe_silence_nan(r, s);
-    }
-    return r;
+    return float16_to_float32(a, !ahp_mode, fpstp);
 }
 
-static uint32_t do_fcvt_f32_to_f16(float32 a, CPUARMState *env, float_status *s)
+float16 HELPER(vfp_fcvt_f32_to_f16)(float32 a, void *fpstp, uint32_t ahp_mode)
 {
-    int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
-    float16 r = float32_to_float16(a, ieee, s);
-    if (ieee) {
-        r = float16_maybe_silence_nan(r, s);
-    }
-    return float16_val(r);
+    return float32_to_float16(a, !ahp_mode, fpstp);
 }
 
-float32 HELPER(neon_fcvt_f16_to_f32)(uint32_t a, CPUARMState *env)
+float64 HELPER(vfp_fcvt_f16_to_f64)(float16 a, void *fpstp, uint32_t ahp_mode)
 {
-    return do_fcvt_f16_to_f32(a, env, &env->vfp.standard_fp_status);
+    return float16_to_float64(a, !ahp_mode, fpstp);
 }
 
-uint32_t HELPER(neon_fcvt_f32_to_f16)(float32 a, CPUARMState *env)
+float16 HELPER(vfp_fcvt_f64_to_f16)(float64 a, void *fpstp, uint32_t ahp_mode)
 {
-    return do_fcvt_f32_to_f16(a, env, &env->vfp.standard_fp_status);
-}
-
-float32 HELPER(vfp_fcvt_f16_to_f32)(uint32_t a, CPUARMState *env)
-{
-    return do_fcvt_f16_to_f32(a, env, &env->vfp.fp_status);
-}
-
-uint32_t HELPER(vfp_fcvt_f32_to_f16)(float32 a, CPUARMState *env)
-{
-    return do_fcvt_f32_to_f16(a, env, &env->vfp.fp_status);
-}
-
-float64 HELPER(vfp_fcvt_f16_to_f64)(uint32_t a, CPUARMState *env)
-{
-    int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
-    float64 r = float16_to_float64(make_float16(a), ieee, &env->vfp.fp_status);
-    if (ieee) {
-        return float64_maybe_silence_nan(r, &env->vfp.fp_status);
-    }
-    return r;
-}
-
-uint32_t HELPER(vfp_fcvt_f64_to_f16)(float64 a, CPUARMState *env)
-{
-    int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
-    float16 r = float64_to_float16(a, ieee, &env->vfp.fp_status);
-    if (ieee) {
-        r = float16_maybe_silence_nan(r, &env->vfp.fp_status);
-    }
-    return float16_val(r);
+    return float64_to_float16(a, !ahp_mode, fpstp);
 }
 
 #define float32_two make_float32(0x40000000)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a0b0c43d12..d8284678f7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5147,10 +5147,15 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
         } else {
             /* Single to half */
             TCGv_i32 tcg_rd = tcg_temp_new_i32();
-            gen_helper_vfp_fcvt_f32_to_f16(tcg_rd, tcg_rn, cpu_env);
+            TCGv_i32 ahp = get_ahp_flag();
+            TCGv_ptr fpst = get_fpstatus_ptr(false);
+
+            gen_helper_vfp_fcvt_f32_to_f16(tcg_rd, tcg_rn, fpst, ahp);
             /* write_fp_sreg is OK here because top half of tcg_rd is zero */
             write_fp_sreg(s, rd, tcg_rd);
             tcg_temp_free_i32(tcg_rd);
+            tcg_temp_free_i32(ahp);
+            tcg_temp_free_ptr(fpst);
         }
         tcg_temp_free_i32(tcg_rn);
         break;
@@ -5163,9 +5168,13 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
             /* Double to single */
             gen_helper_vfp_fcvtsd(tcg_rd, tcg_rn, cpu_env);
         } else {
+            TCGv_ptr fpst = get_fpstatus_ptr(false);
+            TCGv_i32 ahp = get_ahp_flag();
             /* Double to half */
-            gen_helper_vfp_fcvt_f64_to_f16(tcg_rd, tcg_rn, cpu_env);
+            gen_helper_vfp_fcvt_f64_to_f16(tcg_rd, tcg_rn, fpst, ahp);
             /* write_fp_sreg is OK here because top half of tcg_rd is zero */
+            tcg_temp_free_ptr(fpst);
+            tcg_temp_free_i32(ahp);
         }
         write_fp_sreg(s, rd, tcg_rd);
         tcg_temp_free_i32(tcg_rd);
@@ -5175,17 +5184,21 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
     case 0x3:
     {
         TCGv_i32 tcg_rn = read_fp_sreg(s, rn);
+        TCGv_ptr tcg_fpst = get_fpstatus_ptr(false);
+        TCGv_i32 tcg_ahp = get_ahp_flag();
         tcg_gen_ext16u_i32(tcg_rn, tcg_rn);
         if (dtype == 0) {
             /* Half to single */
             TCGv_i32 tcg_rd = tcg_temp_new_i32();
-            gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, cpu_env);
+            gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
             write_fp_sreg(s, rd, tcg_rd);
+            tcg_temp_free_ptr(tcg_fpst);
+            tcg_temp_free_i32(tcg_ahp);
             tcg_temp_free_i32(tcg_rd);
         } else {
             /* Half to double */
             TCGv_i64 tcg_rd = tcg_temp_new_i64();
-            gen_helper_vfp_fcvt_f16_to_f64(tcg_rd, tcg_rn, cpu_env);
+            gen_helper_vfp_fcvt_f16_to_f64(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
             write_fp_dreg(s, rd, tcg_rd);
             tcg_temp_free_i64(tcg_rd);
         }
@@ -9053,12 +9066,17 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
             } else {
                 TCGv_i32 tcg_lo = tcg_temp_new_i32();
                 TCGv_i32 tcg_hi = tcg_temp_new_i32();
+                TCGv_ptr fpst = get_fpstatus_ptr(false);
+                TCGv_i32 ahp = get_ahp_flag();
+
                 tcg_gen_extr_i64_i32(tcg_lo, tcg_hi, tcg_op);
-                gen_helper_vfp_fcvt_f32_to_f16(tcg_lo, tcg_lo, cpu_env);
-                gen_helper_vfp_fcvt_f32_to_f16(tcg_hi, tcg_hi, cpu_env);
+                gen_helper_vfp_fcvt_f32_to_f16(tcg_lo, tcg_lo, fpst, ahp);
+                gen_helper_vfp_fcvt_f32_to_f16(tcg_hi, tcg_hi, fpst, ahp);
                 tcg_gen_deposit_i32(tcg_res[pass], tcg_lo, tcg_hi, 16, 16);
                 tcg_temp_free_i32(tcg_lo);
                 tcg_temp_free_i32(tcg_hi);
+                tcg_temp_free_ptr(fpst);
+                tcg_temp_free_i32(ahp);
             }
             break;
         case 0x56:  /* FCVTXN, FCVTXN2 */
@@ -11532,18 +11550,23 @@ static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
         /* 16 -> 32 bit fp conversion */
         int srcelt = is_q ? 4 : 0;
         TCGv_i32 tcg_res[4];
+        TCGv_ptr fpst = get_fpstatus_ptr(false);
+        TCGv_i32 ahp = get_ahp_flag();
 
         for (pass = 0; pass < 4; pass++) {
             tcg_res[pass] = tcg_temp_new_i32();
 
             read_vec_element_i32(s, tcg_res[pass], rn, srcelt + pass, MO_16);
             gen_helper_vfp_fcvt_f16_to_f32(tcg_res[pass], tcg_res[pass],
-                                           cpu_env);
+                                           fpst, ahp);
         }
         for (pass = 0; pass < 4; pass++) {
             write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
             tcg_temp_free_i32(tcg_res[pass]);
         }
+
+        tcg_temp_free_ptr(fpst);
+        tcg_temp_free_i32(ahp);
     }
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 731cf327a1..46a9725bfd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3824,38 +3824,56 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                         gen_vfp_sqrt(dp);
                         break;
                     case 4: /* vcvtb.f32.f16, vcvtb.f64.f16 */
+                    {
+                        TCGv_ptr fpst = get_fpstatus_ptr(false);
+                        TCGv_i32 ahp_mode = get_ahp_flag();
                         tmp = gen_vfp_mrs();
                         tcg_gen_ext16u_i32(tmp, tmp);
                         if (dp) {
                             gen_helper_vfp_fcvt_f16_to_f64(cpu_F0d, tmp,
-                                                           cpu_env);
+                                                           fpst, ahp_mode);
                         } else {
                             gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp,
-                                                           cpu_env);
+                                                           fpst, ahp_mode);
                         }
+                        tcg_temp_free_i32(ahp_mode);
+                        tcg_temp_free_ptr(fpst);
                         tcg_temp_free_i32(tmp);
                         break;
+                    }
                     case 5: /* vcvtt.f32.f16, vcvtt.f64.f16 */
+                    {
+                        TCGv_ptr fpst = get_fpstatus_ptr(false);
+                        TCGv_i32 ahp = get_ahp_flag();
                         tmp = gen_vfp_mrs();
                         tcg_gen_shri_i32(tmp, tmp, 16);
                         if (dp) {
                             gen_helper_vfp_fcvt_f16_to_f64(cpu_F0d, tmp,
-                                                           cpu_env);
+                                                           fpst, ahp);
                         } else {
                             gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp,
-                                                           cpu_env);
+                                                           fpst, ahp);
                         }
                         tcg_temp_free_i32(tmp);
+                        tcg_temp_free_i32(ahp);
+                        tcg_temp_free_ptr(fpst);
                         break;
+                    }
                     case 6: /* vcvtb.f16.f32, vcvtb.f16.f64 */
+                    {
+                        TCGv_ptr fpst = get_fpstatus_ptr(false);
+                        TCGv_i32 ahp = get_ahp_flag();
                         tmp = tcg_temp_new_i32();
+
                         if (dp) {
                             gen_helper_vfp_fcvt_f64_to_f16(tmp, cpu_F0d,
-                                                           cpu_env);
+                                                           fpst, ahp);
                         } else {
                             gen_helper_vfp_fcvt_f32_to_f16(tmp, cpu_F0s,
-                                                           cpu_env);
+                                                           fpst, ahp);
                         }
+                        tcg_temp_free_i32(ahp);
+                        tcg_temp_free_ptr(fpst);
                         gen_mov_F0_vreg(0, rd);
                         tmp2 = gen_vfp_mrs();
                         tcg_gen_andi_i32(tmp2, tmp2, 0xffff0000);
@@ -3863,15 +3881,21 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                         tcg_temp_free_i32(tmp2);
                         gen_vfp_msr(tmp);
                         break;
+                    }
                     case 7: /* vcvtt.f16.f32, vcvtt.f16.f64 */
+                    {
+                        TCGv_ptr fpst = get_fpstatus_ptr(false);
+                        TCGv_i32 ahp = get_ahp_flag();
                         tmp = tcg_temp_new_i32();
                         if (dp) {
                             gen_helper_vfp_fcvt_f64_to_f16(tmp, cpu_F0d,
-                                                           cpu_env);
+                                                           fpst, ahp);
                         } else {
                             gen_helper_vfp_fcvt_f32_to_f16(tmp, cpu_F0s,
-                                                           cpu_env);
+                                                           fpst, ahp);
                         }
+                        tcg_temp_free_i32(ahp);
+                        tcg_temp_free_ptr(fpst);
                         tcg_gen_shli_i32(tmp, tmp, 16);
                         gen_mov_F0_vreg(0, rd);
                         tmp2 = gen_vfp_mrs();
@@ -3880,6 +3904,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                         tcg_temp_free_i32(tmp2);
                         gen_vfp_msr(tmp);
                         break;
+                    }
                     case 8: /* cmp */
                         gen_vfp_cmp(dp);
                         break;
@@ -7222,53 +7247,70 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     }
                     break;
                 case NEON_2RM_VCVT_F16_F32:
+                {
+                    TCGv_ptr fpst;
+                    TCGv_i32 ahp;
+
                     if (!arm_dc_feature(s, ARM_FEATURE_VFP_FP16) ||
                         q || (rm & 1)) {
                         return 1;
                     }
                     tmp = tcg_temp_new_i32();
                     tmp2 = tcg_temp_new_i32();
+                    fpst = get_fpstatus_ptr(true);
+                    ahp = get_ahp_flag();
                     tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 0));
-                    gen_helper_neon_fcvt_f32_to_f16(tmp, cpu_F0s, cpu_env);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp, cpu_F0s, fpst, ahp);
                     tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 1));
-                    gen_helper_neon_fcvt_f32_to_f16(tmp2, cpu_F0s, cpu_env);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp2, cpu_F0s, fpst, ahp);
                     tcg_gen_shli_i32(tmp2, tmp2, 16);
                     tcg_gen_or_i32(tmp2, tmp2, tmp);
                     tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 2));
-                    gen_helper_neon_fcvt_f32_to_f16(tmp, cpu_F0s, cpu_env);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp, cpu_F0s, fpst, ahp);
                     tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 3));
                     neon_store_reg(rd, 0, tmp2);
                     tmp2 = tcg_temp_new_i32();
-                    gen_helper_neon_fcvt_f32_to_f16(tmp2, cpu_F0s, cpu_env);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp2, cpu_F0s, fpst, ahp);
                     tcg_gen_shli_i32(tmp2, tmp2, 16);
                     tcg_gen_or_i32(tmp2, tmp2, tmp);
                     neon_store_reg(rd, 1, tmp2);
                     tcg_temp_free_i32(tmp);
+                    tcg_temp_free_i32(ahp);
+                    tcg_temp_free_ptr(fpst);
                     break;
+                }
                 case NEON_2RM_VCVT_F32_F16:
+                {
+                    TCGv_ptr fpst;
+                    TCGv_i32 ahp;
                     if (!arm_dc_feature(s, ARM_FEATURE_VFP_FP16) ||
                         q || (rd & 1)) {
                         return 1;
                     }
+                    fpst = get_fpstatus_ptr(true);
+                    ahp = get_ahp_flag();
                     tmp3 = tcg_temp_new_i32();
                     tmp = neon_load_reg(rm, 0);
                     tmp2 = neon_load_reg(rm, 1);
                     tcg_gen_ext16u_i32(tmp3, tmp);
-                    gen_helper_neon_fcvt_f16_to_f32(cpu_F0s, tmp3, cpu_env);
+                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
                     tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 0));
                     tcg_gen_shri_i32(tmp3, tmp, 16);
-                    gen_helper_neon_fcvt_f16_to_f32(cpu_F0s, tmp3, cpu_env);
+                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
                     tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 1));
                     tcg_temp_free_i32(tmp);
                     tcg_gen_ext16u_i32(tmp3, tmp2);
-                    gen_helper_neon_fcvt_f16_to_f32(cpu_F0s, tmp3, cpu_env);
+                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
                     tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 2));
                     tcg_gen_shri_i32(tmp3, tmp2, 16);
-                    gen_helper_neon_fcvt_f16_to_f32(cpu_F0s, tmp3, cpu_env);
+                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
                     tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 3));
                     tcg_temp_free_i32(tmp2);
                     tcg_temp_free_i32(tmp3);
+                    tcg_temp_free_i32(ahp);
+                    tcg_temp_free_ptr(fpst);
                     break;
+                }
                 case NEON_2RM_AESE: case NEON_2RM_AESMC:
                     if (!arm_dc_feature(s, ARM_FEATURE_V8_AES)
                         || ((rm | rd) & 1)) {
-- 
2.17.0
