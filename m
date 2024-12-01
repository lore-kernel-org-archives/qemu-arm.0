Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148931njk;
        Sun, 1 Dec 2024 07:09:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsAp6vYnp4Zx1fu4zbzwIv5WzaX3OmAcMGiEm2oyDTIdGyujUCUpRcavii0fcbkUiL5hLSEO0wldDjqA==@linaro.org
X-Google-Smtp-Source: AGHT+IE2eVkI0d2UzFIz4Qi00bGJQauTC0ND433bo5RYmvAC7gXMen/BQXrqd8F1Jj1ELweKfBnt
X-Received: by 2002:a05:622a:347:b0:461:22fc:73da with SMTP id d75a77b69052e-466c1b70ddemr294100631cf.16.1733065797079;
        Sun, 01 Dec 2024 07:09:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065797; cv=none;
        d=google.com; s=arc-20240605;
        b=Hp/jcZwxh1Fnl8ptjHkEkR31zCe+J6s2Gr3CVBcGbaI8feC5fSVjx6w6DsJtk59Xgd
         R7W9pcc/gKUDKVa7OYd3Pb39c1/IpyDql6V2rEwsMlCBqExdCUl4uTSJTvmYVsRvO2B5
         KohbG8+WcYfjUQlbNOGgGRGryzA5lM31cTWSo51YJKqWQJ3VpgRVz3Ci2foVDLLwpK9f
         5OsSS5ikpRipUC2eLIDNVE5XzbUH5cR5nNy4Wk7vjavQ7TRflICQSLUY2L+bQBeq38k1
         rwBpmTLLetxOuK5Ro71JrjHC2CXQVIfGr6i0Z/8NAt5QRHoT/9Ofvm67JsB65YddDYya
         JO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DDU1bXADDpFH8XK+xPLR0fhaBUmHIE8Q/1IjX5Z5yzg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=BBdaD6a+CgtDQ0ySz88w+YIfMVm8o5hTcwad1wtkDtkdMk+WsjNjLUEZLaMWhxh1JZ
         d+EC1qEcfuzO53aAKNumCIRMJyeTuKsQgPoPeSrShXgW2fx0bw+G7EfJn4PBwx9vE1w6
         1ICYKpqw/FJdj5xLNeUmbXvBYPyJUpTSL1dXkTOht4HbLyU3b8H3/tolR3u3+T4a/8yG
         SUaVNImk0oym+kToHghTRXcM2KrSUVHNHnJOW4fjwcwMRFa9w0el4MMidvEhDJ86FV5P
         Rx0U3E4XQje74b85ugMi2Dmywiaha9eRNcuGsKmjrNONdoZXK3incYYJdsi4+PV4bF+6
         wFNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D4mT5gZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c425887fsi87129061cf.604.2024.12.01.07.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:09:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D4mT5gZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlXB-0001dq-FY; Sun, 01 Dec 2024 10:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX8-0001bG-LF
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:50 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX6-0004Mc-Jr
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:50 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-29654932226so1589010fac.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065607; x=1733670407; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDU1bXADDpFH8XK+xPLR0fhaBUmHIE8Q/1IjX5Z5yzg=;
 b=D4mT5gZ4+hnezv95hP5ZKSiy3p9gk1CIxeva3In3sUwRFmNFSwUldOn3wLj0e0veeH
 KS5FwDLIz2ydkeaEPsYETcQuhAx1PFQe/JK5csJAatWdXRmCv1eDBZVKLCJZmJPUGNbh
 1Ft1W5wIn1L0DEXXOk4viSFLPhLrRorcTgar8wjCdXAibfZ4bcLJhOjF/2pjM264euoi
 9w7FDlUK5TCEE+5uiY4NOqMHzkHr379F8oW8QAr8TEJn0qNrPXmWjHowIroJ4n+91/U9
 DUXZsU7+Xg/7l6vq9UK9ssXLElXrdvvKX1aKhjIF1fboKiRLAyy7j5CRKf1P/S8gs+B8
 Xo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065607; x=1733670407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDU1bXADDpFH8XK+xPLR0fhaBUmHIE8Q/1IjX5Z5yzg=;
 b=SJrdYTl2FPpy7Ci242pa0Wi2taCunicBpq/ChCo1U+VQY2ecFoEmTKVwLSHEfX+nXN
 fSGrYhZ+ldKzmcVM8PyZ0DC3hNmdHRI0jvK5mDqUn0rq0qsoC7Rf4DpWYHsd8WeZRQ8g
 TabDi88H2uVOip3Qz2Eaurv9X2O+6+x9G4I87ltyhdHKYFsAFbO43uupbXomMWndEoZi
 agQmUArQ43P3fGwim4uhIydqOv1tKQL+FkDY87X1pOS+eF4xFuFxM3BMzPdy1MGsDXep
 ckUou80AGLcjNEQPl0jO+cu9mqWnFcd4gTuTGr5vZMXX8JDxB5u3Shwxa327vLb319BF
 4tMw==
