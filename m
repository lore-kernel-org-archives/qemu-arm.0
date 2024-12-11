Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192727njb;
        Wed, 11 Dec 2024 08:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVmYp/e4gj01IagZD+qURzk0fbpym1E3ImwOxO4KaL0ezbb0vn7ULP2/nN3rXFHD7jeWkmCvDRJmJaSA==@linaro.org
X-Google-Smtp-Source: AGHT+IFQAtIazeoGKOmkcSlGBkkKJuTQSA3XzZWhfc71MZSr06hLPNpwo4NLJJLzquq970sYHZRX
X-Received: by 2002:a05:620a:86cb:b0:7b6:d350:b361 with SMTP id af79cd13be357-7b6eb4366c4mr471647885a.8.1733934978749;
        Wed, 11 Dec 2024 08:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934978; cv=none;
        d=google.com; s=arc-20240605;
        b=P+kJifdytPuTxTeOtNMSXIZvHv/JvVbUj81tKiJ/2PRwKlPwMQu45mnu5f3mrsuis4
         qapC2GAhHiB/jSwwcRYldWX4LYP8Uy6FXdoIMUTX6H9ke8vaKqw8XQGMS6rfqBBjlBjI
         N5D27VvQgSOkvtQJjhJ/oO9wmWL0WMMtoHMi255Jlz5nsUjcbtSRuOjXudWlYrUalRt0
         c54PruHTGz9MLGyLlPcmPHmWKADhBIxVNrWrD1f/S1xPoBfCwpvdL9qFd/XsEYIlTAHq
         dcce4AijepaFaoTiaY9iBfmTksSoCtzZfGf+LLZAURIj4J0kf360iskqqfGQ/uFQwV6s
         mQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q5U9x9yH2CbBGhO6oxGu2av+XkmCSdkkhZho2rDLajM=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Q/X4bHxTx2FP6bdz9DnythCzueCH+rtCQzvTdemxh0GXduMoMyZ7E2sERflbx4bMCU
         iCpNGI45BQ8P5sMLe7tsKYgDvtykYrncb+9yAfSNPRUxJHvfF+AisXA/KYMhU2vbarGc
         a2ztlBW0/zbC590Y0A01eudIL1TeO51Henavlk8eg/uPzC8PTMu1g6XKBtAeybm1MAI5
         41VUsN99VpKNJ0zLNShepsPijbrayoumvnwwX+Vi2JdGSlfESa33mVxZwPPtxSiFkjMM
         oJcuX5kI65+BYOUvW7HMwvnjUJIirmLyexAMGqv5ZGLF6w3vCQ9EBe4X7QQZUhCG7vrI
         XG1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gmbl9GEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6de8aa406si538970285a.154.2024.12.11.08.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:36:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gmbl9GEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPfc-0003MH-Ur; Wed, 11 Dec 2024 11:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdY-0006Qp-7V
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:32 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdW-0001Ss-B6
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:31 -0500
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-46375ac25fbso66471741cf.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934749; x=1734539549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5U9x9yH2CbBGhO6oxGu2av+XkmCSdkkhZho2rDLajM=;
 b=Gmbl9GEVxQCqkKJqJVT0U7IWDvX4vxuBzGci878MbDeEZA9xfJdxXZEHgbtX6+Wi4a
 d5Bpm+lQwoDHe0zSth28VAKpUw35vTR/qcjRBg5Wie0DKO+/z2OStkKC44AgituNzVmx
 gwYPp9SP/i6Vl81lbZX+NuxxZ3MYHaRgIIViUU5rMTgG8ALJ6QAWCpRwRXeUO3pAbXz9
 yyhIF5rnDeKrprFQNv93G8vPlWPQ+9kBk+Xw6sGd7czw7pWVHrROm6Zzs/LUkajXFhkA
 xl1jDvYFahgOxGDpIKjbN52+3VGWsl+AumUcrX3iBKu43aO5PcoPfreaD88/LCDWCl/p
 L5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934749; x=1734539549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5U9x9yH2CbBGhO6oxGu2av+XkmCSdkkhZho2rDLajM=;
 b=KcnpCVVUZaRCAzPICwhpNlKMCwB2ZszTDeXGobaW4H9E1zLCUhvLU0yCERnsUBQGla
 4YZteh6z2dAakjNoY7zGawE2e8insleMVfPmJUdDr8EDtmm5KKn5tax5xuFKtFHaZG6O
 95lFRvlRmY/mOS5GtCWiNINswWUmki2dQ9ukIAfDJP90ipxf4j7K+dboUqQBIaHxk2o/
 6JPG6KfiwupHv7i43YYzlY1umVb0EEwDZN0Yrp42hQUL3s3aqPlzD9A8QRAGi/eiPqTN
 GC5pGFjYZL8V4JQni246yMxg7GRSJZpkqaB30WD5jHqPyozddD5ZHYvk9eszAv2ciqMa
 1rtg==
