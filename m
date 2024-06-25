Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp751693njc;
        Tue, 25 Jun 2024 11:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW03I4RoJeW169AwVqOl/Wy9dApvkBawgpkXNwgkSALyfqdRL1gZFTJUhGhlASjJ14PTvswIIeZ5Av0W5jdirkBii4pqBmi
X-Google-Smtp-Source: AGHT+IG2QIQw4qRtQODIWDmP6CuXyy/62no6pVyTIYzvEZVZEg+R3BZB8IgW/IV1WGgKeh4vEIB+
X-Received: by 2002:a05:620a:4729:b0:795:ca3d:8f42 with SMTP id af79cd13be357-79be6e80b87mr947604285a.42.1719341437583;
        Tue, 25 Jun 2024 11:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719341437; cv=none;
        d=google.com; s=arc-20160816;
        b=ccg6CWuOtQnGseytGlxjKO0JmS1qZBJS3pE+ZqF0tnslfBz/BEoOXKcqe/FU+6p7TI
         eXcul2GYL5zgBP7tEJ+y4Jst0+fkCCYF99SFPoU4N0IqWu44lE/kNCTxtsYLIK7DO0Tu
         3SL8e9mYnwxsPCke62s5Y37gbwPNu1h3mdIYtW7eCYmNt9zRUzdpr/R5etjMn9se22bX
         lDEE0U0bIiL6qfYABPmZ1HNWC1wV4rv7ue/7Sf7N7Qyl40qDhXCuC6uXHdWOrwkjawEW
         Lb8lOT0aP4iYCXj3QtD3FfMmRhpe9X8H8VqQTvyyEPi8kgZfWjiRxTTD7Rb7sZBK4nJI
         y9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pO8S7b7Lc2zYJ5YuH/uyew7KLH8ZATkGu/zVIu9bhOw=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=aFzcvShBKDmWi0YkU6rS89ESSn0E8V5M+5ughS1ucWF+N7z//22d9KMZ2bCRMgDXIp
         8ywLCjf1FPibGfIGi7kg90cBuAVPGI8YezRo3nN87C4zt/gz+A8P74YyT59PoMONgdSq
         yyMdvGfUkhUc/SgTXH3P9NNvajtxxYF3ldTSlqBGfNrsPgMyT0Z8vkQ3afIgPos8BsBb
         8zL/EVZwllsbBYxvgAe0bpsc1ttsfR9KoctPmwIi+2SIFLoDUpZ0ENwor8GXuSXaGasa
         2v/WKKCZi4GCky9wfbAmWT/KVRxhkt2/IAovhOOqv9jlcmpCjja89ZSmiCsSoxxJRfku
         1wwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HX3eTs1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce9138a8si1162081185a.350.2024.06.25.11.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 11:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HX3eTs1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMBDw-0003Ql-7r; Tue, 25 Jun 2024 14:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB4D-0000xa-Sr
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:39:15 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB32-00066p-LA
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:38:45 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1f6fabe9da3so47569915ad.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340545; x=1719945345; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pO8S7b7Lc2zYJ5YuH/uyew7KLH8ZATkGu/zVIu9bhOw=;
 b=HX3eTs1J/E/4bAS7pR6TU65Zv3ulhaLWigw3s73j25IrqGu+ZkCx2byCqx9RIwQoPE
 V2iq5NMCUZOmoHIVkCaZZIkFbuI8g0ziDFd1jwhFCRLhFgRuGOAeDiap29BDrDQ/oTwt
 tEnlijj44WJt3EDndU520s5uREQdZh4aRL5oBqNAaPWqRe3BmzkWA6CcuX5VDIzS7JTb
 uJ0I5BHScCY1mFtMf8TY7wdfjK4o0s3EonRdcAHtu9RzdShF9IKiCTI1XVp3JwPmzBiu
 /53fTzYM9rjawjxtcim6b4XdOil+F7hYlxxu8KjWxEbfyN+GBUsW89ZWZ8YRLNHgo/Tb
 riWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340545; x=1719945345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pO8S7b7Lc2zYJ5YuH/uyew7KLH8ZATkGu/zVIu9bhOw=;
 b=URg1B+0iYjcTSqG86RhbKlm8u7LCY2OGTUhNpEasXqCEGnqx8BWT3g1QMLKEBqngtD
 Sqy2TcxsBMG6VNqQ4YtdTOpMqG6dNPp9tEMbaPG1KDUlgwD/BT5F8aKuQ0/f4BLxb4BZ
 XkM18D84VV1dkRO7rcDtXYIRN3kpknfsEKAhl0GPJxDeEp6Ou9BlZwDiTZqEsEyiQXbA
 hoJ9BP44Lr9ECEAbcPB8PwW162SDyOWQkBJTuzk6V2v2HUSKgslKjJznwJF6qJb6GzDO
 P91VHJjx5E5CYElwERblX/SdVECW6Qp0ZQD6Ke9ux5dVvTM28ea6/Gt8CT3qOpvE0M2+
 tzRQ==
X-Gm-Message-State: AOJu0YyuAqjRP4W63tbivJT7PyJhrErI3YYFySgimSfNmAXmOe1iafXM
 eXS68qzI97BL6jegRzjBswze5HAW2PGQcDUuOSAu2Z6kgzSxiPmoGUGXyb0YuCReOzS3HPJ8aL5
 L
X-Received: by 2002:a17:903:32ce:b0:1fa:2420:33ed with SMTP id
 d9443c01a7336-1fa24203694mr94894665ad.65.1719340545240; 
 Tue, 25 Jun 2024 11:35:45 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 08/13] target/arm: Convert BFMLALB, BFMLALT to decodetree