X-Gm-Message-State: AOJu0YxA64DlJi9Wcz1cZaVcUTkwUm83SxXz0v1P3Nxt3WnFAsS7D41E
 o/YGdluB/mUXwqa25SEkCzKY57YZ1+t0dYtHtcGm6if0ZWaow83kIQ5r6V3fRUU=
X-Gm-Gg: ASbGnctDDzj1+IrnYrSnaKGxi43lyBErZEDgC03M9nsfqck9+50p8WNBH2KSqEIAlVn
 DYwBY6IakrIJKKq/NKMN+iydpSjJFjZ3DwNiidyI6yw/CJ6Uow/8sGAQJv/4BfxkCCjtS5SwtiH
 FGgftBlZTAho6Eq5OxzlkoO2Vv/r+r/9BVT5txLJ+SsJnJtq02I/PTtcFR1DtjnQy98SaH2Zxn8
 e0K++RpRQ3QFUwMref6IVcaWU3rDzfgPW6syFRo7rIjNfJDXvu4/Q/TUmX4szVjqs7RARstjzrG
 MEVOgL0WcHTKAAdbZoGnHo0SU8sCQQ0Z0QXh
X-Received: by 2002:a05:6871:3328:b0:29e:2a06:8405 with SMTP id
 586e51a60fabf-29e2a069343mr5585476fac.19.1733065607476; 
 Sun, 01 Dec 2024 07:06:47 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 34/67] target/arm: Convert SQABS, SQNEG to decodetree
Date: Sun,  1 Dec 2024 09:05:33 -0600
Message-ID: <20241201150607.12812-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7KaYx6VddSg2

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 123 +++++++++++++++++++++------------
 target/arm/tcg/a64.decode      |  11 +++
 2 files changed, 89 insertions(+), 45 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e0b5dd76b0..6564fff6b9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8821,6 +8821,78 @@ static bool trans_FMOV_xu(DisasContext *s, arg_rr *a)
     return true;
 }
 
+typedef struct ENVScalar1 {
+    NeonGenOneOpEnvFn *gen_bhs[3];
+    NeonGenOne64OpEnvFn *gen_d;
+} ENVScalar1;
+
+static bool do_env_scalar1(DisasContext *s, arg_rr_e *a, const ENVScalar1 *f)
+{
+    if (!fp_access_check(s)) {
+        return true;
+    }
+    if (a->esz == MO_64) {
+        TCGv_i64 t = read_fp_dreg(s, a->rn);
+        f->gen_d(t, tcg_env, t);
+        write_fp_dreg(s, a->rd, t);
+    } else {
+        TCGv_i32 t = tcg_temp_new_i32();
+
+        read_vec_element_i32(s, t, a->rn, 0, a->esz);
+        f->gen_bhs[a->esz](t, tcg_env, t);
+        write_fp_sreg(s, a->rd, t);
+    }
+    return true;
+}
+
+static bool do_env_vector1(DisasContext *s, arg_qrr_e *a, const ENVScalar1 *f)
+{
+    if (a->esz == MO_64 && !a->q) {
+        return false;
+    }
+    if (!fp_access_check(s)) {
+        return true;
+    }
+    if (a->esz == MO_64) {
+        TCGv_i64 t = tcg_temp_new_i64();
+
+        for (int i = 0; i < 2; ++i) {
+            read_vec_element(s, t, a->rn, i, MO_64);
+            f->gen_d(t, tcg_env, t);
+            write_vec_element(s, t, a->rd, i, MO_64);
+        }
+    } else {
+        TCGv_i32 t = tcg_temp_new_i32();
+        int n = (a->q ? 16 : 8) >> a->esz;
+
+        for (int i = 0; i < n; ++i) {
+            read_vec_element_i32(s, t, a->rn, i, a->esz);
+            f->gen_bhs[a->esz](t, tcg_env, t);
+            write_vec_element_i32(s, t, a->rd, i, a->esz);
+        }
+    }
+    clear_vec_high(s, a->q, a->rd);
+    return true;
+}
+
+static const ENVScalar1 f_scalar_sqabs = {
+    { gen_helper_neon_qabs_s8,
+      gen_helper_neon_qabs_s16,
+      gen_helper_neon_qabs_s32 },
+    gen_helper_neon_qabs_s64,
+};
+TRANS(SQABS_s, do_env_scalar1, a, &f_scalar_sqabs)
+TRANS(SQABS_v, do_env_vector1, a, &f_scalar_sqabs)
+
+static const ENVScalar1 f_scalar_sqneg = {
+    { gen_helper_neon_qneg_s8,
+      gen_helper_neon_qneg_s16,
+      gen_helper_neon_qneg_s32 },
+    gen_helper_neon_qneg_s64,
+};
+TRANS(SQNEG_s, do_env_scalar1, a, &f_scalar_sqneg)
+TRANS(SQNEG_v, do_env_vector1, a, &f_scalar_sqneg)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9133,13 +9205,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
          */
         tcg_gen_not_i64(tcg_rd, tcg_rn);
         break;