X-Gm-Message-State: AOJu0YzfYIXxk/hUVE4c0Y5QwUGLEvn1b9b6IXlL1eT8FogvRWSs2oXG
 jQmBAb10Twxo18A2Fmdqq/NDMb0CAj7+7BouEVCbqaDHdP3CKHJxOZOoXhL+AgM=
X-Gm-Gg: ASbGncuGbSaJWxKrheP45GTHuE3n5p051ZIgNRO/M3U7iWtyPFiWn57s6oSLcv8M0qg
 zcnClkrdk1n18u2R2FJG1eIMeiCcUPLPJB6zf/TU/bRlirrlzin0K4T1mdlPnRK1fMhpIblB+2e
 Dhz/uMPNauEVT70ZuoTjzK6Or4XC3W4NpQBNb/SGrRRqwjAGn9GR71ZrM8Ysf5eToByQLPYgNZK
 U5+Tfj05deGbVX4DCFQdFT6YMpIAyPnWk1ExUqGTJ+6OFT9CGw8fcyjLudBZQ==
X-Received: by 2002:a05:622a:1ba0:b0:467:5014:8bd7 with SMTP id
 d75a77b69052e-467892db65dmr47342081cf.22.1733934749258; 
 Wed, 11 Dec 2024 08:32:29 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 35/69] target/arm: Convert SQABS, SQNEG to decodetree
Date: Wed, 11 Dec 2024 10:30:02 -0600
Message-ID: <20241211163036.2297116-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
X-TUID: tlJbpbgRWSzp

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 123 +++++++++++++++++++++------------
 target/arm/tcg/a64.decode      |  11 +++
 2 files changed, 89 insertions(+), 45 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 95bb2b1ca9..9bb9668d11 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8817,6 +8817,78 @@ static bool trans_FMOV_xu(DisasContext *s, arg_rr *a)
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
@@ -9129,13 +9201,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
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
@@ -9198,6 +9263,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         gen_helper_frint64_d(tcg_rd, tcg_rn, tcg_fpstatus);
         break;
     default:
+    case 0x7: /* SQABS, SQNEG */
         g_assert_not_reached();
     }
 }
@@ -9540,8 +9606,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0x7: /* SQABS / SQNEG */
-        break;
     case 0xa: /* CMLT */
         if (u) {
             unallocated_encoding(s);
@@ -9640,6 +9704,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         break;
     default:
     case 0x3: /* USQADD / SUQADD */
+    case 0x7: /* SQABS / SQNEG */
         unallocated_encoding(s);
         return;
     }
@@ -9669,18 +9734,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -9698,6 +9751,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
                                  tcg_fpstatus);
             break;
         default:
+        case 0x7: /* SQABS, SQNEG */
             g_assert_not_reached();
         }
 
@@ -10055,12 +10109,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -10231,6 +10279,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
     default:
     case 0x3: /* SUQADD, USQADD */
+    case 0x7: /* SQABS, SQNEG */
         unallocated_encoding(s);
         return;
     }
@@ -10321,13 +10370,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -10376,6 +10418,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                     gen_helper_frint64_s(tcg_res, tcg_op, tcg_fpstatus);
                     break;
                 default:
+                case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
                 }
             } else {
@@ -10391,17 +10434,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -10418,6 +10450,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                     }
                     break;
                 default:
+                case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
                 }
             }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 5b9f7caa7f..17ecdac9db 100644
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