Date: Tue, 25 Jun 2024 11:35:31 -0700
Message-Id: <20240625183536.1672454-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: WCqzKTuvZab/

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 +
 target/arm/tcg/translate-a64.c | 77 +++++++++++++---------------------
 2 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6819fd2587..15344a73de 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -951,6 +951,7 @@ SDOT_v          0.00 1110 100 ..... 10010 1 ..... ..... @qrrr_s
 UDOT_v          0.10 1110 100 ..... 10010 1 ..... ..... @qrrr_s
 USDOT_v         0.00 1110 100 ..... 10011 1 ..... ..... @qrrr_s
 BFDOT_v         0.10 1110 010 ..... 11111 1 ..... ..... @qrrr_s
+BFMLAL_v        0.10 1110 110 ..... 11111 1 ..... ..... @qrrr_h
 
 ### Advanced SIMD scalar x indexed element
 
@@ -1031,6 +1032,7 @@ UDOT_vi         0.10 1111 10 .. .... 1110 . 0 ..... .....   @qrrx_s
 SUDOT_vi        0.00 1111 00 .. .... 1111 . 0 ..... .....   @qrrx_s
 USDOT_vi        0.00 1111 10 .. .... 1111 . 0 ..... .....   @qrrx_s
 BFDOT_vi        0.00 1111 01 .. .... 1111 . 0 ..... .....   @qrrx_s
+BFMLAL_vi       0.00 1111 11 .. .... 1111 . 0 ..... .....   @qrrx_h
 
 # Floating-point conditional select
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0f44cd5aee..95be862dde 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5606,6 +5606,19 @@ TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_b)
 TRANS_FEAT(USDOT_v, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usdot_b)
 TRANS_FEAT(BFDOT_v, aa64_bf16, do_dot_vector, a, gen_helper_gvec_bfdot)
 
+static bool trans_BFMLAL_v(DisasContext *s, arg_qrrr_e *a)
+{
+    if (!dc_isar_feature(aa64_bf16, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        /* Q bit selects BFMLALB vs BFMLALT. */
+        gen_gvec_op4_fpst(s, true, a->rd, a->rn, a->rm, a->rd, false, a->q,
+                          gen_helper_gvec_bfmlal);
+    }
+    return true;
+}
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -5946,6 +5959,20 @@ TRANS_FEAT(USDOT_vi, aa64_i8mm, do_dot_vector_idx, a,
 TRANS_FEAT(BFDOT_vi, aa64_bf16, do_dot_vector_idx, a,
            gen_helper_gvec_bfdot_idx)
 
+static bool trans_BFMLAL_vi(DisasContext *s, arg_qrrx_e *a)
+{
+    if (!dc_isar_feature(aa64_bf16, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        /* Q bit selects BFMLALB vs BFMLALT. */
+        gen_gvec_op4_fpst(s, true, a->rd, a->rn, a->rm, a->rd, 0,
+                          (a->idx << 1) | a->q,
+                          gen_helper_gvec_bfmlal_idx);
+    }
+    return true;
+}
+
 /*
  * Advanced SIMD scalar pairwise
  */
@@ -10952,23 +10979,13 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_bf16, s);
         break;
-    case 0x1f:
-        switch (size) {
-        case 3: /* BFMLAL{B,T} */
-            feature = dc_isar_feature(aa64_bf16, s);
-            break;
-        default:
-        case 1: /* BFDOT */
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     default:
     case 0x02: /* SDOT (vector) */
     case 0x03: /* USDOT */
     case 0x10: /* SQRDMLAH (vector) */
     case 0x11: /* SQRDMLSH (vector) */
     case 0x12: /* UDOT (vector) */
+    case 0x1f: /* BFDOT / BFMLAL */
         unallocated_encoding(s);
         return;
     }
@@ -11037,17 +11054,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     case 0xd: /* BFMMLA */
         gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfmmla);
         return;
-    case 0xf:
-        switch (size) {
-        case 3: /* BFMLAL{B,T} */
-            gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, false, is_q,
-                              gen_helper_gvec_bfmlal);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        return;
-
     default:
         g_assert_not_reached();
     }
@@ -12051,24 +12057,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x0b: /* SQDMULL, SQDMULL2 */
         is_long = true;
         break;
-    case 0x0f:
-        switch (size) {
-        case 3: /* BFMLAL{B,T} */
-            if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
-                unallocated_encoding(s);
-                return;
-            }
-            /* can't set is_fp without other incorrect size checks */
-            size = MO_16;
-            break;
-        default:
-        case 0: /* SUDOT */
-        case 1: /* BFDOT */
-        case 2: /* USDOT */
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
@@ -12089,6 +12077,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x0c: /* SQDMULH */
     case 0x0d: /* SQRDMULH */
     case 0x0e: /* SDOT */
+    case 0x0f: /* SUDOT / BFDOT / USDOT / BFMLAL */
     case 0x10: /* MLA */
     case 0x14: /* MLS */
     case 0x18: /* FMLAL2 */
@@ -12171,14 +12160,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 
     switch (16 * u + opcode) {
-    case 0x0f:
-        switch (extract32(insn, 22, 2)) {
-        case 3: /* BFMLAL{B,T} */
-            gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, 0, (index << 1) | is_q,
-                              gen_helper_gvec_bfmlal_idx);
-            return;
-        }
-        g_assert_not_reached();
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
-- 
2.34.1

