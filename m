Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2152905njk;
        Sun, 1 Dec 2024 07:15:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9qSNxeiOMTsTE8TSe/v4cAg1dzo43iMdk2DiXGp9Artans3xC2h0U7Eqqua5XE1waGXxEuCmfPeTT9A==@linaro.org
X-Google-Smtp-Source: AGHT+IHQYkHzwMKb5KliYcGzlbtCx8R0l8QjAhb/t6gIJaoXcRfTZcnSYzPIL3EpQxC79uMR8s3j
X-Received: by 2002:a05:622a:118f:b0:466:afc3:d649 with SMTP id d75a77b69052e-466b36962admr298280851cf.36.1733066130704;
        Sun, 01 Dec 2024 07:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066130; cv=none;
        d=google.com; s=arc-20240605;
        b=bRZjLlYeKKoa7EYM3ws135GvCSEeu+xwB3Bq2h6xLM/V6ERpRg4RZWJVbIXywMaToH
         +aJbNrA+VIND7QQVWXFtQ51aJvKMY6AwEKThIJ93pkFRqPe9QZLKS+4SSieMGjGti377
         yRHh3CEWqszR6opqF+5LioN2bxO19SKyGu0SJPER9zhoHkO8P82VerF9EYsSPjOL79tU
         Y5ZF/67eFY0ZwFgP/aiGQlNbxJiBGRtk/wvD/Qnh9gLU0lrrwUCueygcVTVqM2erPNZb
         3HDdCpLCj9W8ukMrPof2FbYhRGAvsxrTZqa0jCOWAUbjHbPrB2fjWyrpU4YA2bC3j2Yi
         T9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T6yTkY4jMJXsaB061xt//unw5wbLE/ofH7TOm1MyONU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=MbUboF8kjfTv8fU570WpG9uNarvmp3fwASv78AcuU+GKhWv9/cXHXH8gLx6N+hfUnM
         paWafKaJgesJ1Vf+Zna1bxjP3Hvsi7OYp3093rBoCm3B6R+RfsocXPIwrcKtQm0g36Jo
         CLSR8aHhyYvcF1tF6Mno3Udt1QRPWyffvl3vqZO6fjteF+d0RhXtJXYsMMDeFZJ86+Ir
         bejUFY8TULiKuEz2kEOKCRm7zFZLuAwRLmQdxTrZrD3z5q6CuZN4mRnU34kpsLkLLtqC
         H0BmtjZXdgFUE0hgm+0Y6JYa0wHmlC24Z7O15oi+MB4EvpZ5kupYLJzGvK5Ek9UXmSdB
         2jsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBYx2o2s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4103133si95471521cf.299.2024.12.01.07.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:15:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBYx2o2s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlbf-0004kK-Ad; Sun, 01 Dec 2024 10:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaQ-000844-Uz
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:10:18 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaN-0005D2-Pt
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:10:14 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-71d4d3738cdso1218597a34.3
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065809; x=1733670609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6yTkY4jMJXsaB061xt//unw5wbLE/ofH7TOm1MyONU=;
 b=aBYx2o2si7sFes4O7YvMRctYwEQiIcJcaKxuLqTk7Lx+RDS5SLcF0K3WTc3bpm9Si0
 oSfr/0BpZe4nr0x+94rPSCE3A23oMx3mPt31ZitlTwFjx6yQHdNz2iwPhxcrpbfESShl
 oSOjoo4iyQ3vR535IvL0BPfxFYNUl5/S+juYD47ym2Ma53svTtbqf9MXJzniTK7b4AzR
 go/gqrMt4HJ2aGfjZF+foQzSufQ+Ri7MaUjxaatrYiUvdyTSKzHhPdMOtggbWW4JX7p5
 cRu+YqPTBIb3e+2F4aJ7KS284eCVuW6MiKqlCtrlDoNsgvtUkDWnjDhLNqC7Md1xQ49I
 wvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065809; x=1733670609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T6yTkY4jMJXsaB061xt//unw5wbLE/ofH7TOm1MyONU=;
 b=ETosZXfj9E/Yg2lpgBd3PWi9X3mO2nm4L5YeGgiwYAXs2tqjb2Tpul/akk4M3sL+Kw
 xHiMyP79d9nIAhIo8Vh0EKxvzUy358uPygiO2GCVvyxEXoD9am7/SJFqjeLA9zd1cN/d
 wR4KH0B+LcZfi9Q/gF9xVA5yCJZJF7UlfUZpkS3h2SvtzqFdsOLJDwUE3vHKKIXVj+NQ
 YOey7dYsLBoDvB6JmR25JJo65G9LJ98UXhGErhd/8BgTPBYbOL220UrXlvE6/JXP6zyb
 ZkmC9WjA5VlZQwEcfWcGLnLSUPUpzMtVQRB9lyNGNEmMe5smJMEHM6k5G3wPcGPUWR/X
 N5ig==