-    case 0x7: /* SQABS, SQNEG */
-        if (u) {
-            gen_helper_neon_qneg_s64(tcg_rd, tcg_env, tcg_rn);
-        } else {
-            gen_helper_neon_qabs_s64(tcg_rd, tcg_env, tcg_rn);
-        }
-        break;
     case 0xa: /* CMLT */
         cond = TCG_COND_LT;
     do_cmop:
@@ -9202,6 +9267,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         gen_helper_frint64_d(tcg_rd, tcg_rn, tcg_fpstatus);
         break;
     default:
+    case 0x7: /* SQABS, SQNEG */
         g_assert_not_reached();
     }
 }
@@ -9544,8 +9610,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0x7: /* SQABS / SQNEG */
-        break;
     case 0xa: /* CMLT */
         if (u) {
             unallocated_encoding(s);
@@ -9644,6 +9708,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         break;
     default:
     case 0x3: /* USQADD / SUQADD */
+    case 0x7: /* SQABS / SQNEG */
         unallocated_encoding(s);
         return;
     }
@@ -9673,18 +9738,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         read_vec_element_i32(s, tcg_rn, rn, 0, size);
 
         switch (opcode) {
-        case 0x7: /* SQABS, SQNEG */
-        {
-            NeonGenOneOpEnvFn *genfn;
-            static NeonGenOneOpEnvFn * const fns[3][2] = {
-                { gen_helper_neon_qabs_s8, gen_helper_neon_qneg_s8 },
-                { gen_helper_neon_qabs_s16, gen_helper_neon_qneg_s16 },
-                { gen_helper_neon_qabs_s32, gen_helper_neon_qneg_s32 },
-            };
-            genfn = fns[size][u];
-            genfn(tcg_rd, tcg_env, tcg_rn);
-            break;
-        }
         case 0x1a: /* FCVTNS */
         case 0x1b: /* FCVTMS */
         case 0x1c: /* FCVTAS */
@@ -9702,6 +9755,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
                                  tcg_fpstatus);
             break;
         default:
+        case 0x7: /* SQABS, SQNEG */
             g_assert_not_reached();
         }
 
@@ -10059,12 +10113,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             return;
         }
         break;
-    case 0x7: /* SQABS, SQNEG */
-        if (size == 3 && !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0xc ... 0xf:
     case 0x16 ... 0x1f:
     {
@@ -10235,6 +10283,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
     default:
     case 0x3: /* SUQADD, USQADD */
+    case 0x7: /* SQABS, SQNEG */
         unallocated_encoding(s);
         return;
     }
@@ -10325,13 +10374,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                         tcg_gen_clrsb_i32(tcg_res, tcg_op);
                     }
                     break;
-                case 0x7: /* SQABS, SQNEG */
-                    if (u) {
-                        gen_helper_neon_qneg_s32(tcg_res, tcg_env, tcg_op);
-                    } else {
-                        gen_helper_neon_qabs_s32(tcg_res, tcg_env, tcg_op);
-                    }
-                    break;
                 case 0x2f: /* FABS */
                     gen_vfp_abss(tcg_res, tcg_op);
                     break;
@@ -10380,6 +10422,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                     gen_helper_frint64_s(tcg_res, tcg_op, tcg_fpstatus);
                     break;
                 default:
+                case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
                 }
             } else {
@@ -10395,17 +10438,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                         gen_helper_neon_cnt_u8(tcg_res, tcg_op);
                     }
                     break;
-                case 0x7: /* SQABS, SQNEG */
-                {
-                    NeonGenOneOpEnvFn *genfn;
-                    static NeonGenOneOpEnvFn * const fns[2][2] = {
-                        { gen_helper_neon_qabs_s8, gen_helper_neon_qneg_s8 },
-                        { gen_helper_neon_qabs_s16, gen_helper_neon_qneg_s16 },
-                    };
-                    genfn = fns[size][u];
-                    genfn(tcg_res, tcg_env, tcg_op);
-                    break;
-                }
                 case 0x4: /* CLS, CLZ */
                     if (u) {
                         if (size == 0) {
@@ -10422,6 +10454,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                     }
                     break;
                 default:
+                case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
                 }
             }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 787e673f7c..d26ee07597 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -47,6 +47,7 @@
 @rr_h           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=1
 @rr_s           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=2
 @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
+@rr_e           ........ esz:2 . ..... ...... rn:5 rd:5 &rr_e
 @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
 @rr_hsd         ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_hsd
 
@@ -1626,3 +1627,13 @@ UQRSHRN_si      0111 11110 .... ... 10011 1 ..... .....     @shri_s
 SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_b
 SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_h
 SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_s
+
+# Advanced SIMD scalar two-register miscellaneous
+
+SQABS_s         0101 1110 ..1 00000 01111 0 ..... .....     @rr_e
+SQNEG_s         0111 1110 ..1 00000 01111 0 ..... .....     @rr_e
+
+# Advanced SIMD two-register miscellaneous
+
+SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
+SQNEG_v         0.10 1110 ..1 00000 01111 0 ..... .....     @qrr_e
-- 
2.43.0