X-Gm-Message-State: AOJu0YyuqvXAkxJ0ehrfQEzeod0LIAEB4zJJdmbXdijwK+NHWGoi3B6n
 AIg0Dsz5g09lmHfXyjlJGuXugfWVfag4xIAH19vfKbSYqUPPUfC9K8H9QKC6CT8gthMxJV4l0ja
 ZyX8=
X-Gm-Gg: ASbGncvL35wflolNYupK7CnqklyZSpSgbmZRB1zZyWtKRRtGuLYaZlPxRUO9K0gzG5x
 1M3SdmNasMtcLeu/HSpYk0kekg+1m1rojn7TdJ3Oot/IY/3OhrTEzyo82cAKqBjWNWdzFogllMY
 4C/litBIEsxlMOQ0W20VOS2AVB1NCDe1HJn6eRb6hR1n4nEqjjjexLBaw7lqI/d5UCT2xsdJWFM
 kptlTZhRZFTADGwK2kbiMP+tAxBPD3iWKR00mDv9UluU8YuTyY4xzYOGkZD58sr6PyBy1eaK42w
 M/riVWP3uEnKr7ffo4i6sKhOvt8zaTAhx00I
X-Received: by 2002:a05:6830:4427:b0:718:1150:a02b with SMTP id
 46e09a7af769-71d65c755acmr13431113a34.1.1733065809158; 
 Sun, 01 Dec 2024 07:10:09 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 53/67] target/arm: Convert FSQRT (vector) to decodetree
Date: Sun,  1 Dec 2024 09:05:52 -0600
Message-ID: <20241201150607.12812-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cUTIXmCgCNVS

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 67 +++++++++++++++++++++++++---------
 target/arm/tcg/a64.decode      |  3 ++
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 31272c1878..1e8cb07992 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9176,6 +9176,51 @@ static bool do_fabs_fneg_v(DisasContext *s, arg_qrr_e *a, bool neg)
 TRANS(FABS_v, do_fabs_fneg_v, a, false)
 TRANS(FNEG_v, do_fabs_fneg_v, a, true)
 
+static bool do_fp1_vector(DisasContext *s, arg_qrr_e *a,
+                          const FPScalar1 *f, int rmode)
+{
+    TCGv_i32 tcg_rmode = NULL;
+    TCGv_ptr fpst;
+    int check = fp_access_check_vector_hsd(s, a->q, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    fpst = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    if (rmode >= 0) {
+        tcg_rmode = gen_set_rmode(rmode, fpst);
+    }
+
+    if (a->esz == MO_64) {
+        TCGv_i64 t64 = tcg_temp_new_i64();
+
+        for (int pass = 0; pass < 2; ++pass) {
+            read_vec_element(s, t64, a->rn, pass, MO_64);
+            f->gen_d(t64, t64, fpst);
+            write_vec_element(s, t64, a->rd, pass, MO_64);
+        }
+    } else {
+        TCGv_i32 t32 = tcg_temp_new_i32();
+        void (*gen)(TCGv_i32, TCGv_i32, TCGv_ptr)
+            = (a->esz == MO_16 ? f->gen_h : f->gen_s);
+
+        for (int pass = 0, n = (a->q ? 16 : 8) >> a->esz; pass < n; ++pass) {
+            read_vec_element_i32(s, t32, a->rn, pass, a->esz);
+            gen(t32, t32, fpst);
+            write_vec_element_i32(s, t32, a->rd, pass, a->esz);
+        }
+    }
+    clear_vec_high(s, a->q, a->rd);
+
+    if (rmode >= 0) {
+        gen_restore_rmode(tcg_rmode, fpst);
+    }
+    return true;
+}
+
+TRANS(FSQRT_v, do_fp1_vector, a, &f_scalar_fsqrt, -1)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9473,9 +9518,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
      * requires them.
      */
     switch (opcode) {
-    case 0x7f: /* FSQRT */
-        gen_helper_vfp_sqrtd(tcg_rd, tcg_rn, tcg_fpstatus);
-        break;
     case 0x1a: /* FCVTNS */
     case 0x1b: /* FCVTMS */
     case 0x1c: /* FCVTAS */
@@ -9519,6 +9561,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0xb: /* ABS, NEG */
     case 0x2f: /* FABS */
     case 0x6f: /* FNEG */
+    case 0x7f: /* FSQRT */
         g_assert_not_reached();
     }
 }
@@ -10016,13 +10059,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             handle_2misc_fcmp_zero(s, opcode, false, u, is_q, size, rn, rd);
             return;
-        case 0x7f: /* FSQRT */
-            need_fpstatus = true;
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
         case 0x1a: /* FCVTNS */
         case 0x1b: /* FCVTMS */
         case 0x3a: /* FCVTPS */
@@ -10116,6 +10152,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x56: /* FCVTXN, FCVTXN2 */
         case 0x2f: /* FABS */
         case 0x6f: /* FNEG */
+        case 0x7f: /* FSQRT */
             unallocated_encoding(s);
             return;
         }
@@ -10188,9 +10225,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
-                case 0x7f: /* FSQRT */
-                    gen_helper_vfp_sqrts(tcg_res, tcg_op, tcg_fpstatus);
-                    break;
                 case 0x1a: /* FCVTNS */
                 case 0x1b: /* FCVTMS */
                 case 0x1c: /* FCVTAS */
@@ -10233,6 +10267,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 case 0x7: /* SQABS, SQNEG */
                 case 0x2f: /* FABS */
                 case 0x6f: /* FNEG */
+                case 0x7f: /* FSQRT */
                     g_assert_not_reached();
                 }
             }
@@ -10376,11 +10411,11 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         rmode = FPROUNDING_ZERO;
         break;
     case 0x7d: /* FRSQRTE */
-    case 0x7f: /* FSQRT (vector) */
         break;
     default:
     case 0x2f: /* FABS */
     case 0x6f: /* FNEG */
+    case 0x7f: /* FSQRT (vector) */
         unallocated_encoding(s);
         return;
     }
@@ -10486,12 +10521,10 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x7d: /* FRSQRTE */
                 gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
-            case 0x7f: /* FSQRT */
-                gen_helper_vfp_sqrth(tcg_res, tcg_op, tcg_fpstatus);
-                break;
             default:
             case 0x2f: /* FABS */
             case 0x6f: /* FNEG */
+            case 0x7f: /* FSQRT */
                 g_assert_not_reached();
             }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index fec6aa7a23..f6b334b148 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1694,3 +1694,6 @@ FABS_v          0.00 1110 1.1 00000 11111 0 ..... .....     @qrr_sd
 
 FNEG_v          0.10 1110 111 11000 11111 0 ..... .....     @qrr_h
 FNEG_v          0.10 1110 1.1 00000 11111 0 ..... .....     @qrr_sd
+
+FSQRT_v         0.10 1110 111 11001 11111 0 ..... .....     @qrr_h
+FSQRT_v         0.10 1110 1.1 00001 11111 0 ..... .....     @qrr_sd
-- 
2.43.0

